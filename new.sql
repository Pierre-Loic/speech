-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: promodataia
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `Pygame`
--

DROP TABLE IF EXISTS `Pygame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pygame` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pygame`
--

LOCK TABLES `Pygame` WRITE;
/*!40000 ALTER TABLE `Pygame` DISABLE KEYS */;
INSERT INTO `Pygame` VALUES (1,'Lapyrinthe'),(2,'Pettro'),(3,'Snake'),(4,'Morpion');
/*!40000 ALTER TABLE `Pygame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `pygame_id` int(11) DEFAULT NULL,
  `astro` varchar(20) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'TOBLOME','KODJO','1983-05-30',6.13722,1.21222,4,'gémeaux','07 51 05 24 74','ferdinandtoblome@gmail.com \n'),(2,'Coste','Christine','1981-09-02',-73.9689,40.7788,1,'vierge','06 10 57 15 81','christine.costeduvaud@gmail.com\n'),(3,'vavrille','nory','1988-01-06',45.5309,4.86214,4,'capricorne','07 81 83 63 49','noryvavrille88@gmail.com\n'),(4,'Oroudjian','Haikouhi','1989-09-11',48.8667,2.33333,2,'vierge','06 58 17 58 07','h.oroudjian@protonmail.com\n'),(5,'Kettab','Bachir','1987-07-08',-16.5044,-151.774,3,'cancer','06 30 94 41 71','kettab.bachir1987@gmail.com\n'),(6,'Dentand','Arthur','1994-04-01',24.5552,-81.8023,3,'bélier','06 68 48 20 61','arthurdentand@gmail.com\n'),(7,'Ros','Hugo','1988-11-18',45.7581,4.76491,2,'scorpion','07 82 58 18 56','hros38@gmail.com\n'),(8,'Flaus','Théo','1996-09-16',-22.2758,166.458,1,'vierge','06 95 31 19 89','flaus.theo69@gmail.com\n'),(9,'Champredon','Marina','1990-06-26',34.6834,135.84,3,'cancer','06 98 00 85 70','marina.champredon@gmail.com\n'),(10,'Scheurer','Timothée','1993-09-03',126.978,37.5665,1,'vierge','06 32 36 21 03','t.scheurer03@gmail.com\n'),(11,'Guseynov','Rustam','1991-03-17',73.5552,-12.8023,3,'poisson','07 69 01 89 88','rustamguseynov38@gmail.com\n'),(12,'ARETHENS','Emmanuel','1995-04-10',35.0116,135.768,4,'bélier','06 37 83 62 69','emmanuel.arethens1@gmail.com\n'),(13,'﻿Tin','William','1980-05-08',-22.9201,-43.3307,4,'taureau','06 64 03 78 32','tin.william@gmail.com\n'),(14,'Fulleringer','Adrien','1993-12-22',52.5306,13.3831,2,'capricorne','06 35 48 84 39','fuladri38@gmail.com\n'),(15,'Merel','Caroline','1997-12-29',45.5995,-19.3744,2,'capricorne','06 46 81 32 31','carolinemerel@gmail.com\n'),(16,'Dao','Mai','1989-12-15',45.692,4.79277,1,'sagittaire','07 76 99 04 33','md.maidao@gmail.com\n');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-25 14:37:13
