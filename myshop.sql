-- MySQL dump 10.13  Distrib 5.6.20, for osx10.8 (x86_64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	5.6.20

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
  `type` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,2,0,'about us','关于我们','<h2 class=\"headline-1\"><span class=\"headline-content\">介绍</span><span class=\"text_edit editable-title\" style=\"margin-left: 10px;\" data-edit-id=\"571767:%E7%BA%A2%E7%83%A7%E8%82%89:1\"><a href=\"http://baike.baidu.com/view/30525.htm?fr=aladdin#\" class=\"nslog:1019\" title=\"编辑本段\">编辑</a></span></h2><h3 class=\"headline-2\"><a name=\"1_1\" class=\"anchor-2\" href=\"http://\"></a><a name=\"sub30525_1_1\" class=\"anchor-2\" href=\"http://\"></a><a name=\"菜品介绍_菜品概况\" class=\"anchor-2\" href=\"http://\"></a><span class=\"headline-content\">菜品概况</span></h3><div class=\"para\">有的人喜欢吃<a target=\"_blank\" href=\"http://baike.baidu.com/view/6625.htm\">瘦肉</a>因为<a target=\"_blank\" href=\"http://baike.baidu.com/view/6625.htm\">瘦肉</a>有嚼劲，有的人喜欢吃<a target=\"_blank\" href=\"http://baike.baidu.com/view/486565.htm\">肥肉</a>因为肥肉香，有的人觉得<a target=\"_blank\" href=\"http://baike.baidu.com/view/6625.htm\">瘦肉</a>偏硬，难以嚼烂<sup>[1]</sup><a class=\"anchor-inline\" name=\"ref_[1]_30525\" href=\"http://\">&nbsp;</a>，有的人觉得<a target=\"_blank\" href=\"http://baike.baidu.com/subview/486565/12267754.htm\">肥肉</a>腻，难以下咽，可惟独红烧肉这道菜，肉是<a target=\"_blank\" href=\"http://baike.baidu.com/view/1022461.htm\">五花</a>三层，经过制作之后，美味不可用言语来形容，肥而不腻，堪称<a target=\"_blank\" href=\"http://baike.baidu.com/view/43760.htm\">中华美食</a>中的一道经典名菜，这道菜便是“<a target=\"_blank\" href=\"http://baike.baidu.com/view/30525.htm\">红烧肉</a>”，下面就让大家来仔细地了解一下。</div><h3 class=\"headline-2\"><a name=\"1_2\" class=\"anchor-2\" href=\"http://\"></a><a name=\"sub30525_1_2\" class=\"anchor-2\" href=\"http://\"></a><a name=\"菜品介绍_菜品特点\" class=\"anchor-2\" href=\"http://\"></a><span class=\"headline-content\">菜品特点</span></h3><div class=\"para\"><div class=\"album-view layoutright log-set-param\" data-layout=\"right\" style=\"width:219px;padding-left: 20px;\"><p class=\"album-div\" style=\"height:161px;width:219px;\"><a data-log=\"10000206\" class=\"album-overlay use-picture-dialog nslog:1212\" data-lemmaid=\"30525\" data-sublemmaid=\"30525\" data-albumid=\"26631\" data-sign=\"f11f3a292df5e0feab1bdaa55c6034a85edf7216\" href=\"http://baike.baidu.com/picture/30525/30525/26631/f11f3a292df5e0feab1bdaa55c6034a85edf7216?fr=lemma&ct=cover\" target=\"_blank\" style=\"height:161px;width:219px;display: block;\"><img src=\"http://c.hiphotos.baidu.com/baike/s%3D220/sign=8240ac1465380cd7e21ea5ef9145ad14/f11f3a292df5e0feab1bdaa55c6034a85edf7216.jpg\" class=\"album-cover \" alt=\"红烧肉\" title=\"红烧肉\" height=\"161\" width=\"219\"/></a><span class=\"imgBorder\" style=\"height:159px;width:217px;\"></span></p><a data-log=\"10000206\" class=\"album-bottom use-picture-dialog\" data-lemmaid=\"30525\" data-sublemmaid=\"30525\" data-albumid=\"26631\" data-sign=\"f11f3a292df5e0feab1bdaa55c6034a85edf7216\" href=\"http://baike.baidu.com/picture/30525/30525/26631/f11f3a292df5e0feab1bdaa55c6034a85edf7216?fr=lemma&ct=cover\" target=\"blank\"><span class=\"title\">红烧肉</span><span class=\"albumCount\">(15张)</span></a></div><a target=\"_blank\" href=\"http://baike.baidu.com/view/287016.htm\">色泽</a>红亮诱人，肥而不腻，入口酥软即化。</div><div class=\"para\">复杂工序：15&quot; 30&quot; 60&quot; 30&quot;</div><h3 class=\"headline-2\"><a name=\"1_3\" class=\"anchor-2\" href=\"http://\"></a><a name=\"sub30525_1_3\" class=\"anchor-2\" href=\"http://\"></a><a name=\"菜品介绍_相关典故\" class=\"anchor-2\" href=\"http://\"></a><span class=\"headline-content\">相关典故</span></h3><div class=\"para\">提起红烧肉（<a target=\"_blank\" href=\"http://baike.baidu.com/view/2100.htm\">东坡肉</a>），大家自然不能忘记那位将吃红烧肉事业推向高峰的人－－<a target=\"_blank\" href=\"http://baike.baidu.com/subview/6881/9179329.htm\">苏东坡</a>。<div class=\"text_pic layoutright\" data-layout=\"right\" style=\"width:220px;padding-left: 20px\"><a data-log=\"9317\" class=\"nslog:1199 use-picture-dialog\" href=\"http://baike.baidu.com/picture/30525/30525/0/d52a2834349b033bff0b785615ce36d3d439bdbf?fr=lemma&ct=single\" target=\"_blank\" style=\"height: 147px;width:220px;display:block;position:relative;\" data-lemmaid=\"30525\" data-sublemmaid=\"30525\" data-albumid=\"0\" data-sign=\"d52a2834349b033bff0b785615ce36d3d439bdbf\"><span class=\"imgBorder\" style=\"height: 145px;width:218px;\"></span><img src=\"http://e.hiphotos.baidu.com/baike/s%3D220/sign=df4abb6d62d9f2d3241123ed99ed8a53/d52a2834349b033bff0b785615ce36d3d439bdbf.jpg\" class=\"editorImg  log-set-param\" alt=\"\" title=\"\" height=\"147\" width=\"220\"/></a></div></div><div class=\"para\">正是由于他的努力，红烧肉才得以从<a target=\"_blank\" href=\"http://baike.baidu.com/view/521401.htm\">基层</a>走向了上层，从老百姓的菜锅走上了文人墨客的<a target=\"_blank\" href=\"http://baike.baidu.com/view/788977.htm\">餐桌</a>。其实，那个<a target=\"_blank\" href=\"http://baike.baidu.com/view/642130.htm\">源远流长</a>、名响大江南北的<a target=\"_blank\" href=\"http://baike.baidu.com/view/2100.htm\">东坡肉</a>说穿了也就是红烧肉。考究红烧肉的历史，确实难以说清楚它产生于何时、何地，不过，由于<a target=\"_blank\" href=\"http://baike.baidu.com/view/1113649.htm\">东坡</a>先生孜孜不倦的努力，从他那时起，红烧肉就正式的走上了历史的舞台。</div><div class=\"para\">“黄州好猪肉，价钱如粪土，富者不肯吃，贫者不解煮。慢着火，少着水，火候足时它自美。每日早来打一碗，饱得自家君莫管。”从这首苏东坡的《食猪肉》诗，不难看出苏老先生不仅是“每日早来打一碗好吃”，而且，还<a target=\"_blank\" href=\"http://baike.baidu.com/view/711657.htm\">深谙</a>红烧肉“慢着火，少着水，火候足时它自美”的烹饪之道！</div><p><br/></p>','2014-09-13 23:04:52','2014-09-13 23:13:34');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createDate` datetime NOT NULL,
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
  `cart_id` varchar(100) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
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
INSERT INTO `category` VALUES (1,'精品小炒1',0,'2014-09-03 17:17:55'),(2,'划算套餐',0,'2014-09-03 17:18:44'),(3,'大主食',0,'2014-09-03 17:18:57'),(4,'双拼盖饭',0,'2014-09-03 17:19:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'糖醋里脊',NULL,16,0,'糖醋里脊是经典汉族名菜之一。在浙江菜、鲁菜、川菜、粤菜和淮菜里都有此菜，以鲁菜的糖醋里脊最负盛名。糖醋里脊以猪里脊肉为主材，配以面粉，淀粉，醋等作料，酸甜可口，让人食欲大开。',0,'2014-09-02 17:09:49'),(2,'宫保鸡丁',NULL,13,0,'宫保鸡丁是汉族传统经典名菜，属于川菜中最具代表性的菜品之一。创始人为贵州织金人时任四川总督丁宝桢，在任四川总督时创制该菜，流传至今。由于一般认为宫保鸡丁正式创制是丁宝桢任四川总督之时，在蜀地创制并流传开，且其后至今的漫长岁月中，宫保鸡丁主要通过市场巨大的川菜馆作为载体走向大江南北及海外，声名远播，因此宫保鸡丁在菜系定位属于川菜系，同时由于丁宝桢为贵州人，所以宫保鸡丁也可被认为是贵州菜系即黔菜系。',0,'2014-09-02 17:10:33'),(3,'拔丝地瓜',NULL,11,0,'拔丝地瓜是一道色香味俱全的汉族传统名菜，属于鲁菜系甜菜。此菜瓜块大小均匀、色泽金黄、牵丝不断、甜香适口、入口酥脆、吃完口齿留香。拔丝是鲁菜的一大特色，几乎所有小孩都愿意吃。拔丝菜是比较考究师傅的火力控制的一道菜，据说，拔丝苹果就是最早的三级厨师考试菜。 拔丝说起来很简单，不过把炸好的原料外面裹上糖稀，其实这个糖就非常的考究了，早了，拔不出丝来，晚了，又糊又苦，味道不好，卖象也不好。要讲究色泽金黄，细丝可以抻出2、3米都不断。',0,'2014-09-02 17:11:59'),(4,'东坡肘子',NULL,39,0,'东坡肘子是川渝地区的经典的汉族名菜之一，属于川菜系。东坡肘子其实并非苏东坡之功，而是其妻子王弗的妙作。“东坡肘子”被冠以苏东坡之名，又为四川名肴，这是因为“东坡肘子”出自苏东坡的故乡现四川省眉山市东坡区。',0,'2014-09-02 17:12:28'),(5,'大盘鸡',NULL,22,0,'新疆大盘鸡是新疆地区名菜，大约起源于80年代末期，主要用料为鸡块和土豆块，配皮带面烹饪而成。新疆大盘鸡色彩鲜艳，有爽滑麻辣的鸡肉和软糯甜润的土豆，辣中有香，粗中带细，而且经济实惠，亲朋聚会食用尚家。',0,'2014-09-02 17:12:54'),(6,'排骨炖萝卜','a2020c74-6352-4065-90f7-21490e9a209a.jpg',19,0,'排骨炖萝卜是一款家常汤品，主要食材是萝卜和排骨，主要烹饪工艺是炖。萝卜含有丰富的蛋白质、碳水化合物、钙、铁和维生素等；排骨能补充蛋白质和钙，既可平衡营养，又能强身健体。',0,'2014-09-02 17:13:28'),(7,'锅包肉','07332b5a-3081-43f5-a46a-4c5cadb22925.jpg',39,0,'锅包肉是一道东北风味菜，即将猪里脊肉切片腌入味，裹上炸浆下锅炸至金黄色捞起，再下锅拌炒勾芡即成。成菜色泽金黄，口味酸甜',0,'2014-09-03 13:56:24'),(8,'test','c2313771-e242-440b-b8f9-c7c7ada5f5e0.jpg',0,0,'test',-1,'2014-09-03 13:56:42'),(9,'test1','14be23e8-92b5-40f7-8a9b-12d697db7218.jpg',0,0,'',-1,'2014-09-08 11:31:02'),(10,'test1','e774d24b-1836-4d71-a36c-5fc84b5cab43.jpg',12,0,'test1',-1,'2014-09-08 12:39:58'),(11,'test1','bb9d59a7-61c1-4706-889c-e781b6b074f9.jpg',10,0,'test1',0,'2014-09-08 13:35:05'),(12,'test2','5d9f2e36-52a8-43b3-a549-f8e0ce01b930.jpg',10,0,'test2',0,'2014-09-08 13:36:20'),(13,'test3','253a674f-e902-44e5-894f-0ae9b9f41b85.jpg',10,0,'test3',0,'2014-09-08 13:36:57'),(14,'test4','eca5a26c-232d-4fe3-a27b-fe57150e7357.jpg',10,0,'test4',0,'2014-09-08 13:38:31'),(15,'test5','8dcca65e-a073-45e4-b860-6c1b3754f5d6.jpg',10,0,'test5',0,'2014-09-08 13:43:15'),(16,'test6','26355d0c-00c4-43a2-a628-6a1550602313.jpg',10,0,'test6',0,'2014-09-08 14:18:06'),(17,'名称','9d533fa7-a63e-4ce4-b3b6-a5049e171017.jpg',0,0,'',0,'2014-09-10 22:08:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (20,15,4,0),(21,15,3,0),(24,16,2,0),(25,17,3,0),(26,17,1,0);
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
  `status` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysconfig`
--

LOCK TABLES `sysconfig` WRITE;
/*!40000 ALTER TABLE `sysconfig` DISABLE KEYS */;
INSERT INTO `sysconfig` VALUES ('吃货餐馆','18710092308','08:00:40','19:00:00',0,'肯德基（Kentucky Fried Chicken，肯塔基州炸鸡），简称KFC，是美国跨国连锁餐厅，同时也是世界第二大速食及最大炸鸡连锁企业，由哈兰德·桑德斯上校于1930年在肯塔基州路易斯维尔创建，主要出售炸鸡、汉堡、薯条、蛋挞、汽水等西式快餐食品。');
/*!40000 ALTER TABLE `sysconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30),
  `mobile` varchar(11),
  `address` varchar(100),
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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `third_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_connect` (
  `userid` int(11) NOT NULL,
  `openid` varchar(100) NOT NULL,
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
/*!40000 ALTER TABLE `third_connect` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-13 23:14:07
