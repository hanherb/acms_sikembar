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
  `unit_rate` int(11) NOT NULL,
  `detail` text NOT NULL,
  `volume_value` int(11) NOT NULL,
  `price_value` int(11) NOT NULL,
  `cutoff_grade_value` int(11) NOT NULL,
  `cutoff_grade_unit` varchar(255) NOT NULL,
  `volume_unit` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  PRIMARY KEY (`assumption_id`),
  KEY `assumptions_fk0` (`report_id`),
  CONSTRAINT `assumptions_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assumptions`
--

LOCK TABLES `assumptions` WRITE;
/*!40000 ALTER TABLE `assumptions` DISABLE KEYS */;
INSERT INTO `assumptions` VALUES (8,86,1,'Test A',100,10000,1500,'% / Persentase','kilogram / kg','IDR'),(9,86,1,'Test B',100,25000,1500,'gr/tonne','gram / g','IDR'),(10,86,1,'Test C',50,30000,1500,'% / Persentase','ounce / oz','IDR'),(11,86,1,'Test D',25,15000,1500,'gr/tonne','tonne','IDR'),(12,86,1,'Test E',80,15000,1500,'% / Persentase','kilogram / kg','IDR');
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
) ENGINE=InnoDB AUTO_INCREMENT=2157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balances`
--

LOCK TABLES `balances` WRITE;
/*!40000 ALTER TABLE `balances` DISABLE KEYS */;
INSERT INTO `balances` VALUES (2124,86,'Kas dan Bank',150000,'NERACA','Aktiva Lancar'),(2125,86,'Aktiva Tetap',190000,'NERACA','Aktiva Tidak Lancar'),(2126,86,'Persediaan',50000,'NERACA','Aktiva Lancar'),(2127,86,'Piutang Usaha',120000,'NERACA','Aktiva Lancar'),(2128,86,'Beban ditangguhkan',30000,'NERACA','Aktiva Tidak Lancar'),(2129,86,'Aktiva Eksplorasi',75000,'NERACA','Aktiva Tidak Lancar'),(2130,86,'Pajak dibayar dimuka',25000,'NERACA','Aktiva Lancar'),(2131,86,'Piutang lain-lain dan biaya dibayar dimuka',18000,'NERACA','Aktiva Lancar'),(2132,86,'Amortisasi',30000,'NERACA','Aktiva Tidak Lancar'),(2133,86,'Depresiasi',30000,'NERACA','Aktiva Tidak Lancar'),(2134,86,'Hutang Usaha',145000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2135,86,'Hutang Bank',30000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2136,86,'Hutang Akrual',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2137,86,'Hutang Afiliasi',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2138,86,'Hutang Pajak',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2139,86,'Hutang lain-lain',9000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2140,86,'Hutang Bank',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2141,86,'Hutang Pajak',5000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2142,86,'Hutang Leasing',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2143,86,'Hutang Afiliasi',8000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2144,86,'Provisi Reklamasi dan Pasca Tambang',9000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2145,86,'Hutang lain-lain',2000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2146,86,'Modal Yang Disetor',55000,'HUTANG DAN MODAL','Modal Saham'),(2147,86,'Laba (rugi) ditahan',6000,'HUTANG DAN MODAL','Modal Saham'),(2148,86,'Lain-lain',7000,'HUTANG DAN MODAL','Modal Saham'),(2149,86,'Jumlah Aktiva Lancar',363000,'NERACA','Aktiva Lancar'),(2150,86,'Jumlah Aktiva Tidak Lancar',355000,'NERACA','Aktiva Tidak Lancar'),(2151,86,'Jumlah Aktiva',718000,'NERACA','-'),(2152,86,'Jumlah Kewajiban Jangka Pendek',211000,'HUTANG DAN MODAL','Kewajiban Jangka Pendek'),(2153,86,'Jumlah Kewajiban Jangka Panjang',42000,'HUTANG DAN MODAL','Kewajiban Jangka Panjang'),(2154,86,'Jumlah Kewajiban',253000,'HUTANG DAN MODAL','-'),(2155,86,'Jumlah Ekuitas',68000,'HUTANG DAN MODAL','Modal Saham'),(2156,86,'Jumlah Kewajiban dan Ekuitas',321000,'HUTANG DAN MODAL','-');
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
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`budget_id`),
  KEY `budgets_fk0` (`report_id`),
  CONSTRAINT `budgets_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (89,86,'Biaya Tetap',80000,'BIAYA TETAP'),(90,86,'Biaya Utilitas ( Overhead )',35000,'BIAYA UTILITAS'),(91,86,'Bangunan',50000,'BELANJA MODAL'),(92,86,'Sarana dan Prasarana',20000,'BELANJA MODAL'),(93,86,'Kendaraan & Angkutan',15000,'BELANJA MODAL'),(94,86,'Mesin',35000,'BELANJA MODAL'),(95,86,'Peralatan',15000,'BELANJA MODAL'),(96,86,'Jumlah Anggaran Belanja',250000,'-');
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
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cashflow_id`),
  KEY `cashflows_fk0` (`report_id`),
  CONSTRAINT `cashflows_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashflows`
--

LOCK TABLES `cashflows` WRITE;
/*!40000 ALTER TABLE `cashflows` DISABLE KEYS */;
INSERT INTO `cashflows` VALUES (373,86,'Pembebanan untuk program pensiun yang melebihi pembayaran',25000,'AKTIVITAS OPERASI'),(374,86,'Penyusutan',125000,'AKTIVITAS OPERASI'),(375,86,'Amortisasi',80000,'AKTIVITAS OPERASI'),(376,86,'Lain-lain',15000,'AKTIVITAS OPERASI'),(377,86,'Pengurangan (Penambahan) Piutang lain-lain',20000,'AKTIVITAS OPERASI'),(378,86,'Pengurangan (Penambahan) Piutang Usaha ',20000,'AKTIVITAS OPERASI'),(379,86,'Pengurangan (Penambahan) Persediaan',20000,'AKTIVITAS OPERASI'),(380,86,'Pengurangan (Penambahan) Biaya dibayar di muka',10000,'AKTIVITAS OPERASI'),(381,86,'Penambahan (Pengurangan) Hutang Usaha',10000,'AKTIVITAS OPERASI'),(382,86,'Penambahan (Pengurangan) Hutang Pajak',10000,'AKTIVITAS OPERASI'),(383,86,'Penambahan (Pengurangan) Hutang Lain-lain',10000,'AKTIVITAS OPERASI'),(384,86,'Penambahan (Pengurangan) Biaya yg masih harus dibayar',20000,'AKTIVITAS OPERASI'),(385,86,'Penambahan (Pengurangan)  Pendapatan diterima dimuka',20000,'AKTIVITAS OPERASI'),(386,86,'Pengurangan (Penambahan) Kewajiban lancar lainnnya',20000,'AKTIVITAS OPERASI'),(387,86,'Pengurangan (Penambahan) Aktiva Tetap ',15000,'AKTIVITAS INVESTASI'),(388,86,'Pengurangan (Penambahan) Deposito',17500,'AKTIVITAS PENDANAAN'),(389,86,'Penambahan (Pengurangan) Hutang Pemegang Saham',17500,'AKTIVITAS PENDANAAN'),(390,86,'Pengurangan (Penambahan) Aktiva lain-lain ',10000,'AKTIVITAS INVESTASI'),(391,86,'Penambahan (Pengurangan) Hutang Afiliasi',17500,'AKTIVITAS PENDANAAN'),(392,86,'Penambahan (Pengurangan) Hutang lain-lain',17500,'AKTIVITAS PENDANAAN'),(393,86,'Pembayaran Deviden',17500,'AKTIVITAS PENDANAAN'),(394,86,'Koreksi ke Laba ditahan',17500,'AKTIVITAS PENDANAAN'),(395,86,'Tambahan Modal Disetor',17500,'AKTIVITAS PENDANAAN'),(396,86,'Lain-lain',17500,'AKTIVITAS PENDANAAN'),(397,86,'Awal Tahun',80000,'KAS DAN BANK'),(398,86,'Akhir Tahun',90000,'KAS DAN BANK'),(399,86,'Arus Kas Netto digunakan untuk Aktivitas Operasi',405000,'AKTIVITAS OPERASI'),(400,86,'Arus Kas Netto yang digunakan untuk aktivitas Investasi',25000,'AKTIVITAS INVESTASI'),(401,86,'Laba / Rugi Bersih Tahun Berjalan',0,'-'),(402,86,'Arus Kas Netto Yang Digunakan Untuk Aktivitas Pendanaan',140000,'AKTIVITAS PENDANAAN'),(403,86,'Kenaikan / Penurunan Netto Kas dan Bank',570000,'-');
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
  PRIMARY KEY (`costofgood_id`),
  KEY `costofgoods_fk0` (`report_id`),
  CONSTRAINT `costofgoods_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costofgoods`
--

LOCK TABLES `costofgoods` WRITE;
/*!40000 ALTER TABLE `costofgoods` DISABLE KEYS */;
INSERT INTO `costofgoods` VALUES (69,86,'Biaya Bahan dan Material',100000),(70,86,'Biaya Bahan Bakar',50000),(71,86,'Depresiasi',35000),(72,86,'Biaya Pemeliharaan dan Suku Cadang',35000),(73,86,'Amortisasi',50000),(74,86,'Konsultan',40000),(75,86,'Biaya Lain-lain (Biaya Terkait Produksi)',50000),(76,86,'Persediaan Awal',95000),(77,86,'Persediaan Akhir',80000),(78,86,'Total HPP',345000),(79,86,'Total Persediaan',-15000);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investments`
--

