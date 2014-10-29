-- MySQL dump 10.13  Distrib 5.1.71, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	5.1.71

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1-系统公告\n2-网站页面',
  `flag` int(11) NOT NULL COMMENT '0-不能评论\n1-可以评论',
  `alias` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,2,0,'about_us','关于我们','<p><span style=\"font-size:18px\"><span style=\"font-size:24px\"><strong><span style=\"color:#ff0000\">啤酒坊</span></strong><span style=\"font-size:18px\">是灯塔市燕京啤酒总代理，负责灯塔市范围内的所有燕京啤酒的发行与销售。为了让利广大客户，现上线直销平台，减少中间销售环节，让大家以最优惠的价格买到最称心的燕京啤酒。</span></span></span></p>','2014-09-13 23:04:52','2014-09-23 23:04:24'),(2,2,0,'contact_us','联系我们','<p><span style=\"text-decoration:underline;\"><strong><span style=\"color:#ff0000;font-size:32px\">送酒电话：</span></strong></span></p><p><span style=\"text-decoration:underline;\"><strong><span style=\"color:#ff0000;font-size:32px\"><br/></span></strong></span></p><p><span style=\"text-decoration:underline;\"><strong><span style=\"color:#ff0000;font-size:32px\"></span></strong></span></p><p align=\"left\"><span style=\"font-size:24px\"><span style=\"color:#1f497d\">1. 13238939867</span></span></p><p align=\"left\"><span style=\"font-size:24px\"><span style=\"color:#1f497d\">2. 15804205820</span></span><br/></p>','2014-09-15 11:28:59','2014-09-23 23:01:52'),(3,2,0,'order_guide','购物指南','<p><span style=\"color:#c0504d\"><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong>查找商品</strong></span></span></span></p><p><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong><br/></strong></span></span></p><p><span style=\"font-size:18px\">&nbsp; 进入首页(<a target=\"_self\" href=\"http://songpijiu.com\">http://songpijiu.com</a>)查找你要购买的商品，如果您不知要如何挑选商品，建议您可以从分类开始，寻找适合您的商品。</span></p><p><br/><span style=\"font-size:18px\"></span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"color:#C0504D\"><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong>放入购物车</strong></span></span></span></p><p><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong><br/></strong></span></span></p><p><span style=\"font-size:18px\">（1）当您选好商品后，点击“订购”按钮，商品会自动添加到您的购物车中。此时，您还可以继续挑选商品，把想要购买的商品都放入购物车中，最后一起结算。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"font-size:18px\">（2）在选购中，每件商品的订购数量默认为一件，如果您想购买多件商品，可直接在购买单品页加减，也可在购物页面改写。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"font-size:18px\">（3） 如果您想删除购物车中的某样商品，可以点击购物车中商品前面的“X”按钮进行删除操作。</span></p><p><br/><span style=\"font-size:18px\"></span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"color:#C0504D\"><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong>提交订单</strong></span></span></span></p><p><span style=\"text-decoration:underline;\"><span style=\"font-size:18px\"><strong><br/></strong></span></span></p><p><span style=\"font-size:18px\">（1）填写订货人信息<br/>请填写真实的收货人姓名、详细的收货地址、联系电话。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"font-size:18px\">（2）同步信息<br/>如果你为登录状态，可以同步该次的订货信息到用户中心，下次该用户再次订购时，会自动填写该信息。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"font-size:18px\">（3）填写备注信息<br/>请填写您的特殊要求或者提醒信息，我们会尽量根据您的要求给予处理。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><span style=\"font-size:18px\">（4）确认无误后，请点击“提交订单”按钮提交订单，完成订购。<br/>填写完以上信息之后，请仔细核对；确认无误后，请点击“提交订单”按钮提交订单。生成订单号后，表明您已经成功提交了订单。</span></p><p><br/></p>','2014-09-15 11:30:40','2014-09-23 23:27:58'),(5,2,1,'message_board','意见反馈','<p><span style=\"font-size:18px\">有了大家的支持，我们才会做的更好，走的更远，您可以在下面留下你的意见和建议，我们会尽快的改进我们的不足。</span></p><p><span style=\"font-size:18px\"><br/></span></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/></p>','2014-09-15 11:44:22','2014-09-23 23:05:55'),(6,1,0,'notice','燕京啤酒灯塔市总代理推出在线预订服务，让您更快更便捷的喝到美味的燕京啤酒！！！','<p>燕京啤酒灯塔市总代理推出在线预订服务，让您更快更便捷的喝到美味的燕京啤酒！！！</p>','2014-09-15 11:45:14','2014-09-15 17:05:48');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` varchar(100) NOT NULL DEFAULT '',
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
INSERT INTO `cart` VALUES ('194f4352-ba35-476d-a6d5-f1f79eb56f45',1,'2014-09-24 10:18:51','2014-09-24 10:19:05');
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
  `cart_id` varchar(100) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_goods`
--

