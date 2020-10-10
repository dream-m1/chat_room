-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: chat
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `name` varchar(10) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('wang','你好呀','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar5.png','2020-09-30 00:00:00'),('miao','不好啊','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 10:44:15'),('miao','你好啊','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 10:44:32'),('miao','真好啊','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 10:45:14'),('miao','哎呀','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 10:46:08'),('wang','nihao','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar2.png','2020-09-30 12:23:40'),('wang','一帆','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:34:23'),('赵','哈哈哈','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar3.png','2020-09-30 12:35:01'),('wang','哈哈，老师懒了','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:35:21'),('zhao','我又来了','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar5.png','2020-09-30 12:37:31'),('zhao','这个是个啥头像','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar5.png','2020-09-30 12:37:49'),('wang','嗯呢','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:37:50'),('zhao','老年人头像','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar5.png','2020-09-30 12:37:55'),('wang','随机选的','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:37:58'),('wang','每次登录都不一样','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:38:05'),('wang','可能审美不太好','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:38:29'),('wang','我关闭了','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar4.png','2020-09-30 12:42:04'),('sdddf','bggbh','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar5.png','2020-09-30 18:32:38'),('wang','123','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 18:33:40'),('sdddf','321','http://by-image.oss-cn-shanghai.aliyuncs.com/frontend/chat/avatar1.png','2020-09-30 18:33:46');
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

-- Dump completed on 2020-10-10 15:13:44
