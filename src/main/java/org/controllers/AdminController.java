package org.controllers;

import org.vexillum.*;

import javafx.event.*;
import javafx.fxml.*;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.*;
import java.util.*;

public class AdminController extends ControllerParent {
    @FXML private BorderPane panMain;
    @FXML private VBox boxScroll;

    @Override
    protected void stageChangeHandle() { }

    public void load(Stage stage, List<StockItem> items, Operator operator) throws Exception {
        HBox headerBox = (HBox) panMain.lookup("#boxHeader");
        if (headerBox == null) { throw new Exception(); }

        loadHeader(stage, operator, items, headerBox, new SearchConditions());

        openDB();
        addOperatorItem(getDatabase().getApprovals());
        closeDB();
    }

    public void addOperatorItem(HashMap<Date, Integer> operatorMap) throws Exception {
        boxScroll.getChildren().clear();

        Integer[] ids = new Integer[operatorMap.size()];
        int i = 0;
        for(var m : operatorMap.entrySet()) {
            ids[i++] = m.getValue();
        }

        List<Date> dates = new ArrayList<>(operatorMap.keySet());
        Collections.sort(dates);

        List<Operator> operators = getDatabase().getOperatorsByID(ids);

        for(Date date : dates) {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("admin_item.fxml"));
            Parent itemView = loader.load();
            HBox box = (HBox) itemView;

            int id = operatorMap.get(date);
            Operator op = new Operator();
            for (Operator o : operators) {
                if (o.getOperatorID() == id) {
                    op = o;
                    operators.remove(o);
                    break;
                }
            }

            box.setId(op.getOperatorID() + "");

            Label name = (Label) box.lookup("#lblUsername");
            name.setText(op.getName());

            Label time = (Label) box.lookup("#lblApplicationTime");
            time.setText(date.toString());

            Button accept = (Button) box.lookup("#btnAccept");
            accept.setOnAction(btnAcceptClick);

            Button deny = (Button) box.lookup("#btnDeny");
            deny.setOnAction(btnDenyClick);

            boxScroll.getChildren().add(box);
        }
    }

    EventHandler<ActionEvent> btnAcceptClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            Object source = event.getSource();
            Node n = (Node) source;
            Node box = n.getParent().getParent();

            int id = Integer.parseInt(box.getId());

            openDB();
            getDatabase().acceptOperator(id);
            try {
                addOperatorItem(getDatabase().getApprovals());
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                closeDB();
            }
        }
    };

    EventHandler<ActionEvent> btnDenyClick = new EventHandler<ActionEvent>() {
        @Override
        public void handle(ActionEvent event) {
            Object source = event.getSource();
            Node n = (Node) source;
            Node box = n.getParent().getParent();

            int id = Integer.parseInt(box.getId());
            openDB();
            getDatabase().denyOperator(id);
            try {
                addOperatorItem(getDatabase().getApprovals());
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                closeDB();
            }
        }
    };

}