LOCK TABLES `investments` WRITE;
/*!40000 ALTER TABLE `investments` DISABLE KEYS */;
INSERT INTO `investments` VALUES (7,86,'Investasi Berlian',150000),(8,86,'Investasi Emas',100000);
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
) ENGINE=InnoDB AUTO_INCREMENT=2194 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1309,'/add-report',13,'14 November 2019 @ 16:56:20','add report'),(1310,'/add-report',13,'19 November 2019 @ 14:35:35','add report'),(1311,'/add-report',13,'19 November 2019 @ 14:38:27','add report'),(1312,'/add-report',13,'19 November 2019 @ 14:38:40','add report'),(1313,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1314,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1315,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1316,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1317,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1318,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1319,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1320,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1321,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1322,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1323,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1324,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1325,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1326,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1327,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1328,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1329,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1330,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1331,'/add-penerimaan-negara',13,'19 November 2019 @ 14:38:41','add penerimaan'),(1332,'/add-report',13,'19 November 2019 @ 14:40:18','add report'),(1333,'/add-report',13,'19 November 2019 @ 14:42:36','add report'),(1334,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1335,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1336,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1337,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1338,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1339,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1340,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1341,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1342,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1343,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1344,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1345,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1346,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1347,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1348,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1349,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1350,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1351,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1352,'/add-penerimaan-negara',13,'19 November 2019 @ 14:42:37','add penerimaan'),(1353,'/add-report',13,'19 November 2019 @ 14:43:50','add report'),(1354,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1355,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1356,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1357,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1358,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1359,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:50','add penerimaan'),(1360,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1361,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1362,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1363,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1364,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1365,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1366,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1367,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1368,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1369,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1370,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1371,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1372,'/add-penerimaan-negara',13,'19 November 2019 @ 14:43:51','add penerimaan'),(1373,'/add-report',13,'19 November 2019 @ 14:44:37','add report'),(1374,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1375,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1376,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1377,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1378,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1379,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1380,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1381,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1382,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:37','add penerimaan'),(1383,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1384,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1385,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1386,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1387,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1388,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1389,'/add-penerimaan-negara',13,'19 November 2019 @ 14:44:38','add penerimaan'),(1390,'/add-report',13,'19 November 2019 @ 14:57:58','add report'),(1391,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1392,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1393,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1394,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1395,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1396,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1397,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1398,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1399,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1400,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1401,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1402,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1403,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1404,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1405,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1406,'/add-penerimaan-negara',13,'19 November 2019 @ 14:57:59','add penerimaan'),(1407,'/add-report',13,'19 November 2019 @ 14:59:23','add report'),(1408,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1409,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1410,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1411,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1412,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1413,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:23','add penerimaan'),(1414,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1415,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1416,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1417,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1418,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1419,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1420,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1421,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1422,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1423,'/add-penerimaan-negara',13,'19 November 2019 @ 14:59:24','add penerimaan'),(1424,'/add-report',13,'19 November 2019 @ 15:0:43','add report'),(1425,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1426,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1427,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1428,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1429,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1430,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1431,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1432,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1433,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1434,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1435,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1436,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1437,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1438,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1439,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1440,'/add-penerimaan-negara',13,'19 November 2019 @ 15:0:44','add penerimaan'),(1441,'/add-report',13,'19 November 2019 @ 15:9:43','add report'),(1442,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1443,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1444,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1445,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1446,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1447,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1448,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1449,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1450,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:44','add penerimaan'),(1451,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1452,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1453,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1454,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1455,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1456,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1457,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1458,'/add-penerimaan-negara',13,'19 November 2019 @ 15:9:45','add penerimaan'),(1459,'/add-report',13,'19 November 2019 @ 15:14:53','add report'),(1460,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1461,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1462,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1463,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1464,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1465,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1466,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1467,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1468,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1469,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:53','add penerimaan'),(1470,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1471,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1472,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1473,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1474,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1475,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1476,'/add-penerimaan-negara',13,'19 November 2019 @ 15:14:54','add penerimaan'),(1477,'/add-report',13,'19 November 2019 @ 15:24:25','add report'),(1478,'/add-report',13,'19 November 2019 @ 15:26:17','add report'),(1479,'/add-report',13,'20 November 2019 @ 14:59:18','add report'),(1480,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1481,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1482,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1483,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1484,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1485,'/add-arus-kas',13,'20 November 2019 @ 14:59:20','add arus'),(1486,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1487,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1488,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1489,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1490,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1491,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1492,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1493,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1494,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1495,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1496,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1497,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1498,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1499,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1500,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1501,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1502,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1503,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1504,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1505,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1506,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1507,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1508,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1509,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1510,'/add-arus-kas',13,'20 November 2019 @ 14:59:21','add arus'),(1511,'/add-report',13,'20 November 2019 @ 17:0:44','add report'),(1512,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1513,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1514,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1515,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1516,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1517,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1518,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1519,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1520,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1521,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1522,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1523,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1524,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1525,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1526,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1527,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1528,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1529,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1530,'/add-arus-kas',13,'20 November 2019 @ 17:0:45','add arus'),(1531,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1532,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1533,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1534,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1535,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1536,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1537,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1538,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1539,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1540,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1541,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1542,'/add-arus-kas',13,'20 November 2019 @ 17:0:46','add arus'),(1543,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1544,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1545,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1546,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1547,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1548,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1549,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1550,'/add-anggaran-belanja',13,'20 November 2019 @ 17:0:46','add anggaran'),(1551,'/add-report',13,'20 November 2019 @ 17:3:13','add report'),(1552,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1553,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1554,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1555,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1556,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1557,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1558,'/add-arus-kas',13,'20 November 2019 @ 17:3:14','add arus'),(1559,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1560,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1561,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1562,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1563,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1564,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1565,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1566,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1567,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1568,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1569,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1570,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1571,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1572,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1573,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1574,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1575,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1576,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1577,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1578,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1579,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1580,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1581,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1582,'/add-arus-kas',13,'20 November 2019 @ 17:3:15','add arus'),(1583,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1584,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1585,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1586,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1587,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1588,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1589,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1590,'/add-anggaran-belanja',13,'20 November 2019 @ 17:3:15','add anggaran'),(1591,'/add-report',13,'21 November 2019 @ 14:27:4','add report'),(1592,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1593,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1594,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1595,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1596,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1597,'/add-arus-kas',13,'21 November 2019 @ 14:27:5','add arus'),(1598,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1599,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1600,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1601,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1602,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1603,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1604,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1605,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1606,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1607,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1608,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1609,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1610,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1611,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1612,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1613,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1614,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1615,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1616,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1617,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1618,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1619,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1620,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1621,'/add-arus-kas',13,'21 November 2019 @ 14:27:6','add arus'),(1622,'/add-arus-kas',13,'21 November 2019 @ 14:27:7','add arus'),(1623,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1624,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1625,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1626,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1627,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1628,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1629,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1630,'/add-anggaran-belanja',13,'21 November 2019 @ 14:27:7','add anggaran'),(1631,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1632,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1633,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1634,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1635,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1636,'/add-harga-pokok',13,'21 November 2019 @ 14:27:7','add harga'),(1637,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1638,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1639,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1640,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1641,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1642,'/add-harga-pokok',13,'21 November 2019 @ 14:28:38','add harga'),(1643,'/add-report',13,'21 November 2019 @ 14:29:59','add report'),(1644,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1645,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1646,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1647,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1648,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1649,'/add-harga-pokok',13,'21 November 2019 @ 14:29:59','add harga'),(1650,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1651,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1652,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1653,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1654,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1655,'/add-arus-kas',13,'21 November 2019 @ 14:30:39','add arus'),(1656,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1657,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1658,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1659,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1660,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1661,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1662,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1663,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1664,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1665,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1666,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1667,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1668,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1669,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1670,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1671,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1672,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1673,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1674,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1675,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1676,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1677,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1678,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1679,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1680,'/add-arus-kas',13,'21 November 2019 @ 14:30:40','add arus'),(1681,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:40','add anggaran'),(1682,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:40','add anggaran'),(1683,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:40','add anggaran'),(1684,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:40','add anggaran'),(1685,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:40','add anggaran'),(1686,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:41','add anggaran'),(1687,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:41','add anggaran'),(1688,'/add-anggaran-belanja',13,'21 November 2019 @ 14:30:41','add anggaran'),(1689,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1690,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1691,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1692,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1693,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1694,'/add-harga-pokok',13,'21 November 2019 @ 14:30:41','add harga'),(1695,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1696,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1697,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1698,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1699,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1700,'/add-harga-pokok',13,'21 November 2019 @ 14:31:16','add harga'),(1701,'/add-harga-pokok',13,'21 November 2019 @ 14:31:33','add harga'),(1702,'/add-report',13,'21 November 2019 @ 14:31:53','add report'),(1703,'/add-arus-kas',13,'21 November 2019 @ 14:31:54','add arus'),(1704,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:54','add anggaran'),(1705,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:54','add anggaran'),(1706,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:54','add anggaran'),(1707,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:55','add anggaran'),(1708,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:55','add anggaran'),(1709,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:55','add anggaran'),(1710,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:55','add anggaran'),(1711,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1712,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1713,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1714,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1715,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1716,'/add-arus-kas',13,'21 November 2019 @ 14:31:55','add arus'),(1717,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1718,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1719,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1720,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1721,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1722,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1723,'/add-anggaran-belanja',13,'21 November 2019 @ 14:31:56','add anggaran'),(1724,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1725,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1726,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1727,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1728,'/add-arus-kas',13,'21 November 2019 @ 14:31:56','add arus'),(1729,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1730,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1731,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1732,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1733,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1734,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1735,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1736,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1737,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1738,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1739,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1740,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1741,'/add-arus-kas',13,'21 November 2019 @ 14:31:57','add arus'),(1742,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1743,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1744,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1745,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1746,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1747,'/add-harga-pokok',13,'21 November 2019 @ 14:31:57','add harga'),(1748,'/add-harga-pokok',13,'21 November 2019 @ 14:33:9','add harga'),(1749,'/add-harga-pokok',13,'21 November 2019 @ 14:33:9','add harga'),(1750,'/add-report',13,'21 November 2019 @ 14:33:28','add report'),(1751,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1752,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1753,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1754,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1755,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1756,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1757,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1758,'/add-arus-kas',13,'21 November 2019 @ 14:33:30','add arus'),(1759,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1760,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1761,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1762,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1763,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1764,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1765,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1766,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1767,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1768,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1769,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1770,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1771,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1772,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1773,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1774,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1775,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1776,'/add-arus-kas',13,'21 November 2019 @ 14:33:31','add arus'),(1777,'/add-arus-kas',13,'21 November 2019 @ 14:33:32','add arus'),(1778,'/add-arus-kas',13,'21 November 2019 @ 14:33:32','add arus'),(1779,'/add-arus-kas',13,'21 November 2019 @ 14:33:32','add arus'),(1780,'/add-arus-kas',13,'21 November 2019 @ 14:33:32','add arus'),(1781,'/add-arus-kas',13,'21 November 2019 @ 14:33:32','add arus'),(1782,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1783,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1784,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1785,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1786,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1787,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1788,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1789,'/add-anggaran-belanja',13,'21 November 2019 @ 14:33:32','add anggaran'),(1790,'/add-harga-pokok',13,'21 November 2019 @ 14:33:32','add harga'),(1791,'/add-harga-pokok',13,'21 November 2019 @ 14:33:32','add harga'),(1792,'/add-harga-pokok',13,'21 November 2019 @ 14:33:32','add harga'),(1793,'/add-harga-pokok',13,'21 November 2019 @ 14:33:32','add harga'),(1794,'/add-harga-pokok',13,'21 November 2019 @ 14:33:32','add harga'),(1795,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1796,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1797,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1798,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1799,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1800,'/add-harga-pokok',13,'21 November 2019 @ 14:33:33','add harga'),(1801,'/add-report',13,'21 November 2019 @ 14:36:29','add report'),(1802,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1803,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1804,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1805,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1806,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1807,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1808,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1809,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1810,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1811,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1812,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1813,'/add-arus-kas',13,'21 November 2019 @ 14:36:31','add arus'),(1814,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1815,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1816,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1817,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1818,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1819,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1820,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1821,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1822,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1823,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1824,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1825,'/add-arus-kas',13,'21 November 2019 @ 14:36:32','add arus'),(1826,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1827,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1828,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1829,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1830,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1831,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1832,'/add-arus-kas',13,'21 November 2019 @ 14:36:33','add arus'),(1833,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1834,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1835,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1836,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1837,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1838,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1839,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1840,'/add-anggaran-belanja',13,'21 November 2019 @ 14:36:33','add anggaran'),(1841,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1842,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1843,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1844,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1845,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1846,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1847,'/add-harga-pokok',13,'21 November 2019 @ 14:36:33','add harga'),(1848,'/add-harga-pokok',13,'21 November 2019 @ 14:36:34','add harga'),(1849,'/add-harga-pokok',13,'21 November 2019 @ 14:36:34','add harga'),(1850,'/add-harga-pokok',13,'21 November 2019 @ 14:36:34','add harga'),(1851,'/add-harga-pokok',13,'21 November 2019 @ 14:36:34','add harga'),(1852,'/add-report',13,'21 November 2019 @ 16:25:12','add report'),(1853,'/add-arus-kas',13,'21 November 2019 @ 16:25:19','add arus'),(1854,'/add-arus-kas',13,'21 November 2019 @ 16:25:19','add arus'),(1855,'/add-arus-kas',13,'21 November 2019 @ 16:25:19','add arus'),(1856,'/add-arus-kas',13,'21 November 2019 @ 16:25:20','add arus'),(1857,'/add-arus-kas',13,'21 November 2019 @ 16:25:20','add arus'),(1858,'/add-arus-kas',13,'21 November 2019 @ 16:25:20','add arus'),(1859,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1860,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1861,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1862,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1863,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1864,'/add-arus-kas',13,'21 November 2019 @ 16:25:21','add arus'),(1865,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1866,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1867,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1868,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1869,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1870,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1871,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1872,'/add-arus-kas',13,'21 November 2019 @ 16:25:22','add arus'),(1873,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1874,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1875,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1876,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1877,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1878,'/add-arus-kas',13,'21 November 2019 @ 16:25:23','add arus'),(1879,'/add-arus-kas',13,'21 November 2019 @ 16:25:24','add arus'),(1880,'/add-arus-kas',13,'21 November 2019 @ 16:25:24','add arus'),(1881,'/add-arus-kas',13,'21 November 2019 @ 16:25:24','add arus'),(1882,'/add-arus-kas',13,'21 November 2019 @ 16:25:24','add arus'),(1883,'/add-arus-kas',13,'21 November 2019 @ 16:25:24','add arus'),(1884,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:24','add anggaran'),(1885,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1886,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1887,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1888,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1889,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1890,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:25','add anggaran'),(1891,'/add-anggaran-belanja',13,'21 November 2019 @ 16:25:26','add anggaran'),(1892,'/add-harga-pokok',13,'21 November 2019 @ 16:25:26','add harga'),(1893,'/add-harga-pokok',13,'21 November 2019 @ 16:25:26','add harga'),(1894,'/add-harga-pokok',13,'21 November 2019 @ 16:25:26','add harga'),(1895,'/add-harga-pokok',13,'21 November 2019 @ 16:25:26','add harga'),(1896,'/add-harga-pokok',13,'21 November 2019 @ 16:25:26','add harga'),(1897,'/add-harga-pokok',13,'21 November 2019 @ 16:25:27','add harga'),(1898,'/add-harga-pokok',13,'21 November 2019 @ 16:25:27','add harga'),(1899,'/add-harga-pokok',13,'21 November 2019 @ 16:25:27','add harga'),(1900,'/add-harga-pokok',13,'21 November 2019 @ 16:25:28','add harga'),(1901,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:25:28','add sumber'),(1902,'/add-harga-pokok',13,'21 November 2019 @ 16:25:28','add harga'),(1903,'/add-harga-pokok',13,'21 November 2019 @ 16:25:28','add harga'),(1904,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:25:28','add sumber'),(1905,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:25:28','add sumber'),(1906,'/add-investasi',13,'21 November 2019 @ 16:25:29','add investasi'),(1907,'/add-investasi',13,'21 November 2019 @ 16:25:29','add investasi'),(1908,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:25:29','add keuangan'),(1909,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:27:25','add keuangan'),(1910,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:27:25','add keuangan'),(1911,'/add-report',13,'21 November 2019 @ 16:31:56','add report'),(1912,'/add-anggaran-belanja',13,'21 November 2019 @ 16:31:56','add anggaran'),(1913,'/add-harga-pokok',13,'21 November 2019 @ 16:31:56','add harga'),(1914,'/add-harga-pokok',13,'21 November 2019 @ 16:31:56','add harga'),(1915,'/add-harga-pokok',13,'21 November 2019 @ 16:31:56','add harga'),(1916,'/add-harga-pokok',13,'21 November 2019 @ 16:31:56','add harga'),(1917,'/add-harga-pokok',13,'21 November 2019 @ 16:31:57','add harga'),(1918,'/add-harga-pokok',13,'21 November 2019 @ 16:31:57','add harga'),(1919,'/add-harga-pokok',13,'21 November 2019 @ 16:31:58','add harga'),(1920,'/add-harga-pokok',13,'21 November 2019 @ 16:31:58','add harga'),(1921,'/add-harga-pokok',13,'21 November 2019 @ 16:31:58','add harga'),(1922,'/add-harga-pokok',13,'21 November 2019 @ 16:31:58','add harga'),(1923,'/add-harga-pokok',13,'21 November 2019 @ 16:31:59','add harga'),(1924,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:32:2','add sumber'),(1925,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:32:2','add sumber'),(1926,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:32:2','add sumber'),(1927,'/add-investasi',13,'21 November 2019 @ 16:32:2','add investasi'),(1928,'/add-investasi',13,'21 November 2019 @ 16:32:2','add investasi'),(1929,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:2','add keuangan'),(1930,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:3','add keuangan'),(1931,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:3','add keuangan'),(1932,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:3','add keuangan'),(1933,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:3','add keuangan'),(1934,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:32:3','add keuangan'),(1935,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1936,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1937,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1938,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1939,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1940,'/add-arus-kas',13,'21 November 2019 @ 16:32:4','add arus'),(1941,'/add-arus-kas',13,'21 November 2019 @ 16:32:5','add arus'),(1942,'/add-arus-kas',13,'21 November 2019 @ 16:32:5','add arus'),(1943,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1944,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1945,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1946,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1947,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1948,'/add-arus-kas',13,'21 November 2019 @ 16:32:6','add arus'),(1949,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1950,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1951,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1952,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1953,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1954,'/add-arus-kas',13,'21 November 2019 @ 16:32:7','add arus'),(1955,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1956,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1957,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1958,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1959,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1960,'/add-arus-kas',13,'21 November 2019 @ 16:32:8','add arus'),(1961,'/add-arus-kas',13,'21 November 2019 @ 16:32:9','add arus'),(1962,'/add-arus-kas',13,'21 November 2019 @ 16:32:9','add arus'),(1963,'/add-arus-kas',13,'21 November 2019 @ 16:32:9','add arus'),(1964,'/add-arus-kas',13,'21 November 2019 @ 16:32:9','add arus'),(1965,'/add-arus-kas',13,'21 November 2019 @ 16:32:9','add arus'),(1966,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:9','add anggaran'),(1967,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:9','add anggaran'),(1968,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:9','add anggaran'),(1969,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:10','add anggaran'),(1970,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:10','add anggaran'),(1971,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:11','add anggaran'),(1972,'/add-anggaran-belanja',13,'21 November 2019 @ 16:32:11','add anggaran'),(1973,'/add-report',13,'21 November 2019 @ 16:35:30','add report'),(1974,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1975,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1976,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1977,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1978,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1979,'/add-arus-kas',13,'21 November 2019 @ 16:35:35','add arus'),(1980,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1981,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1982,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1983,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1984,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1985,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1986,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1987,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1988,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1989,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1990,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1991,'/add-arus-kas',13,'21 November 2019 @ 16:35:36','add arus'),(1992,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1993,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1994,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1995,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1996,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1997,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1998,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(1999,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(2000,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(2001,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(2002,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(2003,'/add-arus-kas',13,'21 November 2019 @ 16:35:37','add arus'),(2004,'/add-arus-kas',13,'21 November 2019 @ 16:35:38','add arus'),(2005,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:38','add anggaran'),(2006,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:38','add anggaran'),(2007,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:38','add anggaran'),(2008,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:38','add anggaran'),(2009,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:38','add anggaran'),(2010,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:39','add anggaran'),(2011,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:39','add anggaran'),(2012,'/add-anggaran-belanja',13,'21 November 2019 @ 16:35:39','add anggaran'),(2013,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2014,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2015,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2016,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2017,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2018,'/add-harga-pokok',13,'21 November 2019 @ 16:35:41','add harga'),(2019,'/add-harga-pokok',13,'21 November 2019 @ 16:35:42','add harga'),(2020,'/add-harga-pokok',13,'21 November 2019 @ 16:35:42','add harga'),(2021,'/add-harga-pokok',13,'21 November 2019 @ 16:35:43','add harga'),(2022,'/add-harga-pokok',13,'21 November 2019 @ 16:35:43','add harga'),(2023,'/add-harga-pokok',13,'21 November 2019 @ 16:35:43','add harga'),(2024,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:35:43','add sumber'),(2025,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:35:43','add sumber'),(2026,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:35:43','add sumber'),(2027,'/add-investasi',13,'21 November 2019 @ 16:35:43','add investasi'),(2028,'/add-investasi',13,'21 November 2019 @ 16:35:43','add investasi'),(2029,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:43','add keuangan'),(2030,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:43','add keuangan'),(2031,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:43','add keuangan'),(2032,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:44','add keuangan'),(2033,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:44','add keuangan'),(2034,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:35:44','add keuangan'),(2035,'/add-report',13,'21 November 2019 @ 16:40:18','add report'),(2036,'/add-arus-kas',13,'21 November 2019 @ 16:40:23','add arus'),(2037,'/add-arus-kas',13,'21 November 2019 @ 16:40:23','add arus'),(2038,'/add-arus-kas',13,'21 November 2019 @ 16:40:23','add arus'),(2039,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2040,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2041,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2042,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2043,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2044,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2045,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2046,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2047,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2048,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2049,'/add-arus-kas',13,'21 November 2019 @ 16:40:24','add arus'),(2050,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2051,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2052,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2053,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2054,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2055,'/add-arus-kas',13,'21 November 2019 @ 16:40:25','add arus'),(2056,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2057,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2058,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2059,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2060,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2061,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2062,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2063,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2064,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2065,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2066,'/add-arus-kas',13,'21 November 2019 @ 16:40:26','add arus'),(2067,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:26','add anggaran'),(2068,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2069,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2070,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2071,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2072,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2073,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:27','add anggaran'),(2074,'/add-anggaran-belanja',13,'21 November 2019 @ 16:40:28','add anggaran'),(2075,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2076,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2077,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2078,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2079,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2080,'/add-harga-pokok',13,'21 November 2019 @ 16:40:28','add harga'),(2081,'/add-harga-pokok',13,'21 November 2019 @ 16:40:29','add harga'),(2082,'/add-harga-pokok',13,'21 November 2019 @ 16:40:29','add harga'),(2083,'/add-harga-pokok',13,'21 November 2019 @ 16:40:29','add harga'),(2084,'/add-harga-pokok',13,'21 November 2019 @ 16:40:29','add harga'),(2085,'/add-harga-pokok',13,'21 November 2019 @ 16:40:29','add harga'),(2086,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:40:29','add sumber'),(2087,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:40:30','add sumber'),(2088,'/add-sumber-pembiayaan',13,'21 November 2019 @ 16:40:30','add sumber'),(2089,'/add-investasi',13,'21 November 2019 @ 16:40:30','add investasi'),(2090,'/add-investasi',13,'21 November 2019 @ 16:40:30','add investasi'),(2091,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:30','add keuangan'),(2092,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:30','add keuangan'),(2093,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:30','add keuangan'),(2094,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:30','add keuangan'),(2095,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:30','add keuangan'),(2096,'/add-keuangan-lainnya',13,'21 November 2019 @ 16:40:31','add keuangan'),(2097,'/add-report',13,'25 November 2019 @ 0:39:58','add report'),(2098,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2099,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2100,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2101,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2102,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2103,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:39:58','add asumsi'),(2104,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:40:50','add asumsi'),(2105,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:40:50','add asumsi'),(2106,'/add-report',13,'25 November 2019 @ 0:44:9','add report'),(2107,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:9','add asumsi'),(2108,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:9','add asumsi'),(2109,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:9','add asumsi'),(2110,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:9','add asumsi'),(2111,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:9','add asumsi'),(2112,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:44:58','add asumsi'),(2113,'/add-report',13,'25 November 2019 @ 0:45:8','add report'),(2114,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:45:9','add asumsi'),(2115,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:45:9','add asumsi'),(2116,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:45:9','add asumsi'),(2117,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:45:9','add asumsi'),(2118,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:45:9','add asumsi'),(2119,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:46:56','add asumsi'),(2120,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:46:56','add asumsi'),(2121,'/add-report',13,'25 November 2019 @ 0:47:20','add report'),(2122,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:47:20','add asumsi'),(2123,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:47:20','add asumsi'),(2124,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:47:20','add asumsi'),(2125,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:47:20','add asumsi'),(2126,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:47:20','add asumsi'),(2127,'/add-report',13,'25 November 2019 @ 0:48:17','add report'),(2128,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2129,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2130,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2131,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2132,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2133,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2134,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2135,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2136,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2137,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2138,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2139,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2140,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2141,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2142,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2143,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2144,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2145,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2146,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2147,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2148,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2149,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2150,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2151,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2152,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2153,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2154,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2155,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2156,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2157,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2158,'/add-arus-kas',13,'25 November 2019 @ 0:48:19','add arus'),(2159,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:48:19','add asumsi'),(2160,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:48:19','add asumsi'),(2161,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:48:19','add asumsi'),(2162,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:48:19','add asumsi'),(2163,'/add-asumsi-keuangan',13,'25 November 2019 @ 0:48:19','add asumsi'),(2164,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2165,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2166,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2167,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2168,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2169,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2170,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2171,'/add-anggaran-belanja',13,'25 November 2019 @ 0:48:19','add anggaran'),(2172,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2173,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2174,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2175,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2176,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2177,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2178,'/add-harga-pokok',13,'25 November 2019 @ 0:48:19','add harga'),(2179,'/add-harga-pokok',13,'25 November 2019 @ 0:48:20','add harga'),(2180,'/add-harga-pokok',13,'25 November 2019 @ 0:48:20','add harga'),(2181,'/add-harga-pokok',13,'25 November 2019 @ 0:48:20','add harga'),(2182,'/add-harga-pokok',13,'25 November 2019 @ 0:48:20','add harga'),(2183,'/add-sumber-pembiayaan',13,'25 November 2019 @ 0:48:20','add sumber'),(2184,'/add-sumber-pembiayaan',13,'25 November 2019 @ 0:48:20','add sumber'),(2185,'/add-sumber-pembiayaan',13,'25 November 2019 @ 0:48:20','add sumber'),(2186,'/add-investasi',13,'25 November 2019 @ 0:48:20','add investasi'),(2187,'/add-investasi',13,'25 November 2019 @ 0:48:20','add investasi'),(2188,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan'),(2189,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan'),(2190,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan'),(2191,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan'),(2192,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan'),(2193,'/add-keuangan-lainnya',13,'25 November 2019 @ 0:48:20','add keuangan');
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
  `national_income_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `value` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`national_income_id`),
  KEY `national_incomes_fk0` (`report_id`),
  CONSTRAINT `national_incomes_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_incomes`
--

LOCK TABLES `national_incomes` WRITE;
/*!40000 ALTER TABLE `national_incomes` DISABLE KEYS */;
INSERT INTO `national_incomes` VALUES (289,86,'PPH Pasal 21',70000,'PAJAK'),(290,86,'PPH Pasal 22',30000,'PAJAK'),(291,86,'PPH Pasal 25',50000,'PAJAK'),(292,86,'PPH Pasal 23/26',25000,'PAJAK'),(293,86,'PPN Masukan',25000,'PAJAK'),(294,86,'Pajak-pajak daerah',50000,'PAJAK'),(295,86,'PPN Keluaran',25000,'PAJAK'),(296,86,'PPH Pasal 29',30000,'PAJAK'),(297,86,'Lumpsum Payment',30000,'PAJAK'),(298,86,'Royalti',80000,'NON PAJAK'),(299,86,'Deadrent',30000,'NON PAJAK'),(300,86,'SPW3D',30000,'NON PAJAK'),(301,86,'Advance Payment',30000,'NON PAJAK'),(302,86,'BBN',30000,'NON PAJAK'),(303,86,'Jumlah Pajak',335000,'PAJAK'),(304,86,'Jumlah Non Pajak',200000,'NON PAJAK'),(305,86,'Jumlah Penerimaan Negara',535000,'-');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_finances`
--

LOCK TABLES `other_finances` WRITE;
/*!40000 ALTER TABLE `other_finances` DISABLE KEYS */;
INSERT INTO `other_finances` VALUES (19,86,'Depresiasi',80000),(20,86,'Investasi',250000),(21,86,'Amortisasi',50000),(22,86,'Biaya Keselamatan Pertambangan',35000),(23,86,'Biaya Penanganan lingkungan',35000),(24,86,'Biaya Pengembangan Masyarakat',35000);
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
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`profit_loss_id`),
  KEY `profit_losses_fk0` (`report_id`),
  CONSTRAINT `profit_losses_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_losses`
--

LOCK TABLES `profit_losses` WRITE;
/*!40000 ALTER TABLE `profit_losses` DISABLE KEYS */;
INSERT INTO `profit_losses` VALUES (700,86,'Penjualan',1500000,'PENDAPATAN'),(701,86,'Royalti',550000,'PENDAPATAN'),(702,86,'Harga Pokok Penjualan',100000,'PENDAPATAN'),(703,86,'Beban Operasi',110000,'BEBAN OPERASI'),(704,86,'Beban Penjualan',50000,'BEBAN OPERASI'),(705,86,'Beban Umum',25000,'BEBAN OPERASI'),(706,86,'Beban Lain-Lain',10000,'BEBAN OPERASI'),(707,86,'Beban Bunga',55000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(708,86,'Laba Selisih Kurs',15000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(709,86,'Pendapatan Bunga',35000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(710,86,'Beban Lain-Lain',15000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(711,86,'Rugi Selisih Kurs, Bersih',15000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(712,86,'Biaya Pajak Penghasilan',35000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(713,86,'Laba Rugi Kotor',850000,'PENDAPATAN'),(714,86,'Jumlah Beban Operasi',100000,'BEBAN OPERASI'),(715,86,'Laba Rugi Operasi',750000,'BEBAN OPERASI'),(716,86,'Jumlah Pendapatan Lain Lain',145000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(717,86,'Laba Rugi Sebelum Pajak',895000,'PENDAPATAN/(BEBAN) LAIN-LAIN'),(718,86,'Laba Rugi Bersih',860000,'PENDAPATAN/(BEBAN) LAIN-LAIN');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (86,13,'Operasi Produksi',1,0,0,'Triwulan I','IDR',2019);
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
  PRIMARY KEY (`source_of_financing_id`),
  KEY `source_of_financings_fk0` (`report_id`),
  CONSTRAINT `source_of_financings_fk0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_of_financings`
--

LOCK TABLES `source_of_financings` WRITE;
/*!40000 ALTER TABLE `source_of_financings` DISABLE KEYS */;
INSERT INTO `source_of_financings` VALUES (10,86,'Modal Sendiri',100000),(11,86,'Pinjaman Dalam Negeri',50000),(12,86,'Pinjaman Luar Negeri',25000);
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

-- Dump completed on 2019-11-25  2:09:11
