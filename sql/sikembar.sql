-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sikembar
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assumption_fuel_prices`
--

DROP TABLE IF EXISTS `assumption_fuel_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assumption_fuel_prices` (
  `assumption_fuel_price_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `unit_rate` int(11) NOT NULL,
  `detail` text NOT NULL,
  `volume_unit_id` int(11) NOT NULL,
  `volume_value` int(11) NOT NULL,
  PRIMARY KEY (`assumption_fuel_price_id`),
  KEY `assumption_fuel_prices_fk0` (`report_id`),
  KEY `assumption_fuel_prices_fk1` (`currency_id`),
  KEY `assumption_fuel_prices_fk2` (`volume_unit_id`),
  CONSTRAINT `assumption_fuel_prices_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `assumption_fuel_prices_fk1` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`currency_id`),
  CONSTRAINT `assumption_fuel_prices_fk2` FOREIGN KEY (`volume_unit_id`) REFERENCES `volume_units` (`volume_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assumption_fuel_prices`
--

LOCK TABLES `assumption_fuel_prices` WRITE;
/*!40000 ALTER TABLE `assumption_fuel_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `assumption_fuel_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assumptions`
--

DROP TABLE IF EXISTS `assumptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assumptions` (
  `assumption_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `unit_rate` int(11) NOT NULL,
  `detail` text NOT NULL,
  `volume_unit_id` int(11) NOT NULL,
  `volume_value` int(11) NOT NULL,
  `price_value` int(11) NOT NULL,
  `cutoff_grade_value` int(11) NOT NULL,
  `cutoff_grade_unit` varchar(255) NOT NULL,
  PRIMARY KEY (`assumption_id`),
  KEY `assumptions_fk0` (`report_id`),
  KEY `assumptions_fk1` (`currency_id`),
  KEY `assumptions_fk2` (`volume_unit_id`),
  CONSTRAINT `assumptions_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `assumptions_fk1` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`currency_id`),
  CONSTRAINT `assumptions_fk2` FOREIGN KEY (`volume_unit_id`) REFERENCES `volume_units` (`volume_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assumptions`
--

LOCK TABLES `assumptions` WRITE;
/*!40000 ALTER TABLE `assumptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assumptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_categories`
--

DROP TABLE IF EXISTS `balance_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_categories`
--

LOCK TABLES `balance_categories` WRITE;
/*!40000 ALTER TABLE `balance_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balances`
--

DROP TABLE IF EXISTS `balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balances` (
  `balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`balance_id`),
  KEY `balances_fk0` (`report_id`),
  CONSTRAINT `balances_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balances`
--

LOCK TABLES `balances` WRITE;
/*!40000 ALTER TABLE `balances` DISABLE KEYS */;
INSERT INTO `balances` VALUES (249,18,'Kas dan Bank',250000,'NERACA','Aktiva Lancar'),(250,18,'Piutang Usaha',150000,'NERACA','Aktiva Lancar'),(251,18,'Persediaan',50000,'NERACA','Aktiva Lancar'),(252,18,'Pajak dibayar dimuka',25000,'NERACA','Aktiva Lancar'),(253,18,'Piutang lain-lain dan biaya dibayar dimuka',18000,'NERACA','Aktiva Lancar'),(254,18,'Aktiva Tetap',150000,'NERACA','Aktiva Tidak Lancar'),(255,18,'Aktiva Eksplorasi',75000,'NERACA','Aktiva Tidak Lancar'),(256,18,'Beban ditangguhkan',30000,'NERACA','Aktiva Tidak Lancar'),(257,18,'Amortisasi',30000,'NERACA','Aktiva Tidak Lancar'),(258,18,'Depresiasi',30000,'NERACA','Aktiva Tidak Lancar'),(259,18,'Hutang Usaha',75000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(260,18,'Hutang Akrual',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(261,18,'Hutang Bank',30000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(262,18,'Hutang Pajak',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(263,18,'Hutang lain-lain',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(264,18,'Hutang Afiliasi',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(265,18,'Hutang Bank',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(266,18,'Hutang Leasing',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(267,18,'Hutang Pajak',5000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(268,18,'Hutang Afiliasi',8000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(269,18,'Modal Yang Disetor',25000,'HUTANG DAN MODAL','Modal Saham'),(270,18,'Provisi Reklamasi dan Pasca Tambang',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(271,18,'Hutang lain-lain',2000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(272,18,'Laba (rugi) ditahan',6000,'HUTANG DAN MODAL','Modal Saham'),(273,18,'Lain-lain',7000,'HUTANG DAN MODAL','Modal Saham'),(274,18,'Jumlah Aktiva Lancar',493000,'NERACA','Aktiva Lancar'),(275,18,'Jumlah Aktiva',733000,'NERACA','-'),(276,18,'Jumlah Kewajiban Jangka Pendek',141000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(277,18,'Jumlah Aktiva Tidak Lancar',240000,'NERACA','Aktiva Tidak Lancar'),(278,18,'Jumlah Kewajiban',174000,'HUTANG DAN MODAL','-'),(279,18,'Jumlah Kewajiban Jangka Panjang',33000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(280,18,'Jumlah Kewajiban dan Ekuitas',212000,'HUTANG DAN MODAL','-'),(281,18,'Jumlah Ekuitas',38000,'HUTANG DAN MODAL','Modal Saham'),(315,20,'Kas dan Bank',150000,'NERACA','Aktiva Lancar'),(316,20,'Pajak dibayar dimuka',25000,'NERACA','Aktiva Lancar'),(317,20,'Piutang lain-lain dan biaya dibayar dimuka',18000,'NERACA','Aktiva Lancar'),(318,20,'Aktiva Tetap',120000,'NERACA','Aktiva Tidak Lancar'),(319,20,'Piutang Usaha',100000,'NERACA','Aktiva Lancar'),(320,20,'Persediaan',50000,'NERACA','Aktiva Lancar'),(321,20,'Aktiva Eksplorasi',75000,'NERACA','Aktiva Tidak Lancar'),(322,20,'Amortisasi',30000,'NERACA','Aktiva Tidak Lancar'),(323,20,'Beban ditangguhkan',30000,'NERACA','Aktiva Tidak Lancar'),(324,20,'Hutang Usaha',75000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(325,20,'Depresiasi',30000,'NERACA','Aktiva Tidak Lancar'),(326,20,'Hutang Bank',30000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(327,20,'Hutang Akrual',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(328,20,'Hutang Pajak',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(329,20,'Hutang lain-lain',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(330,20,'Hutang Afiliasi',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(331,20,'Hutang Bank',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(332,20,'Hutang Pajak',5000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(333,20,'Hutang Leasing',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(334,20,'Provisi Reklamasi dan Pasca Tambang',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(335,20,'Hutang Afiliasi',8000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(336,20,'Hutang lain-lain',2000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(337,20,'Modal Yang Disetor',25000,'HUTANG DAN MODAL','Modal Saham'),(338,20,'Laba (rugi) ditahan',6000,'HUTANG DAN MODAL','Modal Saham'),(339,20,'Lain-lain',7000,'HUTANG DAN MODAL','Modal Saham'),(340,20,'Jumlah Aktiva Lancar',343000,'NERACA','Aktiva Lancar'),(341,20,'Jumlah Aktiva Tidak Lancar',210000,'NERACA','Aktiva Tidak Lancar'),(342,20,'Jumlah Aktiva',553000,'NERACA','-'),(343,20,'Jumlah Kewajiban Jangka Pendek',141000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(344,20,'Jumlah Kewajiban Jangka Panjang',33000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(345,20,'Jumlah Kewajiban',174000,'HUTANG DAN MODAL','-'),(346,20,'Jumlah Kewajiban dan Ekuitas',212000,'HUTANG DAN MODAL','-'),(347,20,'Jumlah Ekuitas',38000,'HUTANG DAN MODAL','Modal Saham');
/*!40000 ALTER TABLE `balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget_categories`
--

DROP TABLE IF EXISTS `budget_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_categories`
--

LOCK TABLES `budget_categories` WRITE;
/*!40000 ALTER TABLE `budget_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgets` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`budget_id`),
  KEY `budgets_fk0` (`report_id`),
  KEY `budgets_fk1` (`category_id`),
  CONSTRAINT `budgets_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `budgets_fk1` FOREIGN KEY (`category_id`) REFERENCES `budget_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashflow_categories`
--

DROP TABLE IF EXISTS `cashflow_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashflow_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashflow_categories`
--

LOCK TABLES `cashflow_categories` WRITE;
/*!40000 ALTER TABLE `cashflow_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashflow_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashflows`
--

DROP TABLE IF EXISTS `cashflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashflows` (
  `cashflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`cashflow_id`),
  KEY `cashflows_fk0` (`report_id`),
  KEY `cashflows_fk1` (`category_id`),
  CONSTRAINT `cashflows_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `cashflows_fk1` FOREIGN KEY (`category_id`) REFERENCES `cashflow_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashflows`
--

LOCK TABLES `cashflows` WRITE;
/*!40000 ALTER TABLE `cashflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_types`
--

DROP TABLE IF EXISTS `company_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_types` (
  `company_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_type_name` text NOT NULL,
  PRIMARY KEY (`company_type_id`),
  UNIQUE KEY `company_type_name` (`company_type_name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_of_goods_categories`
--

DROP TABLE IF EXISTS `cost_of_goods_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_of_goods_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_of_goods_categories`
--

LOCK TABLES `cost_of_goods_categories` WRITE;
/*!40000 ALTER TABLE `cost_of_goods_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_of_goods_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costofgoods`
--

DROP TABLE IF EXISTS `costofgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `costofgoods` (
  `costofgood_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`costofgood_id`),
  KEY `costofgoods_fk0` (`report_id`),
  KEY `costofgoods_fk1` (`category_id`),
  CONSTRAINT `costofgoods_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `costofgoods_fk1` FOREIGN KEY (`category_id`) REFERENCES `cost_of_goods_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costofgoods`
--

LOCK TABLES `costofgoods` WRITE;
/*!40000 ALTER TABLE `costofgoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `costofgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` text NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investments`
--

DROP TABLE IF EXISTS `investments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investments` (
  `investment_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`investment_id`),
  KEY `investments_fk0` (`report_id`),
  CONSTRAINT `investments_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investments`
--

LOCK TABLES `investments` WRITE;
/*!40000 ALTER TABLE `investments` DISABLE KEYS */;
/*!40000 ALTER TABLE `investments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'/add-report',13,'12 November 2019 @ 0:47:49','add report'),(2,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(3,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(4,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(5,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(6,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(7,'/add-neraca',13,'12 November 2019 @ 0:47:49','add neraca'),(8,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(9,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(10,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(11,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(12,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(13,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(14,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(15,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(16,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(17,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(18,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(19,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(20,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(21,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(22,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(23,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(24,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(25,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(26,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(27,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(28,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(29,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(30,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(31,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(32,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(33,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(34,'/add-neraca',13,'12 November 2019 @ 0:47:50','add neraca'),(35,'/add-report',13,'12 November 2019 @ 0:48:1','add report'),(36,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(37,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(38,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(39,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(40,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(41,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(42,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(43,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(44,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(45,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(46,'/add-neraca',13,'12 November 2019 @ 0:48:1','add neraca'),(47,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(48,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(49,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(50,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(51,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(52,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(53,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(54,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(55,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(56,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(57,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(58,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(59,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(60,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(61,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(62,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(63,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(64,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(65,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(66,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(67,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(68,'/add-neraca',13,'12 November 2019 @ 0:48:2','add neraca'),(69,'/add-report',13,'12 November 2019 @ 18:11:48','add report'),(70,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(71,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(72,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(73,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(74,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(75,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(76,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(77,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(78,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(79,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(80,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(81,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(82,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(83,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(84,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(85,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(86,'/add-neraca',13,'12 November 2019 @ 18:11:48','add neraca'),(87,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(88,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(89,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(90,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(91,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(92,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(93,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(94,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(95,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(96,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(97,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(98,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(99,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(100,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(101,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(102,'/add-neraca',13,'12 November 2019 @ 18:11:49','add neraca'),(103,'/add-report',13,'12 November 2019 @ 20:51:43','add report'),(104,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(105,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(106,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(107,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(108,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(109,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(110,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(111,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(112,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(113,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(114,'/add-neraca',13,'12 November 2019 @ 20:51:43','add neraca'),(115,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(116,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(117,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(118,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(119,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(120,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(121,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(122,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(123,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(124,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(125,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(126,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(127,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(128,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(129,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(130,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(131,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(132,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(133,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(134,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(135,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca'),(136,'/add-neraca',13,'12 November 2019 @ 20:51:44','add neraca');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_income_categories`
--

DROP TABLE IF EXISTS `national_income_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `national_income_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_income_categories`
--

LOCK TABLES `national_income_categories` WRITE;
/*!40000 ALTER TABLE `national_income_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `national_income_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_incomes`
--

DROP TABLE IF EXISTS `national_incomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `national_incomes` (
  `profit_loss_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`profit_loss_id`),
  KEY `national_incomes_fk0` (`report_id`),
  KEY `national_incomes_fk1` (`category_id`),
  CONSTRAINT `national_incomes_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `national_incomes_fk1` FOREIGN KEY (`category_id`) REFERENCES `national_income_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_incomes`
--

LOCK TABLES `national_incomes` WRITE;
/*!40000 ALTER TABLE `national_incomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `national_incomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_costs`
--

DROP TABLE IF EXISTS `operation_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_costs` (
  `operation_cost_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`operation_cost_id`),
  KEY `operation_costs_fk0` (`report_id`),
  CONSTRAINT `operation_costs_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_costs`
--

LOCK TABLES `operation_costs` WRITE;
/*!40000 ALTER TABLE `operation_costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_finances`
--

DROP TABLE IF EXISTS `other_finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_finances` (
  `other_finance_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`other_finance_id`),
  KEY `other_finances_fk0` (`report_id`),
  CONSTRAINT `other_finances_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_finances`
--

LOCK TABLES `other_finances` WRITE;
/*!40000 ALTER TABLE `other_finances` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `display_name` text NOT NULL,
  `can_created_modules` varchar(255) NOT NULL,
  `can_read_modules` varchar(255) NOT NULL,
  `can_update_modules` varchar(255) NOT NULL,
  `can_delete_modules` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `permissions_fk0` (`role_id`),
  CONSTRAINT `permissions_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procurement_categories`
--

DROP TABLE IF EXISTS `procurement_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procurement_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procurement_categories`
--

LOCK TABLES `procurement_categories` WRITE;
/*!40000 ALTER TABLE `procurement_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `procurement_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procurements`
--

DROP TABLE IF EXISTS `procurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procurements` (
  `procurements_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `specification` text NOT NULL,
  `volume_unit_id` int(11) NOT NULL,
  `volume_value` int(11) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `unit_price_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `country_of_origin` varchar(255) NOT NULL,
  `province_of_origin` varchar(255) NOT NULL,
  `district_of_origin` varchar(255) NOT NULL,
  `city_of_origin` varchar(255) NOT NULL,
  `project_area` text DEFAULT NULL,
  `tkdn` int(11) NOT NULL,
  `tkdn_category_id` int(11) NOT NULL,
  PRIMARY KEY (`procurements_id`),
  KEY `procurements_fk0` (`report_id`),
  KEY `procurements_fk1` (`volume_unit_id`),
  KEY `procurements_fk2` (`unit_price_category_id`),
  KEY `procurements_fk3` (`category_id`),
  KEY `procurements_fk4` (`tkdn_category_id`),
  CONSTRAINT `procurements_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `procurements_fk1` FOREIGN KEY (`volume_unit_id`) REFERENCES `volume_units` (`volume_unit_id`),
  CONSTRAINT `procurements_fk2` FOREIGN KEY (`unit_price_category_id`) REFERENCES `unit_price_categories` (`category_id`),
  CONSTRAINT `procurements_fk3` FOREIGN KEY (`category_id`) REFERENCES `procurement_categories` (`category_id`),
  CONSTRAINT `procurements_fk4` FOREIGN KEY (`tkdn_category_id`) REFERENCES `tkdn_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procurements`
--

LOCK TABLES `procurements` WRITE;
/*!40000 ALTER TABLE `procurements` DISABLE KEYS */;
/*!40000 ALTER TABLE `procurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit_losses`
--

DROP TABLE IF EXISTS `profit_losses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profit_losses` (
  `profit_loss_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`profit_loss_id`),
  KEY `profit_losses_fk0` (`report_id`),
  CONSTRAINT `profit_losses_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_losses`
--

LOCK TABLES `profit_losses` WRITE;
/*!40000 ALTER TABLE `profit_losses` DISABLE KEYS */;
/*!40000 ALTER TABLE `profit_losses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_type` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `flagged_for_deletion` tinyint(1) DEFAULT 0,
  `term` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `reports_fk0` (`user_id`),
  CONSTRAINT `reports_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (18,13,'Operasi Produksi',1,0,0,'Triwulan I','IDR',2019),(20,13,'Operasi Produksi',1,0,0,'Triwulan I','IDR',2018);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` text NOT NULL,
  `display_name` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','Perusahaan Tambang'),(2,'admin','Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `royalties`
--

DROP TABLE IF EXISTS `royalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `royalties` (
  `royalty_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `unit_rate` int(11) NOT NULL,
  `detail` text NOT NULL,
  `volume_unit_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`royalty_id`),
  KEY `royalties_fk0` (`report_id`),
  KEY `royalties_fk1` (`currency_id`),
  KEY `royalties_fk2` (`volume_unit_id`),
  CONSTRAINT `royalties_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `royalties_fk1` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`currency_id`),
  CONSTRAINT `royalties_fk2` FOREIGN KEY (`volume_unit_id`) REFERENCES `volume_units` (`volume_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `royalties`
--

LOCK TABLES `royalties` WRITE;
/*!40000 ALTER TABLE `royalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `royalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sof_categories`
--

DROP TABLE IF EXISTS `sof_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sof_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sof_categories`
--

LOCK TABLES `sof_categories` WRITE;
/*!40000 ALTER TABLE `sof_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sof_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_of_financings`
--

DROP TABLE IF EXISTS `source_of_financings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_of_financings` (
  `source_of_financing_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`source_of_financing_id`),
  KEY `source_of_financings_fk0` (`report_id`),
  KEY `source_of_financings_fk1` (`category_id`),
  CONSTRAINT `source_of_financings_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `source_of_financings_fk1` FOREIGN KEY (`category_id`) REFERENCES `sof_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_of_financings`
--

LOCK TABLES `source_of_financings` WRITE;
/*!40000 ALTER TABLE `source_of_financings` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_of_financings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` text NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `term_name` (`term_name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tkdn_categories`
--

DROP TABLE IF EXISTS `tkdn_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tkdn_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tkdn_categories`
--

LOCK TABLES `tkdn_categories` WRITE;
/*!40000 ALTER TABLE `tkdn_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tkdn_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_price_categories`
--

DROP TABLE IF EXISTS `unit_price_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_price_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_price_categories`
--

LOCK TABLES `unit_price_categories` WRITE;
/*!40000 ALTER TABLE `unit_price_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_price_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `company_type` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'hanherb','123','user','Hanindyo Herbowo','Operasi Produksi'),(14,'admin','123','admin','Admin','Operasi Produksi');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_units`
--

DROP TABLE IF EXISTS `volume_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_units` (
  `volume_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_unit_text` text NOT NULL,
  PRIMARY KEY (`volume_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_units`
--

LOCK TABLES `volume_units` WRITE;
/*!40000 ALTER TABLE `volume_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  1:25:21
