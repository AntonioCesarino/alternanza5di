-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: car_pooling
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `autisti`
--

DROP TABLE IF EXISTS `autisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autisti` (
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto` text,
  `numero_patente` varchar(20) NOT NULL,
  `scadenza_patente` date DEFAULT NULL,
  PRIMARY KEY (`numero_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autisti`
--

LOCK TABLES `autisti` WRITE;
/*!40000 ALTER TABLE `autisti` DISABLE KEYS */;
INSERT INTO `autisti` VALUES ('Luca','Del mondo','','','2132132132','2019-03-12'),('Antonio','Cersarino','','','8574852','2019-03-22'),('Sossio','Crescenzo','','','tg854785','2020-05-25');
/*!40000 ALTER TABLE `autisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto` text,
  `codice_fiscale` varchar(16) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tappe`
--

DROP TABLE IF EXISTS `tappe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tappe` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `longituine` varchar(20) DEFAULT NULL,
  `latitudine` varchar(20) DEFAULT NULL,
  `nome` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tappe`
--

LOCK TABLES `tappe` WRITE;
/*!40000 ALTER TABLE `tappe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tappe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tappe_viaggio`
--

DROP TABLE IF EXISTS `tappe_viaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tappe_viaggio` (
  `id_viaggio` int(11) NOT NULL,
  `id_tappe` int(11) NOT NULL,
  `ordine` int(11) NOT NULL,
  KEY `id_tappe` (`id_tappe`),
  KEY `id_viaggio` (`id_viaggio`),
  CONSTRAINT `tappe_viaggio_ibfk_1` FOREIGN KEY (`id_tappe`) REFERENCES `tappe` (`id`),
  CONSTRAINT `tappe_viaggio_ibfk_2` FOREIGN KEY (`id_viaggio`) REFERENCES `viaggi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tappe_viaggio`
--

LOCK TABLES `tappe_viaggio` WRITE;
/*!40000 ALTER TABLE `tappe_viaggio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tappe_viaggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transzione`
--

DROP TABLE IF EXISTS `transzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transzione` (
  `id_viaggio` int(11) DEFAULT NULL,
  `codice_fiscale` varchar(16) DEFAULT NULL,
  `numero_patente` varchar(20) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  KEY `id_viaggio` (`id_viaggio`),
  KEY `codice_fiscale` (`codice_fiscale`),
  KEY `numero_patente` (`numero_patente`),
  CONSTRAINT `transzione_ibfk_1` FOREIGN KEY (`id_viaggio`) REFERENCES `viaggi` (`id`),
  CONSTRAINT `transzione_ibfk_2` FOREIGN KEY (`codice_fiscale`) REFERENCES `cliente` (`codice_fiscale`),
  CONSTRAINT `transzione_ibfk_3` FOREIGN KEY (`numero_patente`) REFERENCES `autisti` (`numero_patente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transzione`
--

LOCK TABLES `transzione` WRITE;
/*!40000 ALTER TABLE `transzione` DISABLE KEYS */;
/*!40000 ALTER TABLE `transzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaggi`
--

DROP TABLE IF EXISTS `viaggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaggi` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `ora_partenza` time DEFAULT NULL,
  `ora_arrivo` time DEFAULT NULL,
  `numero_posti` int(20) DEFAULT NULL,
  `costo_km` float DEFAULT NULL,
  `tappa_partenza` int(8) DEFAULT NULL,
  `tappa_arrivo` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tappa_partenza` (`tappa_partenza`),
  KEY `tappa_arrivo` (`tappa_arrivo`),
  CONSTRAINT `viaggi_ibfk_1` FOREIGN KEY (`tappa_partenza`) REFERENCES `tappe` (`id`),
  CONSTRAINT `viaggi_ibfk_2` FOREIGN KEY (`tappa_arrivo`) REFERENCES `tappe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaggi`
--

LOCK TABLES `viaggi` WRITE;
/*!40000 ALTER TABLE `viaggi` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'car_pooling'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-27 22:27:24
