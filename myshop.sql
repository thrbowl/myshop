-- MySQL dump 10.14  Distrib 5.5.37-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	5.5.37-MariaDB-log

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` varchar(23) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_goods`
--

DROP TABLE IF EXISTS `cart_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_goods`
--

LOCK TABLES `cart_goods` WRITE;
/*!40000 ALTER TABLE `cart_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'小炒',0,'2014-09-03 17:17:55'),(2,'套餐',0,'2014-09-03 17:18:44'),(3,'主食',0,'2014-09-03 17:18:57'),(4,'盖饭',0,'2014-09-03 17:19:06');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `sale` int(11) NOT NULL DEFAULT '0',
  `description` varchar(1000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'糖醋里脊',NULL,16,0,'糖醋里脊是经典汉族名菜之一。在浙江菜、鲁菜、川菜、粤菜和淮菜里都有此菜，以鲁菜的糖醋里脊最负盛名。糖醋里脊以猪里脊肉为主材，配以面粉，淀粉，醋等作料，酸甜可口，让人食欲大开。',0,'2014-09-02 17:09:49'),(2,'宫保鸡丁',NULL,13,0,'宫保鸡丁是汉族传统经典名菜，属于川菜中最具代表性的菜品之一。创始人为贵州织金人时任四川总督丁宝桢，在任四川总督时创制该菜，流传至今。由于一般认为宫保鸡丁正式创制是丁宝桢任四川总督之时，在蜀地创制并流传开，且其后至今的漫长岁月中，宫保鸡丁主要通过市场巨大的川菜馆作为载体走向大江南北及海外，声名远播，因此宫保鸡丁在菜系定位属于川菜系，同时由于丁宝桢为贵州人，所以宫保鸡丁也可被认为是贵州菜系即黔菜系。',0,'2014-09-02 17:10:33'),(3,'拔丝地瓜',NULL,11,0,'拔丝地瓜是一道色香味俱全的汉族传统名菜，属于鲁菜系甜菜。此菜瓜块大小均匀、色泽金黄、牵丝不断、甜香适口、入口酥脆、吃完口齿留香。拔丝是鲁菜的一大特色，几乎所有小孩都愿意吃。拔丝菜是比较考究师傅的火力控制的一道菜，据说，拔丝苹果就是最早的三级厨师考试菜。 拔丝说起来很简单，不过把炸好的原料外面裹上糖稀，其实这个糖就非常的考究了，早了，拔不出丝来，晚了，又糊又苦，味道不好，卖象也不好。要讲究色泽金黄，细丝可以抻出2、3米都不断。',0,'2014-09-02 17:11:59'),(4,'东坡肘子',NULL,39,0,'东坡肘子是川渝地区的经典的汉族名菜之一，属于川菜系。东坡肘子其实并非苏东坡之功，而是其妻子王弗的妙作。“东坡肘子”被冠以苏东坡之名，又为四川名肴，这是因为“东坡肘子”出自苏东坡的故乡现四川省眉山市东坡区。',0,'2014-09-02 17:12:28'),(5,'大盘鸡',NULL,22,0,'新疆大盘鸡是新疆地区名菜，大约起源于80年代末期，主要用料为鸡块和土豆块，配皮带面烹饪而成。新疆大盘鸡色彩鲜艳，有爽滑麻辣的鸡肉和软糯甜润的土豆，辣中有香，粗中带细，而且经济实惠，亲朋聚会食用尚家。',0,'2014-09-02 17:12:54'),(6,'排骨炖萝卜','a2020c74-6352-4065-90f7-21490e9a209a.jpg',19,0,'排骨炖萝卜是一款家常汤品，主要食材是萝卜和排骨，主要烹饪工艺是炖。萝卜含有丰富的蛋白质、碳水化合物、钙、铁和维生素等；排骨能补充蛋白质和钙，既可平衡营养，又能强身健体。',0,'2014-09-02 17:13:28'),(7,'锅包肉','07332b5a-3081-43f5-a46a-4c5cadb22925.jpg',39,0,'锅包肉是一道东北风味菜，即将猪里脊肉切片腌入味，裹上炸浆下锅炸至金黄色捞起，再下锅拌炒勾芡即成。成菜色泽金黄，口味酸甜',0,'2014-09-03 13:56:24'),(8,'test','c2313771-e242-440b-b8f9-c7c7ada5f5e0.jpg',0,0,'test',-1,'2014-09-03 13:56:42');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category`
--

DROP TABLE IF EXISTS `goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(1000) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES ('吃货餐馆','18710092308','08:00:40','19:00:00',0,'肯德基（Kentucky Fried Chicken，肯塔基州炸鸡），简称KFC，是美国跨国连锁餐厅，同时也是世界第二大速食及最大炸鸡连锁企业，由哈兰德·桑德斯上校于1930年在肯塔基州路易斯维尔创建，主要出售炸鸡、汉堡、薯条、蛋挞、汽水等西式快餐食品。');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2014-09-03 18:55:52
