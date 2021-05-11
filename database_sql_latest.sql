CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `advert`
--

DROP TABLE IF EXISTS `advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advert` (
  `advert_id` varchar(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `message` varchar(100) NOT NULL,
  `photo_path` varchar(260) DEFAULT NULL,
  `link` varchar(50) NOT NULL,
  `frequency` float DEFAULT NULL,
  `video_path` varchar(260) DEFAULT NULL,
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert`
--

LOCK TABLES `advert` WRITE;
/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` varchar(36) NOT NULL,
  `message` varchar(100) NOT NULL,
  `post_id` varchar(36) NOT NULL,
  `username` varchar(36) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_Comment_Post1_idx` (`post_id`),
  KEY `fk_Comment_User1_idx` (`username`),
  CONSTRAINT `fk_Post_ID` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `fk_Username_Comment` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` varchar(36) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `post_tags` varchar(100) DEFAULT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `username_id` varchar(36) NOT NULL,
  `photo_path` varchar(260) DEFAULT NULL,
  `video_path` varchar(260) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_Post_User1_idx` (`username_id`),
  CONSTRAINT `fk_Username_Post` FOREIGN KEY (`username_id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('0713807d-b004-11eb-be11-9c5c8ed4d803','jonh90asd7as','john,rock,tim',15,'john_.78b309','highleg',NULL,'2021-05-08 00:00:00'),('22a5658a-b0b9-11eb-b5b3-9c5c8ed4d803','HELLO A TEST','rock,hum,test',2,'john_.78b309','sam_photo',NULL,'2021-05-09 00:00:00'),('29a97e5e-b0bb-11eb-963c-9c5c8ed4d803','This is a test','',0,'john_.78b309',NULL,NULL,'2021-05-09 12:39:07'),('2cef413e-b016-11eb-a267-9c5c8ed4d803','RUN RUN RUN GIUM','rin,gin,hello',0,'john_.78b309',NULL,NULL,'2021-05-08 00:00:00'),('834f41d5-affd-11eb-b606-9c5c8ed4d803','RANDOM SHITE','gym,excercise,rock',6,'john_.78b309',NULL,'video_highleg','2021-05-08 00:00:00'),('885bc38a-b0bb-11eb-8147-9c5c8ed4d803','ANOTHR TEST','',8,'john_.78b309',NULL,NULL,'2021-05-09 12:41:46'),('a54a1cd0-b0bb-11eb-8586-9c5c8ed4d803','test','',38,'john_.78b309',NULL,NULL,'2021-05-09 12:42:34'),('f3c30a3c-b016-11eb-8153-9c5c8ed4d803','Thi is a remindr the gym is open now','gym,open,now',2,'john_.78b309',NULL,NULL,'2021-05-08 00:00:00'),('facae59d-b015-11eb-bd89-9c5c8ed4d803','Heya this is a quick update for our gym class','gym,class,team',2,'john_.78b309',NULL,NULL,'2021-05-08 00:00:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_profile`
--

DROP TABLE IF EXISTS `reward_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_profile` (
  `reward_id` varchar(36) NOT NULL,
  `points` int DEFAULT '0',
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_profile`
--

LOCK TABLES `reward_profile` WRITE;
/*!40000 ALTER TABLE `reward_profile` DISABLE KEYS */;
INSERT INTO `reward_profile` VALUES ('13b8c0bd-af2e-11eb-abf5-9c5c8ed4d803',0),('24368396-af2e-11eb-a314-9c5c8ed4d803',0),('24ca2ee6-af3e-11eb-94a6-9c5c8ed4d803',0),('2b45228c-af38-11eb-82b5-9c5c8ed4d803',0),('333c121f-af3a-11eb-a5b0-9c5c8ed4d803',0),('37922886-af42-11eb-810c-9c5c8ed4d803',0),('3909728e-af42-11eb-bde0-9c5c8ed4d803',0),('3b35b700-af3f-11eb-97c0-9c5c8ed4d803',0),('44caeb03-af3b-11eb-a6df-9c5c8ed4d803',0),('50c1e2c8-af40-11eb-aebe-9c5c8ed4d803',0),('5a692ad7-af3f-11eb-b7e7-9c5c8ed4d803',0),('5d8c12d0-af3e-11eb-a9c9-9c5c8ed4d803',0),('6024e698-af2e-11eb-9b34-9c5c8ed4d803',0),('66328190-af3c-11eb-b3dd-9c5c8ed4d803',0),('68dd9455-af33-11eb-84da-9c5c8ed4d803',0),('6aa2a8b0-ae51-11eb-a37c-9c5c8ed4d803',0),('78b33072-af42-11eb-b5db-9c5c8ed4d803',3600),('80a6fbf9-af3c-11eb-bfc6-9c5c8ed4d803',0),('857e148c-af3a-11eb-9f01-9c5c8ed4d803',0),('85ee2ac6-af2a-11eb-8efb-9c5c8ed4d803',0),('86b6dab8-af3f-11eb-8d02-9c5c8ed4d803',0),('88e115d1-af3d-11eb-80a8-9c5c8ed4d803',0),('8f9600e6-af3e-11eb-aff0-9c5c8ed4d803',0),('95ff40b9-af33-11eb-a2f2-9c5c8ed4d803',0),('962f5dce-af2d-11eb-a280-9c5c8ed4d803',0),('a4e1f79c-af33-11eb-8005-9c5c8ed4d803',0),('a6431ba9-af3b-11eb-9567-9c5c8ed4d803',0),('a97938fd-af3e-11eb-bc9a-9c5c8ed4d803',0),('b1b80a95-af3c-11eb-b482-9c5c8ed4d803',0),('b27a0bcc-af29-11eb-b114-9c5c8ed4d803',0),('cbd2d84d-af35-11eb-9282-9c5c8ed4d803',0),('ea04226a-af33-11eb-af47-9c5c8ed4d803',0),('ea05cd4c-af28-11eb-b6b2-9c5c8ed4d803',0),('ed58b161-ae4d-11eb-9e77-9c5c8ed4d803',0),('f360387b-af3b-11eb-a023-9c5c8ed4d803',0),('f3a40bfa-af35-11eb-8188-9c5c8ed4d803',0);
/*!40000 ALTER TABLE `reward_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(36) NOT NULL,
  `birth_date` date NOT NULL,
  `user_tags` varchar(100) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `reward_profile_id` varchar(36) NOT NULL,
  `avatar_path` varchar(260) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `credit` int DEFAULT '0',
  `premium` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_User_Reward_Profile1_idx` (`reward_profile_id`),
  CONSTRAINT `fk_User_Reward_Profile` FOREIGN KEY (`reward_profile_id`) REFERENCES `reward_profile` (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2adas.5d8c12','1999-01-04','','4e1df3d256693afb3630685668820df4','5d8c12d0-af3e-11eb-a9c9-9c5c8ed4d803','danny','2adasd','',0,0),('adgiu.b1b7e3','1999-01-04','','4e1df3d256693afb3630685668820df4','b1b80a95-af3c-11eb-b482-9c5c8ed4d803','highleg','adgiuasuigbdib','',0,0),('asdas.24ca2e','1999-01-04','','b2086154f101464aab3328ba7e060deb','24ca2ee6-af3e-11eb-94a6-9c5c8ed4d803','highleg','asdasd3434','',0,0),('azdas.a6431b','1999-01-04','','b2086154f101464aab3328ba7e060deb','a6431ba9-af3b-11eb-9567-9c5c8ed4d803','highleg','azdasdasd123','',0,0),('bobbb.80a6fb','1999-01-04','','4e1df3d256693afb3630685668820df4','80a6fbf9-af3c-11eb-bfc6-9c5c8ed4d803','highleg','BOBBBY','',0,0),('bomb.5a692a','1999-01-04','','098f6bcd4621d373cade4e832627b4f6','5a692ad7-af3f-11eb-b7e7-9c5c8ed4d803','test','BOMB','',0,0),('boom.86b6da','1999-01-04','','b2086154f101464aab3328ba7e060deb','86b6dab8-af3f-11eb-8d02-9c5c8ed4d803','test','BOOM','',0,0),('danas.44caeb','1999-01-04','','8e30e04d5af5400ef678fac7b7bebfda','44caeb03-af3b-11eb-a6df-9c5c8ed4d803','highleg','danasdasd','',0,0),('danny.2b4522','1999-01-04','','b2086154f101464aab3328ba7e060deb','2b45228c-af38-11eb-82b5-9c5c8ed4d803','highleg','Danny','',0,0),('danny.857e14','1999-01-04','','8e30e04d5af5400ef678fac7b7bebfda','857e148c-af3a-11eb-9f01-9c5c8ed4d803','highleg','dannyb','',0,0),('dommy.88e115','1999-01-04','','df9d96cdfb38922b73821afad42c02e4','88e115d1-af3d-11eb-80a8-9c5c8ed4d803','highleg','dommy','',0,0),('jimmy.333c12','1999-01-04','','b2086154f101464aab3328ba7e060deb','333c121f-af3a-11eb-a5b0-9c5c8ed4d803','highleg','jimmyt','',0,0),('johnn.f36038','1999-01-04','','b2086154f101464aab3328ba7e060deb','f360387b-af3b-11eb-a023-9c5c8ed4d803','highleg','JOHNNY','',0,0),('johns.379228','1999-01-04','','b2086154f101464aab3328ba7e060deb','37922886-af42-11eb-810c-9c5c8ed4d803','highleg','JohnSmith','',0,0),('johns.39094b','1999-01-04','','b2086154f101464aab3328ba7e060deb','3909728e-af42-11eb-bde0-9c5c8ed4d803','highleg','JohnSmith','',0,0),('john_.78b309','1999-01-04','run, gym, rock','b2086154f101464aab3328ba7e060deb','78b33072-af42-11eb-b5db-9c5c8ed4d803','sam_photo','john','Hello this is my fitness page, I am really proud of it :)',550,1),('john_.962f5d','1999-01-04','','ec5b589f2d0dc8fc727f0e2aafe2ecbd','962f5dce-af2d-11eb-a280-9c5c8ed4d803','highleg','John Ross','',0,0),('john_.ea05cd','1999-01-04','','9fd37f99578a3946036fb09d0994269c','ea05cd4c-af28-11eb-b6b2-9c5c8ed4d803','highleg','John Smith','',0,0),('laure.a4e1f7','1999-01-04','','b2086154f101464aab3328ba7e060deb','a4e1f79c-af33-11eb-8005-9c5c8ed4d803','high','LAuren Thoma','',0,0),('murra.ea0422','1999-01-04','','527bd5b5d689e2c32ae974c6229ff785','ea04226a-af33-11eb-af47-9c5c8ed4d803','high','MurrayC','',0,0),('paul_.ed588a','1999-01-04','gym,cardio,rock','BOB ROSS','ed58b161-ae4d-11eb-9e77-9c5c8ed4d803','highleg','Paul Ross','',0,0),('robbi.f3a40b','1999-01-04','','b2086154f101464aab3328ba7e060deb','f3a40bfa-af35-11eb-8188-9c5c8ed4d803','highleg','RobbieTon','',0,0),('ross_.13b8c0','1999-01-04','','ec5b589f2d0dc8fc727f0e2aafe2ecbd','13b8c0bd-af2e-11eb-abf5-9c5c8ed4d803','highleg','Ross Weller','',0,0),('ross_.24365c','1999-01-04','','ec5b589f2d0dc8fc727f0e2aafe2ecbd','24368396-af2e-11eb-a314-9c5c8ed4d803','highleg','Ross Weller','',0,0),('samue.50c1e2','1999-01-04','','ec5b589f2d0dc8fc727f0e2aafe2ecbd','50c1e2c8-af40-11eb-aebe-9c5c8ed4d803','highleg','SamuelThomas','',0,0),('samue.6024e6','1999-01-04','','ec5b589f2d0dc8fc727f0e2aafe2ecbd','6024e698-af2e-11eb-9b34-9c5c8ed4d803','highleg','SamuelWThomas','',0,0),('samue.663281','1999-01-04','','b2086154f101464aab3328ba7e060deb','66328190-af3c-11eb-b3dd-9c5c8ed4d803','highleg','Samuel','',0,0),('sam_t.6aa281','1999-01-04','john,leg,simp','527bd5b5d689e2c32ae974c6229ff785','6aa2a8b0-ae51-11eb-a37c-9c5c8ed4d803','highleg','ROSS','',0,0),('sam_t.95ff40','1999-01-04','','b2086154f101464aab3328ba7e060deb','95ff40b9-af33-11eb-a2f2-9c5c8ed4d803','high','Sam t','',0,0),('sam_t.b27a0b','1999-01-04','','8e30e04d5af5400ef678fac7b7bebfda','b27a0bcc-af29-11eb-b114-9c5c8ed4d803','highleg','Sam Thomas','',0,0),('semue.cbd2d8','1999-01-04','','b2086154f101464aab3328ba7e060deb','cbd2d84d-af35-11eb-9282-9c5c8ed4d803','highleg','SemuelThomas','',0,0),('steve.85ee2a','1999-01-04','','9fd37f99578a3946036fb09d0994269c','85ee2ac6-af2a-11eb-8efb-9c5c8ed4d803','highleg','Steven Tom','',0,0),('test.3b35b6','1999-01-04','','4e1df3d256693afb3630685668820df4','3b35b700-af3f-11eb-97c0-9c5c8ed4d803','highleg','test','',0,0),('test.8f95d9','1999-01-04','','b2086154f101464aab3328ba7e060deb','8f9600e6-af3e-11eb-aff0-9c5c8ed4d803','test','test','',0,0),('test.a97912','1999-01-04','','098f6bcd4621d373cade4e832627b4f6','a97938fd-af3e-11eb-bc9a-9c5c8ed4d803','test','test','',0,0),('willi.68dd6d','1999-01-04','','8e30e04d5af5400ef678fac7b7bebfda','68dd9455-af33-11eb-84da-9c5c8ed4d803','highleg','William Smith','',0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-11 12:20:10
