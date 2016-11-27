CREATE DATABASE  IF NOT EXISTS `loshs_compartidos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `loshs_compartidos`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: loshs_compartidos
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `iCategoryId` int(10) NOT NULL AUTO_INCREMENT,
  `sCategoryName` varchar(100) NOT NULL,
  `dtCreated` datetime DEFAULT NULL,
  `dtDeleted` datetime DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes`
--

DROP TABLE IF EXISTS `Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Likes` (
  `iLikesId` int(11) NOT NULL AUTO_INCREMENT,
  `iUserId` int(11) NOT NULL,
  `iOfferId` int(11) NOT NULL,
  `dtLike` datetime NOT NULL,
  PRIMARY KEY (`iLikesId`),
  KEY `iUserId_idx` (`iUserId`),
  KEY `iUserId_idx2` (`iUserId`),
  KEY `iOffersId_idx2` (`iOfferId`),
  KEY `iUserId_idx3` (`iUserId`),
  KEY `iOffersId_idx3` (`iOfferId`),
  CONSTRAINT `iOffersId3` FOREIGN KEY (`iOfferId`) REFERENCES `Offers` (`iOfferId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `iUserId3` FOREIGN KEY (`iUserId`) REFERENCES `User` (`iUserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offers`
--

DROP TABLE IF EXISTS `Offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offers` (
  `iOfferId` int(11) NOT NULL AUTO_INCREMENT,
  `sTitle` varchar(150) NOT NULL,
  `dtStartDate` datetime DEFAULT NULL,
  `dtExpirationDate` datetime DEFAULT NULL,
  `dtCreatedDate` datetime DEFAULT NULL,
  `dtDeletedDate` datetime DEFAULT NULL,
  `dtLastModifiedDate` datetime DEFAULT NULL,
  `pLocation` point NOT NULL,
  `sDescription` varchar(150) NOT NULL,
  `iUserId` int(11) DEFAULT NULL,
  `iCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`iOfferId`),
  KEY `iUserid_idx` (`iUserId`),
  KEY `iCategoryid_idx` (`iCategoryId`),
  SPATIAL KEY `pLocation_idx` (`pLocation`),
  CONSTRAINT `iCategoryId` FOREIGN KEY (`iCategoryId`) REFERENCES `Categories` (`iCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `iUserid` FOREIGN KEY (`iUserId`) REFERENCES `User` (`iUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offers`
--

LOCK TABLES `Offers` WRITE;
/*!40000 ALTER TABLE `Offers` DISABLE KEYS */;
INSERT INTO `Offers` VALUES (1,'Oferta1',NULL,NULL,NULL,NULL,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0>@\0\0\0\0\0\0$@','Gran oferta!',1,NULL),(2,'Oferta1',NULL,NULL,NULL,NULL,NULL,'\0\0\0\0\0\0\0\0\0\0\0\0L\Ý@\0\0\0\0\0L\Í@','Gran oferta!',1,NULL);
/*!40000 ALTER TABLE `Offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `iUserId` int(11) NOT NULL AUTO_INCREMENT,
  `sUserName` varchar(50) DEFAULT NULL,
  `sUserFirstName` varchar(50) NOT NULL,
  `sUserLastName` varchar(50) DEFAULT NULL,
  `dtCreatedDate` datetime NOT NULL,
  `dtDeletedDate` varchar(50) DEFAULT NULL,
  `dtLastModifiedDate` datetime DEFAULT NULL,
  `sPassword` varchar(50) NOT NULL,
  `sLocationSource` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,NULL,'Hugo',NULL,'2016-11-27 13:28:27',NULL,NULL,'*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 14:28:12
