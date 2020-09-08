-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: kinopoisk
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `movie_title_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cinema_movie_title1_idx` (`movie_title_id`),
  CONSTRAINT `fk_cinema_movie_title1` FOREIGN KEY (`movie_title_id`) REFERENCES `movie_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `critique`
--

DROP TABLE IF EXISTS `critique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critique` (
  `movie_title_id` int NOT NULL,
  `users_id` int NOT NULL,
  `review` text COLLATE utf8mb4_general_ci,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `fk_critique_movie_title_idx` (`movie_title_id`),
  KEY `fk_critique_users_idx` (`users_id`),
  CONSTRAINT `fk_critique_movie_title` FOREIGN KEY (`movie_title_id`) REFERENCES `movie_title` (`id`),
  CONSTRAINT `fk_critique_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critique`
--

LOCK TABLES `critique` WRITE;
/*!40000 ALTER TABLE `critique` DISABLE KEYS */;
/*!40000 ALTER TABLE `critique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL,
  `genre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_genre_movie_title` FOREIGN KEY (`id`) REFERENCES `movie_title` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'аниме'),(2,'биографический'),(3,'боевик'),(4,'вестерн'),(5,'военный'),(6,'детектив'),(7,'детский'),(8,'документальный'),(9,'драма'),(10,'исторический'),(11,'кинокомикс'),(12,'комедия'),(13,'концерт'),(14,'короткометражный'),(15,'криминал'),(16,'мелодрама'),(17,'мистика'),(18,'музыка'),(19,'мультфильм'),(20,'мюзикл'),(21,'научный'),(22,'приключения'),(23,'реалити-шоу'),(24,'семейный'),(25,'спорт'),(26,'ток-шоу'),(27,'триллер'),(28,'ужасы'),(29,'фантастика'),(30,'фильм-нуар'),(31,'фэнтези'),(32,'эротика');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limit`
--

DROP TABLE IF EXISTS `limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limit` (
  `id` int NOT NULL,
  `limit` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limit`
--

