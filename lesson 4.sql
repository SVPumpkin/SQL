-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_22
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'voluptas',16),(2,'sunt',20),(3,'quasi',13),(4,'eos',2),(5,'inventore',20),(6,'doloremque',11),(7,'labore',12),(8,'quaerat',17),(9,'qui',12),(10,'quia',20),(11,'et',12),(12,'iusto',20),(13,'voluptates',13),(14,'omnis',7),(15,'ipsum',8),(16,'deleniti',6),(17,'facilis',4),(18,'doloremque',3),(19,'incidunt',6),(20,'exercitationem',11);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended','black_list') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,5,'requested','1971-11-18 11:44:19','1989-07-11 23:36:19'),(3,13,'unfriended','2002-02-02 05:30:51','2018-07-19 03:05:12'),(4,2,'unfriended','2014-11-24 19:17:51','2003-11-25 11:11:54'),(4,12,'declined','1987-01-24 13:03:58','1993-11-24 02:36:00'),(5,11,'black_list','2014-02-24 15:01:39','2005-09-11 20:26:03'),(7,2,'unfriended','1979-04-18 04:09:43','1981-06-27 10:26:39'),(7,7,'requested','1977-08-30 10:35:50','2003-11-30 17:48:08'),(9,3,'approved','2000-09-13 01:46:45','2006-10-04 01:16:05'),(9,4,'declined','2017-12-23 23:51:28','1972-09-25 11:13:50'),(9,14,'black_list','1980-03-25 17:23:05','2001-02-07 10:56:49'),(10,10,'black_list','2002-03-27 10:54:31','1977-05-13 20:46:53'),(11,1,'unfriended','1996-10-02 07:34:50','2017-07-03 12:09:20'),(12,18,'declined','2007-12-20 14:49:51','1988-07-19 02:32:55'),(13,19,'black_list','2014-10-03 06:28:00','2014-11-21 11:55:49'),(14,10,'declined','2003-12-10 19:54:00','2016-09-05 01:32:12'),(15,4,'declined','1974-11-11 05:53:10','1981-02-10 20:32:01'),(19,8,'approved','1979-03-16 05:39:07','1982-03-16 03:56:51'),(19,19,'approved','2016-02-11 22:15:30','2007-09-14 04:28:57'),(20,10,'requested','1987-02-11 11:38:45','1991-08-09 04:44:33'),(20,15,'approved','2019-12-21 20:47:22','1991-01-02 06:49:37');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) unsigned NOT NULL,
  `game_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,4,'voluptas'),(2,1,'qui'),(3,8,'accusantium'),(4,17,'ex'),(5,8,'rerum'),(6,17,'voluptatibus'),(7,14,'magnam'),(8,3,'ut'),(9,18,'sed'),(10,9,'nisi'),(11,3,'iste'),(12,1,'maxime'),(13,18,'nulla'),(14,5,'qui'),(15,12,'id'),(16,8,'voluptate'),(17,8,'voluptatem'),(18,19,'quia'),(19,1,'est'),(20,9,'doloremque');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,7,6,11,'2021-10-06 08:29:12'),(2,18,2,18,'1978-10-12 10:54:35'),(3,15,8,9,'2000-08-05 04:25:50'),(4,18,19,11,'2004-05-23 16:27:36'),(5,16,7,8,'2013-03-14 13:35:19'),(6,7,7,19,'2020-04-29 00:00:18'),(7,15,7,3,'1984-03-14 15:33:14'),(8,6,16,15,'1999-08-25 20:00:54'),(9,7,1,2,'1992-10-31 20:16:30'),(10,13,11,16,'1998-03-09 23:11:54'),(11,5,15,6,'1991-10-23 20:39:55'),(12,7,9,14,'2001-01-12 10:28:20'),(13,12,8,10,'1982-01-26 20:01:18'),(14,14,9,6,'1983-05-23 21:20:43'),(15,20,14,17,'1981-09-04 13:38:20'),(16,4,10,8,'1987-02-13 15:35:01'),(17,19,2,10,'2004-11-13 12:57:52'),(18,9,16,17,'2009-01-01 11:29:06'),(19,13,8,8,'1979-09-13 17:53:50'),(20,7,19,15,'2012-12-12 12:18:52');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,12,13,'Sint in ipsum error aut sint exercitationem delectus. Voluptatem aperiam recusandae enim pariatur velit eum. Illo iusto veniam vel cumque est sed similique. Exercitationem aut ratione impedit at minima incidunt laborum.','voluptas',5,NULL,'1982-09-27 22:56:07','2001-01-20 19:59:39'),(2,4,8,'Et in cum pariatur quod tempore dolorem nam. Veniam aspernatur ipsam quas omnis ipsam.','mollitia',9,NULL,'2002-12-03 09:25:51','2014-10-08 13:40:30'),(3,2,20,'Nesciunt delectus incidunt vel impedit. Quo voluptatem enim harum et iure architecto dolor blanditiis. Fuga consequuntur qui explicabo sed explicabo. Esse tempore numquam amet quisquam.','ea',2,NULL,'1985-12-14 23:50:39','1980-07-28 06:34:58'),(4,4,7,'Repudiandae tempora ut et quia consequatur blanditiis. Aut commodi neque aspernatur itaque. Recusandae veniam doloremque nisi illum quos enim ea. Et nulla in id inventore tenetur.','voluptatem',5969739,NULL,'2020-01-25 09:50:08','2019-02-20 21:41:53'),(5,8,17,'Voluptas earum est non dolore et. Laboriosam minus ipsum est reiciendis id quis repellat. Aut nihil ea et in accusamus consequatur. Esse nihil optio voluptate sit assumenda.','delectus',60,NULL,'1976-03-12 07:02:03','2006-12-21 09:47:10'),(6,16,20,'Adipisci autem maxime id quis quam praesentium iste. Dolore atque pariatur accusamus vel ea itaque quos tenetur. Qui tenetur et vitae consectetur. Consequatur quo corrupti aperiam ratione ducimus.','illum',211,NULL,'2016-04-06 13:23:27','1991-09-21 00:24:41'),(7,5,13,'Sint et facilis nihil repellat et. Et natus sed ipsa quia nisi ipsam. Aperiam maxime nisi modi aliquam qui.','corporis',2914583,NULL,'1984-01-05 05:03:50','1998-08-06 16:57:16'),(8,12,8,'Consequatur modi voluptatibus repellat et ut. Voluptatibus vitae autem dolor repellendus deleniti. Facere doloribus dolor tempora qui. Quisquam et sunt maiores incidunt ea excepturi.','sit',163,NULL,'1984-01-04 18:31:04','2012-02-16 19:52:02'),(9,14,4,'Nihil incidunt est repellat quis recusandae. Molestiae vero velit blanditiis omnis tempore adipisci. Rerum doloribus sit voluptatibus fuga.','temporibus',558236371,NULL,'1981-01-14 15:35:18','1977-07-25 10:28:15'),(10,4,20,'Tempore ut consequuntur sint id voluptatem voluptates. Eos modi nihil alias in repellendus minima illo accusamus. Ullam quae doloremque illo vel dicta. Nulla nobis neque sint ea odit sed beatae explicabo.','dolorem',369,NULL,'1999-10-26 14:20:08','1976-09-19 13:44:48'),(11,1,20,'Voluptatem nihil voluptatibus eum reiciendis dolorem. Consectetur corrupti odit vel rerum unde et explicabo. Sequi voluptatem dolorem aut omnis nostrum.','illo',0,NULL,'1982-01-22 23:21:25','1985-04-23 09:09:34'),(12,16,15,'In sunt iusto cupiditate et quia ut maiores odio. Exercitationem unde maiores odit temporibus.','ut',0,NULL,'1999-08-15 16:23:20','1973-12-02 10:23:21'),(13,8,18,'Ut sint ex tempora non. Sapiente hic veniam laboriosam expedita temporibus illo. Illum aliquid officia facere consequuntur dolorem tenetur explicabo. Sit qui commodi non sunt ut maxime nobis.','commodi',99020506,NULL,'1971-10-21 03:06:14','2001-08-30 17:19:57'),(14,10,20,'Ad veniam qui libero ex voluptatem omnis aut pariatur. Eum sed qui aliquid ipsum ea sunt est est. Non nihil ea facere quia. Magni quae pariatur quaerat deleniti et facere.','et',0,NULL,'1992-02-12 02:05:58','1996-11-04 11:14:46'),(15,14,5,'Voluptatibus et quos possimus accusantium a possimus assumenda. Quis facilis eos eos dignissimos. Doloremque aut est eligendi reiciendis aut. Neque consequatur eos voluptate nostrum.','sed',114159357,NULL,'2019-06-16 03:36:33','2017-09-25 00:01:44'),(16,1,11,'Distinctio sunt molestias est omnis et facere magni ut. Occaecati officia vitae ex est sunt ut. Quos velit dolores praesentium blanditiis magni dolorum similique. Voluptatem dolore necessitatibus in aperiam. Sit qui omnis totam est vero provident.','iste',0,NULL,'1995-03-04 00:50:56','2013-07-17 16:26:45'),(17,17,3,'Harum magnam accusantium sit quod perferendis dolorem dolorem. Est omnis placeat quia at provident. Sapiente nesciunt atque iusto.','quas',50012,NULL,'1979-03-30 17:23:32','2019-10-22 12:55:16'),(18,17,7,'Aut sit ut id. Ut aut voluptatum qui eum. Eius aut odit reprehenderit fugiat corrupti dolor.','aut',234430,NULL,'1982-02-28 20:11:37','1978-10-16 22:20:18'),(19,3,1,'Sed id vero accusamus dolor eveniet. Eligendi nostrum aspernatur et aliquam. Vero facere qui eaque voluptas facilis officiis. Et ut maiores provident vel rerum qui.','porro',760995,NULL,'2011-04-16 15:35:26','2012-02-27 17:07:15'),(20,2,10,'Quis qui perspiciatis nemo rem aliquam. Amet magni voluptas rerum pariatur quis.','inventore',697,NULL,'1996-09-12 14:48:39','2022-11-11 04:02:02');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'doloribus','2013-09-01 03:30:29','2008-07-19 07:43:16'),(2,'facere','1998-06-19 19:20:45','1998-12-29 13:16:01'),(3,'aut','1978-01-01 14:27:39','2000-03-17 10:13:33'),(4,'veniam','1996-07-11 00:44:21','2004-02-13 15:28:32'),(5,'incidunt','2000-09-18 20:09:02','2006-02-16 16:59:58'),(6,'adipisci','2020-06-18 14:26:12','2006-06-28 05:44:26'),(7,'consectetur','2005-06-12 05:19:22','1995-11-14 10:15:58'),(8,'possimus','1995-09-13 08:03:47','1992-11-26 05:40:02'),(9,'est','2014-12-01 07:13:19','2022-07-21 13:33:49'),(10,'consequatur','1995-03-11 08:13:19','2011-01-13 22:57:05'),(11,'vel','1970-07-31 00:06:06','1974-01-13 04:45:16'),(12,'aut','2015-12-13 17:21:39','1971-02-27 22:19:28'),(13,'et','2021-01-14 10:39:11','1986-10-02 19:06:15'),(14,'aut','1978-01-14 02:39:37','1988-09-22 21:34:16'),(15,'molestiae','2021-08-14 22:27:24','2015-09-29 19:07:45'),(16,'ipsam','2018-07-05 04:14:59','2021-07-14 11:18:58'),(17,'ipsa','2010-09-20 18:22:05','1981-05-03 16:01:29'),(18,'facilis','1975-08-21 20:21:38','1991-01-30 23:40:55'),(19,'incidunt','1998-08-05 00:20:19','1974-10-03 15:40:38'),(20,'iusto','2021-01-24 13:25:26','1975-02-01 07:51:45');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,7,5,'Est enim rem quia eum quisquam sint exercitationem. Architecto consequuntur debitis excepturi illo ea. Exercitationem quos expedita provident non nesciunt voluptas. Officiis aut hic fugit ipsa quam excepturi expedita.','2000-03-18 21:34:15'),(2,8,7,'Sapiente consequatur est saepe consequatur. Quia consectetur libero voluptatem aspernatur asperiores iste reiciendis. Laboriosam ducimus modi est animi exercitationem consequuntur totam. Omnis amet totam officia nihil perspiciatis.','1991-01-23 10:20:12'),(3,10,10,'Aperiam exercitationem aut id maxime illo sit eos. Maiores est laborum omnis veritatis inventore non quasi. Beatae sit doloremque dolorem. Voluptatibus magni rerum odit.','1999-12-16 21:36:10'),(4,20,2,'Esse ut sed inventore qui repudiandae soluta. Culpa ab dolores facere deserunt aut et. Velit et autem consequatur.','2001-05-29 20:47:53'),(5,18,19,'Iusto ratione similique debitis. Est ad et aperiam cumque. Nihil iure quaerat molestias quae iste ad. Tempora dolor et fugit molestiae.','1989-11-20 09:13:23'),(6,20,9,'Ut enim consequatur consequatur repellendus. Eligendi et deleniti nihil quia corrupti ipsum id. Inventore cum a vitae corrupti architecto repellat. Perspiciatis quod impedit deleniti labore explicabo non.','1977-10-23 07:43:55'),(7,17,14,'Recusandae non id quod laborum soluta voluptas. Nulla veniam et qui ducimus doloribus. Doloribus in odit tenetur voluptas dignissimos quasi corrupti.','2012-06-22 08:29:07'),(8,11,7,'Aut eius expedita minima aliquid voluptatem possimus ullam. Voluptate qui hic voluptatem alias. Tempora non velit voluptas optio saepe eveniet totam.','1983-08-28 20:32:46'),(9,8,5,'Reprehenderit qui quia laborum dolor qui soluta. Suscipit accusantium sint eaque. Maxime et vel omnis odit accusamus laborum.','1979-11-25 04:38:21'),(10,2,20,'Perspiciatis totam et et. Enim exercitationem excepturi accusamus. Voluptas dolore illum quo vel ipsam consequatur odit.','2005-02-17 01:53:08'),(11,1,1,'Praesentium quia qui aspernatur doloremque. Ducimus ipsam vero velit hic voluptas molestiae. Vel doloribus possimus veniam.','1974-10-14 09:47:54'),(12,6,9,'Magnam ratione voluptas aliquid illo. Rerum optio quo fugit voluptatem modi magni quasi. Sunt quas repellat est id.','1994-09-01 15:24:08'),(13,18,19,'Similique praesentium accusantium reprehenderit vel. Quia ut odio nemo quia facilis voluptatum. Vitae odit accusamus vel molestiae minima. Saepe hic expedita impedit dolorem ab exercitationem facilis similique. Autem unde a est amet.','1976-01-07 06:44:29'),(14,4,11,'Laborum fugiat explicabo at quibusdam et minima eos voluptatibus. Eaque dolores non dolorum qui quas adipisci inventore magnam. Dolores repudiandae cumque ut aut dolores ducimus. Maiores voluptates et rerum nisi quis at mollitia.','1989-04-14 12:26:09'),(15,3,3,'Labore et et ad non qui asperiores. Beatae reiciendis voluptatibus corporis sunt soluta dolorem fuga.','1978-12-18 14:33:29'),(16,12,19,'Velit veritatis minima ea qui aspernatur natus accusantium. Dicta magnam enim alias quas natus nulla ullam. Sit et magnam consequatur et accusamus.','1979-10-16 12:27:46'),(17,2,11,'Amet occaecati itaque accusamus id laborum aperiam non. Et unde suscipit et. Voluptas voluptatum esse qui dolor reprehenderit.','1983-02-14 22:48:20'),(18,2,13,'Aut soluta tempora et inventore. In aut quam quia eveniet soluta quia labore ut. Iusto et aspernatur labore voluptates natus nam modi.','2017-02-11 08:51:21'),(19,13,5,'Assumenda culpa iure voluptate odio. Accusamus magni atque sed dicta aperiam qui. Dolorum reprehenderit dolor eum iusto nam consectetur vitae magnam. Amet esse suscipit dolore eveniet dolorum consequatur.','2005-05-10 23:15:44'),(20,19,16,'Nam non optio assumenda. Quia voluptatum ea consequatur consequatur inventore laudantium esse non. Veniam voluptatem laudantium et eum nesciunt nihil amet. Qui dolorem et et dolor illum dolores. Nesciunt autem deleniti harum unde.','2001-03-12 19:08:35');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'ullam',1),(2,'quas',2),(3,'qui',3),(4,'qui',4),(5,'occaecati',5),(6,'aspernatur',6),(7,'consequatur',7),(8,'totam',8),(9,'repellat',9),(10,'exercitationem',10),(11,'dicta',11),(12,'quo',12),(13,'velit',13),(14,'inventore',14),(15,'dicta',15),(16,'eum',16),(17,'pariatur',17),(18,'nulla',18),(19,'sed',19),(20,'modi',20);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,10,1),(2,5,2),(3,10,3),(4,5,4),(5,18,5),(6,16,6),(7,1,7),(8,10,8),(9,3,9),(10,7,10),(11,16,11),(12,8,12),(13,13,13),(14,1,14),(15,16,15),(16,11,16),(17,19,17),(18,6,18),(19,5,19),(20,11,20);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varbinary(8000) DEFAULT NULL,
  `postname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,10,3,'Dolor repellat fuga qui natus quod et quasi. Qui illum quo nostrum eum delectus aut earum.',NULL,'et','1988-09-09 12:32:08','1973-09-01 01:21:55'),(2,2,9,'Aut molestias voluptatem cum natus sint reiciendis odio. Unde modi magni exercitationem beatae molestias occaecati et. Omnis est voluptas aspernatur.',NULL,'minus','2020-01-04 16:32:40','1988-11-11 07:54:11'),(3,3,12,'Amet ipsa molestiae perspiciatis quae totam libero necessitatibus. Sed inventore minus repudiandae aperiam et inventore sed. Et eum placeat nemo vitae repudiandae eos placeat omnis.',NULL,'commodi','1992-05-25 05:11:34','2021-02-28 12:57:32'),(4,18,5,'Error et sint eveniet voluptate a eius. Reprehenderit tempore quos nihil quibusdam. Harum ut et id qui autem vel. Et velit quisquam tempora veritatis.',NULL,'repellat','1981-04-06 23:02:39','2006-09-22 09:34:00'),(5,19,18,'Iusto nihil voluptatibus et nulla. Nobis ea doloribus velit nihil dolores. Maiores id sapiente perspiciatis doloribus expedita rerum earum. Quod laboriosam eaque commodi nobis fugit nemo quis.',NULL,'in','1972-08-15 18:49:38','1985-05-21 17:03:15'),(6,11,5,'Ut dolore nobis et. Aut repellendus et molestiae et animi architecto dicta tempora. Eos laudantium dolor in.',NULL,'voluptatem','2010-10-21 20:48:35','1992-02-11 07:40:44'),(7,4,12,'Quidem magni esse veniam praesentium unde. Id deserunt esse eum labore animi explicabo. Sit reprehenderit culpa similique harum. Eum tempora expedita dolorum eligendi eligendi.',NULL,'repellat','2013-10-18 13:49:58','1985-11-01 18:47:26'),(8,13,14,'Sit sit id perspiciatis consequatur voluptas fuga. A et id veniam deserunt voluptas. Quia adipisci pariatur veniam amet molestias commodi molestias. Dolor perspiciatis architecto cumque autem dolor iste aliquam sed.',NULL,'quis','1973-03-10 13:46:53','1973-05-10 19:33:56'),(9,17,13,'Itaque omnis quas et molestiae aliquam eos. Culpa rem nulla modi ad. Iste consectetur hic modi veniam voluptatem quibusdam eos.',NULL,'autem','1976-01-10 18:07:46','2007-04-26 20:30:40'),(10,4,2,'Et ut et eum totam quibusdam iure eligendi. Qui fuga placeat quidem eius incidunt ut ut. Vel aliquid quisquam numquam recusandae. Molestias asperiores totam quidem culpa in doloremque.',NULL,'est','1984-01-27 15:46:13','1972-01-08 07:10:33'),(11,14,16,'Consequatur recusandae et autem rerum. Consequuntur quo et quibusdam error nobis. Et quo hic nostrum voluptatibus aut vel.',NULL,'ad','2005-09-09 16:03:22','1993-10-30 06:19:10'),(12,9,1,'Voluptates ex necessitatibus deserunt ad nam. Eos qui ea non. Magni tempora qui exercitationem non.',NULL,'enim','1981-03-04 01:25:48','2015-06-18 13:02:34'),(13,7,18,'At et omnis quos libero autem quam. Sit sequi et error nulla est quis quod quod. Magnam et voluptatum dolor omnis aliquam.',NULL,'alias','2017-09-28 15:40:04','2015-02-06 00:36:03'),(14,6,12,'Inventore autem voluptatem sit dolore. Odit ut voluptates est iste.',NULL,'eligendi','2015-06-18 02:37:19','2001-12-18 20:10:27'),(15,5,6,'Nam commodi possimus eius a est reiciendis autem. Sunt fugiat voluptatum perferendis aut voluptas. Excepturi assumenda cum neque quam soluta.',NULL,'sunt','1992-10-10 00:22:50','2010-06-07 11:22:14'),(16,15,16,'Ut magni ullam enim aut nobis. Ut dolores quis molestias eum nulla. Fuga magni similique minus sed et et eius.',NULL,'molestiae','2011-08-10 02:53:21','2004-12-24 12:13:32'),(17,8,2,'Aliquid qui debitis cumque quidem repellendus ipsam in quasi. Quia sit beatae facere eaque voluptatem in quisquam. Neque voluptatem deserunt eum odio. Est et autem voluptatem et quibusdam quas ut.',NULL,'eum','2013-10-25 15:49:53','2016-05-28 05:53:27'),(18,2,11,'Omnis voluptas soluta impedit similique. Officiis quia sint nesciunt non ut est dolorum. Nobis autem ipsam hic voluptates. Voluptatem aut ipsa neque.',NULL,'numquam','1974-12-16 04:05:59','2011-05-17 05:35:54'),(19,14,10,'Ipsam quia iusto consequuntur. Quia vero tempore qui illum laboriosam. Nihil aut itaque omnis voluptatem quis totam reiciendis. Omnis odio sunt amet delectus amet. Non iusto enim nesciunt animi.',NULL,'itaque','1998-08-11 22:21:13','1971-01-07 17:01:39'),(20,15,5,'Et et officiis fugiat dolores et culpa. Cupiditate non culpa consectetur voluptatem. Illo ea perferendis ut laborum qui. Sed debitis aut itaque. Qui voluptatem nihil illo nulla ut maiores ratione.',NULL,'praesentium','2000-10-11 05:20:00','1972-10-02 18:10:21');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_photo_id` (`photo_id`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,NULL,'1972-02-26',1,'1974-11-26 23:04:58',NULL),(2,NULL,'2014-03-29',2,'2017-11-05 12:37:42',NULL),(3,NULL,'2007-03-31',3,'1984-12-15 10:25:44',NULL),(4,NULL,'1972-11-29',4,'2022-10-18 10:55:25',NULL),(5,NULL,'1997-07-29',5,'1995-07-01 23:48:53',NULL),(6,NULL,'1991-02-01',6,'1976-10-13 11:25:57',NULL),(7,NULL,'1971-12-31',7,'2013-04-05 04:24:17',NULL),(8,NULL,'2016-03-12',8,'1973-10-23 14:26:02',NULL),(9,NULL,'2006-04-17',9,'1972-06-02 15:00:20',NULL),(10,NULL,'1984-09-26',10,'1978-09-13 20:26:57',NULL),(11,NULL,'2003-11-18',11,'2020-10-03 21:33:57',NULL),(12,NULL,'2008-05-28',12,'1977-10-24 00:38:03',NULL),(13,NULL,'1996-04-05',13,'2018-02-12 10:38:23',NULL),(14,NULL,'2011-01-28',14,'2009-07-14 15:56:13',NULL),(15,NULL,'1980-06-30',15,'2005-01-08 03:37:38',NULL),(16,NULL,'1994-01-10',16,'2015-03-25 22:05:29',NULL),(17,NULL,'1982-06-03',17,'2021-04-24 03:26:02',NULL),(18,NULL,'1977-10-24',18,'2005-07-28 22:42:15',NULL),(19,NULL,'2000-09-26',19,'2012-03-28 17:36:59',NULL),(20,NULL,'1976-03-26',20,'1997-06-19 06:15:17',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Wilford','Bosco','adeline02@example.com','41edefb7d2d90f53da5bdf1b1dca1ec48b2f950a',1,'\0'),(2,'Parker','Mosciski','ltillman@example.org','a1449e3093278d4acfa1842077cc919e629e9817',1,''),(3,'Leslie','Jaskolski','yschumm@example.com','37ad5d72fc9e1cb280951adfadf517631d590cc9',1,''),(4,'Wilbert','Bartell','marie.kub@example.com','5dbf34a980f42070bf32dcba8b03fe4ee968cdd1',374895,'\0'),(5,'Ruben','Mraz','gusikowski.celestine@example.org','f16ebc8718d8050202d8838d6e45998f993425d5',1,''),(6,'Kimberly','Kuhic','emmy.walker@example.net','aabf886f5c1f94eda7353e67e23a6c91a8e211ed',363,'\0'),(7,'Trent','Tremblay','metz.domenic@example.org','4a92650f041808ef3bdae73ca7e449aca8d19ac5',965898211,''),(8,'Norval','Funk','stehr.sonya@example.com','407f7045f17425d301e18d7dd15f5b1ec5287dd9',749964,''),(9,'Deon','Nader','ckovacek@example.com','9f2315a134b91199b89a5625e52dd10a06178aa2',94088,''),(10,'Evie','Bahringer','josephine81@example.org','18951faf77d965bcc4a36f4882c7b4370fb635b3',138752,''),(11,'Mireya','Watsica','kendall35@example.net','b7c01a8e6283c49fb6dc9670c741b0d2387e6d2c',0,'\0'),(12,'Isabella','Zulauf','uraynor@example.org','1e071c5a0fec73629acc2f3f7ec66bdb9521d294',743347,''),(13,'Tabitha','Mosciski','vkohler@example.com','b063bdc28f82fb677596f34d03ae1838c6e0c69f',5191442933,''),(14,'Lilian','Leannon','aurore16@example.net','7bf5bd692955d7d9b57883ff644ca076d0e35d33',22472,''),(15,'Forest','Schiller','nick.rogahn@example.com','a9702aa6b214256ea662b83935708e9c7f26ba73',1,'\0'),(16,'Darrick','Von','stiedemann.dejah@example.net','d67f3fe2585120992d019f961bd61c27ba58dbaa',0,''),(17,'Kade','Altenwerth','prohaska.reta@example.net','be1010b9108763f1af7cd3f28b6ad5c1eb39e52a',637656,'\0'),(18,'Annamae','Howe','vella.feest@example.net','7eb7972358a7cef6616e95f380097f2f75e28fa4',5947466463,''),(19,'Ines','Bailey','lherman@example.org','d7db8b8322b0d299934eaac5de3095c68a415a6d',15,''),(20,'Lempi','Mante','waters.kenny@example.org','f4d1752e277f957a30fafccd799ad864e1806102',0,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,11),(4,9),(5,7),(6,5),(6,14),(7,4),(9,1),(10,20),(12,9),(12,15),(13,14),(15,1),(15,7),(18,3),(18,7),(18,17),(19,3),(20,20);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-11 19:12:29