LOCK TABLES `cart_goods` WRITE;
/*!40000 ALTER TABLE `cart_goods` DISABLE KEYS */;
INSERT INTO `cart_goods` VALUES (16,'a611ee3e-51d2-42ff-a2d6-6092ae12d146',20,1),(17,'a611ee3e-51d2-42ff-a2d6-6092ae12d146',21,1),(25,'194f4352-ba35-476d-a6d5-f1f79eb56f45',24,1),(26,'194f4352-ba35-476d-a6d5-f1f79eb56f45',19,1),(27,'194f4352-ba35-476d-a6d5-f1f79eb56f45',23,1),(28,'194f4352-ba35-476d-a6d5-f1f79eb56f45',21,1),(29,'c655c57c-c650-0001-82b4-913ba9e0ff00',20,1),(30,'c655c57c-c650-0001-82b4-913ba9e0ff00',21,1),(31,'c655c57c-c650-0001-82b4-913ba9e0ff00',22,1),(32,'c655c57c-c650-0001-82b4-913ba9e0ff00',23,1),(34,'c6562f72-c010-0001-1475-edd0ff0e1786',20,1),(35,'c6562f72-c010-0001-1475-edd0ff0e1786',18,26),(36,'c65b3d58-9fe0-0001-649a-13001c3011d6',19,99);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'新品上市',0,'2014-09-15 11:48:41');
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
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '-1-已删除\n0-上架中\n1-已下架',
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (18,'清爽纸箱','65ab3da7-1d14-4870-ac13-1aa4f2373644.jpg',30,2,'',0,'2014-09-15 11:50:43'),(19,'燕京超爽','872b1005-ccaa-4674-bc50-348f6e436c5d.jpg',23,6,'',0,'2014-09-15 11:52:24'),(20,'燕京清爽塑包','5cb1f40d-c322-454a-b27b-e0daafe55a64.jpg',23,0,'',0,'2014-09-15 11:52:48'),(21,'燕京啤酒','e61a5667-d05d-4778-b829-15c08db18ac0.jpg',50,0,'',0,'2014-09-15 11:53:22'),(22,'燕京啤酒1','3c794be4-50db-4afa-946f-72823f668a02.jpg',50,0,'',0,'2014-09-15 11:53:48'),(23,'燕京8度精品','c9d23df5-48db-48f8-b35c-a159fa67e727.jpg',48,0,'',0,'2014-09-15 11:54:15'),(24,'燕京荞麦干啤','4bb2bd98-cedc-4297-9e6c-68dc0854d24d.jpg',45,9,'',0,'2014-09-15 11:54:43'),(25,'燕京精酿','4fea59e0-d17f-4ed8-bb68-3b1996d89df9.jpg',42,0,'',0,'2014-09-15 11:55:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (27,18,5,0),(28,19,5,0),(29,20,5,0),(30,21,5,0),(31,22,5,0),(32,23,5,0),(33,24,5,0),(34,25,5,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (1,1,18,1,30),(2,1,19,5,23),(3,1,24,5,45),(4,2,19,15,23),(5,2,24,9,45),(6,3,19,17,23),(7,3,20,6,23),(8,3,21,1,50),(9,4,18,1,30),(10,4,19,6,23),(11,4,20,15,23),(12,5,19,1,23),(13,5,20,1,23),(14,5,25,1,42),(15,6,18,1,30),(16,6,19,16,23),(17,7,19,1,23),(18,7,24,1,45),(19,8,18,1,30),(20,8,19,1,23),(21,8,24,4,45);
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
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-未处理\n1-处理中\n2-已发货\n3-已收款\n9-已完成\n-1-已舍弃',
  `comments` varchar(1000) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,370,'郝冲冲','18710092318','北京市朝阳区建国路京汇大厦5层',9,'','2014-09-24 10:09:59'),(2,1,750,'茅云龙','18710092308','北京昌平区六环以内回龙观龙跃苑一区2号楼一单元602室',-1,'','2014-09-24 10:19:05'),(3,0,579,'aina','18711111111','手机电话费',-1,'阿的风景啊看','2014-09-24 12:50:13'),(4,0,513,'maomao','18710092302','the god',0,'','2014-09-24 17:47:53'),(5,0,88,'zz','18712345678','zz',0,'','2014-09-24 23:35:57'),(6,0,398,'郝冲冲','18710092308','北京昌平区六环以内回龙观龙跃苑一区2号楼一单元602室',-1,'','2014-10-08 11:30:39'),(7,0,68,'test','18711001100','八大处',0,'','2014-10-09 13:28:30'),(8,0,233,'xiaowang','13419873421','中南海',9,'','2014-10-09 14:48:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysconfig`
--

DROP TABLE IF EXISTS `sysconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysconfig` (
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-营业中\n1-关门了',
  `comments` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysconfig`
--

LOCK TABLES `sysconfig` WRITE;
/*!40000 ALTER TABLE `sysconfig` DISABLE KEYS */;
INSERT INTO `sysconfig` VALUES ('燕京啤酒坊','13238939867','08:00:40','19:00:00',0,'啤酒坊是灯塔市燕京啤酒总代理，负责灯塔市范围内的所有燕京啤酒的发行与销售。\r\n为了让利广大客户，现上线直销平台，减少中间销售环节，让大家以最优惠的价格买到最称心的燕京啤酒。');
/*!40000 ALTER TABLE `sysconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_connect`
--

DROP TABLE IF EXISTS `third_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_connect` (
  `user_id` int(11) NOT NULL,
  `open_id` varchar(100) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `flag` int(11) NOT NULL,
  `createDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_connect`
--

LOCK TABLES `third_connect` WRITE;
/*!40000 ALTER TABLE `third_connect` DISABLE KEYS */;
INSERT INTO `third_connect` VALUES (1,'D5A2CD6AA2023B90554BF7D960E06EB0','毛毛',1,'2014-09-24 10:18:51');
/*!40000 ALTER TABLE `third_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'茅云龙','18710092308','北京昌平区六环以内回龙观龙跃苑一区2号楼一单元602室','2014-09-24 10:18:51');
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

-- Dump completed on 2014-10-29 17:28:59
