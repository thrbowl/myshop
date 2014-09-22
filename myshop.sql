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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,2,0,'about_us','关于我们','<p><span style=\"color:#ff0000\"><strong>啤酒坊</strong></span>是灯塔市燕京啤酒总代理，负责灯塔市范围内的所有燕京啤酒的发行与销售。为了让利广大客户，现上线直销平台，减少中间销售环节，让大家以最优惠的价格买到最称心的燕京啤酒。</p>','2014-09-13 23:04:52','2014-09-15 17:05:43'),(2,2,0,'contact_us','联系我们','<p>送酒电话：</p><p>1. 13238939867</p><p>2. 15804205820<br/></p>','2014-09-15 11:28:59','2014-09-15 11:28:59'),(3,2,0,'order_guide','购物指南','<div class=\"Help_R32\">\r\n					<p><span style=\"color: #ff0000;\"><span style=\"font-size: medium;\"></span></span><img src=\"http://www.4008880999.com/data/files/article/201112271432292041.jpg\" alt=\"1.jpg\"/></p><p style=\"padding-left: 60px;\">进入壹卡会商城首页，选择莴苣网标题、图片进入莴苣网 ；或者直接进入莴苣网页面（www.mewowo.com）</p><p><img src=\"http://www.4008880999.com/data/files/article/201112271433031233.jpg\" alt=\"2.jpg\" height=\"53\" width=\"237\"/></p><p style=\"padding-left: 60px;\">进入莴苣网后选择您所需要的商品，进入商品详情页面，如要购买，则点击“放入购物车”；如要继续选择商品，则继续选 择商品，把想要购买的商品都放入购物车中；</p><p>&nbsp;</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/article/201112271433487317.jpg\" alt=\"2-1.jpg\"/></p><p style=\"text-align: left;\"><img src=\"http://www.4008880999.com/data/files/article/201112271434318522.jpg\" alt=\"3.jpg\"/></p><p style=\"text-align: left; padding-left: 60px;\">在您选择完您所要购买的商品，想结账时，您可以点击页面顶部的购物车，进入购物车结算；</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/article/201112271434554599.jpg\" alt=\"3-1.jpg\"/></p><p style=\"text-align: left;\"><img src=\"http://www.4008880999.com/data/files/article/201112271435299268.jpg\" alt=\"4.jpg\"/></p><p style=\"text-align: left; padding-left: 60px;\">1、进入购物车后，您可以再次对已经放入购物车中的商品进行删减，以确定最终的商品进行结算；</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/article/201112271435534371.jpg\" alt=\"4-1.jpg\" height=\"259\" width=\"405\"/></p><p style=\"text-align: left; padding-left: 60px;\">2、点击结算后，进入收货人信息填写页面。此页面需要您按照页面的选项提示详细填写收货人的姓名、收货地址、联系方式，以及支付与配送方式、是否需要发票、 是否需要备注等信息；</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/ms/201112271456068168.jpg\" alt=\"6.jpg\"/></p><p style=\"text-align: left; padding-left: 120px;\">A.支付及配送方式的设置：</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/ms/201112271458413673.jpg\" alt=\"7.jpg\" height=\"343\" width=\"402\"/></p><p style=\"text-align: left; padding-left: 120px;\">B.设置完毕后，点击“保存信息”即可。</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/article/201112271438303174.jpg\" alt=\"4-4.jpg\" height=\"172\" width=\"451\"/></p><p style=\"text-align: left; padding-left: 120px;\">&nbsp;</p><p style=\"text-align: left; padding-left: 60px;\">3、所有内容都设置完毕后，点击提交订单，则进入订单信息确认页面，点击“立即支付”后，页面跳转至壹卡账户管理系统的订单支付页面；</p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/article/201112271439092836.jpg\" alt=\"4-5.jpg\" height=\"300\" width=\"457\"/></p><p style=\"text-align: left;\"><img src=\"http://www.4008880999.com/data/files/article/201112271439353581.jpg\" alt=\"5.jpg\"/></p><p style=\"text-align: left; padding-left: 60px;\">在页面跳转至壹卡账户管理系统的订单支付页面时，<span class=\"STYLE5\">请确认您是否已经在壹卡付账户管理系统注册了账号</span>，如果没有，则请点击“<a href=\"https://www.ekapay.cn/pweb/OnlineRegisterNotice.do?LoginType=R&_locale=zh_CN&BankId=9999\" target=\"_blank\">壹卡付注册</a>”；如果您已经注册了，则请按照选项提示填写登录名和登录密码，点击按钮登录，并确认您的订单信息，进行支付扣款。</p><p style=\"text-align: left; padding-left: 90px;\"><strong><span style=\"color: #ff0000;\"><a href=\"http://www.4008880999.com/index.php?app=article&act=view&article_id=67\" target=\"_blank\">【为什么要注册壹卡付账户管理系统账号】</a></span></strong></p><p style=\"text-align: left; padding-left: 90px;\"><strong><span style=\"color: #ff0000;\"><a href=\"http://www.4008880999.com/index.php?app=article&act=view&article_id=271\" target=\"_blank\">【如何注册壹卡付】</a></span></strong></p><p style=\"text-align: center;\"><img src=\"http://www.4008880999.com/data/files/ms/201112271517435829.jpg\" alt=\"5-2.jpg\"/></p>					</div><p><br/></p>','2014-09-15 11:30:40','2014-09-15 11:30:40'),(5,2,1,'message_board','意见反馈','<p>有了大家的支持，我们才会做的更好，走的更远，您可以在下面留下你的意见和建议，我们会尽快的改进我们的不足。</p>','2014-09-15 11:44:22','2014-09-15 11:44:22'),(6,1,0,'notice','燕京啤酒灯塔市总代理推出在线预订服务，让您更快更便捷的喝到美味的燕京啤酒！！！','<p>燕京啤酒灯塔市总代理推出在线预订服务，让您更快更便捷的喝到美味的燕京啤酒！！！</p>','2014-09-15 11:45:14','2014-09-15 17:05:48');
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
INSERT INTO `cart` VALUES ('00f27ca9-98bc-42ef-8cb6-0bf532c70d34',0,'2014-09-20 20:41:03','2014-09-20 20:41:03'),('025ed33c-9e57-467c-83e3-780c01559ed4',0,'2014-09-20 02:59:30','2014-09-20 02:59:30'),('02c4c4ee-247d-42eb-b3f7-8553ce38c32e',0,'2014-09-19 15:11:17','2014-09-19 15:11:17'),('031b0286-e7bf-4474-9cc1-632c5f2a83f4',0,'2014-09-19 15:47:53','2014-09-19 15:47:53'),('0364d139-42f3-4b3b-b054-ed3cfa21db1a',0,'2014-09-19 04:57:15','0000-00-00 00:00:00'),('0382ec9b-2c19-4a86-a0a4-1bf96c7186d9',0,'2014-09-20 09:21:10','2014-09-20 09:21:10'),('03ca2610-cc5e-4870-bb69-73e013e712c1',0,'2014-09-22 13:44:03','2014-09-22 13:44:03'),('041f8738-b981-48c1-90b7-b1ff87222f4d',0,'2014-09-20 02:59:35','2014-09-20 02:59:35'),('056c9ef2-9ed6-48bd-bf4f-8130d1028ae1',0,'2014-09-19 22:15:12','2014-09-19 22:15:12'),('0628adf8-db7e-48bc-b170-f7832c6bbbe4',0,'2014-09-19 06:00:41','0000-00-00 00:00:00'),('076227f6-548a-42a5-b590-17e0eddabe0c',0,'2014-09-18 20:17:18','0000-00-00 00:00:00'),('0b297e84-a6c8-4166-ae70-ece4b9bd3916',0,'2014-09-22 12:11:03','2014-09-22 12:11:03'),('0b97496e-3e3c-482d-ba46-ebfe75af4904',0,'2014-09-22 11:57:24','2014-09-22 11:57:24'),('0c0dbf14-284f-435b-93c4-4ab3d95a3c18',0,'2014-09-19 13:03:44','0000-00-00 00:00:00'),('0cad2088-d947-47f6-b0b7-f1f657f8fa09',0,'2014-09-19 05:19:48','0000-00-00 00:00:00'),('0d09b852-a7bf-461d-b89e-8a1c10b7396f',0,'2014-09-19 15:44:21','2014-09-19 15:44:21'),('0e11f3b0-2688-40f2-bb19-8e289c37b981',0,'2014-09-19 02:06:54','0000-00-00 00:00:00'),('0eda8b80-89fd-4b28-b820-e1cab2985512',0,'2014-09-20 12:48:11','2014-09-20 12:48:11'),('1078591e-c503-473f-b288-7acca53330ab',0,'2014-09-20 08:43:52','2014-09-20 08:43:52'),('10827b05-6a88-4b22-a917-c25d46acfbfd',0,'2014-09-19 15:44:23','2014-09-19 15:44:23'),('1218a387-5025-493b-be3b-9fe894d20ba6',0,'2014-09-18 16:04:41','0000-00-00 00:00:00'),('133e759c-9d26-4725-9f89-b1e6377b12d3',0,'2014-09-20 17:29:20','2014-09-20 17:29:20'),('15ff331e-2909-4b04-98f0-aa2e1ffa27c4',0,'2014-09-20 16:11:14','2014-09-20 16:11:14'),('174b45c4-194d-4069-abde-3ee07786ec59',0,'2014-09-19 04:14:53','0000-00-00 00:00:00'),('17979e9b-7c07-4c3f-b1b0-50c27b7de7c2',0,'2014-09-22 11:06:50','2014-09-22 11:06:50'),('19509cee-b781-4018-a1b2-9a1f6f32007f',0,'2014-09-19 00:43:00','0000-00-00 00:00:00'),('19ffbbdb-7f9e-41fc-bca7-2b4893a414c5',0,'2014-09-19 15:47:55','2014-09-19 15:47:55'),('1b94bdc4-a9ca-46cd-9365-388ab20143fa',0,'2014-09-19 06:32:15','0000-00-00 00:00:00'),('1e83f97e-28e2-43d0-9eb3-4ad6c476b070',0,'2014-09-18 21:39:50','0000-00-00 00:00:00'),('1ed77cf2-ddc9-405a-8446-5ce2a6c7bd7b',0,'2014-09-19 16:09:37','2014-09-19 16:09:37'),('20b27a61-6729-4c58-9751-5bc4e2a3a438',0,'2014-09-19 06:25:14','0000-00-00 00:00:00'),('22c0ea7a-5eb4-44a5-b4fc-b67d71928b37',0,'2014-09-19 20:43:46','2014-09-19 20:43:46'),('27df75a2-d9e3-4d26-8ab6-10aada826669',0,'2014-09-20 01:52:42','2014-09-20 01:52:42'),('291f96cb-535e-4a08-8e47-68a75360f797',0,'2014-09-19 11:41:56','0000-00-00 00:00:00'),('293a77f4-649f-4aa9-b118-a69f5d4dfd54',0,'2014-09-18 17:54:56','0000-00-00 00:00:00'),('2cadca68-2c34-4d08-ace0-32279b0f86aa',0,'2014-09-19 06:25:15','0000-00-00 00:00:00'),('2cec3eab-01eb-4c70-8a0a-f84ee5276fe3',0,'2014-09-19 11:35:09','0000-00-00 00:00:00'),('2d569de9-0d0e-498d-ab3a-acd5a5b63442',0,'2014-09-20 18:00:24','2014-09-20 18:00:24'),('2d61c7fb-b620-42bc-9bc3-ed7238073cff',0,'2014-09-20 16:30:44','2014-09-20 16:30:44'),('2e18d4ed-8a38-4d16-b0fb-8a082f1f5461',0,'2014-09-19 10:32:43','0000-00-00 00:00:00'),('2f3d5d5d-2c0c-4427-b0a3-999254d9e437',0,'2014-09-19 03:53:50','0000-00-00 00:00:00'),('2f9cf6b5-719e-46f9-ba64-a0083f529ced',0,'2014-09-20 01:52:50','2014-09-20 01:52:50'),('2fc50aa3-50ad-46c3-8d2f-ba407ec2c5d4',0,'2014-09-19 06:32:22','0000-00-00 00:00:00'),('2fc9d4ed-6de2-4f7f-a9ed-486fa5fa4d33',0,'2014-09-20 21:32:00','2014-09-20 21:32:00'),('307d9bef-21d5-4fc7-a01e-a6b48b2e7363',0,'2014-09-19 15:15:22','2014-09-19 15:15:22'),('30f73f0b-66a4-488c-af62-2e6cf85e90b1',0,'2014-09-19 06:25:16','0000-00-00 00:00:00'),('314a808a-5ac0-41c3-9d02-dc90053f83ec',0,'2014-09-19 17:40:57','2014-09-19 17:40:57'),('32316ce4-25da-40f7-b4f4-e2dcc6802947',0,'2014-09-19 20:41:01','2014-09-19 20:41:01'),('32beaf81-2d4b-40f7-82f0-6a6baa7f89b5',0,'2014-09-20 08:44:04','2014-09-20 08:44:04'),('336ee5b3-c130-4272-9245-9b069f9b1656',1,'2014-09-18 11:21:26','0000-00-00 00:00:00'),('35994210-f1be-4951-86a7-137dd1cc8a36',0,'2014-09-19 23:59:07','2014-09-19 23:59:07'),('3634797b-5f24-4995-a151-07790e46938f',0,'2014-09-19 23:59:01','2014-09-19 23:59:01'),('365ce711-7514-4cd5-a49c-120634c1861f',0,'2014-09-19 20:43:51','2014-09-19 20:43:51'),('38646f20-327a-4f30-8f8e-7ad825871c54',0,'2014-09-18 20:34:33','0000-00-00 00:00:00'),('38f15c3e-f8bd-4f84-9d57-c590f300e5ff',0,'2014-09-19 08:46:17','0000-00-00 00:00:00'),('38f60eb4-53cd-488a-98fb-be15913bb00a',0,'2014-09-18 22:33:53','0000-00-00 00:00:00'),('39764efb-bf82-4de9-9117-00f45263b0b3',0,'2014-09-18 18:10:22','0000-00-00 00:00:00'),('39ee136a-0a87-46c6-a2e6-197004434005',0,'2014-09-19 23:38:04','2014-09-19 23:38:04'),('3a65466d-396b-4f4f-bbb7-a1a177573248',0,'2014-09-18 23:47:45','0000-00-00 00:00:00'),('3c5ac75c-5538-423b-8df0-8bad69224e8a',0,'2014-09-19 20:43:47','2014-09-19 20:43:47'),('3c62a472-f99a-4fe1-a9d8-557ff51d7f78',0,'2014-09-20 09:17:27','2014-09-20 09:17:27'),('3ccc9fb1-0cca-4254-982a-7f66783b07b2',0,'2014-09-20 11:03:01','2014-09-20 11:03:01'),('40d72180-afe1-4a75-95df-895a26a3f2e7',0,'2014-09-19 20:33:24','2014-09-19 20:33:24'),('4469c5fc-428b-485e-b7aa-9bc645b774a6',0,'2014-09-20 04:06:27','2014-09-20 04:06:27'),('44c0ebc5-f967-4de3-b710-1e8fbbe620a8',0,'2014-09-20 16:11:33','2014-09-20 16:11:33'),('44fa3dc3-7a6d-4ac9-8e13-3623b85f1f94',0,'2014-09-19 20:33:23','2014-09-19 20:33:23'),('45c85d14-ab98-4ad3-9783-3c71f85c34fd',0,'2014-09-20 08:16:21','2014-09-20 08:16:21'),('466f87b8-07b1-41e9-a8ae-2fb648a2a4a0',0,'2014-09-19 05:02:27','0000-00-00 00:00:00'),('46d79d01-7e85-427b-8a1e-2a497182a9bd',0,'2014-09-20 00:37:47','2014-09-20 00:37:47'),('47f9d7ad-9eb3-41ce-9d82-4fda8da3b403',0,'2014-09-19 12:40:59','0000-00-00 00:00:00'),('48985b52-2dc4-409a-8d00-b6b3123cc171',0,'2014-09-18 23:32:49','0000-00-00 00:00:00'),('48d66b22-a90e-4089-8fad-91bdc6b08707',0,'2014-09-20 07:45:50','2014-09-20 07:45:50'),('492f8c84-7ec3-42ca-94d8-766567c0c44a',0,'2014-09-22 13:12:23','2014-09-22 13:12:23'),('4a594428-d789-4317-9283-8a18ba6e4d95',0,'2014-09-19 02:26:33','0000-00-00 00:00:00'),('4bb67269-e00f-4c26-9507-1693345b1d39',0,'2014-09-22 11:40:01','2014-09-22 11:40:01'),('4bbf2c35-5637-473a-b711-c1a5e390b1c3',0,'2014-09-19 08:33:00','0000-00-00 00:00:00'),('4c268f14-8648-4d11-9e6a-76bb41965887',0,'2014-09-19 08:19:14','0000-00-00 00:00:00'),('4c2e5f1e-52d7-4a3c-a451-929efee7b930',0,'2014-09-19 05:19:44','0000-00-00 00:00:00'),('4d7f61eb-26ee-4a3d-a37e-b2f2d2706f17',0,'2014-09-19 10:48:13','0000-00-00 00:00:00'),('51ac8049-bc25-4173-b4b1-0f6735aeb5ec',0,'2014-09-20 14:04:55','2014-09-20 14:04:55'),('51addc2e-2675-4874-8e37-e67cb19095e5',0,'2014-09-19 00:37:36','0000-00-00 00:00:00'),('53b9a4ff-6b0c-41fb-96f9-fe4f35a71376',0,'2014-09-20 22:05:02','2014-09-20 22:05:02'),('5586e1bf-78f3-412c-8a99-0147d56c1eee',0,'2014-09-20 21:32:01','2014-09-20 21:32:01'),('5609c572-55e6-449d-a029-81afe373eeef',0,'2014-09-19 02:39:54','0000-00-00 00:00:00'),('595abe92-5dc3-4e86-ab32-d7e0ee5c710c',0,'2014-09-18 11:29:13','0000-00-00 00:00:00'),('59ae720e-0ed5-4e0d-9bbb-bdec497fbabe',0,'2014-09-20 05:43:57','2014-09-20 05:43:57'),('5a2577d7-23b1-44e7-9f39-f9e587b3c22b',0,'2014-09-19 15:44:23','2014-09-19 15:44:23'),('5a56b678-774a-437c-8ad2-68c3c5c054fd',0,'2014-09-20 01:56:59','2014-09-20 01:56:59'),('5b1034dc-16c3-44ce-8d3d-fd5625210abe',0,'2014-09-19 22:00:45','2014-09-19 22:00:45'),('5b44caba-c241-4656-9a53-cb41318debc7',0,'2014-09-18 14:08:29','0000-00-00 00:00:00'),('5b70a834-16bd-4507-8625-51e675156419',0,'2014-09-19 16:01:55','2014-09-19 16:01:55'),('5b8a31cf-d62f-492d-b335-d801a0e37366',0,'2014-09-19 17:03:45','2014-09-19 17:03:45'),('5bf1ff3e-eaae-4a39-ab32-9bbb524ad075',0,'2014-09-19 02:26:29','0000-00-00 00:00:00'),('5cd45a02-e1a5-413a-8f5d-be1d04f42c6a',0,'2014-09-20 04:03:53','2014-09-20 04:03:53'),('5db14542-15ea-46db-9ab2-a4ddb4cc682e',0,'2014-09-19 04:14:53','0000-00-00 00:00:00'),('5e3b56a9-f5a6-4a60-9984-de276fa35032',0,'2014-09-20 00:37:47','2014-09-20 00:37:47'),('5f9959fc-a31e-4756-9a49-fa29dbc97ce1',0,'2014-09-22 12:39:27','2014-09-22 12:39:27'),('610f2389-d02f-4cc1-bfae-80762df47ee6',0,'2014-09-20 21:11:33','2014-09-20 21:11:33'),('62b13281-cbcd-42ef-bf49-f4f8bb7994eb',0,'2014-09-20 11:03:02','2014-09-20 11:03:02'),('630600c8-6ab8-4867-9b79-c5e60640dd7d',0,'2014-09-19 10:07:00','0000-00-00 00:00:00'),('640101ac-d896-4cba-b69e-a0b186291932',0,'2014-09-19 06:25:58','0000-00-00 00:00:00'),('6465f1f6-04e3-44e5-ad4f-5ee6813bb96d',0,'2014-09-18 14:41:11','0000-00-00 00:00:00'),('6595c6e3-e9e9-4e69-aaab-0ab8d146ce59',0,'2014-09-20 11:48:03','2014-09-20 11:48:03'),('66de5d5e-d7af-49a9-9fe2-bcacae27d18d',0,'2014-09-18 23:33:05','0000-00-00 00:00:00'),('6896de69-914a-4cd2-894c-c7cb2119686b',0,'2014-09-19 05:10:46','0000-00-00 00:00:00'),('6ae5b378-d730-4b6d-997d-1ca77f4a4d07',0,'2014-09-19 08:32:52','0000-00-00 00:00:00'),('6bfdb82c-825a-4fc4-9984-33e0b1d5fc92',0,'2014-09-18 19:21:09','0000-00-00 00:00:00'),('6cc3d1eb-8d8f-43ee-9994-c88336ce263d',0,'2014-09-19 01:21:21','0000-00-00 00:00:00'),('6fed473c-a154-4785-aed6-21ab965a7e10',0,'2014-09-19 20:33:22','2014-09-19 20:33:22'),('7210a48d-0bf5-4d07-9585-7f6854444594',0,'2014-09-19 00:44:32','0000-00-00 00:00:00'),('7222cf86-6d91-4a02-975e-4431b4f52c35',0,'2014-09-18 22:50:37','0000-00-00 00:00:00'),('73227de5-b76e-4e09-a094-7ccf2fc78f57',0,'2014-09-18 18:09:49','0000-00-00 00:00:00'),('75f373cd-cd6c-4629-9720-59a7852c88c4',0,'2014-09-18 18:10:21','0000-00-00 00:00:00'),('75fa05db-c98a-47f2-9759-2c719a66b793',0,'2014-09-20 00:36:42','2014-09-20 00:36:42'),('784b4146-e1da-46c9-abae-d8aa18d65d3e',0,'2014-09-20 21:31:59','2014-09-20 21:31:59'),('78aa07f0-56b6-4847-aa3a-268fdd578f88',0,'2014-09-18 22:34:45','0000-00-00 00:00:00'),('7915d168-c43b-49d5-90bb-b2f51e188a35',0,'2014-09-19 15:47:54','2014-09-19 15:47:54'),('7a60cb2c-f119-4510-ad47-f22b2efd6519',0,'2014-09-20 00:54:11','2014-09-20 00:54:11'),('7a981edc-e96e-4611-bcb1-b2d7bb744e34',0,'2014-09-20 03:08:53','2014-09-20 03:08:53'),('7b7b8031-abbe-4036-a50e-c955e723aab8',0,'2014-09-20 11:02:59','2014-09-20 11:02:59'),('7c744e06-153b-4966-83c4-9e1c45e92456',0,'2014-09-19 15:44:20','2014-09-19 15:44:20'),('7cf3af28-b396-4b86-bb25-1f5349cfa112',0,'2014-09-18 11:28:53','2014-09-22 10:30:25'),('7e396a93-1a1b-43b1-9ace-c7780377f5b3',0,'2014-09-19 03:33:53','0000-00-00 00:00:00'),('7f9edabb-3501-4321-9ec4-c5f1e4e74e22',0,'2014-09-20 09:17:23','2014-09-20 09:17:23'),('8023efd1-ced8-407e-ad62-6fe54c1435aa',0,'2014-09-19 20:43:47','2014-09-19 20:43:47'),('805a507c-864c-42a7-8d07-3b36e140c198',0,'2014-09-20 03:37:46','2014-09-20 03:37:46'),('80e14856-cd86-4848-91d4-77ad49bec672',0,'2014-09-19 06:00:03','0000-00-00 00:00:00'),('81175e5c-150c-40a2-b35f-268642bc6fae',0,'2014-09-20 07:45:35','2014-09-20 07:45:35'),('827a159a-43b9-43d8-aa31-2aedd404aec9',0,'2014-09-20 02:52:15','2014-09-20 02:52:15'),('837e2c98-6c19-4e57-9ac8-2a52bf2efc28',0,'2014-09-20 05:59:08','2014-09-20 05:59:08'),('839427b3-7e43-4ca3-a15c-bd59ce1dc063',0,'2014-09-19 02:26:31','0000-00-00 00:00:00'),('84169744-e7f1-4916-aadb-601ba19869bf',0,'2014-09-20 06:09:01','2014-09-20 06:09:01'),('84b06d02-78fc-46ed-b75b-344234dc2d25',0,'2014-09-18 16:04:42','0000-00-00 00:00:00'),('8567b502-76e6-4d29-a321-6493cd5b00c7',0,'2014-09-20 15:46:59','2014-09-20 15:46:59'),('885110bd-66e3-4fa9-b1c2-3fa5738068ee',0,'2014-09-19 00:37:37','0000-00-00 00:00:00'),('88530fb2-ef1b-48d4-820b-d63eae955cad',0,'2014-09-19 03:36:45','0000-00-00 00:00:00'),('88e6d416-b231-4ae8-8684-d7b0eb876197',0,'2014-09-20 18:48:19','2014-09-20 18:48:19'),('88ebbb71-4bcd-4259-9b73-3d04f445b350',0,'2014-09-18 18:10:19','0000-00-00 00:00:00'),('8a3c8e35-b88b-4642-b27e-08f00a574aa0',0,'2014-09-20 16:11:28','2014-09-20 16:11:28'),('8b4a2caf-47e2-47ff-83d2-8d13856adfa5',0,'2014-09-20 20:41:24','2014-09-20 20:41:24'),('8b688bd6-4094-4139-9b0b-a78860a205f7',0,'2014-09-20 18:45:20','2014-09-20 18:45:20'),('8d0f7b53-b87e-4b28-89f5-4ce922f1941e',0,'2014-09-19 16:38:19','2014-09-19 16:38:19'),('8f1d21e9-32d7-4d60-9d6c-47cd15325805',0,'2014-09-22 12:39:09','2014-09-22 12:39:09'),('90b0fe0f-7473-4973-a5cb-9840a42d28bf',0,'2014-09-18 22:20:34','0000-00-00 00:00:00'),('90f0eaed-8bd6-43b8-905e-00f09e4a111b',0,'2014-09-20 16:11:30','2014-09-20 16:11:30'),('91f88be7-5b4c-470b-a7b0-9d643f29a213',0,'2014-09-19 23:37:49','2014-09-19 23:37:49'),('9228c4d9-d4c5-47dd-9731-75507bca16f6',0,'2014-09-20 18:45:03','2014-09-20 18:45:03'),('92a23bf7-3da2-4d63-be6f-cbb710c56527',0,'2014-09-20 16:08:44','2014-09-20 16:08:44'),('92fbbb6e-7868-44cd-bcc6-edc9e7436d4d',0,'2014-09-18 15:34:24','0000-00-00 00:00:00'),('94a5aa8b-4859-4f7c-b5c9-c8da3828312f',0,'2014-09-20 09:17:39','2014-09-20 09:17:39'),('9517b3c4-f4f0-482b-8f5d-4bbc9ba0fc63',0,'2014-09-18 22:28:47','0000-00-00 00:00:00'),('9676111f-bac4-407b-95c5-7c3affdd39fb',0,'2014-09-19 10:01:34','0000-00-00 00:00:00'),('99280e8e-b63e-45db-9609-5fcbcf98877f',0,'2014-09-19 20:43:48','2014-09-19 20:43:48'),('99acc0ac-34eb-4111-81e1-40665ca60ba0',0,'2014-09-19 11:41:55','0000-00-00 00:00:00'),('9b3c5cfa-a3d7-446c-8d1a-4f567000e2a7',0,'2014-09-20 08:21:46','2014-09-20 08:21:46'),('9bb9f880-e61d-4037-a15a-0a31fe99bf8f',0,'2014-09-19 02:40:10','0000-00-00 00:00:00'),('9beb7eea-99d6-49ee-8698-ebbae6aa54b1',0,'2014-09-18 17:13:45','0000-00-00 00:00:00'),('9c13f26b-8ea2-4ec2-b6aa-c3ae901ab1dc',0,'2014-09-19 15:44:22','2014-09-19 15:44:22'),('9d740404-e18d-4aa5-8e4f-1d121382f6e2',0,'2014-09-19 20:35:38','2014-09-19 20:35:38'),('9f057793-a236-4332-a7d4-f08172f497ba',0,'2014-09-22 11:39:58','2014-09-22 11:39:58'),('9fda6ba1-9113-4aa8-8713-e1beb21f7a0c',0,'2014-09-19 05:06:14','0000-00-00 00:00:00'),('a18dec92-4843-45bc-8023-2551e0d9d98f',0,'2014-09-19 09:45:07','0000-00-00 00:00:00'),('a2481894-8c08-43b1-ad37-096adeafe97b',0,'2014-09-22 11:45:19','2014-09-22 11:45:19'),('a281dba6-6ff9-449e-816b-8b7bb83f36a7',0,'2014-09-18 17:10:11','0000-00-00 00:00:00'),('a5bf7f5d-728f-4781-95ef-521cfdda95f8',0,'2014-09-20 05:44:03','2014-09-20 05:44:03'),('a818737e-bcc4-48bc-8527-73f092924a8e',0,'2014-09-22 11:08:01','2014-09-22 11:08:01'),('ad08039c-8999-40f1-a16a-acc416f6f432',0,'2014-09-19 13:02:20','0000-00-00 00:00:00'),('ad3cfa53-7a50-4543-a0d9-ac7feaf30e0c',0,'2014-09-19 22:38:31','2014-09-19 22:38:31'),('adf9e391-d96c-4868-90c3-7bc5d9b9f175',0,'2014-09-19 10:01:30','0000-00-00 00:00:00'),('ae918dfc-78a9-4a7a-9746-f05a87a82442',0,'2014-09-20 17:12:24','2014-09-20 17:12:24'),('af3c9aec-003b-4a0b-bea0-93a86f54f9c3',0,'2014-09-22 13:42:23','2014-09-22 13:42:23'),('b107b03e-29f6-47a6-848a-c6bfd7828741',0,'2014-09-22 13:46:16','2014-09-22 13:46:16'),('b14c0353-ec23-4a9a-8818-a3bb9ba2e9a0',0,'2014-09-19 22:37:51','2014-09-19 22:37:51'),('b18d24a4-70fd-4f05-9e53-bfec56c5a488',0,'2014-09-19 18:38:08','2014-09-19 18:38:08'),('b1bff7cd-71d2-4747-8b54-866b5d8603fe',0,'2014-09-19 17:34:03','2014-09-19 17:34:03'),('b1e409f1-63c9-47d2-93a9-bdb478a56e44',0,'2014-09-18 21:07:41','0000-00-00 00:00:00'),('b2ae181a-f803-4f28-a79d-b72e27120191',0,'2014-09-19 17:24:44','2014-09-19 17:24:44'),('b4b34fd6-2dde-4f1d-8f12-f8d81e3eea47',0,'2014-09-20 13:56:51','2014-09-20 13:56:51'),('b4b51a12-e25b-477e-bc81-a013d712026c',0,'2014-09-20 12:01:08','2014-09-20 12:01:08'),('b4cbec2c-f931-4d08-b66d-3b8488d73aa6',0,'2014-09-19 18:37:51','2014-09-19 18:37:51'),('b5a5a280-983b-4239-99d7-f251a6d6b801',0,'2014-09-19 22:04:22','2014-09-19 22:04:22'),('b5d2904b-a252-46e9-9c3d-1b416f90e5ac',0,'2014-09-19 20:14:31','2014-09-19 20:14:31'),('b652cee0-8794-4d79-a1f2-e164dd9935d0',0,'2014-09-19 23:59:06','2014-09-19 23:59:06'),('b6de2a11-7d9f-4518-b733-073d44d6b270',0,'2014-09-19 23:59:03','2014-09-19 23:59:03'),('b7cc8524-7630-4aec-a0f1-dbe4e1888fab',0,'2014-09-20 14:04:43','2014-09-20 14:04:43'),('b7e4afbf-8943-4a45-a02b-a004485ef3ac',0,'2014-09-20 15:15:37','2014-09-20 15:15:37'),('b9546581-0fef-43de-ac55-38757c1f4183',0,'2014-09-18 18:10:24','0000-00-00 00:00:00'),('b971e2f2-c30c-43bf-9156-d9411d7ff190',0,'2014-09-19 07:58:59','0000-00-00 00:00:00'),('bcac1ae4-7fca-4732-903e-72f0b7ec5118',0,'2014-09-20 04:07:00','2014-09-20 04:07:00'),('bd35efe4-2b27-4a39-a45a-385a195b4936',0,'2014-09-20 02:59:28','2014-09-20 02:59:28'),('bd8e7a86-f5b7-44c6-a2c9-fe1f2fb2a532',2,'2014-09-18 21:39:08','0000-00-00 00:00:00'),('bda694af-f4ff-4daf-9cf8-bc9a22334f0c',0,'2014-09-20 09:13:09','2014-09-20 09:13:09'),('bfb13cb6-3dbd-4c8a-a5f5-82036a0aa1ba',0,'2014-09-20 08:27:07','2014-09-20 08:27:07'),('c1b08ffb-ac88-45f9-af26-db9752ec2544',0,'2014-09-19 22:37:45','2014-09-19 22:37:45'),('c221d225-7503-4d8e-bc4d-13268673a5dd',0,'2014-09-18 21:37:49','2014-09-20 06:44:16'),('c39831bc-531f-477e-bbd5-b2b1b91e06cf',0,'2014-09-20 08:55:06','2014-09-20 08:55:06'),('c3bad258-92ea-4e42-8e46-72988f330a39',0,'2014-09-19 20:35:44','2014-09-19 20:35:44'),('c45f8a3e-3c38-4ca2-91b1-fc1d5bd7d30a',0,'2014-09-19 07:14:24','0000-00-00 00:00:00'),('c57fc24e-4825-4b9d-a0d3-25cd231697b7',0,'2014-09-20 05:58:08','2014-09-20 05:58:08'),('c622cc37-bc0f-41c3-a5f4-4a7450e69b72',0,'2014-09-18 14:41:03','0000-00-00 00:00:00'),('c6b73116-df5a-44a2-8ab6-3691a3c57a57',0,'2014-09-22 13:42:10','2014-09-22 13:42:10'),('c98abcc8-1d71-4b46-8b90-99bc4d11d676',0,'2014-09-19 07:31:59','0000-00-00 00:00:00'),('ca8d0e0f-bac2-4ba8-a359-6590cf33aed8',0,'2014-09-19 23:59:03','2014-09-19 23:59:03'),('cbe16115-34b6-4e81-9365-64785415cfbd',0,'2014-09-18 13:34:05','0000-00-00 00:00:00'),('cc781b06-6391-4225-a61b-f58a20eef109',0,'2014-09-19 15:44:21','2014-09-19 15:44:21'),('cd4481ee-83b8-46c1-a4c4-2503535b6e68',0,'2014-09-18 12:28:48','0000-00-00 00:00:00'),('cf5326c6-e4bb-4363-8806-917d9981e2a4',0,'2014-09-20 12:01:11','2014-09-20 12:01:11'),('d089ad39-9982-411f-a6c9-8028969e1e4e',0,'2014-09-19 03:36:45','0000-00-00 00:00:00'),('d178ca93-f6b6-4220-86ab-ac69da145213',0,'2014-09-18 17:27:46','0000-00-00 00:00:00'),('d241f166-1923-4bbb-99cf-3d276c32d517',0,'2014-09-19 15:27:44','2014-09-19 15:27:44'),('d4d2b03b-848b-4256-a8af-0d0e51ee4cfc',0,'2014-09-19 18:41:50','2014-09-19 18:41:50'),('d5bac215-b383-4b97-b07b-b4e1105312b3',0,'2014-09-20 17:20:40','2014-09-20 17:20:40'),('d6164f89-e79b-4788-b9f4-482f95eb3dfb',0,'2014-09-19 11:48:35','0000-00-00 00:00:00'),('d9d61a15-2374-4020-8830-c3dbe254a524',0,'2014-09-19 11:42:40','0000-00-00 00:00:00'),('daf34dbf-46f0-4734-b97a-343cda85e9f5',0,'2014-09-18 16:04:40','0000-00-00 00:00:00'),('db404d8d-0fe6-4029-a55b-848f8edca27d',0,'2014-09-19 15:38:23','2014-09-19 15:38:23'),('db5442ed-6523-4b65-a4d9-624131bc6927',0,'2014-09-20 00:37:47','2014-09-20 00:37:47'),('dbc3cfbe-1af2-40e7-be71-e84d72135441',0,'2014-09-18 11:30:06','0000-00-00 00:00:00'),('dbed0e9a-755b-48a5-b8bc-3105a87d34eb',0,'2014-09-19 16:38:29','2014-09-19 16:38:29'),('dd9465ae-5b6b-4a6f-950b-9d5bc797c0fc',0,'2014-09-22 13:42:16','2014-09-22 13:42:16'),('ddb9d365-2b4b-4e6b-b9e2-3743aa8d5149',0,'2014-09-19 00:37:37','0000-00-00 00:00:00'),('de5829ca-a163-4469-8ca6-4587eacdbf08',0,'2014-09-20 05:57:59','2014-09-20 05:57:59'),('de83d240-a9f8-4b8b-8331-dedd474bde83',0,'2014-09-20 18:00:26','2014-09-20 18:00:26'),('df7ece72-6740-42e7-ac71-a749bb2bc3b3',0,'2014-09-19 05:19:43','0000-00-00 00:00:00'),('e0d757bd-3738-45b4-8994-950038eb2c84',0,'2014-09-19 03:59:33','0000-00-00 00:00:00'),('e26fbf44-72a1-41d6-87ad-57c793b9355b',0,'2014-09-22 13:00:02','2014-09-22 13:00:02'),('e5aeb621-2e46-42ef-8890-0ba4126a8928',0,'2014-09-18 13:33:41','0000-00-00 00:00:00'),('e5f128c7-8278-413b-9e90-527be0edbca4',0,'2014-09-18 19:32:02','0000-00-00 00:00:00'),('e7e35413-dd8c-4ebf-8241-ed5836973038',0,'2014-09-20 18:00:25','2014-09-20 18:00:25'),('e8896fc3-7454-4aa1-8ddb-8b9a86b40239',0,'2014-09-19 11:35:40','0000-00-00 00:00:00'),('e90f2dba-f746-4ac4-9637-19cc81dbd272',0,'2014-09-18 20:34:13','0000-00-00 00:00:00'),('e91fa8bd-c72e-4855-97e5-4450f1cc7116',0,'2014-09-19 15:38:38','2014-09-19 15:38:38'),('e96ed884-4866-4208-a996-56bc78e53a6b',0,'2014-09-18 15:35:55','0000-00-00 00:00:00'),('e9ce84b5-68a7-41e7-ac5f-42c1287d7bbd',0,'2014-09-19 07:31:49','0000-00-00 00:00:00'),('eb3d4faf-22ae-420c-9c35-34d655773783',0,'2014-09-18 21:32:53','0000-00-00 00:00:00'),('ebee87cd-8e06-4a92-b40b-be16905b5487',0,'2014-09-20 13:40:01','2014-09-20 13:40:01'),('edcf05a9-1740-4084-9f0b-54a95cc0366b',0,'2014-09-20 00:54:30','2014-09-20 00:54:30'),('ee8c602b-635b-4163-b42c-33e4206cbbef',0,'2014-09-19 04:14:52','0000-00-00 00:00:00'),('eec5dc0c-3164-4fcf-aad0-72356b5b9783',0,'2014-09-20 12:47:57','2014-09-20 12:47:57'),('f1967a96-608e-4683-9985-d32f9f78de03',0,'2014-09-20 03:09:57','2014-09-20 03:09:57'),('f1a6e9e2-7b75-4f67-841e-eaf15a79bb27',0,'2014-09-18 11:28:22','0000-00-00 00:00:00'),('f1c44e56-9ed9-4d0d-883e-68344191bc61',0,'2014-09-18 15:47:46','0000-00-00 00:00:00'),('f21f2e44-f20d-485b-a215-b6a9c8ef1833',0,'2014-09-19 11:41:57','0000-00-00 00:00:00'),('f27ff1b0-ec32-450b-8e56-2681c63dac9b',0,'2014-09-19 10:07:32','0000-00-00 00:00:00'),('f2ead622-d2ae-4704-8945-733ac0657864',0,'2014-09-19 07:59:32','0000-00-00 00:00:00'),('f356bdea-4a19-45cd-aefc-881ae13f1f22',0,'2014-09-19 23:59:05','2014-09-19 23:59:05'),('f57c178c-ae4d-4aed-881b-fb95eaea7d9f',0,'2014-09-20 16:11:20','2014-09-20 16:11:20'),('f586fbc4-3587-41ce-ad57-58a64228011d',0,'2014-09-18 17:55:22','0000-00-00 00:00:00'),('f78d6314-d7c7-4584-b3fa-2a8ca9ff83f0',0,'2014-09-20 22:04:37','2014-09-20 22:04:37'),('f810c8eb-7e1a-4115-8897-9e6321a482ad',0,'2014-09-19 10:34:51','0000-00-00 00:00:00'),('f94f493e-98ee-4f58-9ab6-22924c0baf79',0,'2014-09-18 12:28:57','0000-00-00 00:00:00'),('f9f82392-ff04-48b3-a597-04d50eedcb56',0,'2014-09-20 17:09:31','2014-09-20 17:09:31'),('fc933ac1-b7a0-444d-8364-f12a9c22b8c9',0,'2014-09-19 20:43:47','2014-09-19 20:43:47'),('fe4b2016-b26c-464a-987d-170c72f1db4c',0,'2014-09-20 22:38:55','2014-09-20 22:38:55'),('fe597fd6-cc78-43be-b195-d53f9bce99a0',0,'2014-09-19 18:10:25','2014-09-19 18:10:25'),('feaa6b93-33dc-4a2e-8f82-c9dac5885748',0,'2014-09-19 02:07:26','0000-00-00 00:00:00'),('fecb9de5-ded7-49c0-bc05-15eb070c058a',0,'2014-09-20 13:16:14','2014-09-20 13:16:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_goods`
--

LOCK TABLES `cart_goods` WRITE;
/*!40000 ALTER TABLE `cart_goods` DISABLE KEYS */;
INSERT INTO `cart_goods` VALUES (28,'c221d225-7503-4d8e-bc4d-13268673a5dd',21,1);
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
  `status` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `goods` VALUES (18,'清爽纸箱','65ab3da7-1d14-4870-ac13-1aa4f2373644.jpg',30,0,'',0,'2014-09-15 11:50:43'),(19,'燕京超爽','872b1005-ccaa-4674-bc50-348f6e436c5d.jpg',23,0,'',0,'2014-09-15 11:52:24'),(20,'燕京清爽塑包','5cb1f40d-c322-454a-b27b-e0daafe55a64.jpg',23,0,'',0,'2014-09-15 11:52:48'),(21,'燕京啤酒','e61a5667-d05d-4778-b829-15c08db18ac0.jpg',50,0,'',0,'2014-09-15 11:53:22'),(22,'燕京啤酒1','3c794be4-50db-4afa-946f-72823f668a02.jpg',50,0,'',0,'2014-09-15 11:53:48'),(23,'燕京8度精品','c9d23df5-48db-48f8-b35c-a159fa67e727.jpg',48,0,'',0,'2014-09-15 11:54:15'),(24,'燕京荞麦干啤','4bb2bd98-cedc-4297-9e6c-68dc0854d24d.jpg',45,0,'',0,'2014-09-15 11:54:43'),(25,'燕京精酿','4fea59e0-d17f-4ed8-bb68-3b1996d89df9.jpg',42,0,'',0,'2014-09-15 11:55:06');
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
INSERT INTO `third_connect` VALUES (1,'D5A2CD6AA2023B90554BF7D960E06EB0','毛毛',1,'2014-09-18 11:21:26'),(2,'6622CFFA55DB9B502BD2B16F092D4572','郝冲冲',1,'2014-09-18 21:39:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,NULL,'2014-09-18 11:21:26'),(2,NULL,NULL,NULL,'2014-09-18 21:39:08');
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

-- Dump completed on 2014-09-22 13:46:18
