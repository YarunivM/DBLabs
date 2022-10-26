-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: yaruniv
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `browsers`
--

DROP TABLE IF EXISTS `browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `browsers` (
  `BrowserID` int NOT NULL,
  `Version` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BrowserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsers`
--

LOCK TABLES `browsers` WRITE;
/*!40000 ALTER TABLE `browsers` DISABLE KEYS */;
INSERT INTO `browsers` VALUES (1,'10.9','Google Chrome'),(2,'105.0.2 ','Firefox'),(3,'5.1.7','Safari');
/*!40000 ALTER TABLE `browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `GameID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Produser` varchar(45) DEFAULT NULL,
  `Requirements` int DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `requirement_idx` (`Requirements`),
  CONSTRAINT `requirement` FOREIGN KEY (`Requirements`) REFERENCES `browsers` (`BrowserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'The Sims 4','Maxis',1),(2,'Gotham Knights',' Warner Bros. Interactive Entertainment',1),(3,'Apex Legends','Electronic Arts',2),(4,'NARAKA:BLADEPIONT','24 Entertainment',1),(5,'PUBG:BATTLEGROUNDS','PUBG Corporation',3),(6,'RimWorld','Ludeon Studios',3),(7,'Dota 2','Valve',2),(8,'Victoria 3','Paradox Interactive',1),(9,'Counter-Strike: Global Offenseve','Valve',1),(10,'Call of Duty: Modern Warfare ||','Infinity Ward ',2);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `start`
--

DROP TABLE IF EXISTS `start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `start` (
  `StartID` int NOT NULL,
  `GameID` int NOT NULL,
  `UserID` int NOT NULL,
  `StatusID` int DEFAULT NULL,
  PRIMARY KEY (`StartID`),
  KEY `fk_Start_Game_idx` (`GameID`),
  KEY `fk_Start_User1_idx` (`UserID`),
  KEY `fk_Start_Status_idx` (`StatusID`),
  CONSTRAINT `fk_Start_Game` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Start_Status` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Start_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `start`
--

LOCK TABLES `start` WRITE;
/*!40000 ALTER TABLE `start` DISABLE KEYS */;
INSERT INTO `start` VALUES (1,1,1,1),(2,5,2,2),(3,1,2,2),(4,2,5,1),(5,3,7,1),(6,6,1,2),(7,7,4,2),(8,9,10,1),(9,10,3,1),(10,10,3,2),(11,4,4,2);
/*!40000 ALTER TABLE `start` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `StatusID` int NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'new game'),(2,'continue');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ihor','1999-10-22','ihor22@gmail.com'),(2,'Petr','2001-07-11','pert11@ukr.net'),(3,'Olga','1987-05-06',NULL),(4,'Ivan',NULL,'ivan27@gmail.com'),(5,'Oxana','2002-03-08','oxana08@gmail.com'),(6,'Svitlana','1997-11-13',NULL),(7,'Denys','2001-12-30','den1230@ukr.net'),(8,'Oleg','1995-07-25','oleg07@gmail.com'),(9,'Semen',NULL,''),(10,'Illia','2003-10-15','illia1015@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-26 15:14:28
