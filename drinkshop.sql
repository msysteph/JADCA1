CREATE DATABASE  IF NOT EXISTS `drinkshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `drinkshop`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: drinkshop
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description_short` varchar(100) NOT NULL,
  `description_long` varchar(200) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `retail_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `product_category` varchar(45) NOT NULL,
  `image_location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Classic Bubble Tea','Our store\'s classic.','Our store\'s classic bubble tea. Made from freshly-brewed leaves daily and chewy, low-sugar tapioca pearls.',2.00,3.00,200,'Bubble teas','https://i.imgur.com/Se3C34D.png'),(2,'Taro Bubble Tea','Bubble tea flavoured with taro.','Made from freshly-brewed tea and flavoured with taro, served with taro bits and chewy tapioca pearls.',3.50,5.50,200,'Bubble teas','https://i.imgur.com/TTx3i34.png'),(3,'Matcha Bubble Tea','Bubble tea flavoured with authentic matcha.','Made from freshly-brewed tea and flavoured with authentic Japanese matcha, served with chewy tapioca pearls. ',3.00,4.00,150,'Bubble teas','https://i.imgur.com/jP4PXLJ.png'),(4,'Pineapple Coconut Kombucha','Kombucha flavoured with fresh pineapples and coconut.','Made from fermented black tea and flavoured with fresh pinapples and coconut. Many health benefits.',5.50,8.50,100,'Kombuchas','https://i.imgur.com/CBNP4DO.png'),(5,'Passionfruit Kombucha','Kombucha flavoured with fresh passionfruit.','Made from fermented black tea and flavoured with fresh passionfruit.  Many health benefits.',5.00,7.00,100,'Kombuchas','https://i.imgur.com/fjPKd2r.png'),(6,'Strawberry Mint Kombucha','Kombucha flavoured with fresh strawberries and mint.','Made from fermented black tea and flavoured with fresh strawberries and springs of mint. Many health benefits.',5.50,8.50,100,'Kombuchas','https://i.imgur.com/u3lY37q.png'),(7,'Oreo Chocolate Milkshake','Milkshake flavoured with oreo pieces and Hersheys chocolate.','Made from fresh low-fat milk and flavoured with oreo pieces and Hersheys chocolate. ',4.50,6.50,150,'Milkshakes','https://i.imgur.com/IZq81jG.png'),(8,'Strawberry Cherry Milkshake','Milkshake flavoured with fresh strawberries and cherries.','Made from fresh low-fat milk and flavoured with fresh strawberries and cherries. ',5.50,7.00,150,'Milkshakes','https://i.imgur.com/5VK1v8p.png'),(9,'Peanut Butterscotch Milkshake','Milkshake flavoured with peanut butter and butterscotch.','Made from fresh low-fat milk and flavoured with peanut butter and butterscotch.',6.00,8.50,150,'Milkshakes','https://i.imgur.com/ugrhEhY.png');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mario','itsme','admin','mario@gmail.com'),(2,'peaches','yourhighness','admin','peaches@gmail.com'),(3,'luigi','forthepeople','admin','luigi@gmail.com'),(4,'yoshi','dinosayrawr','member','yoshi@gmail.com'),(5,'bowser','spiky','member','bowser@gmail.com'),(6,'waluigi','wah','member','waluigi@gmail.com'),(8,'wario','yellowisgreat','member','wario@gmail.com'),(9,'daisy','flowery','member','daisy@gmail.com'),(10,'bowserjr','needamom','member','bowserjr@gmail.com');
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

-- Dump completed on 2020-05-16 14:13:11
