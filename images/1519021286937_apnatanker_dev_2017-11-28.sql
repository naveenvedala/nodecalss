# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 35.193.251.202 (MySQL 5.7.14-google-log)
# Database: apnatanker_dev
# Generation Time: 2017-11-28 09:08:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` varchar(30) NOT NULL,
  `lane` varchar(99) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT 'India',
  `zipcode` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`id`, `lane`, `city`, `state`, `country`, `zipcode`)
VALUES
	('JAHU8NX1',NULL,NULL,NULL,'India',NULL),
	('JAHUNXBS',NULL,NULL,NULL,'India',NULL),
	('JAJ8EVJE',NULL,NULL,NULL,'India',NULL),
	('SUPPORT_DL_ADDRESS',NULL,NULL,NULL,'India',NULL);

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table agency_grp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agency_grp`;

CREATE TABLE `agency_grp` (
  `id` varchar(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `logo` longtext,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `agency_grp` WRITE;
/*!40000 ALTER TABLE `agency_grp` DISABLE KEYS */;

INSERT INTO `agency_grp` (`id`, `name`, `title`, `logo`, `status`)
VALUES
	('CMP0001','CMP0001','Company',NULL,1),
	('CMP0002','CMP0001','Company',NULL,1),
	('DL','Digital Lync Tech','DLTech',NULL,1),
	('Orange','Orange Travels','Orange Travles',NULL,1);

/*!40000 ALTER TABLE `agency_grp` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table apex_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apex_data`;

