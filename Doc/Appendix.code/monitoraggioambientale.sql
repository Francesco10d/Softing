CREATE DATABASE  IF NOT EXISTS `monitoraggioambientale` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `monitoraggioambientale`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: monitoraggioambientale
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amministratore`
--

DROP TABLE IF EXISTS `amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amministratore` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  `LuogoNascita` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `E_Mail` varchar(45) DEFAULT NULL,
  `ChiaveDiRecupero` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amministratore`
--

LOCK TABLES `amministratore` WRITE;
/*!40000 ALTER TABLE `amministratore` DISABLE KEYS */;
INSERT INTO `amministratore` VALUES ('Lorenzo93','lore126','Lorenzo','Salvi','1993-08-10','Teramo','3468192604','lorenzo.salvi@student.univaq.it','242387'),('Ludovico96','ludo124','Ludovico','Di Federico','1996-08-01','Pescara','3270544051','ludovico.difederico@student.univaq.it','243542'),('Marco96','marco125','Marco','Poscente','1996-04-04','Rieti','3335938140','marco.poscente@student.univaq.it','243591'),('Muccini23','muc123','Henry','Muccini','1970-05-23','Roma (RM)','3458796321','henry.muccini@univaq.it','234563'),('Salvatore96','salvo127','Salvatore','Salernitano','1996-05-01','Aversa','3408052643','salvatore.salernitano@student.univaq.it','242016');
/*!40000 ALTER TABLE `amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `Coordinate` varchar(50) NOT NULL,
  `Popolazione` int(11) DEFAULT NULL,
  `Nominativo` varchar(45) DEFAULT NULL,
  `M^2` int(11) DEFAULT NULL,
  PRIMARY KEY (`Coordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES ('12°11\'33\"N 34°15\'43\"E',50,'Via Matteotti',400),('25°11\'45\"N 34°54\'12\"E',75,'Piazza Cavour',800),('34°12\'45\"N 23°12\'65\"E',34,'Via Fasciano',300);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backupvalori`
--

DROP TABLE IF EXISTS `backupvalori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backupvalori` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RangeLuminosità` int(10) unsigned DEFAULT NULL,
  `RangePressione` int(10) unsigned DEFAULT NULL,
  `RangeTemperatura` int(10) unsigned DEFAULT NULL,
  `RangeUmidità` int(10) unsigned DEFAULT NULL,
  `LuminositàOttimale` int(10) unsigned DEFAULT NULL,
  `PressioneOttimale` int(10) unsigned DEFAULT NULL,
  `TemperaturaOttimale` int(10) unsigned DEFAULT NULL,
  `UmiditàOttimale` int(10) unsigned DEFAULT NULL,
  `Sensore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Sensore` (`Sensore`),
  CONSTRAINT `Sensore` FOREIGN KEY (`Sensore`) REFERENCES `sensore` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backupvalori`
--

LOCK TABLES `backupvalori` WRITE;
/*!40000 ALTER TABLE `backupvalori` DISABLE KEYS */;
/*!40000 ALTER TABLE `backupvalori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edificio` (
  `NCivico` int(11) NOT NULL,
  `Capienza` int(11) DEFAULT NULL,
  `Tipologia` varchar(45) DEFAULT NULL,
  `Dimensione` varchar(45) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NCivico`),
  KEY `Area_idx` (`Area`),
  CONSTRAINT `Area` FOREIGN KEY (`Area`) REFERENCES `area` (`Coordinate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (0,15,'Palazzina','150','12°11\'33\"N 34°15\'43\"E'),(2,35,'Immobile d\'ufficio','250','12°11\'33\"N 34°15\'43\"E'),(4,25,'Casa Privata','200','25°11\'45\"N 34°54\'12\"E'),(6,50,'Ospedale','600','25°11\'45\"N 34°54\'12\"E'),(8,24,'Palazzo','200','34°12\'45\"N 23°12\'65\"E'),(10,10,'Negozio','100','34°12\'45\"N 23°12\'65\"E');
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestoresensori`
--

DROP TABLE IF EXISTS `gestoresensori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestoresensori` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `LuogoNascita` varchar(45) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  `E-Mail` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestoresensori`
--

LOCK TABLES `gestoresensori` WRITE;
/*!40000 ALTER TABLE `gestoresensori` DISABLE KEYS */;
INSERT INTO `gestoresensori` VALUES ('Fabrizio96','fab96','Fabrizio','Sorcio','Edificio','Aversa (CE)','1996-05-01','fab96@gmail.com','3425676457'),('Fiilippo94','fil94','Filippo','Bianchi','Area','Roma','1987-07-23','fil98@outlook.it','3458798654'),('Francesco96','cat96','Francesco','Catani','Edificio','Francavilla','1996-04-12','cat96@gmail.com','3457686094'),('Luca234','luc445','Luca','Boccanera','Area','Roma','1997-02-28','luc97@gmail.com','4893245932'),('Ludovico96','lud96','Ludovico','Di Federico','Edificio','Moscufo','1996-10-23','ludo96@gmail.com','3406512785'),('Marco96','mar196','Marco','Poscente','Edificio','Antrodoco','1996-05-28','marcoposcente96@gmail.com','3495412786'),('Mario235','mar994','Mario','Biondi','Città','Chieti','1993-04-15','mario@gmail.com','7593724732'),('Roberta45','rob45','Roberta','Tiberio','Edficio','Rosciolo','1996-04-21','rob67@live.it','3456789321'),('Salvatore96','sal96','Salvatore','Salernitano','Edificio','Aversa (CE)','1996-05-01','salvatoresalernitano96@gmail.com','3408052643'),('Tobia56','tob56','Tobia','Muschio','Area','Milano','1967-03-12','tob56@live.it','3416754897');
/*!40000 ALTER TABLE `gestoresensori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piano`
--

DROP TABLE IF EXISTS `piano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piano` (
  `IdPiano` int(11) NOT NULL,
  `NCorridoi` int(10) unsigned DEFAULT NULL,
  `NStanze` int(10) unsigned DEFAULT NULL,
  `Edificio` int(11) NOT NULL,
  PRIMARY KEY (`IdPiano`,`Edificio`),
  KEY `Edificio_idx` (`Edificio`),
  CONSTRAINT `Edificio` FOREIGN KEY (`Edificio`) REFERENCES `edificio` (`NCivico`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piano`
--

LOCK TABLES `piano` WRITE;
/*!40000 ALTER TABLE `piano` DISABLE KEYS */;
INSERT INTO `piano` VALUES (0,4,8,0),(0,2,4,2),(0,2,5,4),(0,3,6,6),(0,4,8,8),(0,2,6,10),(1,3,9,0),(1,3,6,2),(1,2,5,6),(1,4,9,8),(2,2,7,2),(2,3,6,6),(2,4,10,8),(3,3,5,2),(3,4,6,8),(4,4,4,8);
/*!40000 ALTER TABLE `piano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segnale`
--

DROP TABLE IF EXISTS `segnale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segnale` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date DEFAULT NULL,
  `Ora` time DEFAULT NULL,
  `Stato` tinyint(4) DEFAULT NULL,
  `Temperatura` int(10) unsigned DEFAULT NULL,
  `Luminosità` int(10) unsigned DEFAULT NULL,
  `Pressione` int(10) unsigned DEFAULT NULL,
  `Umidità` int(10) unsigned DEFAULT NULL,
  `IDSensore` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDSensore` (`IDSensore`),
  CONSTRAINT `IDSensore` FOREIGN KEY (`IDSensore`) REFERENCES `sensore` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segnale`
--

LOCK TABLES `segnale` WRITE;
/*!40000 ALTER TABLE `segnale` DISABLE KEYS */;
/*!40000 ALTER TABLE `segnale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensore`
--

DROP TABLE IF EXISTS `sensore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensore` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DataManutenzione` date DEFAULT NULL,
  `Stato` tinyint(4) DEFAULT NULL,
  `Temperatura` int(10) unsigned DEFAULT NULL,
  `Luminosità` int(10) unsigned DEFAULT NULL,
  `Pressione` int(10) unsigned DEFAULT NULL,
  `Umidità` int(10) unsigned DEFAULT NULL,
  `Gestore` varchar(45) DEFAULT NULL,
  `Piano` int(11) DEFAULT NULL,
  `Edificio` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Gestore_idx` (`Gestore`),
  KEY `Piano_idx` (`Piano`),
  KEY `Edifiicio_idx` (`Edificio`),
  CONSTRAINT `Edifiicio` FOREIGN KEY (`Edificio`) REFERENCES `edificio` (`NCivico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Gestore` FOREIGN KEY (`Gestore`) REFERENCES `gestoresensori` (`Username`),
  CONSTRAINT `Piano` FOREIGN KEY (`Piano`) REFERENCES `piano` (`IdPiano`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensore`
--

LOCK TABLES `sensore` WRITE;
/*!40000 ALTER TABLE `sensore` DISABLE KEYS */;
INSERT INTO `sensore` VALUES (1,'2018-12-15',0,25,500,89,55,'Fabrizio96',0,0),(2,'2018-10-22',0,30,630,92,63,'Fabrizio96',0,0),(3,'2018-11-20',0,21,570,83,58,'Fabrizio96',1,0),(4,'2018-11-14',0,24,620,89,59,'Fabrizio96',1,0),(5,'2018-12-28',0,23,469,83,58,'Marco96',0,2),(6,'2018-10-23',0,27,653,78,64,'Marco96',0,2),(7,'2018-12-20',0,31,580,75,60,'Marco96',1,2),(8,'2018-11-16',0,28,550,80,56,'Marco96',1,2),(9,'2018-09-29',0,32,660,90,70,'Marco96',2,2),(10,'2018-11-26',0,31,500,76,78,'Marco96',2,2),(11,'2018-12-16',0,29,560,80,56,'Marco96',3,2),(12,'2018-11-23',0,26,590,75,81,'Marco96',3,2),(13,'2018-12-19',0,30,650,89,74,'Salvatore96',0,4),(14,'2018-12-20',0,30,640,90,75,'Salvatore96',0,4),(15,'2018-11-12',0,27,568,12,150,'Ludovico96',0,6),(16,'2018-12-12',1,34,560,67,34,'Ludovico96',0,6),(17,'2018-11-23',0,25,670,90,75,'Ludovico96',1,6),(18,'2018-11-24',0,29,400,89,70,'Ludovico96',1,6),(19,'2018-08-12',1,39,570,118,31,'Ludovico96',2,6),(20,'2018-11-26',0,27,600,85,70,'Ludovico96',2,6),(21,'2018-12-12',0,26,578,76,70,'Francesco96',0,8),(22,'2018-11-12',0,30,580,75,68,'Francesco96',0,8),(23,'2018-11-16',0,28,600,80,70,'Francesco96',1,8),(24,'2018-11-18',0,30,650,85,70,'Francesco96',1,8),(25,'2018-12-19',0,32,600,90,65,'Francesco96',2,8),(26,'2018-07-21',1,33,570,43,78,'Francesco96',2,8),(27,'2018-08-20',0,34,550,79,80,'Francesco96',3,8),(28,'2018-10-25',1,40,550,75,23,'Francesco96',3,8),(29,'2018-12-23',0,26,600,79,68,'Francesco96',4,8),(30,'2018-11-23',0,31,650,34,70,'Francesco96',4,8),(31,'2018-12-12',0,30,670,70,80,'Roberta45',0,10),(32,'2018-10-27',0,28,700,76,85,'Roberta45',0,10);
/*!40000 ALTER TABLE `sensore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `IdTicket` int(11) NOT NULL AUTO_INCREMENT,
  `Oggetto` varchar(45) DEFAULT NULL,
  `Descrizione` varchar(1000) DEFAULT NULL,
  `DataInvio` datetime DEFAULT NULL,
  `Mittente` varchar(45) DEFAULT NULL,
  `Lettura` tinyint(4) NOT NULL,
  `Destinatario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdTicket`),
  KEY `Mittente_idx` (`Mittente`),
  KEY `Destinatario_idx` (`Destinatario`),
  CONSTRAINT `Destinatario` FOREIGN KEY (`Destinatario`) REFERENCES `amministratore` (`Username`),
  CONSTRAINT `Mittente` FOREIGN KEY (`Mittente`) REFERENCES `gestoresensori` (`Username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'Aggiungere Ticket','Ciao Francesco! Prova a modificare il ticket. ','2018-12-17 00:00:00','Fabrizio96',0,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 10:59:06
