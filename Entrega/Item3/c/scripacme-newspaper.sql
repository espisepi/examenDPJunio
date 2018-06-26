start transaction;
create database `Acme-Newspaper`;
use `Acme-Newspaper`;
create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';
grant select, insert, update, delete on `Acme-Newspaper`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Newspaper`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: acme-newspaper
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gfgqmtp2f9i5wsojt33xm0uth` (`userAccount_id`),
  KEY `AdminUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (71,0,'admin@acmenewspaper.com','admin 1','+34617557203','postal Adress admin 1','surname admin 1',61),(72,0,'admin2@acmenewspaper.com','admin 2','+34615557203','postal Adress admin 2','surname admin 2',62);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expirationMonth` varchar(255) DEFAULT NULL,
  `expirationYear` varchar(255) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `targetPage` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_pdtmvobr4ousebqlhebxwn7q0` (`title`),
  KEY `FK_7n9ussuxsi3k6rm34vajrccvn` (`agent_id`),
  CONSTRAINT `FK_7n9ussuxsi3k6rm34vajrccvn` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (108,0,'https://sumedico.com/wp-content/uploads/2016/06/C%C3%B3mo_saber_si_tu_gato_te_quiere.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/abci-cinco-policias-heridos-tras-batalla-campal-contra-clanes-estacion-linares-baeza-201804301112_noticia.html','title 1 Agent1',77),(109,0,'https://www.petdarling.com/articulos/wp-content/uploads/2014/11/eliminar-pis-de-gato.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/castilla-leon/abci-hombre-mata-paliza-expareja-burgos-201804300824_noticia.html','title 2 Agent1',77),(110,0,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWHlWg-bUOzO10ILqRtdH_xY9gLwxRUUDFIKJHUTEqbQq3_Cg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/espana/abci-juez-pidio-absolver-manada-no-tiene-ningun-expediente-ultimos-cuatro-anos-201804301228_noticia.html','title 3 Agent1',77),(111,0,'https://t2.uc.ltmcdn.com/images/5/0/6/img_como_saber_si_un_gato_es_macho_o_hembra_con_fotos_10605_600.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 4 Agent2',78),(112,0,'https://cdn3.computerhoy.com/sites/computerhoy.com/files/styles/fullcontent/public/novedades/entender-gato.jpg?itok=GQSe1IVJ','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 5 Agent2 sexo',78),(113,0,'https://img.bekiamascotas.com/articulos/portada/51000/51644-h2.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 6 Agent3 viagra',79),(114,0,'https://sumedico.com/wp-content/uploads/2017/12/por-qu%C3%A9-adoptar-un-gato.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 7 Agent2 cialis',78),(115,0,'https://t2.ea.ltmcdn.com/es/images/3/4/8/img_como_ensenar_a_un_gato_a_sentarse_20843_600.jpg','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707','http://www.abc.es/sociedad/abci-tiempo-puente-mayo-primavera-resiste-volver-201804301655_noticia.html','title 8 Agent3',79);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5cg6nedtnilfs6spfq209syse` (`userAccount_id`),
  KEY `AgentUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_5cg6nedtnilfs6spfq209syse` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (77,0,'agent1@acmenewspaper.com','agent 1','+34652582643','postal Adress agent 1','surname agent 1',67),(78,0,'agent2@acmenewspaper.com','agent 2','+34652582643','postal Adress agent 2','surname agent 2',68),(79,0,'agent3@acmenewspaper.com','agent 3','+34352582643','postal Adress agent 3','surname agent 3',69),(80,0,'agent4@acmenewspaper.com','agent 4','+34654582643','postal Adress agent 4','surname agent 4',70);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `publishedMoment` date DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ipgmt2t51ohhv3v3e7079qt1v` (`draftMode`,`publishedMoment`,`title`,`body`,`summary`,`newspaper_id`,`writer_id`),
  KEY `FK_pftm848lf5hu8sd0vghfs605l` (`newspaper_id`),
  KEY `FK_tushlj62v3v30iqifyful69d` (`writer_id`),
  CONSTRAINT `FK_tushlj62v3v30iqifyful69d` FOREIGN KEY (`writer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pftm848lf5hu8sd0vghfs605l` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (90,0,'body chirp 1','\0','2017-09-20','summary article 1 this article is so long','title article 1 sex',81,73),(91,0,'body chirp 2 cialis','\0','2017-10-21','summary article 1 this article is so long and interesting','title article 2',82,73),(92,0,'body chirp 3','',NULL,'summary article 1 this article is so refreshing','title article 3',83,73),(93,0,'body chirp 4','',NULL,'summary article 1 this article is so long','title article 4',83,73),(94,0,'body chirp 5','\0','2017-09-20','summary article 1 this article is so cool viagra','title article 5',84,75),(95,0,'body chirp 6','\0','2017-09-20','summary especial article 6 this article is so long','title article 6',86,74),(96,0,'body chirp 7','\0','2017-09-20','summary article 1 this article is so long','title article 7',84,75),(97,0,'body impresionante chirp 8','\0','2017-09-20','summary article 1 this article is so long','title article 8',85,76),(98,0,'body chirp 9','\0','2016-10-21','summary article 1 this article is so long','title article 9',86,74),(99,0,'body chirp 10','\0','2016-10-21','summary article 1 this article is so long','title article 10',87,75),(100,0,'body chirp 11','\0','2016-10-21','summary article 1 this article is so long','title article 11',88,74),(101,0,'body chirp 12','\0','2016-10-21','summary article 1 this article is so long','title article 12',89,76);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_pictures`