LOCK TABLES `limit` WRITE;
/*!40000 ALTER TABLE `limit` DISABLE KEYS */;
INSERT INTO `limit` VALUES (1,'без ограничений'),(2,'c 5 лет'),(3,'с 13 лет'),(4,'с 17 лет');
/*!40000 ALTER TABLE `limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_title`
--

DROP TABLE IF EXISTS `movie_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_title` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genre_id` int NOT NULL,
  `age_limit_id` int NOT NULL,
  `day_premier` date NOT NULL,
  `duration` time NOT NULL,
  `Persons_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_movie_title_genre_idx` (`genre_id`) /*!80000 INVISIBLE */,
  KEY `fk_movie_title_limit_idx` (`age_limit_id`),
  CONSTRAINT `fk_movie_title_cinema` FOREIGN KEY (`id`) REFERENCES `cinema` (`id`),
  CONSTRAINT `fk_movie_title_film_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  CONSTRAINT `fk_movie_title_limit` FOREIGN KEY (`age_limit_id`) REFERENCES `limit` (`id`),
  CONSTRAINT `fk_movie_title_Persons` FOREIGN KEY (`id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_title`
--

LOCK TABLES `movie_title` WRITE;
/*!40000 ALTER TABLE `movie_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `second_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `profession` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `birth_place` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `movie_title_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `fk_Persons_movie_title` FOREIGN KEY (`id`) REFERENCES `movie_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `users_id` int NOT NULL,
  `movie_title_id` int NOT NULL,
  `ball` tinyint NOT NULL,
  KEY `fk_rating_users1_idx` (`users_id`),
  KEY `fk_rating_movie_title1_idx` (`movie_title_id`),
  CONSTRAINT `fk_rating_movie_title1` FOREIGN KEY (`movie_title_id`) REFERENCES `movie_title` (`id`),
  CONSTRAINT `fk_rating_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_time`
--

DROP TABLE IF EXISTS `session_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_time` (
  `cinema_id` int NOT NULL,
  `session` time DEFAULT NULL,
  `movie_title_id` int NOT NULL,
  KEY `fk_session_time_cinema_idx` (`cinema_id`) /*!80000 INVISIBLE */,
  KEY `fk_session_time_movie_title1_idx` (`movie_title_id`),
  CONSTRAINT `fk_session_time_cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`),
  CONSTRAINT `fk_session_time_movie_title` FOREIGN KEY (`movie_title_id`) REFERENCES `movie_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_time`
--

LOCK TABLES `session_time` WRITE;
/*!40000 ALTER TABLE `session_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `vip_status` binary(0) DEFAULT NULL COMMENT '0 - vip status\n1 - norm status',
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick_name_UNIQUE` (`nick_name`),
  UNIQUE KEY `password_hash_UNIQUE` (`password_hash`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mr. Jayson Jacobi','17226 Marvin Lakes\nSouth Ronnyfort, OR 28616','1989-07-14 10:49:30','2018-03-04 03:13:19','','07560686e7733482e73a3bec6621d00df1a8c3c3'),(2,'Devyn Kirlin','088 Katharina Mount\nNew Casimirhaven, MI 44146','1995-03-05 20:38:01','2003-06-25 13:59:55','','1f2d3dfe25e0dd593cbbbd76d39010d5684d087d'),(3,'Wendy Labadie','51688 Gracie Lodge\nLake Lucasfort, NE 57975','2004-04-24 09:45:06','1995-11-06 02:56:00','','b43f5bb14300d93766a36bd39c27981eebd58dfc'),(4,'Dr. Cielo Raynor','19863 Rau Radial\nSouth Marleeport, CA 64555','1970-10-23 19:53:28','1980-10-13 11:44:16','','7e5f1f0f6f3693d978abba0cbe5453de09016a9c'),(5,'Alverta Ryan','0522 Lubowitz Prairie\nHansenside, TX 15116','2008-06-09 16:45:02','2002-11-03 08:30:19','','2be9d190414f60bae0c85d173fee4849d8368d99'),(6,'Dino Larson','5203 Micaela Burgs\nWest Garrick, CO 31437','2012-03-06 16:34:31','1973-12-22 01:36:12','','105eb1c4e409e27874a3e03b910ddf0bf94fb65c'),(7,'Prof. Jewel Kuhic DVM','2740 Lupe Stream Suite 473\nMaureenland, MI 96017-6861','1995-08-16 13:40:13','1971-04-04 00:01:37','','48aa854832377dd8a5677d71eac2c99fe7f5c6c0'),(8,'Karina Rowe','20701 Esteban Shoal Suite 049\nBrionnashire, AR 35210','1987-04-24 04:53:52','1980-02-23 23:54:50','','3c337d919ef834ea5659cf7c5f62812284b8a3b5'),(9,'Warren Stanton','33578 Reichert Dale\nLake Delmerfurt, MA 16234','1983-11-28 09:18:28','1975-11-24 05:27:43','','d1430d39fc91599cf33db7b8b9655a26c0e184fc'),(10,'Laurine Bradtke','8983 Goldner Way\nSouth Julienburgh, NJ 57924','2018-08-28 00:50:39','1974-05-18 17:18:27','','0824bb13db2a6f4c4b14cfc718aed00046afd403'),(11,'Cecelia Kub','75435 Arjun Tunnel Suite 319\nKlockoville, MN 36165','1976-06-29 19:31:05','1982-03-22 07:28:38','','9166f82dd8ad013433200e110b547879eabd5b99'),(12,'Kareem Dicki','233 Hessel Lodge\nNew Lafayettehaven, AZ 01921-8709','2018-09-11 19:15:52','1973-02-17 21:55:44','','3b38948695302f59207998e8f2515b40fd74663c'),(13,'Miss Maida Wiegand Jr.','66091 Abdiel Orchard\nLake Veronicachester, VA 25739','1973-07-28 21:50:57','1970-05-08 09:38:15','','9bdb7a54940a8deee1b7948c2cebdacdfe10425c'),(14,'Dexter Turcotte','51229 Camilla Rest Suite 827\nJanisfort, PA 61003-5106','1994-03-05 02:39:32','1971-03-08 09:40:01','','654dcbaa73e7e3182a35a37e563c9d1ee771a5a8'),(15,'Ernest Stiedemann Sr.','01058 Sibyl Island\nEast Beau, DE 60473-8259','1972-03-28 21:12:06','2016-04-24 00:10:50','','05c35e9d8fd770985c0ab0eb2056ffb90879a337'),(16,'Hassie Kerluke','6925 Larson Harbors\nMolliestad, MO 65157','2005-08-20 13:53:24','1994-01-12 11:06:55','','752eaa026248ddd284be48faaf0c0b307dc045a3'),(17,'Ismael Schulist','660 Jast Point Apt. 057\nProsaccostad, LA 25198-4771','1985-11-01 00:18:55','2003-01-15 02:41:45','','700cd8ca7a1d5837c1c2b98a7779366afbf410dc'),(18,'Regan Mitchell','6593 Grady Lake\nSydnihaven, OH 30034','1990-06-09 08:50:23','1997-08-03 10:11:43','','6e0d4a0f1200335a8acee5934ad1bb9ac2f6e5a1'),(19,'Vivien Beahan','61388 Schimmel Greens\nLake Amani, NC 22030-6414','2011-07-13 22:44:27','1986-11-14 02:01:14','','cd41ccaf533dccaa2604ac8edfa25a4c772f74e6'),(20,'Dr. Laisha Tillman IV','124 Wisozk Union\nNolanville, FL 12180','1999-11-30 17:19:12','1996-07-18 01:44:27','','5653acfb415a82c496bafdacde5cba8bc2800cc1'),(21,'Ms. Juliana Nolan III','249 Kreiger Falls Suite 461\nVerdiefort, NY 89319','2006-11-05 21:09:43','2020-06-21 16:30:10','','403119428b39f0f1d05aa41605be135a01039319'),(22,'Keenan Lang','79859 Ledner Parks\nWintheiserfort, SC 76558-0926','1994-01-29 04:11:10','1991-03-24 15:21:08','','0492cce58a6d4a78ec984eeb6be123f972f10149'),(23,'Miss Tamara Ritchie','6703 Charlie Skyway\nFritschview, SC 70859','1973-01-30 14:42:48','1995-10-03 12:06:59','','4c9cd7f0b327bc88a93268d330c210e270d3f1ef'),(24,'Richmond Ziemann','20362 Heaney Trail Suite 481\nAbbottshire, NY 40551-6447','1974-12-13 15:41:40','1975-11-04 13:37:37','','1c609a79dd9399dbcab31e60cfbae893cf64688a'),(25,'Shyann Pollich PhD','2368 Heathcote Land Suite 296\nEast Monashire, TX 12452-5437','2013-10-01 02:53:26','1978-09-13 19:19:02','','7eeeae0468e9ce7d04bf70d07f26d3f2f83381bb'),(26,'Dr. Monroe Schaefer V','60119 Delphia Falls Apt. 117\nEmilianohaven, TN 06836-6946','1983-11-15 08:44:26','1976-12-01 19:21:30','','e7a48a51717e951161766804cd7a02fdce931c03'),(27,'Ashley Rice','0551 Jacobson Wall Suite 620\nJuneborough, SC 64888-6797','2009-05-06 20:31:28','2003-04-27 19:59:54','','f0226a7bb6e9955abb968bf67b2963019a3e4409'),(28,'Amalia Bahringer DDS','00383 Kertzmann Curve\nNew Gregoriamouth, MN 18596','1984-07-04 16:13:06','1987-10-17 10:53:46','','030fd96ec60d306a8f32628ce9278ff2e3f60008'),(29,'Katelin Hauck DVM','01167 Reichert Place Suite 724\nEdgardotown, NJ 85288-5818','2014-01-21 11:21:28','1995-05-12 05:28:29','','5567203d198838651a1d46b07f0068fbc65e9b64'),(30,'Jarrett Schaefer','367 Brielle Creek\nMurphyport, HI 90213-0696','2011-11-19 06:41:08','2011-06-05 12:48:51','','a844e13ad9a6662d557a2fa024f7c5fde8724bd9'),(31,'Mr. Gerald Krajcik DVM','7662 Niko Extension\nSchroederhaven, MI 23703-3245','1979-01-09 13:51:27','1976-04-23 10:01:21','','a84e76d4dcdd8d96c7b0b080b86cb9beb976a8d9'),(32,'Mr. Trey Crooks MD','385 McLaughlin Pike Apt. 244\nLizzieberg, OK 18091-9318','2007-11-29 07:00:19','1991-09-22 16:50:07','','271f3e3d259221bafa1867136528a71f1d638fbf'),(33,'Jazmin Schiller PhD','800 Birdie Ferry Apt. 523\nEast Lillian, FL 85174-1667','1989-03-03 03:11:18','1986-06-06 23:30:38','','a9c172c90c918b91e6d57019d88f76ef82db6c8a'),(34,'Brandi Quitzon','46808 Davis Park\nSouth Felicitastad, CA 44405','1978-10-26 08:41:33','1975-10-12 04:34:08','','fcdcfd23250e529aa56e08ab50634de4c8041b37'),(35,'Antonio O\'Reilly DVM','506 Reid Shoal Apt. 883\nNew Arelystad, MD 73156','1999-05-16 16:31:37','1976-06-13 20:27:55','','7b1eb00059d5e6d5f02e042240a05364455c420a'),(36,'Sid Lemke','18761 Nienow Walk Apt. 203\nWest Jesse, MS 72802-8194','1995-11-14 08:44:54','1988-06-18 08:59:31','','3193c9c6ccfd76df9af6dd2686725eaf77a64144'),(37,'Dr. Reinhold Kassulke DDS','241 Heaney Manors Apt. 146\nLake Wilhelmchester, ME 26419-3753','2006-03-09 17:31:15','1974-02-05 07:27:18','','6c54750d34ecf74f22b3166601df7a48d1e66f2e'),(38,'Breanna Grant','913 Ernser Estates Suite 947\nEast Nyah, AR 17250','1999-08-18 18:30:30','1970-11-26 20:23:16','','adeeeeaf8207803dda5751fbd050733e3ac45950'),(39,'Sedrick Emmerich','667 Dibbert Spurs\nFayside, CT 64292','1979-04-28 19:57:39','1975-06-21 08:20:10','','067375e9d8f3fc88258bf089b9ddbf955f58d4bf'),(40,'Juanita Langworth','022 Schneider Isle\nCarmelland, NH 30124-5200','2008-09-21 16:55:55','1981-07-31 07:37:12','','f5f953ddb8caf5fd1ef0d559e9e6a82d8661a5be'),(41,'Jerod Thiel','0636 Gleason Alley\nNew Marlenport, RI 01269-2245','1987-04-12 22:56:52','2013-04-22 04:38:32','','5380ca933339225a5060c822100bde0eb560275e'),(42,'Ana Bogisich DDS','4089 Shields River Suite 607\nPort Davinchester, ME 71140-5863','1992-06-16 21:47:08','1972-09-04 21:29:00','','4533499c41ab069d1d142f04d3de9eddd3d12f41'),(43,'Madisyn Parker','7454 Blanda Crescent Apt. 111\nPort Johannshire, SD 33100-2851','2018-02-24 23:40:47','1979-09-29 10:55:14','','26e50c472d750109971caa3d8c3dcc2f1ee62009'),(44,'Pascale Bartell','73322 Christa Track\nDanielport, CO 29845','1993-05-28 19:24:57','1975-01-03 21:17:53','','a9056483112899cd9c71296a38b598a532cf4644'),(45,'Margarett Nader Jr.','460 Ebert Lock\nPort Julianabury, RI 96377-3773','1999-06-22 17:19:40','1978-07-18 09:49:59','','270db33d96f73832d0d5c6fb354ef983c0aad6b9'),(46,'Raina Zboncak','89353 Hyatt Pine\nBeierside, ME 16130-8898','1984-02-07 15:02:52','1998-10-02 21:26:43','','0ac71bc0fef39c88eba09a24a5aa6665358642fe'),(47,'Alison Gusikowski','146 Murray Street Suite 775\nLake Garthport, MT 59814','1982-04-11 19:22:01','1989-05-19 12:04:19','','d3b9c6aab999a6b14d1a2243e9982b44bd0c812d'),(48,'Daniella Boyer DVM','16926 Hickle Plaza\nSanfordport, ME 27318-4426','2020-07-06 02:36:59','1980-06-12 05:27:30','','4e8b75146cb10e154d450b7c9eb5fc661c0ead9f'),(49,'Deja Rohan III','176 Russel Lakes\nWest Orinburgh, NY 15227','1974-02-27 22:11:36','1990-02-15 14:15:47','','e373e8b171c7ea8abe7f38277bf49f817aa252c9'),(50,'Mikel Macejkovic','6209 McKenzie Forge\nNorth Heaven, TN 64463-8454','2015-10-25 10:29:58','2018-03-13 08:40:26','','a19d25429d927f0becc008119f7e77d70e4d876c'),(51,'Esta Kautzer','30445 Juliet Falls\nSouth Rubyeberg, MS 11300','1979-09-11 00:50:38','1978-06-26 17:00:30','','be99c495731fea7748f9ed43296ef8e1d2fa2bfa'),(52,'Leanne Bogisich','33009 Rutherford Knolls\nAldahaven, SD 58046-4622','1982-05-26 12:33:13','1981-04-06 21:14:45','','03c7372822cfadb7d9db99ac82eec2266718557d'),(53,'Rosella Boyer','242 Okuneva Wells\nClementinaberg, AK 15944-5126','1981-12-05 04:00:30','1998-06-27 01:52:13','','c3dda21cc02ed57f1661354f3de548f938037aaf'),(54,'Hayley Barton','8454 Davis Mill Apt. 869\nLake Halietown, WV 59567-5867','2009-10-09 14:26:46','1993-03-15 21:57:00','','e98a0519169173f98a4c41178feabb56ea367960'),(55,'Prof. Kylie O\'Connell','6685 Franecki Fork Apt. 035\nEast Jane, WY 21761-8965','1990-08-15 23:14:01','1981-12-05 00:04:40','','806106eea9614151e4ecd3b7ad0e6d6108887252'),(56,'Josie Volkman','79363 Kane Curve\nAmericaland, SC 12725-6049','2016-09-27 07:20:33','1989-09-28 23:50:08','','0895ae4e726c9598addb1d561cf92ee4a8540d73'),(57,'Faustino Smitham','4977 Jaleel Passage\nGulgowskifort, MA 64760','1993-09-03 19:11:42','1988-02-10 18:34:57','','907a2880aebf64f4f68179b5b0e18f45820997b7'),(58,'Mittie Kohler','61893 Rod Meadows Apt. 658\nUptonport, MS 83713','1991-10-11 02:55:59','1990-09-06 09:00:43','','077e0f268e02f4c738e43af364a358b5b160e015'),(59,'Kiarra Oberbrunner','35484 Lydia Knoll\nJohnstonburgh, HI 59059','2001-05-20 14:48:16','2003-09-10 16:13:52','','3f656d94e7682721269522c1f2904f0af9d7fbed'),(60,'Marcelino Gorczany','418 Durgan Light Apt. 504\nSantiagohaven, WV 16282','1973-11-12 11:50:25','1999-11-18 10:56:35','','4d5f8adca21f7b0a4e40404d270edc2d025196f0'),(61,'Webster Pouros','56665 Wyman Green\nNorth Tyrel, GA 06657-7816','1994-12-20 14:49:19','2001-06-18 02:52:28','','1dc8f231388c6d4e2719c6174d788b99c03697b8'),(62,'Mrs. Matilde Cummerata Sr.','239 Gretchen Center Suite 487\nGeorgeburgh, WI 87920-7218','1983-01-26 20:39:01','1972-03-20 03:03:28','','b77f2a868597c977fcefaca80aa90a5dba89cd46'),(63,'Ephraim Kilback','18944 Elfrieda Mission Apt. 494\nWindlerburgh, MN 82668-4229','1986-07-31 10:06:37','2015-01-04 05:33:02','','2f32f46da924fd8f5dbe5fe5e9f36bc63c00a618'),(64,'Otto Sporer','2727 McGlynn Cape\nSpencerbury, SD 99964','1974-02-04 07:20:21','1985-12-24 20:00:52','','e47a59c66989c97bbf2c8a08a9772d927edd7500'),(65,'Eladio Terry','03292 Lamont Lights\nBinsside, DE 50478','1993-03-30 01:07:41','1974-02-13 17:42:31','','9cccb354040301e6969d08d26883e919ec0d4759'),(66,'Tess Senger','277 Barton Rue\nWest Guido, TN 71193','1979-03-12 16:33:29','1984-02-20 00:18:01','','96b82564c568204f29167bd3fcab2a188228077b'),(67,'Rowan Hand','7093 Idella Junctions Apt. 638\nKeeblerton, FL 66106-2669','1980-07-14 14:14:26','1971-09-19 09:49:10','','d01d66d19a40b29749ccb9c4700c702d3c3a4f10'),(68,'Clay D\'Amore','3074 Angeline Locks\nAuermouth, PA 87355-7073','1975-10-18 16:56:32','2016-07-30 13:37:52','','c98a4fa197f51eb31afc4ae72d5720926a4d0dfb'),(69,'Bert Hickle','11095 Kiel Route\nCaitlynchester, MT 38805','1975-10-04 19:57:21','1997-05-07 01:44:22','','6d5bdf9abd8c950fc54c25df4594611a706d3426'),(70,'Terence Bogisich','1417 Toy Hollow Suite 040\nWest Romaineburgh, TX 21521-1045','1978-06-07 22:09:27','2007-08-13 20:56:48','','5fb498b9b2794d57235e8828c94ec8490dcd79ff'),(71,'Rosalind Kutch','575 Justyn Well\nLueilwitzview, MA 24645','2007-11-04 22:00:50','1987-09-30 16:21:11','','a96d8000828a774de015db3105a801cc218ab4d3'),(72,'Ludwig Ankunding III','653 Rod Avenue\nNorth Isabelmouth, OK 55307-0301','2003-03-14 16:32:25','1975-10-10 15:28:02','','24290a8cfec2856ab2cf148d8a823c38842de5eb'),(73,'Virginie Von','3316 Reichel Crest Suite 040\nHowardmouth, MI 18626-3584','2002-12-13 19:22:59','1993-02-10 08:12:12','','2a6d17b7edd8a1b8670d7aceb0152f0223333576'),(74,'Prof. Miles Rodriguez','061 Mitchel Loaf Apt. 641\nSchoenmouth, UT 38973-4951','2001-03-14 07:28:12','1996-06-28 10:15:49','','6574a51798f8ce9d325aba8793ca6140e5e7d033'),(75,'Estelle Pacocha V','6322 Luigi Ranch Suite 236\nGreenmouth, KY 15550','2006-08-07 22:41:50','2006-06-30 15:29:31','','c1f99586f4cabc3adac9f9845b2d2f5ac7707298'),(76,'Prof. Lucius Carter DDS','789 Weissnat Islands Apt. 440\nEddiestad, VT 42407-2572','2020-05-02 03:20:26','2020-03-20 01:34:28','','09900b8df820bedf485e79539e4bd78cf165e3ed'),(77,'Hipolito Wiegand','1669 Evan Extension Suite 120\nShaniyaview, AL 31379','2004-04-02 20:09:53','1977-09-08 06:08:55','','a9b1b1f3f19676888b69ebf92906e7d82692e496'),(78,'Erik O\'Connell','5766 Rasheed Gateway\nEbbaton, HI 77122-8933','2000-01-31 17:09:38','1999-03-14 12:26:53','','306768f605408f461abd45cb396369016fb10420'),(79,'Bradford Marquardt','78572 Kris Throughway\nNorth Gia, KY 67405-5614','1992-10-30 11:40:00','2013-11-05 03:01:36','','f57f67b79d0051404d40821d4c0cdc3ec995efc0'),(80,'Erna Huels','54940 Jarred Oval\nRogahnmouth, MT 54235-9385','1977-06-17 20:57:44','1988-11-01 17:23:38','','d131f08c268056e28063e2d458fdce4e7494b7f3'),(81,'Lillie Schoen DDS','751 Bahringer Creek\nSouth Ron, DE 65406-8784','1993-05-13 02:58:39','2003-12-19 11:20:15','','0e93d5fbb7e900f579330e4a6221d999ba61c698'),(82,'Prof. Jasmin Wolff','545 Gulgowski Lake Suite 043\nNorth Raymondshire, CA 41650','1986-07-14 08:56:42','2004-07-18 23:58:43','','715880f32b6343c204c4a68a6a72557f9f97ec90'),(83,'Elfrieda Shanahan IV','99268 Kohler Drives Suite 276\nSkylarfort, DC 27941-4349','2012-04-01 10:43:47','1970-01-10 10:51:09','','85f82fca63fadc25e50213321900c92e1631a7d6'),(84,'Myrna Schamberger','623 Skye Mountains\nLake Marcel, MO 63315','1972-04-23 12:33:23','1997-03-17 01:49:04','','a8f782567038d344cea937f4c341027e0b7f0260'),(85,'Jayson Bednar','047 Gutkowski Path Suite 328\nMaximilliaport, NE 05593-6602','1970-01-17 05:56:15','2002-11-26 20:38:32','','921a62d478eef8b6c3d5ebcc518e24f9151b4107'),(86,'Jordy Goyette II','86242 Stoltenberg Divide\nMarleneton, CA 18174-3324','2014-11-24 17:35:25','1999-12-02 16:30:34','','e5a3c70c109b511b916590e627192c4497cb9e40'),(87,'Jazlyn Kshlerin','480 Hamill Ports Apt. 724\nBartellside, FL 86952-6624','2016-12-09 17:12:10','2001-08-11 14:47:31','','ee23dcc6568be7edd9836a1477ba3a1fcc9844d2'),(88,'Mr. Osbaldo Volkman Sr.','539 Darius Vista Suite 978\nSouth Alvera, MN 50124-5916','2010-12-26 23:11:51','1985-01-29 06:14:12','','d4a32b1b4fe31054ade5dc630601279cbe6914f5'),(89,'Zoie Johnston','0594 Muller Way Apt. 917\nWest Laron, CO 34475-5991','1996-10-17 23:18:54','2019-05-26 05:58:20','','9967b8f1db1f7e848f3119370ebef51e66f1a902'),(90,'Flavie Littel','493 Velma Forks Suite 558\nBrownhaven, FL 58701','1984-06-16 06:51:51','2016-11-06 15:35:14','','7d9420d905613c7acbbf0c5c68deca63b587e98a'),(91,'Jordi Senger DDS','22262 Mireille Spring\nPort Kadinville, CT 81851','2015-01-10 22:14:41','2008-08-28 16:24:15','','539dc7a9eeca49e1d1bdadec53e643442f52d706'),(92,'Ms. Shawna Pagac','4827 Becker Wall Apt. 124\nSallyton, VT 19845','1991-09-17 21:33:35','1972-07-10 17:43:15','','374bd648b54719ff5eef2e3ecec2e9f3c98815b6'),(93,'Prof. Clark Pagac','253 Towne Mall Suite 108\nNorth Zechariah, MT 45712-0881','2016-10-06 01:03:17','1985-02-23 16:26:23','','6b0353ca4c659914ec0bbf4cc9a675eca1815450'),(94,'Mireille Steuber PhD','870 Cassandre Village\nBoyleburgh, MI 66082-9394','2000-06-26 14:49:11','2018-04-14 00:33:48','','d84a2eac44f94a492dc119b283e754c181194e8d'),(95,'Dr. Erin Gleichner','88149 Turner Camp\nAbernathyborough, MA 62093','1972-01-30 14:31:45','1975-08-12 17:54:21','','da8dea57e547c3b14bf0e644dd6af55c13c24a68'),(96,'Miss Estella Marquardt Jr.','7884 Houston Vista Apt. 818\nHolliemouth, WY 09842','2007-07-20 05:40:23','2014-05-25 01:14:55','','4dce46e32e87401c63299c62966078e788082674'),(97,'Miss Delilah Swift PhD','674 Steuber Rapids Suite 541\nNew Elmer, VT 96163-3205','2007-04-07 21:19:17','1970-01-19 15:44:25','','5fb5dc3f945de7dfa7bf7bc96a2c73ca42d59829'),(98,'Ben Bashirian','53677 Waters Summit\nMarquardthaven, IL 64760-5689','1998-05-09 17:00:49','1996-02-11 20:50:54','','d808fb81685ddf977173e96bc6184647bb5497da'),(99,'Obie Schultz','6127 Bergnaum Way Suite 133\nNorth Domenicoton, SD 34460-6819','1995-03-03 19:34:12','2002-02-03 22:35:22','','c90efd77bea9da20677d0241d0f6977f95edc90d'),(100,'Pete Rempel','28830 Mitchell Plaza\nFramihaven, WV 33081','1978-07-29 01:36:45','1991-11-05 18:48:49','','2dd057f4bfd9098fd6699314005538a321845597');
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

-- Dump completed on 2020-09-08 20:48:46
