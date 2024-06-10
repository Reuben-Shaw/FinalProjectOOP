package org.controllers;

import org.vexillum.*;
import javafx.event.*;
import javafx.fxml.*;
import javafx.geometry.*;
import javafx.scene.*;
import javafx.scene.text.*;
import javafx.scene.control.*;
import javafx.scene.image.*;
import javafx.scene.input.*;
import javafx.scene.layout.*;
import javafx.stage.*;
import javax.swing.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.*;

public class BasketController extends ControllerParent {
    @FXML private StackPane panStacker;
    @FXML private BorderPane panMain;
    @FXML private VBox boxScroll;
    @FXML private Label lblExportSales;
    @FXML private Label lblExportCosts;
    @FXML private Label lblExportSubtotal;
    @FXML private Label lblImportCosts;
    @FXML private Label lblTotal;

    private HashMap<Integer, StockItem> importItems = new HashMap<>();
    private HashMap<Integer, StockItem> exportItems = new HashMap<>();

    @Override
    protected void stageChangeHandle() {}

    public void load(Stage stage, List<StockItem> items, Operator operator) {
        try {
            HBox headerBox = (HBox) panMain.lookup("#boxHeader");
            if (headerBox == null) { throw new Exception(); }

            loadHeader(stage, operator, items, headerBox, new SearchConditions());
            createItems();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void createItems() throws Exception {
        int index = 0;

        for (StockItem i : getItems()) {
            if (i.getAmount() < 0) importItems.put(index, i);
            else exportItems.put(index, i);
            index++;
        }

        FXMLLoader loader = new FXMLLoader(getClass().getResource("basket_divider.fxml"));
        Parent itemView = loader.load();
        HBox box = (HBox) itemView;
        ((Label) box.lookup("#lblImportExport")).setText("Imports");
        boxScroll.getChildren().clear();
        boxScroll.getChildren().add(box);
        addItem(importItems);

        loader = new FXMLLoader(getClass().getResource("basket_divider.fxml"));
        itemView = loader.load();
        box = (HBox) itemView;
        ((Label) box.lookup("#lblImportExport")).setText("Exports");
        boxScroll.getChildren().add(box);
        addItem(exportItems);

        openDB();
        calculateTotalCost();
        closeDB();
    }

    private void addItem(HashMap<Integer, StockItem> itemsMap) throws IOException {
        for(var item : itemsMap.entrySet()) {
            StockItem i = item.getValue();

            FXMLLoader loader = new FXMLLoader(getClass().getResource("basket_item.fxml"));
            Parent itemView = loader.load();
            HBox box = (HBox) itemView;

            String designPath = "org/Assets/FlagsSmall/" + i.getIsoID() + ".png";
            Image design = new Image(designPath);
            Image img = !(i instanceof Cushion c) ? design :
                    c.getSize() != CUSHION_SIZE.LONG ?
                            Masker.standardCushion(true, designPath) : Masker.longCushion(true, designPath);
            ((ImageView) box.lookup("#imgDesign")).setImage(img);

            VBox imageHolder = (VBox) box.lookup("#imageHolder");
            if (!img.equals(design)) imageHolder.setStyle("-fx-border-width: 2; -fx-border-color: #FFFFFF");
            else imageHolder.setStyle("-fx-border-width: 2; -fx-border-color: #000000");

            String name = i.getName();

            if (i instanceof Flag f) {
                name += " Flag ";
                name += FLAG_SIZE.getString(f.getSize());
            }
            else if (i instanceof Cushion c) {
                name += " Cushion ";
                name += CUSHION_SIZE.getString(c.getSize());
            }

            ((Label) box.lookup("#lblName")).setText(name);

            setCosts(box, i);

            ((Button) box.lookup("#btnInformation")).setOnAction(btnInfoClick);
            ((Label) box.lookup("#lblIncrement")).setText(i.getPrintAmount() + "");
            ((Button) box.lookup("#btnMinus")).setOnAction(btnMinusClick);
            ((Button) box.lookup("#btnAdd")).setOnAction(btnAddClick);

            ((Button) box.lookup("#btnEdit")).setOnAction(btnEditClick);

            if (i.getAmount() < 0) {
                box.getChildren().remove(box.lookup("#btnInformation"));
            }

            box.setId(i.hashCode() + "");
            boxScroll.getChildren().add(box);
        }
    }

    private void setCosts(Node b, StockItem i) {
        NumberFormat eurFormatter = NumberFormat.getCurrencyInstance(Locale.UK);
        double price = i.calculatePrice();
        String cost = eurFormatter.format(price);
        String subtotal = eurFormatter.format(price * i.getPrintAmount());

        ((Label) b.lookup("#lblPriceSingle")).setText(cost);
        ((Label) b.lookup("#lblSubtotal")).setText(subtotal);
    }

    private void calculateTotalCost() {
        NumberFormat eurFormatter = NumberFormat.getCurrencyInstance(Locale.UK);

        double exportSales = 0;
        double exportCosts = 0;
        double importCosts = 0;
        for (var item : exportItems.entrySet()) {
            StockItem i = item.getValue();
            exportSales += i.calculatePrice() * i.getAmount();
            exportCosts += getDatabase().getPrice(i.getSizeID()) * i.getAmount();
        }
        for (var item : importItems.entrySet()) {
            StockItem i = item.getValue();
            importCosts += i.calculatePrice() * i.getPrintAmount();
        }

        lblExportSales.setText(eurFormatter.format(exportSales));
        lblExportCosts.setText(eurFormatter.format(exportCosts));
        lblExportSubtotal.setText(eurFormatter.format(exportSales - exportCosts));
        lblImportCosts.setText(eurFormatter.format(importCosts));
        lblTotal.setText(eurFormatter.format(exportSales - exportCosts - importCosts));
    }

    @FXML
    protected void btnCheckoutClick(ActionEvent event) throws Exception {
        openDB();
        for(StockItem i : getItems()) {
            if (i.getAmount() < 0) {
                getDatabase().updateAmountAndRestock(i.getStockID(), i.getSizeID(), i.getTotalAmount() + i.getPrintAmount(), i.getRestock());
            }
            Node b = boxScroll.lookup("#" + i.hashCode());
            boxScroll.getChildren().remove(b);
        }

        itemsClear();
        importItems.clear();
        exportItems.clear();
        calculateTotalCost();
        closeDB();
    }

    private int locateIndex(int hash) {
        for (int i = 0; i < itemsSize(); i++) {
            if (getItems(i).hashCode() == hash) {
                return i;
            }
        }

        System.out.println("Failure to find " + hash + ":\n");
        for (StockItem item : getItems()) {
            System.out.println(item.hashCode());
        }

        return -1;
    }

    EventHandler<ActionEvent> btnInfoClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            try {
                Object source = event.getSource();
                Node n = (Node) source;
                Node itemBox = n.getParent();

                FXMLLoader loader = new FXMLLoader(getClass().getResource("basket_popup.fxml"));
                Parent itemView = loader.load();

                VBox box = (VBox) itemView;

                box.setOnMouseClicked(hidePopupClick);

                box.lookup("#boxContainment").setOnMouseClicked(ignoreHideClick);
                box.lookup("#btnBlue").setOnMouseClicked(hidePopupClick);

                StockItem item = findItemHash(Integer.parseInt(itemBox.getId()));
                if (item instanceof Cushion c) {
                    Label lblAddD = (Label) box.lookup("#lblAdditionalDesc");
                    lblAddD.setText("Filling:");
                    Label lblAddV = (Label) box.lookup("#lblAdditionalVal");
                    lblAddV.setText(c.getMaterial().toString());

                    Label lblMatD = (Label) box.lookup("#lblMaterialDesc");
                    Label lblMatV = (Label) box.lookup("#lblMaterialVal");
                    lblMatD.setDisable(true);
                    lblMatV.setDisable(true);
                }
                else if (item instanceof Flag f) {
                    Label lblAddD = (Label) box.lookup("#lblAdditionalDesc");
                    lblAddD.setText("Hoist:");
                    Label lblAddV = (Label) box.lookup("#lblAdditionalVal");
                    lblAddV.setText(f.getHoist() != null ? f.getHoist().toString() : "N/A");

                    Label lblMatD = (Label) box.lookup("#lblMaterialDesc");
                    lblMatD.setDisable(false);
                    lblMatD.setText("Material:");
                    Label lblMatV = (Label) box.lookup("#lblMaterialVal");
                    lblMatV.setDisable(false);
                    lblMatV.setText(f.getMaterial().toString());
                }

                panStacker.getChildren().add(box);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    };

    private void hidePopup() {
        Node n = panStacker.lookup("#boxDarkening");
        panStacker.getChildren().remove(n);
    }

    EventHandler<MouseEvent> ignoreHideClick = MouseEvent::consume;
    EventHandler<MouseEvent> hidePopupClick = new EventHandler<MouseEvent>() {
        @Override
        public void handle(MouseEvent event) {
            try {
                hidePopup();
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    };

    EventHandler<ActionEvent> btnMinusClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            try {
                Object source = event.getSource();
                Node n = (Node) source;
                Node box = n.getParent().getParent();
                Label l = (Label) box.lookup("#lblIncrement");

                int newVal = Integer.parseInt(l.getText()) - 1;
                int hashVal = Integer.parseInt(box.getId());
                int index = locateIndex(hashVal);
                if (index < 0) {
                    System.out.println("Error at minus click");
                    return;
                }

                StockItem i = getItems(index);
                openDB();
                getDatabase().updateAmountAndRestock(i.getStockID(), i.getSizeID(), i.getTotalAmount() + 1, i.getRestock());

                if (newVal == 0) {
                    removeItem(i);
                    boxScroll.getChildren().remove(box);
                    calculateTotalCost();
                    setCosts(box, i);
                    calculateTotalCost();
                    closeDB();
                    return;
                }

                if (i.getAmount() < 0) i.setAmount(newVal * -1);
                else {
                    i.setAmount(newVal);
                    i.setTotalAmount(i.getTotalAmount() + 1);
                }

                l.setText(newVal + "");

                box.lookup("#btnAdd").setDisable(false);
                setCosts(box, i);
                calculateTotalCost();
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
            finally {
                closeDB();
            }
        }
    };
    EventHandler<ActionEvent> btnAddClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            try {
                Object source = event.getSource();
                Node n = (Node) source;
                Node box = n.getParent().getParent();
                Label l = (Label) box.lookup("#lblIncrement");

                int newVal = Integer.parseInt(l.getText()) + 1;
                l.setText(newVal + "");

                int hashVal = Integer.parseInt(box.getId());
                int index = locateIndex(hashVal);
                if (index < 0) {
                    System.out.println("Error at add click");
                    return;
                }

                StockItem i = getItems(index);
                openDB();
                getDatabase().updateAmountAndRestock(i.getStockID(), i.getSizeID(), i.getTotalAmount() - 1, i.getRestock());

                if (i.getAmount() < 0) i.setAmount(newVal * -1);
                else {
                    i.setAmount(newVal);
                    i.setTotalAmount(i.getTotalAmount() - 1);
                }

                if (i.getAmount() > 0 && i.getTotalAmount() == 0) {
                    n.setDisable(true);
                }

                setCosts(box, i);
                calculateTotalCost();
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
            finally {
                closeDB();
            }
        }
    };

    EventHandler<ActionEvent> btnEditClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            try {
                Object source = event.getSource();

                HBox box = (HBox) ((Node) source).getParent();

                int hashVal = Integer.parseInt(box.getId());
                int index = locateIndex(hashVal);
                if (index < 0) {
                    System.out.println("Error at edit click");
                    return;
                }

                boolean isFlag = getItems(index) instanceof Flag;
                openDB();
                Design d = getDatabase().getDeignFromIso(getItems(index).getIsoID());
                closeDB();
                System.out.println("Made it past this one woo");

                l.showItem(stage, getItems(), operator, d, isFlag, index);
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    };
}