--

DROP TABLE IF EXISTS `article_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_pictures` (
  `Article_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_slh5rr6y2n4ml5s20v5nlr52g` (`Article_id`),
  CONSTRAINT `FK_slh5rr6y2n4ml5s20v5nlr52g` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_pictures`
--

LOCK TABLES `article_pictures` WRITE;
/*!40000 ALTER TABLE `article_pictures` DISABLE KEYS */;
INSERT INTO `article_pictures` VALUES (90,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(90,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(90,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(91,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(91,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(91,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(92,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(92,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(92,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(93,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(93,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(93,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(94,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(94,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(94,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(95,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(95,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(95,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(96,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(96,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(96,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(97,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(97,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(97,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(98,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(98,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(98,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(99,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(99,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(99,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(100,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(100,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(100,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				'),(101,'https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg\n				'),(101,'https://img.blogs.es/anexom/wp-content/uploads/2016/10/Peridicos-920x515.jpg\n				'),(101,'https://cibercult.files.wordpress.com/2014/06/periodico1.jpg\n				');
/*!40000 ALTER TABLE `article_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem`
--

DROP TABLE IF EXISTS `configurationsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem`
--

LOCK TABLES `configurationsystem` WRITE;
/*!40000 ALTER TABLE `configurationsystem` DISABLE KEYS */;
INSERT INTO `configurationsystem` VALUES (102,0);
/*!40000 ALTER TABLE `configurationsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem_tabooword`
--

DROP TABLE IF EXISTS `configurationsystem_tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem_tabooword` (
  `ConfigurationSystem_id` int(11) NOT NULL,
  `tabooWords_id` int(11) NOT NULL,
  UNIQUE KEY `UK_atoy8roxhv9akeamxs61hujxr` (`tabooWords_id`),
  KEY `FK_4uqlduhykfkaeldgil1dx4ehl` (`ConfigurationSystem_id`),
  CONSTRAINT `FK_4uqlduhykfkaeldgil1dx4ehl` FOREIGN KEY (`ConfigurationSystem_id`) REFERENCES `configurationsystem` (`id`),
  CONSTRAINT `FK_atoy8roxhv9akeamxs61hujxr` FOREIGN KEY (`tabooWords_id`) REFERENCES `tabooword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem_tabooword`
--

LOCK TABLES `configurationsystem_tabooword` WRITE;
/*!40000 ALTER TABLE `configurationsystem_tabooword` DISABLE KEYS */;
INSERT INTO `configurationsystem_tabooword` VALUES (102,103),(102,104),(102,105),(102,106);
/*!40000 ALTER TABLE `configurationsystem_tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_omxvm61kuh8u4xoitu7p0lxst` (`publicationDate`,`title`,`description`,`publisher_id`),
  KEY `FK_6w4ywp7unfjqi2kflvm35ie1g` (`publisher_id`),
  CONSTRAINT `FK_6w4ywp7unfjqi2kflvm35ie1g` FOREIGN KEY (`publisher_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (81,0,'description newspaper 1','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 1',73),(82,0,'description newspaper 2 sex','https://supergracioso.com/wp-content/uploads/2015/05/Errores-en-peri%C3%B3dicos-%C2%A1INCRE%C3%8DBLES-Parte-I.jpg',NULL,'title newspaper 2',73),(83,0,'description newspaper 3','https://supergracioso.com/wp-content/uploads/2015/05/Errores-en-peri%C3%B3dicos-%C2%A1INCRE%C3%8DBLES-Parte-I.jpg',NULL,'title accidente newspaper 3',73),(84,0,'description newspaper 4','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 4',75),(85,0,'description newspaper 5 cialis','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 5',76),(86,0,'description amanecer newspaper 6','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 6',74),(87,0,'description newspaper 7','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title terror newspaper 7',75),(88,0,'description newspaper 8','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg','2017-09-21','title newspaper 8',74),(89,0,'description newspaper 9','https://www.cerebriti.com/uploads/0b8d55790024b6a75aeb4d9772ae2706.jpg',NULL,'title newspaper 9',76);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_advertisement`
--

DROP TABLE IF EXISTS `newspaper_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_advertisement` (
  `Newspaper_id` int(11) NOT NULL,
  `advertisements_id` int(11) NOT NULL,
  UNIQUE KEY `UK_tb7o1y9ulk08rvr5l4xqt0myr` (`advertisements_id`),
  KEY `FK_97th6woe726kprc71xhahdq9f` (`Newspaper_id`),
  CONSTRAINT `FK_97th6woe726kprc71xhahdq9f` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_tb7o1y9ulk08rvr5l4xqt0myr` FOREIGN KEY (`advertisements_id`) REFERENCES `advertisement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_advertisement`
--

LOCK TABLES `newspaper_advertisement` WRITE;
/*!40000 ALTER TABLE `newspaper_advertisement` DISABLE KEYS */;
INSERT INTO `newspaper_advertisement` VALUES (82,108),(82,111),(82,113),(83,109),(83,112),(85,110),(85,114),(85,115);
/*!40000 ALTER TABLE `newspaper_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabooword`
--

DROP TABLE IF EXISTS `tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabooword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `default_word` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabooword`
--

LOCK TABLES `tabooword` WRITE;
/*!40000 ALTER TABLE `tabooword` DISABLE KEYS */;
INSERT INTO `tabooword` VALUES (103,0,'','sex'),(104,0,'','sexo'),(105,0,'','viagra'),(106,0,'','cialis'),(107,0,'\0','cialis 1');
/*!40000 ALTER TABLE `tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troblem`
--

DROP TABLE IF EXISTS `troblem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troblem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `gauge` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qxjtui3vehe79qei8s6rbayri` (`ticker`),
  KEY `UK_crxp042w99xwclevi6jttr6j2` (`draftMode`,`moment`,`newspaper_id`,`admin_id`),
  KEY `FK_2qjl8liwrdxyprlh2a248gtgm` (`admin_id`),
  KEY `FK_gxp6n4489a90dwnmlhh38583g` (`newspaper_id`),
  CONSTRAINT `FK_gxp6n4489a90dwnmlhh38583g` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_2qjl8liwrdxyprlh2a248gtgm` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troblem`
--

LOCK TABLES `troblem` WRITE;
/*!40000 ALTER TABLE `troblem` DISABLE KEYS */;
INSERT INTO `troblem` VALUES (116,0,'description1','\0',1,'2020-02-02 13:00:00','18:ir:06:12345:26','title1',71,81),(117,0,'description2','\0',2,'2020-02-02 13:48:00','18:iG:06:12343:25','title2',71,82),(118,0,'description3','\0',3,'2018-06-25 15:22:00','18:hk:06:12375:25','title3',72,81),(119,0,'description4','\0',1,'2020-02-02 16:32:00','18:ir:06:12387:22','title4',72,82),(120,0,'description5','\0',2,'2018-06-20 16:32:00','18:ir:06:16345:20','title5',71,83);
/*!40000 ALTER TABLE `troblem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  KEY `UserUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (73,0,'user1@acmenewspaper.com','user 1','+34617557203','postal Adress user 1','surname user 1',63),(74,0,'user2@acmenewspaper.com','user 2','+34617557203','postal Adress user 2','surname user 2',64),(75,0,'user3@acmenewspaper.com','user 3','+34648213455','postal Adress user 3','surname user 3',65),(76,0,'user4@acmenewspaper.com','user 4','+34648213455','postal Adress user 4','surname user 4',66);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (61,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(62,0,'c84258e9c39059a89ab77d846ddab909','admin2'),(63,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(64,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(65,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(66,0,'3f02ebe3d7929b091e3d8ccfde2f3bc6','user4'),(67,0,'83a87fd756ab57199c0bb6d5e11168cb','agent1'),(68,0,'b1a4a6b01cc297d4677c4ca6656e14d7','agent2'),(69,0,'6f097a447415dd5030d579a9051165f0','agent3'),(70,0,'0d7745d57a8ae3fcacdd9fe6e54cac8a','agent4');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (61,'ADMIN'),(62,'ADMIN'),(63,'USER'),(64,'USER'),(65,'USER'),(66,'USER'),(67,'AGENT'),(68,'AGENT'),(69,'AGENT'),(70,'AGENT');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-26 17:13:19

commit;