CREATE TABLE `apex_data` (
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `apex_data_uq_name_code` (`name`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `apex_data` WRITE;
/*!40000 ALTER TABLE `apex_data` DISABLE KEYS */;

INSERT INTO `apex_data` (`name`, `code`, `status`)
VALUES
	('Admin','ROLE',1),
	('Basic','ROLE',1),
	('NA','ROLE',1),
	('SuperAdmin','ROLE',1),
	('User','ROLE',1);

/*!40000 ALTER TABLE `apex_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table apex_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apex_menu`;

CREATE TABLE `apex_menu` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `role` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '999',
  `updated_by` varchar(30) DEFAULT 'system',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table apex_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apex_report`;

CREATE TABLE `apex_report` (
  `id` varchar(30) NOT NULL,
  `name` varchar(99) NOT NULL,
  `report_url` varchar(99) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table apex_report_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apex_report_data`;

CREATE TABLE `apex_report_data` (
  `id` varchar(30) NOT NULL,
  `name` varchar(99) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `apex_report_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apex_report_data_fk_apex_report_id` (`apex_report_id`),
  CONSTRAINT `apex_report_data_fk_apex_report_id` FOREIGN KEY (`apex_report_id`) REFERENCES `apex_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table app_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_data`;

CREATE TABLE `app_data` (
  `id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `grpcode` varchar(9) NOT NULL,
  `updated_by` varchar(30) NOT NULL DEFAULT 'system',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_data_uq_name_code_grpcode` (`name`,`code`,`grpcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table branch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pan` varchar(30) DEFAULT NULL,
  `tan` varchar(30) DEFAULT NULL,
  `gstin` varchar(30) DEFAULT NULL,
  `lat` varchar(99) DEFAULT NULL,
  `lng` varchar(99) DEFAULT NULL,
  `address` varchar(99) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `country` varchar(30) NOT NULL DEFAULT 'India',
  `zipcode` int(8) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `grpcode` varchar(9) NOT NULL,
  `updated_by` varchar(30) DEFAULT 'system',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;

INSERT INTO `branch` (`id`, `name`, `phone`, `mobile`, `email`, `pan`, `tan`, `gstin`, `lat`, `lng`, `address`, `city`, `state`, `country`, `zipcode`, `is_main`, `active`, `grpcode`, `updated_by`, `updated_on`)
VALUES
	('CMP0001','branchname','80080','80080','abcd@gmail.com','effcd5462n','','','120','180',NULL,'Hyderabad','Telangana','India',500089,1,1,'CMP0001','system','2017-11-27 06:54:19'),
	('CMP0002','branchname','80080','80080','abcd@gmail.com','effcd5462n','','','120','180',NULL,'Hyderabad','Telangana','India',500089,1,1,'CMP0002','system','2017-11-27 07:06:11'),
	('DL_MAIN_BRANCH','DL Tech',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'India',NULL,1,1,'DLTECH','system','2017-11-22 14:52:06'),
	('Orange','Miyapur','80080','80080','orange@gmail.com','effcd5462n','','','120','180',NULL,'Hyderabad','Telangana','India',500089,1,1,'Orange','system','2017-11-28 06:18:53');

/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table consumer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `consumer`;

CREATE TABLE `consumer` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(99) DEFAULT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `address_id` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `grpcode` varchar(9) NOT NULL,
  `updated_by` varchar(30) NOT NULL DEFAULT 'system',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `consumer_fk_address_id` (`address_id`),
  CONSTRAINT `consumer_fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table img
# ------------------------------------------------------------

DROP TABLE IF EXISTS `img`;

CREATE TABLE `img` (
  `id` varchar(30) NOT NULL,
  `name` varchar(99) DEFAULT 'upload',
  `src` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;

INSERT INTO `img` (`id`, `name`, `src`)
VALUES
	('JAHU8NX1','upload',NULL),
	('JAHUNXBS','upload',NULL),
	('JAJ8EVJE','upload',NULL),
	('SUPPORT_DL_IMG','upload',NULL);

/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'Anonymous',
  `mobile` varchar(15) NOT NULL,
  `email` varchar(99) DEFAULT NULL,
  `aadhar` varchar(99) DEFAULT NULL,
  `password` varchar(30) NOT NULL DEFAULT '1234',
  `role` varchar(30) NOT NULL DEFAULT 'User',
  `address_id` varchar(30) NOT NULL,
  `branch_id` varchar(30) NOT NULL,
  `img_id` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `grpcode` varchar(9) NOT NULL,
  `created_by` varchar(30) NOT NULL DEFAULT 'system',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(30) NOT NULL DEFAULT 'system',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `profile_fk_address_id` (`address_id`),
  KEY `profile_fk_img_id` (`img_id`),
  KEY `profile_fk_branch_id` (`branch_id`),
  CONSTRAINT `profile_fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `profile_fk_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `profile_fk_img_id` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;

INSERT INTO `profile` (`id`, `name`, `mobile`, `email`, `aadhar`, `password`, `role`, `address_id`, `branch_id`, `img_id`, `active`, `grpcode`, `created_by`, `created_on`, `updated_by`, `updated_on`)
VALUES
	('JAHU8NX1','abcd','123456789','abcd@gmail.com','123456781234','1234','SuperAdmin','JAHU8NX1','CMP0001','JAHU8NX1',1,'CMP0001','system','2017-11-27 06:54:19','system','2017-11-27 06:54:19'),
	('JAHUNXBS','abcd','123456789','abcd@gmail.com','123456781234','1234','SuperAdmin','JAHUNXBS','CMP0002','JAHUNXBS',1,'CMP0002','system','2017-11-27 07:06:11','system','2017-11-27 07:06:11'),
	('JAJ8EVJE','Baddam Veera','8008012345','orange@gmail.com','123456781234','1234','SuperAdmin','JAJ8EVJE','Orange','JAJ8EVJE',1,'Orange','system','2017-11-28 06:18:58','system','2017-11-28 06:18:58'),
	('SUPPORT_DL','Support User','123456789','support@digitallynctech.com',NULL,'1234','SuperAdmin','SUPPORT_DL_ADDRESS','DL_MAIN_BRANCH','SUPPORT_DL_IMG',1,'DLTECH','system','2017-11-22 14:52:12','system','2017-11-22 14:52:12');

/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
