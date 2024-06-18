-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vexillumschema
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stock_amount`
--

DROP TABLE IF EXISTS `stock_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_amount` (
  `stockid` int NOT NULL,
  `sizeid` int NOT NULL,
  `amount` int DEFAULT '0',
  `restock` int DEFAULT '0',
  PRIMARY KEY (`stockid`,`sizeid`),
  KEY `arraysizeid_idx` (`sizeid`),
  CONSTRAINT `arraysizeid` FOREIGN KEY (`sizeid`) REFERENCES `sizes` (`sizeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `arraystockid` FOREIGN KEY (`stockid`) REFERENCES `stockmanager` (`stockid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_amount`
--

LOCK TABLES `stock_amount` WRITE;
/*!40000 ALTER TABLE `stock_amount` DISABLE KEYS */;
INSERT INTO `stock_amount` VALUES (0,0,9,2),(0,1,9,2),(0,2,9,2),(0,3,9,2),(0,4,9,2),(1,0,7,8),(1,1,11,9),(1,2,5,3),(1,3,15,9),(1,4,3,9),(2,0,15,6),(2,1,17,9),(2,2,3,7),(2,3,13,3),(2,4,19,8),(3,0,13,4),(3,1,14,5),(3,2,1,4),(3,3,14,4),(3,4,17,8),(4,0,12,6),(4,1,2,7),(4,2,1,7),(4,3,12,9),(4,4,15,4),(5,0,14,8),(5,1,2,4),(5,2,17,7),(5,3,16,3),(5,4,17,6),(6,0,15,6),(6,1,15,6),(6,2,16,5),(6,3,11,6),(6,4,19,5),(7,0,5,8),(7,1,10,3),(7,2,4,5),(7,3,4,9),(7,4,7,4),(8,0,15,5),(8,1,7,4),(8,2,14,3),(8,3,12,4),(8,4,17,5),(9,0,3,9),(9,1,14,4),(9,2,10,9),(9,3,12,9),(9,4,12,6),(10,0,12,9),(10,1,13,7),(10,2,2,7),(10,3,16,8),(10,4,13,4),(11,0,8,7),(11,1,17,5),(11,2,15,3),(11,3,17,3),(11,4,13,6),(12,0,2,7),(12,1,14,9),(12,2,2,8),(12,3,15,8),(12,4,5,8),(13,0,3,5),(13,1,6,6),(13,2,4,6),(13,3,1,4),(13,4,5,6),(14,0,1,5),(14,1,3,5),(14,2,4,3),(14,3,5,6),(14,4,19,5),(15,0,10,2),(15,1,17,7),(15,2,2,4),(15,3,19,7),(15,4,8,5),(16,0,7,9),(16,1,19,9),(16,2,6,3),(16,3,2,8),(16,4,2,3),(17,0,11,3),(17,1,0,4),(17,2,18,6),(17,3,16,4),(17,4,5,6),(18,0,5,4),(18,1,9,3),(18,2,9,9),(18,3,9,3),(18,4,4,8),(19,0,1,8),(19,1,19,9),(19,2,5,7),(19,3,16,5),(19,4,11,7),(20,0,19,7),(20,1,7,3),(20,2,10,8),(20,3,18,9),(20,4,8,5),(21,0,4,6),(21,1,9,6),(21,2,20,6),(21,3,22,6),(21,4,16,6),(22,0,8,6),(22,1,7,5),(22,2,15,6),(22,3,5,5),(22,4,18,8),(23,0,18,8),(23,1,15,7),(23,2,19,4),(23,3,15,8),(23,4,19,5),(24,0,11,8),(24,1,1,4),(24,2,17,3),(24,3,9,7),(24,4,13,5),(25,0,14,5),(25,1,3,9),(25,2,6,4),(25,3,7,8),(25,4,16,3),(26,0,6,6),(26,1,4,9),(26,2,11,9),(26,3,12,6),(26,4,11,7),(27,0,13,8),(27,1,13,6),(27,2,19,4),(27,3,12,7),(27,4,8,7),(28,0,3,6),(28,1,5,6),(28,2,6,6),(28,3,11,6),(28,4,7,6),(29,0,11,4),(29,1,18,7),(29,2,5,6),(29,3,2,7),(29,4,1,9),(30,0,18,7),(30,1,14,4),(30,2,5,4),(30,3,16,5),(30,4,13,4),(31,0,7,4),(31,1,4,5),(31,2,15,7),(31,3,9,8),(31,4,5,3),(32,0,11,7),(32,1,16,9),(32,2,18,6),(32,3,18,6),(32,4,7,3),(33,0,8,7),(33,1,12,9),(33,2,19,5),(33,3,10,8),(33,4,17,3),(34,0,9,9),(34,1,7,5),(34,2,13,3),(34,3,17,8),(34,4,17,8),(35,0,3,5),(35,1,10,4),(35,2,2,6),(35,3,8,5),(35,4,14,6),(36,0,8,8),(36,1,3,4),(36,2,1,7),(36,3,7,4),(36,4,12,8),(37,0,5,9),(37,1,17,9),(37,2,3,6),(37,3,19,7),(37,4,12,8),(38,0,1,7),(38,1,5,5),(38,2,4,5),(38,3,4,5),(38,4,6,4),(39,0,18,9),(39,1,5,5),(39,2,2,7),(39,3,13,6),(39,4,15,5),(40,0,5,8),(40,1,4,6),(40,2,8,3),(40,3,13,8),(40,4,18,6),(41,0,14,6),(41,1,13,5),(41,2,15,8),(41,3,1,8),(41,4,12,4),(42,0,6,6),(42,1,3,4),(42,2,16,9),(42,3,15,7),(42,4,16,4),(43,0,3,3),(43,1,3,7),(43,2,13,3),(43,3,17,8),(43,4,10,6),(44,0,19,9),(44,1,2,8),(44,2,18,5),(44,3,2,7),(44,4,4,6),(45,0,18,3),(45,1,5,9),(45,2,7,4),(45,3,6,8),(45,4,19,6),(46,0,2,6),(46,1,5,6),(46,2,19,7),(46,3,9,3),(46,4,9,4),(47,0,9,7),(47,1,19,4),(47,2,12,6),(47,3,8,3),(47,4,7,6),(48,0,1,8),(48,1,3,3),(48,2,4,9),(48,3,8,7),(48,4,6,8),(49,0,1,7),(49,1,13,8),(49,2,9,4),(49,3,12,8),(49,4,9,9),(50,0,17,4),(50,1,18,4),(50,2,3,6),(50,3,4,5),(50,4,15,5),(51,0,16,7),(51,1,11,3),(51,2,1,7),(51,3,4,3),(51,4,7,5),(52,0,5,5),(52,1,13,7),(52,2,13,8),(52,3,19,8),(52,4,11,9),(53,0,9,8),(53,1,4,4),(53,2,10,3),(53,3,3,9),(53,4,3,3),(54,0,13,8),(54,1,10,7),(54,2,10,9),(54,3,15,5),(54,4,16,5),(55,0,10,4),(55,1,7,7),(55,2,4,6),(55,3,22,5),(55,4,5,3),(56,0,14,6),(56,1,7,3),(56,2,2,7),(56,3,2,9),(56,4,16,3),(57,0,11,7),(57,1,4,4),(57,2,16,9),(57,3,5,5),(57,4,3,5),(58,0,11,6),(58,1,6,9),(58,2,6,4),(58,3,18,8),(58,4,3,7),(59,0,12,9),(59,1,14,6),(59,2,8,4),(59,3,9,7),(59,4,14,8),(60,0,4,6),(60,1,9,4),(60,2,15,3),(60,3,19,4),(60,4,8,4),(61,0,9,5),(61,1,19,5),(61,2,7,3),(61,3,9,4),(61,4,10,4),(62,0,2,9),(62,1,7,4),(62,2,13,5),(62,3,14,6),(62,4,8,7),(63,0,1,6),(63,1,17,4),(63,2,15,7),(63,3,2,9),(63,4,19,5),(64,0,2,5),(64,1,8,6),(64,2,9,6),(64,3,3,9),(64,4,15,4),(65,0,4,7),(65,1,10,6),(65,2,7,5),(65,3,1,4),(65,4,13,8),(66,0,5,4),(66,1,7,5),(66,2,10,9),(66,3,16,5),(66,4,19,8),(67,0,11,6),(67,1,5,9),(67,2,6,8),(67,3,6,7),(67,4,9,8),(68,0,14,5),(68,1,19,5),(68,2,17,9),(68,3,14,7),(68,4,6,9),(69,0,3,4),(69,1,12,9),(69,2,3,7),(69,3,4,3),(69,4,15,5),(70,0,16,5),(70,1,5,4),(70,2,4,6),(70,3,7,3),(70,4,9,4),(71,0,3,3),(71,1,3,9),(71,2,5,4),(71,3,18,5),(71,4,17,7),(72,0,5,7),(72,1,2,5),(72,2,4,9),(72,3,13,5),(72,4,15,9),(73,0,7,5),(73,1,18,5),(73,2,12,5),(73,3,8,7),(73,4,3,9),(74,0,4,7),(74,1,15,8),(74,2,15,5),(74,3,6,8),(74,4,16,5),(75,0,4,7),(75,1,1,3),(75,2,4,8),(75,3,12,7),(75,4,18,3),(76,0,15,9),(76,1,17,4),(76,2,3,7),(76,3,16,9),(76,4,1,6),(77,0,3,4),(77,1,17,6),(77,2,10,3),(77,3,7,6),(77,4,6,8),(78,0,6,7),(78,1,2,5),(78,2,11,3),(78,3,7,3),(78,4,6,9),(79,0,6,5),(79,1,12,6),(79,2,12,9),(79,3,10,9),(79,4,10,6),(80,0,18,5),(80,1,5,3),(80,2,9,8),(80,3,19,3),(80,4,10,9),(81,0,14,8),(81,1,16,8),(81,2,12,6),(81,3,8,5),(81,4,7,9),(82,0,18,3),(82,1,9,3),(82,2,7,7),(82,3,7,7),(82,4,18,6),(83,0,2,9),(83,1,2,4),(83,2,6,7),(83,3,12,6),(83,4,4,3),(84,0,15,9),(84,1,2,6),(84,2,11,4),(84,3,6,7),(84,4,2,9),(85,0,15,7),(85,1,11,7),(85,2,14,7),(85,3,2,3),(85,4,14,9),(86,0,16,7),(86,1,7,6),(86,2,8,4),(86,3,6,5),(86,4,1,4),(87,0,12,4),(87,1,6,6),(87,2,9,3),(87,3,5,3),(87,4,1,7),(88,0,15,4),(88,1,16,7),(88,2,4,4),(88,3,5,4),(88,4,4,5),(89,0,11,5),(89,1,17,3),(89,2,9,5),(89,3,18,8),(89,4,15,7),(90,0,4,6),(90,1,2,6),(90,2,10,9),(90,3,18,7),(90,4,12,7),(91,0,1,3),(91,1,17,7),(91,2,1,8),(91,3,4,3),(91,4,4,9),(92,0,4,4),(92,1,13,7),(92,2,13,3),(92,3,17,4),(92,4,4,8),(93,0,6,7),(93,1,8,7),(93,2,2,9),(93,3,13,6),(93,4,4,3),(94,0,10,7),(94,1,13,9),(94,2,4,9),(94,3,7,5),(94,4,18,4),(95,0,19,5),(95,1,17,3),(95,2,2,5),(95,3,8,3),(95,4,4,7),(96,0,9,4),(96,1,2,6),(96,2,1,4),(96,3,2,8),(96,4,8,6),(97,0,7,4),(97,1,10,4),(97,2,1,6),(97,3,17,6),(97,4,5,5),(98,0,8,7),(98,1,10,9),(98,2,11,8),(98,3,19,4),(98,4,4,8),(99,0,9,7),(99,1,4,5),(99,2,1,7),(99,3,7,5),(99,4,5,4),(100,0,2,7),(100,1,15,9),(100,2,1,9),(100,3,9,9),(100,4,14,4),(101,0,15,9),(101,1,13,5),(101,2,10,8),(101,3,13,6),(101,4,11,3),(102,0,14,6),(102,1,18,6),(102,2,9,8),(102,3,14,9),(102,4,16,9),(103,0,8,9),(103,1,9,5),(103,2,19,9),(103,3,8,7),(103,4,9,3),(104,0,8,6),(104,1,17,7),(104,2,2,7),(104,3,9,6),(104,4,9,3),(105,0,9,9),(105,1,9,6),(105,2,17,4),(105,3,5,3),(105,4,14,5),(106,0,5,6),(106,1,2,7),(106,2,10,5),(106,3,13,9),(106,4,3,3),(107,0,4,8),(107,1,7,5),(107,2,16,3),(107,3,7,8),(107,4,11,8),(108,0,16,7),(108,1,2,3),(108,2,14,5),(108,3,3,3),(108,4,12,3),(109,0,6,7),(109,1,9,4),(109,2,19,4),(109,3,8,8),(109,4,7,6),(110,0,13,9),(110,1,4,4),(110,2,7,9),(110,3,3,8),(110,4,16,5),(111,0,16,8),(111,1,17,7),(111,2,16,3),(111,3,4,9),(111,4,12,7),(112,0,18,4),(112,1,18,4),(112,2,3,9),(112,3,15,6),(112,4,6,9),(113,0,1,4),(113,1,3,7),(113,2,11,9),(113,3,15,5),(113,4,2,5),(114,0,13,7),(114,1,3,5),(114,2,16,4),(114,3,12,4),(114,4,9,9),(115,0,15,5),(115,1,19,4),(115,2,19,8),(115,3,7,9),(115,4,7,9),(116,0,10,5),(116,1,11,9),(116,2,12,3),(116,3,9,9),(116,4,5,5),(117,0,12,6),(117,1,19,7),(117,2,19,6),(117,3,7,7),(117,4,8,8),(118,0,12,7),(118,1,17,4),(118,2,8,9),(118,3,15,7),(118,4,12,3),(119,0,12,3),(119,1,6,3),(119,2,11,7),(119,3,6,5),(119,4,3,3),(120,0,14,7),(120,1,1,6),(120,2,6,7),(120,3,3,4),(120,4,12,6),(121,0,10,9),(121,1,17,5),(121,2,11,3),(121,3,9,8),(121,4,10,4),(122,0,18,3),(122,1,3,8),(122,2,18,6),(122,3,16,8),(122,4,17,5),(123,0,19,5),(123,1,13,3),(123,2,2,7),(123,3,19,6),(123,4,16,8),(124,0,6,9),(124,1,5,8),(124,2,1,5),(124,3,6,5),(124,4,15,4),(125,0,19,8),(125,1,1,6),(125,2,7,4),(125,3,1,4),(125,4,16,3),(126,0,11,7),(126,1,9,9),(126,2,1,5),(126,3,13,9),(126,4,1,5),(127,0,10,8),(127,1,19,7),(127,2,17,9),(127,3,8,9),(127,4,17,4),(128,0,13,8),(128,1,9,6),(128,2,1,5),(128,3,9,4),(128,4,5,8),(129,0,12,4),(129,1,15,8),(129,2,7,6),(129,3,16,7),(129,4,10,7),(130,0,8,3),(130,1,16,8),(130,2,10,8),(130,3,4,8),(130,4,3,9),(131,0,12,6),(131,1,2,4),(131,2,11,7),(131,3,7,3),(131,4,1,7),(132,0,13,9),(132,1,18,9),(132,2,1,4),(132,3,11,6),(132,4,15,8),(133,0,13,4),(133,1,9,8),(133,2,4,3),(133,3,19,9),(133,4,13,5),(134,0,14,9),(134,1,15,9),(134,2,19,7),(134,3,16,8),(134,4,19,6),(135,0,13,3),(135,1,1,8),(135,2,3,7),(135,3,4,6),(135,4,10,4),(136,0,12,4),(136,1,12,8),(136,2,18,9),(136,3,15,4),(136,4,16,3),(137,0,13,6),(137,1,14,9),(137,2,14,4),(137,3,6,3),(137,4,12,3),(138,0,14,7),(138,1,7,8),(138,2,9,9),(138,3,18,6),(138,4,15,4),(139,0,14,3),(139,1,10,4),(139,2,8,8),(139,3,4,3),(139,4,19,4),(140,0,13,3),(140,1,4,5),(140,2,5,7),(140,3,15,5),(140,4,12,6),(141,0,14,6),(141,1,3,5),(141,2,15,3),(141,3,14,7),(141,4,12,7),(142,0,18,6),(142,1,19,7),(142,2,2,8),(142,3,18,7),(142,4,17,5),(143,0,9,5),(143,1,19,5),(143,2,15,5),(143,3,12,9),(143,4,13,8),(144,0,1,7),(144,1,16,4),(144,2,14,9),(144,3,3,3),(144,4,16,9),(145,0,1,5),(145,1,7,9),(145,2,3,3),(145,3,16,5),(145,4,5,7),(146,0,10,4),(146,1,14,8),(146,2,18,4),(146,3,15,5),(146,4,16,9),(147,0,15,9),(147,1,4,9),(147,2,15,7),(147,3,1,7),(147,4,10,9),(148,0,14,6),(148,1,13,9),(148,2,12,8),(148,3,15,9),(148,4,5,7),(149,0,1,4),(149,1,17,3),(149,2,15,6),(149,3,6,9),(149,4,3,3),(150,0,2,6),(150,1,1,5),(150,2,9,3),(150,3,19,4),(150,4,14,5),(151,0,5,4),(151,1,9,5),(151,2,18,4),(151,3,12,3),(151,4,7,8),(152,0,10,3),(152,1,19,4),(152,2,10,9),(152,3,1,9),(152,4,16,3),(153,0,3,5),(153,1,8,8),(153,2,12,4),(153,3,11,3),(153,4,17,9),(154,0,10,3),(154,1,15,3),(154,2,17,9),(154,3,4,4),(154,4,5,5),(155,0,14,6),(155,1,5,5),(155,2,10,7),(155,3,16,6),(155,4,18,9),(156,0,18,3),(156,1,15,5),(156,2,5,2),(156,3,2,8),(156,4,7,3),(157,0,13,4),(157,1,6,9),(157,2,12,6),(157,3,12,4),(157,4,18,3),(158,0,8,8),(158,1,1,6),(158,2,1,3),(158,3,14,9),(158,4,18,5),(159,0,4,7),(159,1,12,7),(159,2,18,6),(159,3,5,9),(159,4,16,3),(160,0,10,7),(160,1,9,8),(160,2,19,8),(160,3,17,6),(160,4,19,3),(161,0,15,9),(161,1,7,4),(161,2,11,3),(161,3,6,3),(161,4,8,7),(162,0,8,4),(162,1,15,8),(162,2,1,6),(162,3,4,7),(162,4,2,9),(163,0,17,8),(163,1,14,5),(163,2,11,7),(163,3,10,9),(163,4,5,4),(164,0,17,3),(164,1,13,3),(164,2,4,7),(164,3,6,9),(164,4,19,3),(165,0,17,8),(165,1,1,5),(165,2,10,6),(165,3,5,9),(165,4,3,9),(166,0,12,3),(166,1,12,6),(166,2,13,7),(166,3,19,6),(166,4,7,6),(167,0,2,5),(167,1,12,3),(167,2,12,9),(167,3,2,5),(167,4,1,4),(168,0,8,4),(168,1,9,4),(168,2,1,9),(168,3,4,8),(168,4,1,4),(169,0,17,4),(169,1,12,8),(169,2,13,8),(169,3,2,5),(169,4,11,4),(170,0,10,8),(170,1,6,4),(170,2,10,6),(170,3,16,9),(170,4,6,6),(171,0,15,8),(171,1,6,3),(171,2,14,3),(171,3,11,6),(171,4,5,8),(172,0,19,3),(172,1,17,6),(172,2,4,8),(172,3,7,6),(172,4,4,3),(173,0,15,6),(173,1,3,2),(173,2,16,4),(173,3,4,6),(173,4,18,6),(174,0,10,3),(174,1,4,9),(174,2,10,3),(174,3,13,6),(174,4,19,6),(175,0,8,2),(175,1,14,7),(175,2,16,7),(175,3,17,9),(175,4,18,4),(176,0,3,8),(176,1,17,9),(176,2,2,4),(176,3,14,6),(176,4,17,4),(177,0,9,5),(177,1,5,3),(177,2,12,7),(177,3,3,7),(177,4,6,9),(178,0,14,8),(178,1,11,6),(178,2,6,7),(178,3,4,5),(178,4,12,5),(179,0,11,8),(179,1,1,8),(179,2,8,7),(179,3,11,3),(179,4,10,5),(180,0,18,3),(180,1,11,3),(180,2,12,4),(180,3,17,6),(180,4,13,5),(181,0,10,8),(181,1,2,4),(181,2,16,8),(181,3,2,6),(181,4,11,9),(182,0,9,6),(182,1,12,4),(182,2,4,8),(182,3,1,3),(182,4,19,3),(183,0,8,6),(183,1,10,7),(183,2,11,4),(183,3,19,8),(183,4,4,3),(184,0,11,5),(184,1,10,4),(184,2,8,8),(184,3,12,3),(184,4,17,5),(185,0,7,4),(185,1,3,4),(185,2,16,6),(185,3,1,3),(185,4,3,3),(186,0,11,9),(186,1,16,9),(186,2,19,8),(186,3,15,6),(186,4,16,4),(187,0,15,6),(187,1,6,4),(187,2,18,8),(187,3,6,3),(187,4,6,5),(188,0,7,4),(188,1,5,7),(188,2,3,6),(188,3,12,7),(188,4,11,8),(189,0,14,7),(189,1,5,6),(189,2,9,8),(189,3,3,8),(189,4,5,4),(190,0,16,3),(190,1,19,4),(190,2,13,4),(190,3,7,6),(190,4,16,3),(191,0,18,6),(191,1,12,5),(191,2,1,9),(191,3,1,4),(191,4,2,3),(192,0,11,3),(192,1,19,3),(192,2,1,9),(192,3,8,6),(192,4,4,5),(193,0,19,6),(193,1,7,8),(193,2,17,7),(193,3,11,8),(193,4,1,6),(194,0,15,4),(194,1,15,6),(194,2,8,3),(194,3,2,5),(194,4,12,9),(195,0,10,9),(195,1,15,7),(195,2,4,7),(195,3,1,7),(195,4,5,6),(196,0,16,11),(196,1,15,3),(196,2,2,4),(196,3,10,3),(196,4,19,7),(197,0,9,7),(197,1,13,3),(197,2,16,8),(197,3,5,4),(197,4,1,3),(198,0,6,7),(198,1,9,8),(198,2,15,5),(198,3,17,9),(198,4,3,9),(199,0,2,4),(199,1,5,9),(199,2,8,7),(199,3,18,5),(199,4,1,3),(200,0,10,9),(200,1,19,4),(200,2,15,9),(200,3,4,6),(200,4,2,8),(201,0,12,8),(201,1,1,5),(201,2,11,5),(201,3,13,3),(201,4,1,5),(202,0,10,9),(202,1,8,4),(202,2,17,9),(202,3,7,6),(202,4,18,3),(203,0,19,8),(203,1,15,9),(203,2,1,6),(203,3,9,9),(203,4,1,7),(204,0,16,7),(204,1,10,6),(204,2,9,9),(204,3,4,3),(204,4,16,8),(205,0,5,4),(205,1,13,5),(205,2,17,5),(205,3,9,6),(205,4,8,9),(206,0,16,9),(206,1,6,9),(206,2,13,3),(206,3,18,7),(206,4,10,4),(207,0,8,7),(207,1,19,8),(207,2,13,7),(207,3,1,6),(207,4,4,9),(208,0,7,8),(208,1,10,3),(208,2,14,6),(208,3,18,9),(208,4,7,4),(209,0,8,7),(209,1,9,7),(209,2,16,7),(209,3,4,3),(209,4,17,8),(210,0,17,4),(210,1,5,5),(210,2,3,5),(210,3,11,5),(210,4,9,4),(211,0,19,8),(211,1,17,4),(211,2,10,4),(211,3,11,5),(211,4,4,4),(212,0,10,5),(212,1,10,5),(212,2,15,3),(212,3,8,3),(212,4,14,6),(213,0,12,8),(213,1,16,4),(213,2,9,9),(213,3,18,5),(213,4,7,9),(214,0,1,5),(214,1,14,4),(214,2,15,8),(214,3,16,9),(214,4,7,9),(215,0,16,5),(215,1,3,5),(215,2,4,3),(215,3,12,9),(215,4,18,9),(216,0,1,9),(216,1,10,4),(216,2,8,8),(216,3,1,7),(216,4,3,8),(217,0,2,7),(217,1,5,3),(217,2,15,9),(217,3,19,4),(217,4,12,4),(218,0,11,6),(218,1,6,9),(218,2,13,9),(218,3,10,6),(218,4,6,3),(219,0,4,8),(219,1,12,4),(219,2,12,9),(219,3,13,7),(219,4,4,6),(220,0,17,5),(220,1,18,8),(220,2,11,4),(220,3,11,5),(220,4,19,8),(221,0,15,7),(221,1,16,9),(221,2,3,9),(221,3,4,7),(221,4,19,3),(222,0,9,3),(222,1,3,4),(222,2,14,6),(222,3,1,6),(222,4,1,8),(223,0,10,3),(223,1,9,7),(223,2,6,6),(223,3,9,5),(223,4,13,5),(224,0,17,8),(224,1,6,6),(224,2,7,5),(224,3,2,6),(224,4,11,8),(225,0,6,8),(225,1,19,3),(225,2,9,7),(225,3,14,5),(225,4,1,4),(226,0,3,8),(226,1,10,6),(226,2,9,4),(226,3,8,9),(226,4,8,3),(227,0,1,7),(227,1,10,3),(227,2,10,7),(227,3,12,5),(227,4,1,9),(228,0,9,3),(228,1,15,7),(228,2,5,3),(228,3,13,3),(228,4,17,6),(229,0,2,8),(229,1,9,5),(229,2,4,7),(229,3,14,9),(229,4,3,9),(230,0,16,5),(230,1,5,8),(230,2,16,8),(230,3,4,4),(230,4,5,7),(231,0,12,8),(231,1,15,3),(231,2,3,6),(231,3,7,3),(231,4,12,7),(232,0,6,7),(232,1,3,8),(232,2,5,7),(232,3,4,9),(232,4,14,3),(233,0,12,9),(233,1,5,7),(233,2,14,6),(233,3,19,8),(233,4,1,5),(234,0,11,3),(234,1,19,3),(234,2,15,4),(234,3,11,9),(234,4,12,9),(235,0,7,5),(235,1,2,3),(235,2,1,4),(235,3,7,8),(235,4,15,9),(236,0,13,6),(236,1,13,7),(236,2,19,6),(236,3,14,4),(236,4,19,5),(237,0,5,5),(237,1,18,4),(237,2,7,9),(237,3,17,8),(237,4,2,5),(238,0,8,4),(238,1,1,9),(238,2,7,3),(238,3,17,6),(238,4,13,4),(239,0,11,6),(239,1,13,7),(239,2,2,4),(239,3,3,4),(239,4,8,5),(240,0,19,4),(240,1,1,6),(240,2,6,9),(240,3,18,6),(240,4,9,7),(241,0,9,7),(241,1,6,4),(241,2,7,8),(241,3,14,5),(241,4,9,3),(242,0,16,3),(242,1,15,8),(242,2,11,6),(242,3,6,8),(242,4,13,7),(243,0,11,4),(243,1,10,3),(243,2,2,9),(243,3,1,8),(243,4,19,8),(244,0,18,5),(244,1,12,4),(244,2,8,4),(244,3,18,4),(244,4,2,9),(245,0,5,4),(245,1,5,9),(245,2,10,7),(245,3,13,4),(245,4,15,5),(246,0,10,7),(246,1,14,9),(246,2,5,3),(246,3,3,5),(246,4,11,5),(247,0,17,4),(247,1,10,3),(247,2,1,6),(247,3,7,5),(247,4,9,6),(248,0,8,4),(248,1,19,9),(248,2,14,8),(248,3,19,5),(248,4,19,6),(249,0,12,4),(249,1,14,9),(249,2,7,9),(249,3,13,9),(249,4,17,6),(250,0,2,8),(250,1,14,3),(250,2,1,3),(250,3,16,6),(250,4,7,8),(251,0,1,5),(251,1,1,6),(251,2,13,8),(251,3,17,6),(251,4,18,6),(252,0,1,8),(252,1,17,3),(252,2,9,5),(252,3,6,5),(252,4,16,9),(253,0,3,8),(253,1,3,9),(253,2,19,6),(253,3,4,4),(253,4,13,5),(254,0,10,4),(254,1,16,5),(254,2,18,5),(254,3,3,5),(254,4,5,8),(255,0,7,4),(255,1,14,6),(255,2,16,8),(255,3,5,9),(255,4,9,4),(256,0,6,3),(256,1,13,5),(256,2,15,8),(256,3,4,7),(256,4,14,9),(257,0,7,4),(257,1,15,5),(257,2,10,6),(257,3,19,5),(257,4,16,5),(258,0,13,8),(258,1,4,4),(258,2,4,9),(258,3,3,6),(258,4,5,5),(259,0,11,4),(259,1,2,4),(259,2,11,3),(259,3,19,4),(259,4,9,6),(260,0,5,8),(260,1,7,6),(260,2,4,8),(260,3,11,6),(260,4,19,7),(261,0,13,9),(261,1,8,9),(261,2,9,3),(261,3,6,3),(261,4,2,8),(262,0,12,8),(262,1,16,5),(262,2,5,6),(262,3,8,7),(262,4,15,5),(263,0,12,3),(263,1,19,8),(263,2,17,3),(263,3,13,8),(263,4,14,8),(264,0,16,3),(264,1,6,4),(264,2,6,7),(264,3,16,6),(264,4,2,8),(265,0,10,7),(265,1,9,4),(265,2,9,6),(265,3,4,3),(265,4,15,8),(266,0,0,7),(266,1,5,4),(266,2,18,7),(266,3,17,5),(266,4,5,7),(267,0,16,8),(267,1,6,7),(267,2,16,7),(267,3,15,6),(267,4,12,9),(268,0,11,9),(268,1,9,4),(268,2,8,7),(268,3,16,5),(268,4,17,4),(269,0,14,5),(269,1,16,9),(269,2,10,9),(269,3,18,6),(269,4,1,7),(270,0,12,3),(270,1,19,5),(270,2,8,6),(270,3,5,3),(270,4,10,7),(271,0,4,3),(271,1,8,6),(271,2,11,3),(271,3,16,6),(271,4,10,7),(272,0,9,9),(272,1,6,4),(272,2,8,3),(272,3,16,3),(272,4,5,3),(273,0,18,6),(273,1,14,4),(273,2,8,8),(273,3,15,5),(273,4,14,6),(274,0,6,7),(274,1,4,3),(274,2,7,3),(274,3,13,9),(274,4,16,6),(275,0,16,3),(275,1,7,9),(275,2,17,6),(275,3,5,8),(275,4,12,7),(276,0,9,8),(276,1,2,4),(276,2,15,6),(276,3,3,5),(276,4,17,5),(277,0,3,3),(277,1,3,9),(277,2,3,3),(277,3,17,3),(277,4,10,4),(278,0,11,4),(278,1,6,5),(278,2,19,8),(278,3,9,4),(278,4,15,3),(279,0,9,4),(279,1,13,6),(279,2,10,3),(279,3,11,6),(279,4,11,5),(280,0,1,3),(280,1,6,7),(280,2,19,3),(280,3,2,3),(280,4,6,7),(281,0,13,6),(281,1,1,9),(281,2,9,7),(281,3,14,3),(281,4,6,3),(282,0,18,5),(282,1,16,9),(282,2,10,7),(282,3,11,5),(282,4,7,9),(283,0,1,4),(283,1,12,4),(283,2,8,9),(283,3,10,6),(283,4,4,5),(284,0,16,6),(284,1,1,6),(284,2,4,3),(284,3,12,7),(284,4,2,5),(285,0,16,5),(285,1,5,8),(285,2,1,8),(285,3,8,4),(285,4,7,8),(286,0,16,3),(286,1,1,9),(286,2,5,9),(286,3,14,8),(286,4,14,5),(287,0,16,3),(287,1,18,3),(287,2,15,4),(287,3,1,8),(287,4,2,4),(288,0,10,3),(288,1,13,3),(288,2,5,6),(288,3,9,3),(288,4,9,6),(289,0,6,5),(289,1,14,4),(289,2,10,5),(289,3,1,9),(289,4,4,9),(290,0,8,8),(290,1,19,3),(290,2,6,5),(290,3,3,8),(290,4,1,5),(291,0,12,7),(291,1,6,7),(291,2,8,4),(291,3,3,7),(291,4,16,7),(292,0,11,7),(292,1,5,4),(292,2,14,6),(292,3,9,3),(292,4,11,9),(293,0,9,6),(293,1,3,3),(293,2,14,3),(293,3,11,4),(293,4,5,3),(294,0,10,4),(294,1,19,7),(294,2,8,5),(294,3,16,8),(294,4,14,3),(295,0,4,8),(295,1,3,6),(295,2,11,8),(295,3,6,5),(295,4,10,4),(296,0,12,3),(296,1,14,7),(296,2,8,6),(296,3,8,4),(296,4,3,7),(297,0,1,3),(297,1,16,4),(297,2,18,7),(297,3,8,6),(297,4,6,9),(298,0,11,4),(298,1,8,8),(298,2,17,3),(298,3,6,8),(298,4,7,5),(299,0,6,9),(299,1,2,3),(299,2,13,7),(299,3,4,5),(299,4,14,7),(300,0,13,5),(300,1,1,9),(300,2,6,3),(300,3,7,9),(300,4,11,4),(301,0,10,3),(301,1,2,8),(301,2,6,5),(301,3,9,4),(301,4,11,5),(302,0,8,5),(302,1,12,4),(302,2,16,9),(302,3,18,5),(302,4,17,6),(303,0,13,5),(303,1,5,3),(303,2,8,9),(303,3,17,3),(303,4,16,8),(304,0,13,3),(304,1,16,9),(304,2,3,8),(304,3,6,7),(304,4,5,6),(305,0,11,3),(305,1,4,6),(305,2,6,8),(305,3,19,9),(305,4,15,3),(306,0,14,8),(306,1,1,6),(306,2,11,5),(306,3,18,8),(306,4,1,3),(307,0,3,3),(307,1,5,5),(307,2,2,8),(307,3,8,7),(307,4,5,6),(308,0,13,4),(308,1,10,9),(308,2,4,8),(308,3,2,9),(308,4,10,5),(309,0,9,3),(309,1,1,6),(309,2,7,7),(309,3,4,7),(309,4,17,4),(310,0,18,3),(310,1,7,4),(310,2,19,9),(310,3,7,6),(310,4,6,9),(311,0,16,5),(311,1,3,6),(311,2,1,8),(311,3,13,6),(311,4,14,8),(312,0,4,5),(312,1,11,9),(312,2,4,4),(312,3,2,4),(312,4,13,7),(313,0,13,5),(313,1,17,6),(313,2,6,3),(313,3,15,7),(313,4,7,7),(314,0,5,6),(314,1,18,9),(314,2,5,9),(314,3,5,6),(314,4,6,3),(315,0,15,7),(315,1,6,4),(315,2,11,5),(315,3,12,5),(315,4,4,8),(316,0,1,9),(316,1,19,5),(316,2,9,7),(316,3,7,4),(316,4,1,4),(317,0,14,7),(317,1,2,8),(317,2,16,4),(317,3,3,3),(317,4,1,7),(318,0,13,8),(318,1,8,4),(318,2,11,9),(318,3,3,9),(318,4,10,5),(319,0,0,6),(319,1,5,5),(319,2,13,7),(319,3,3,9),(319,4,12,9),(320,0,4,5),(320,1,2,5),(320,2,15,3),(320,3,12,4),(320,4,14,7),(321,0,4,6),(321,1,8,8),(321,2,15,7),(321,3,19,3),(321,4,14,8),(322,0,19,7),(322,1,1,8),(322,2,15,8),(322,3,6,7),(322,4,10,4),(323,0,18,3),(323,1,2,9),(323,2,18,7),(323,3,14,9),(323,4,11,5),(324,0,19,9),(324,1,14,7),(324,2,6,3),(324,3,14,4),(324,4,13,3),(325,0,2,9),(325,1,9,7),(325,2,9,6),(325,3,1,9),(325,4,8,6),(326,0,12,6),(326,1,3,5),(326,2,9,7),(326,3,18,9),(326,4,12,4),(327,0,13,3),(327,1,12,6),(327,2,4,4),(327,3,9,8),(327,4,14,5),(328,5,1,4),(328,6,17,5),(328,7,8,7),(328,8,8,4),(329,5,8,4),(329,6,12,3),(329,7,10,4),(329,8,6,8),(330,5,19,4),(330,6,4,4),(330,7,3,5),(330,8,11,3),(331,5,6,4),(331,6,15,4),(331,7,17,6),(331,8,11,8),(332,5,4,7),(332,6,2,8),(332,7,14,3),(332,8,6,4),(333,5,9,3),(333,6,2,5),(333,7,18,5),(333,8,10,3),(334,5,1,4),(334,6,12,4),(334,7,11,3),(334,8,4,5),(335,5,6,5),(335,6,16,4),(335,7,2,6),(335,8,5,8),(336,5,13,6),(336,6,15,9),(336,7,8,5),(336,8,16,4),(337,5,14,3),(337,6,7,7),(337,7,19,9),(337,8,1,4),(338,5,8,3),(338,6,9,9),(338,7,9,6),(338,8,14,7),(339,5,4,5),(339,6,14,7),(339,7,19,5),(339,8,1,8),(340,5,10,4),(340,6,6,8),(340,7,14,3),(340,8,3,9),(341,5,2,9),(341,6,7,6),(341,7,11,7),(341,8,13,8),(342,5,7,3),(342,6,19,3),(342,7,3,5),(342,8,8,8),(343,5,4,8),(343,6,4,4),(343,7,4,5),(343,8,16,7),(344,5,15,9),(344,6,4,6),(344,7,2,3),(344,8,6,7),(345,5,6,3),(345,6,2,8),(345,7,6,7),(345,8,2,8),(346,5,1,7),(346,6,15,5),(346,7,12,4),(346,8,5,6),(347,5,7,5),(347,6,10,7),(347,7,2,7),(347,8,3,3),(348,5,11,7),(348,6,1,3),(348,7,16,5),(348,8,8,3),(349,5,5,4),(349,6,9,7),(349,7,13,4),(349,8,9,3),(350,5,15,6),(350,6,11,7),(350,7,15,4),(350,8,16,6),(351,5,16,3),(351,6,11,5),(351,7,4,7),(351,8,8,4),(352,5,16,8),(352,6,14,6),(352,7,2,8),(352,8,5,3),(353,5,11,6),(353,6,15,5),(353,7,17,7),(353,8,12,6),(354,5,6,7),(354,6,1,7),(354,7,17,9),(354,8,5,5),(355,5,8,8),(355,6,14,9),(355,7,6,4),(355,8,3,9),(356,5,12,7),(356,6,2,4),(356,7,4,3),(356,8,2,4),(357,5,10,3),(357,6,17,8),(357,7,2,9),(357,8,16,5),(358,5,16,4),(358,6,18,9),(358,7,2,7),(358,8,19,9),(359,5,18,4),(359,6,8,6),(359,7,5,3),(359,8,15,9),(360,5,15,9),(360,6,1,6),(360,7,19,3),(360,8,9,4),(361,5,17,7),(361,6,10,9),(361,7,19,4),(361,8,6,8),(362,5,4,5),(362,6,1,9),(362,7,15,3),(362,8,14,9),(363,5,14,9),(363,6,1,3),(363,7,19,8),(363,8,16,4),(364,5,5,8),(364,6,5,9),(364,7,2,3),(364,8,1,6),(365,5,18,3),(365,6,3,6),(365,7,8,7),(365,8,3,6),(366,5,14,5),(366,6,5,5),(366,7,5,4),(366,8,16,4),(367,5,16,4),(367,6,12,6),(367,7,7,5),(367,8,12,3),(368,5,9,7),(368,6,10,4),(368,7,12,5),(368,8,3,7),(369,5,8,8),(369,6,8,7),(369,7,6,4),(369,8,8,4),(370,5,8,5),(370,6,6,6),(370,7,15,6),(370,8,14,3),(371,5,8,6),(371,6,5,7),(371,7,3,8),(371,8,5,3),(372,5,13,5),(372,6,18,3),(372,7,18,9),(372,8,12,4),(373,5,10,6),(373,6,19,6),(373,7,12,6),(373,8,8,5),(374,5,10,4),(374,6,13,6),(374,7,2,9),(374,8,15,8),(375,5,1,7),(375,6,5,3),(375,7,15,3),(375,8,16,4),(376,5,18,5),(376,6,15,8),(376,7,15,7),(376,8,15,9),(377,5,4,3),(377,6,8,7),(377,7,19,8),(377,8,19,7),(378,5,9,9),(378,6,10,9),(378,7,11,3),(378,8,11,8),(379,5,11,3),(379,6,9,7),(379,7,7,5),(379,8,11,3),(380,5,5,8),(380,6,1,7),(380,7,18,3),(380,8,10,8),(381,5,16,7),(381,6,3,5),(381,7,13,7),(381,8,13,8),(382,5,14,9),(382,6,5,4),(382,7,15,5),(382,8,7,3),(383,5,7,9),(383,6,15,9),(383,7,10,6),(383,8,17,8),(384,5,15,9),(384,6,16,3),(384,7,4,5),(384,8,6,5),(385,5,17,6),(385,6,11,8),(385,7,1,5),(385,8,19,3),(386,5,5,4),(386,6,8,9),(386,7,19,5),(386,8,9,8),(387,5,5,6),(387,6,15,8),(387,7,12,4),(387,8,13,9),(388,5,2,6),(388,6,14,8),(388,7,11,5),(388,8,12,4),(389,5,6,4),(389,6,18,5),(389,7,8,4),(389,8,4,8),(390,5,7,7),(390,6,8,8),(390,7,2,3),(390,8,17,3),(391,5,17,4),(391,6,10,9),(391,7,14,4),(391,8,7,4),(392,5,16,7),(392,6,17,8),(392,7,2,8),(392,8,3,4),(393,5,7,8),(393,6,14,9),(393,7,11,4),(393,8,2,3),(394,5,13,8),(394,6,3,5),(394,7,13,6),(394,8,9,5),(395,5,16,3),(395,6,6,3),(395,7,10,5),(395,8,17,8),(396,5,1,5),(396,6,4,4),(396,7,14,4),(396,8,17,5),(397,5,13,3),(397,6,2,3),(397,7,3,7),(397,8,7,7),(398,5,13,6),(398,6,9,6),(398,7,10,4),(398,8,1,3),(399,5,18,4),(399,6,3,4),(399,7,19,5),(399,8,3,3),(400,5,17,8),(400,6,13,6),(400,7,14,3),(400,8,9,9),(401,5,8,6),(401,6,2,8),(401,7,10,9),(401,8,16,4),(402,5,12,7),(402,6,17,9),(402,7,10,7),(402,8,5,7),(403,5,4,7),(403,6,7,8),(403,7,12,4),(403,8,15,6),(404,5,2,5),(404,6,2,5),(404,7,5,4),(404,8,13,3),(405,5,18,3),(405,6,14,5),(405,7,13,4),(405,8,12,3),(406,5,7,5),(406,6,6,6),(406,7,8,7),(406,8,10,3),(407,5,11,6),(407,6,10,4),(407,7,18,3),(407,8,1,7),(408,5,17,6),(408,6,9,3),(408,7,10,8),(408,8,17,3),(409,5,1,8),(409,6,6,4),(409,7,14,8),(409,8,5,5),(410,5,13,5),(410,6,9,3),(410,7,9,3),(410,8,8,6),(411,5,9,6),(411,6,9,6),(411,7,17,5),(411,8,15,5),(412,5,10,6),(412,6,13,6),(412,7,6,3),(412,8,8,3),(413,5,8,5),(413,6,6,5),(413,7,2,6),(413,8,14,5),(414,5,18,4),(414,6,12,3),(414,7,1,3),(414,8,16,6),(415,5,5,6),(415,6,10,9),(415,7,11,4),(415,8,2,5),(416,5,8,4),(416,6,5,8),(416,7,14,7),(416,8,14,4),(417,5,10,9),(417,6,5,4),(417,7,10,6),(417,8,11,4),(418,5,18,7),(418,6,16,5),(418,7,15,8),(418,8,1,5),(419,5,4,7),(419,6,9,9),(419,7,17,5),(419,8,5,8),(420,5,10,3),(420,6,18,4),(420,7,7,9),(420,8,10,8),(421,5,9,3),(421,6,8,4),(421,7,9,4),(421,8,12,3),(422,5,18,6),(422,6,12,9),(422,7,5,5),(422,8,15,8),(423,5,18,9),(423,6,10,9),(423,7,8,7),(423,8,3,5),(424,5,9,9),(424,6,13,9),(424,7,19,9),(424,8,15,3),(425,5,1,4),(425,6,8,9),(425,7,2,3),(425,8,19,8),(426,5,17,8),(426,6,4,6),(426,7,14,3),(426,8,14,8),(427,5,6,3),(427,6,15,9),(427,7,8,8),(427,8,15,9),(428,5,6,8),(428,6,10,7),(428,7,4,9),(428,8,11,3),(429,5,9,3),(429,6,2,5),(429,7,18,9),(429,8,6,3),(430,5,15,4),(430,6,15,7),(430,7,17,8),(430,8,11,8),(431,5,2,9),(431,6,13,7),(431,7,16,4),(431,8,5,3),(432,5,3,7),(432,6,15,3),(432,7,9,4),(432,8,17,3),(433,5,10,8),(433,6,16,7),(433,7,19,7),(433,8,4,6),(434,5,5,3),(434,6,12,3),(434,7,4,9),(434,8,7,6),(435,5,10,6),(435,6,15,3),(435,7,6,9),(435,8,17,8),(436,5,7,6),(436,6,15,8),(436,7,9,7),(436,8,7,4),(437,5,5,9),(437,6,1,9),(437,7,19,3),(437,8,5,6),(438,5,16,3),(438,6,3,5),(438,7,19,6),(438,8,6,7),(439,5,18,9),(439,6,2,7),(439,7,13,4),(439,8,4,5),(440,5,8,9),(440,6,10,8),(440,7,14,9),(440,8,1,7),(441,5,19,4),(441,6,9,5),(441,7,12,7),(441,8,13,3),(442,5,6,4),(442,6,2,8),(442,7,6,4),(442,8,1,7),(443,5,3,7),(443,6,9,9),(443,7,9,5),(443,8,17,6),(444,5,4,6),(444,6,4,9),(444,7,17,6),(444,8,3,6),(445,5,13,5),(445,6,16,4),(445,7,16,7),(445,8,18,5),(446,5,8,7),(446,6,12,3),(446,7,14,9),(446,8,7,6),(447,5,7,7),(447,6,3,4),(447,7,7,7),(447,8,17,3),(448,5,16,4),(448,6,8,6),(448,7,1,7),(448,8,18,8),(449,5,13,8),(449,6,14,7),(449,7,6,4),(449,8,12,6),(450,5,10,8),(450,6,17,8),(450,7,19,4),(450,8,7,9),(451,5,17,8),(451,6,19,6),(451,7,4,6),(451,8,19,8),(452,5,13,6),(452,6,12,7),(452,7,4,5),(452,8,1,5),(453,5,12,6),(453,6,10,5),(453,7,16,5),(453,8,8,3),(454,5,19,6),(454,6,4,4),(454,7,8,7),(454,8,18,3),(455,5,3,8),(455,6,5,8),(455,7,17,7),(455,8,12,9),(456,5,1,6),(456,6,14,7),(456,7,15,3),(456,8,5,8),(457,5,19,4),(457,6,3,4),(457,7,10,9),(457,8,13,5),(458,5,15,5),(458,6,1,5),(458,7,5,7),(458,8,19,9),(459,5,15,5),(459,6,1,9),(459,7,19,3),(459,8,3,9),(460,5,17,7),(460,6,8,4),(460,7,2,8),(460,8,2,7),(461,5,3,6),(461,6,4,9),(461,7,10,7),(461,8,11,3),(462,5,18,3),(462,6,2,6),(462,7,7,8),(462,8,10,5),(463,5,11,4),(463,6,1,6),(463,7,18,7),(463,8,2,3),(464,5,11,3),(464,6,8,7),(464,7,9,5),(464,8,13,4),(465,5,11,8),(465,6,13,7),(465,7,19,5),(465,8,3,4),(466,5,4,9),(466,6,3,4),(466,7,12,5),(466,8,7,8),(467,5,13,8),(467,6,6,7),(467,7,2,6),(467,8,3,4),(468,5,16,4),(468,6,12,9),(468,7,16,8),(468,8,9,6),(469,5,14,9),(469,6,4,4),(469,7,2,9),(469,8,9,7),(470,5,5,9),(470,6,1,8),(470,7,5,7),(470,8,4,6),(471,5,8,8),(471,6,4,5),(471,7,15,9),(471,8,10,9),(472,5,13,5),(472,6,13,9),(472,7,17,4),(472,8,2,6),(473,5,12,9),(473,6,15,7),(473,7,5,9),(473,8,9,7),(474,5,18,5),(474,6,4,7),(474,7,5,6),(474,8,14,9),(475,5,11,5),(475,6,13,7),(475,7,8,3),(475,8,14,7),(476,5,16,6),(476,6,11,7),(476,7,4,7),(476,8,11,8),(477,5,13,5),(477,6,17,8),(477,7,4,7),(477,8,6,7),(478,5,5,5),(478,6,2,3),(478,7,18,4),(478,8,11,3),(479,5,7,5),(479,6,10,8),(479,7,19,4),(479,8,7,9),(480,5,8,4),(480,6,8,8),(480,7,12,4),(480,8,15,5),(481,5,14,4),(481,6,10,5),(481,7,4,9),(481,8,13,5),(482,5,3,3),(482,6,9,3),(482,7,16,5),(482,8,12,6),(483,5,1,8),(483,6,10,7),(483,7,12,4),(483,8,16,6),(484,5,16,4),(484,6,8,7),(484,7,8,5),(484,8,13,7),(485,5,10,8),(485,6,14,9),(485,7,12,6),(485,8,13,7),(486,5,3,5),(486,6,8,7),(486,7,12,3),(486,8,2,6),(487,5,5,4),(487,6,10,7),(487,7,6,9),(487,8,13,4),(488,5,13,9),(488,6,17,3),(488,7,11,3),(488,8,12,6),(489,5,15,9),(489,6,15,4),(489,7,8,9),(489,8,3,4),(490,5,18,9),(490,6,10,4),(490,7,1,6),(490,8,19,7),(491,5,1,7),(491,6,6,6),(491,7,15,8),(491,8,6,6),(492,5,15,7),(492,6,11,8),(492,7,17,6),(492,8,17,4),(493,5,12,3),(493,6,6,8),(493,7,3,5),(493,8,15,8),(494,5,8,5),(494,6,1,8),(494,7,5,4),(494,8,7,7),(495,5,17,4),(495,6,5,9),(495,7,7,8),(495,8,10,8),(496,5,16,7),(496,6,9,4),(496,7,4,9),(496,8,5,8),(497,5,17,5),(497,6,7,9),(497,7,6,9),(497,8,13,5),(498,5,15,3),(498,6,19,7),(498,7,3,3),(498,8,10,8),(499,5,6,9),(499,6,8,6),(499,7,1,3),(499,8,17,5),(500,5,19,8),(500,6,19,8),(500,7,5,3),(500,8,16,3),(501,5,16,9),(501,6,9,7),(501,7,3,8),(501,8,5,3),(502,5,14,4),(502,6,18,9),(502,7,12,5),(502,8,5,9),(503,5,4,6),(503,6,9,8),(503,7,1,7),(503,8,11,7),(504,5,17,7),(504,6,19,9),(504,7,2,9),(504,8,3,4),(505,5,3,8),(505,6,7,8),(505,7,11,8),(505,8,13,6),(506,5,5,3),(506,6,19,6),(506,7,18,6),(506,8,7,3),(507,5,17,4),(507,6,10,8),(507,7,15,9),(507,8,4,5),(508,5,16,5),(508,6,3,7),(508,7,19,4),(508,8,5,8),(509,5,19,9),(509,6,8,3),(509,7,9,8),(509,8,10,4),(510,5,19,3),(510,6,17,4),(510,7,14,4),(510,8,19,3),(511,5,15,7),(511,6,12,8),(511,7,17,5),(511,8,1,5),(512,5,12,4),(512,6,15,3),(512,7,2,4),(512,8,15,9),(513,5,15,3),(513,6,16,4),(513,7,6,8),(513,8,5,3),(514,5,3,5),(514,6,5,3),(514,7,11,9),(514,8,18,6),(515,5,5,6),(515,6,6,6),(515,7,1,7),(515,8,2,4),(516,5,12,8),(516,6,2,8),(516,7,1,5),(516,8,10,4),(517,5,19,9),(517,6,4,4),(517,7,3,7),(517,8,9,4),(518,5,2,8),(518,6,3,3),(518,7,1,5),(518,8,15,7),(519,5,6,4),(519,6,16,5),(519,7,4,5),(519,8,7,8),(520,5,10,8),(520,6,14,5),(520,7,8,5),(520,8,13,6),(521,5,13,4),(521,6,12,3),(521,7,5,9),(521,8,2,8),(522,5,4,6),(522,6,10,3),(522,7,19,8),(522,8,13,8),(523,5,12,4),(523,6,18,3),(523,7,18,5),(523,8,10,6),(524,5,9,9),(524,6,9,7),(524,7,7,5),(524,8,5,8),(525,5,5,5),(525,6,10,3),(525,7,6,8),(525,8,4,7),(526,5,8,4),(526,6,14,6),(526,7,11,5),(526,8,6,7),(527,5,1,8),(527,6,2,6),(527,7,13,5),(527,8,17,8),(528,5,14,5),(528,6,10,8),(528,7,4,8),(528,8,12,7),(529,5,1,4),(529,6,16,6),(529,7,12,3),(529,8,20,4),(530,5,1,5),(530,6,13,7),(530,7,14,6),(530,8,7,9),(531,5,1,3),(531,6,18,4),(531,7,15,4),(531,8,13,4),(532,5,8,8),(532,6,13,9),(532,7,13,9),(532,8,13,7),(533,5,5,6),(533,6,12,5),(533,7,11,4),(533,8,13,8),(534,5,4,5),(534,6,15,7),(534,7,5,8),(534,8,4,8),(535,5,15,5),(535,6,4,3),(535,7,11,8),(535,8,8,7),(536,5,4,4),(536,6,5,3),(536,7,3,6),(536,8,5,9),(537,5,4,8),(537,6,7,3),(537,7,4,9),(537,8,5,5),(538,5,2,5),(538,6,6,9),(538,7,1,5),(538,8,10,4),(539,5,19,5),(539,6,4,3),(539,7,7,4),(539,8,13,7),(540,5,4,6),(540,6,3,9),(540,7,2,7),(540,8,9,6),(541,5,19,6),(541,6,9,7),(541,7,5,5),(541,8,1,5),(542,5,18,7),(542,6,3,7),(542,7,15,6),(542,8,15,6),(543,5,7,4),(543,6,3,3),(543,7,14,4),(543,8,2,8),(544,5,8,6),(544,6,16,3),(544,7,13,3),(544,8,7,5),(545,5,13,6),(545,6,18,8),(545,7,10,7),(545,8,18,7),(546,5,16,3),(546,6,12,7),(546,7,18,9),(546,8,14,7),(547,5,1,3),(547,6,11,6),(547,7,14,3),(547,8,11,5),(548,5,17,8),(548,6,19,7),(548,7,9,4),(548,8,19,8),(549,5,4,8),(549,6,1,6),(549,7,2,4),(549,8,18,5),(550,5,2,7),(550,6,8,5),(550,7,19,5),(550,8,17,7),(551,5,14,6),(551,6,8,3),(551,7,10,7),(551,8,5,8),(552,5,7,8),(552,6,14,3),(552,7,18,6),(552,8,1,3),(553,5,3,8),(553,6,12,8),(553,7,6,7),(553,8,1,9),(554,5,17,5),(554,6,5,5),(554,7,11,7),(554,8,5,5),(555,5,5,4),(555,6,6,5),(555,7,2,9),(555,8,14,9),(556,5,8,6),(556,6,4,6),(556,7,15,3),(556,8,6,8),(557,5,2,5),(557,6,9,6),(557,7,15,9),(557,8,16,6),(558,5,14,8),(558,6,16,8),(558,7,4,5),(558,8,2,5),(559,5,3,3),(559,6,4,6),(559,7,19,6),(559,8,11,3),(560,5,14,9),(560,6,7,9),(560,7,10,4),(560,8,4,8),(561,5,1,8),(561,6,10,5),(561,7,10,5),(561,8,4,6),(562,5,7,9),(562,6,13,3),(562,7,9,8),(562,8,7,4),(563,5,1,4),(563,6,15,3),(563,7,7,4),(563,8,19,8),(564,5,9,6),(564,6,18,3),(564,7,13,3),(564,8,16,3),(565,5,17,5),(565,6,15,6),(565,7,11,6),(565,8,12,5),(566,5,12,4),(566,6,12,4),(566,7,18,4),(566,8,17,7),(567,5,16,5),(567,6,14,5),(567,7,9,5),(567,8,7,4),(568,5,12,3),(568,6,7,5),(568,7,12,5),(568,8,18,9),(569,5,13,8),(569,6,12,8),(569,7,19,3),(569,8,5,4),(570,5,13,8),(570,6,17,9),(570,7,1,9),(570,8,4,7),(571,5,5,5),(571,6,12,5),(571,7,18,4),(571,8,9,8),(572,5,16,7),(572,6,7,8),(572,7,17,7),(572,8,6,7),(573,5,15,7),(573,6,7,8),(573,7,11,3),(573,8,6,8),(574,5,19,6),(574,6,16,7),(574,7,19,5),(574,8,4,7),(575,5,4,6),(575,6,17,8),(575,7,16,9),(575,8,7,5),(576,5,2,5),(576,6,16,5),(576,7,1,5),(576,8,7,3),(577,5,7,8),(577,6,2,8),(577,7,4,9),(577,8,13,5),(578,5,13,5),(578,6,3,5),(578,7,19,5),(578,8,9,9),(579,5,4,4),(579,6,6,5),(579,7,6,3),(579,8,1,5),(580,5,9,6),(580,6,14,9),(580,7,16,6),(580,8,8,3),(581,5,14,3),(581,6,2,5),(581,7,3,8),(581,8,7,8),(582,5,15,7),(582,6,16,6),(582,7,19,5),(582,8,4,7),(583,5,9,5),(583,6,6,7),(583,7,9,8),(583,8,6,8),(584,5,2,6),(584,6,6,3),(584,7,1,4),(584,8,11,6),(585,5,13,9),(585,6,16,9),(585,7,16,3),(585,8,10,8),(586,5,8,3),(586,6,3,4),(586,7,13,6),(586,8,9,5),(587,5,14,9),(587,6,18,6),(587,7,19,5),(587,8,18,3),(588,5,9,3),(588,6,10,9),(588,7,18,5),(588,8,18,3),(589,5,13,7),(589,6,2,3),(589,7,19,7),(589,8,2,3),(590,5,16,5),(590,6,9,3),(590,7,7,6),(590,8,16,6),(591,5,5,5),(591,6,19,6),(591,7,4,8),(591,8,6,4),(592,5,6,4),(592,6,13,3),(592,7,5,6),(592,8,6,6),(593,5,8,4),(593,6,15,9),(593,7,18,8),(593,8,14,4),(594,5,16,3),(594,6,6,6),(594,7,4,8),(594,8,2,7),(595,5,9,7),(595,6,16,8),(595,7,10,9),(595,8,13,3),(596,5,12,9),(596,6,12,9),(596,7,5,5),(596,8,4,7),(597,5,16,8),(597,6,7,4),(597,7,6,7),(597,8,1,3),(598,5,5,3),(598,6,18,5),(598,7,10,6),(598,8,12,9),(599,5,11,5),(599,6,9,4),(599,7,12,7),(599,8,7,6),(600,5,16,6),(600,6,17,5),(600,7,3,5),(600,8,19,8),(601,5,18,6),(601,6,17,9),(601,7,14,3),(601,8,3,8),(602,5,20,9),(602,6,5,3),(602,7,15,7),(602,8,12,6),(603,5,13,8),(603,6,9,7),(603,7,16,6),(603,8,11,5),(604,5,2,8),(604,6,5,3),(604,7,8,4),(604,8,11,7),(605,5,14,9),(605,6,13,4),(605,7,3,5),(605,8,14,6),(606,5,6,9),(606,6,4,8),(606,7,7,9),(606,8,7,5),(607,5,19,4),(607,6,7,5),(607,7,8,3),(607,8,10,5),(608,5,2,7),(608,6,6,3),(608,7,16,6),(608,8,18,5),(609,5,7,4),(609,6,8,3),(609,7,7,4),(609,8,3,9),(610,5,19,6),(610,6,12,5),(610,7,17,6),(610,8,6,3),(611,5,19,7),(611,6,12,3),(611,7,4,6),(611,8,18,6),(612,5,5,9),(612,6,14,5),(612,7,14,4),(612,8,5,3),(613,5,19,8),(613,6,3,7),(613,7,1,3),(613,8,9,3),(614,5,4,4),(614,6,3,3),(614,7,15,8),(614,8,18,7),(615,5,8,4),(615,6,10,6),(615,7,12,7),(615,8,1,8),(616,5,1,5),(616,6,6,5),(616,7,9,4),(616,8,9,5),(617,5,5,9),(617,6,12,5),(617,7,15,8),(617,8,11,8),(618,5,13,6),(618,6,9,5),(618,7,5,3),(618,8,6,8),(619,5,18,9),(619,6,17,4),(619,7,3,4),(619,8,9,5),(620,5,11,8),(620,6,18,9),(620,7,1,4),(620,8,6,3),(621,5,5,8),(621,6,18,8),(621,7,13,9),(621,8,11,3),(622,5,17,8),(622,6,17,3),(622,7,12,4),(622,8,5,6),(623,5,7,9),(623,6,6,8),(623,7,14,6),(623,8,13,5),(624,5,7,3),(624,6,6,4),(624,7,4,6),(624,8,1,3),(625,5,11,3),(625,6,14,4),(625,7,12,9),(625,8,8,4),(626,5,19,4),(626,6,1,7),(626,7,10,3),(626,8,5,5),(627,5,5,5),(627,6,4,4),(627,7,11,7),(627,8,17,4),(628,5,6,4),(628,6,9,7),(628,7,10,4),(628,8,14,3),(629,5,8,9),(629,6,4,3),(629,7,17,5),(629,8,17,4),(630,5,10,8),(630,6,1,8),(630,7,10,6),(630,8,11,5),(631,5,6,9),(631,6,5,9),(631,7,12,9),(631,8,10,8),(632,5,14,5),(632,6,13,4),(632,7,15,3),(632,8,19,9),(633,5,5,6),(633,6,5,5),(633,7,17,3),(633,8,13,9),(634,5,16,7),(634,6,1,9),(634,7,12,4),(634,8,18,7),(635,5,8,9),(635,6,18,6),(635,7,5,4),(635,8,17,8),(636,5,10,4),(636,6,1,6),(636,7,16,9),(636,8,13,4),(637,5,18,3),(637,6,15,8),(637,7,9,7),(637,8,10,7),(638,5,12,5),(638,6,13,4),(638,7,19,3),(638,8,15,6),(639,5,11,5),(639,6,15,8),(639,7,19,5),(639,8,10,9),(640,5,18,5),(640,6,8,3),(640,7,9,8),(640,8,9,9),(641,5,1,7),(641,6,3,7),(641,7,9,5),(641,8,12,6),(642,5,9,3),(642,6,5,3),(642,7,8,5),(642,8,5,8),(643,5,9,8),(643,6,2,8),(643,7,6,4),(643,8,7,5),(644,5,19,5),(644,6,10,9),(644,7,14,6),(644,8,15,9),(645,5,13,6),(645,6,16,7),(645,7,14,6),(645,8,11,3),(646,5,16,5),(646,6,14,5),(646,7,3,8),(646,8,2,4),(647,5,2,9),(647,6,15,6),(647,7,3,7),(647,8,19,4),(648,5,4,9),(648,6,5,5),(648,7,18,6),(648,8,3,5),(649,5,7,9),(649,6,9,6),(649,7,12,5),(649,8,8,9),(650,5,13,9),(650,6,12,7),(650,7,17,7),(650,8,19,5),(651,5,12,7),(651,6,13,9),(651,7,14,4),(651,8,14,7),(652,5,4,7),(652,6,9,4),(652,7,18,3),(652,8,6,9),(653,5,3,9),(653,6,6,4),(653,7,13,8),(653,8,8,7),(654,5,11,7),(654,6,3,7),(654,7,14,5),(654,8,11,9),(655,5,2,7),(655,6,19,4),(655,7,16,6),(655,8,11,3);
/*!40000 ALTER TABLE `stock_amount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 12:38:19
