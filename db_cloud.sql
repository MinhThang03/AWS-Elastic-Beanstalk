-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: doanclound
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` int DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passreset` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY ` fk_account_role_user_idx` (`roleid`),
  CONSTRAINT ` fk_account_role_user` FOREIGN KEY (`roleid`) REFERENCES `role_user` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','123','Hoang Minh Thang','minhhoangthang75@gmail.com',NULL,NULL,NULL,1,1,NULL,NULL),(2,'haiduong','123','Le Hai Duong','HaiDuong@gmail.com',NULL,NULL,NULL,2,1,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_image` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Toan','https://giasuhanoigioi.edu.vn/wp-content/uploads/2019/08/cach-hoc-gioi-toan-hinh.jpg','THPT 2019-2020'),(2,'Anh Van','https://hongduc.vn/wp-content/uploads/2020/02/tienganh.jpg','THPT 2019-2020');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `file_check` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_course_idx` (`course_id`),
  CONSTRAINT `fk_exam_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'Exam1',1,'true'),(2,'Exam2',2,'true');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preview`
--

DROP TABLE IF EXISTS `preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preview` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `answer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preview_account_idx` (`user_id`),
  KEY `fk_preview_question_idx` (`question_id`),
  CONSTRAINT `fk_preview_account` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_preview_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preview`
--

LOCK TABLES `preview` WRITE;
/*!40000 ALTER TABLE `preview` DISABLE KEYS */;
INSERT INTO `preview` VALUES (1,2,1,'B');
/*!40000 ALTER TABLE `preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int DEFAULT NULL,
  `question_no` int NOT NULL,
  `question_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_a` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_b` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_c` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_d` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_exam_idx` (`exam_id`),
  CONSTRAINT `fk_question_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,1,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(2,1,2,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(3,1,3,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(4,1,4,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(5,1,5,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(6,1,6,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(7,1,7,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(8,1,8,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(9,1,9,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(10,1,10,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(11,1,11,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(12,1,12,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(13,1,13,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(14,1,14,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(15,1,15,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(16,1,16,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(17,1,17,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(18,1,18,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(19,1,19,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(20,1,20,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(21,2,1,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(22,2,2,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(23,2,3,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(24,2,4,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(25,2,5,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(26,2,6,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(27,2,7,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(28,2,8,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(29,2,9,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(30,2,10,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(31,2,11,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(32,2,12,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(33,2,13,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(34,2,14,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(35,2,15,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(36,2,16,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(37,2,17,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(38,2,18,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(39,2,19,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B'),(40,2,20,'Tea or coffee?','A. I\'m going to have tea, please.','B. I\'ll have tea, please.','C. I want to drink','D. All correct','B');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_course`
--

DROP TABLE IF EXISTS `register_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_course_account_idx` (`user_id`),
  KEY `fk_register_course_course_idx` (`course_id`),
  CONSTRAINT `fk_register_course_account` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_register_course_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_course`
--

LOCK TABLES `register_course` WRITE;
/*!40000 ALTER TABLE `register_course` DISABLE KEYS */;
INSERT INTO `register_course` VALUES (1,2,1);
/*!40000 ALTER TABLE `register_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `exam_score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_score_account_idx` (`user_id`),
  KEY `fk_score_exam_idx` (`exam_id`),
  CONSTRAINT `fk_score_account` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_score_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,2,1,0.5);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10 16:58:33
