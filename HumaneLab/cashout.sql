-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cashout
CREATE DATABASE IF NOT EXISTS `cashout` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cashout`;

-- Dumping structure for table cashout.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4181 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.apartments: ~1 rows (approximately)
DELETE FROM `apartments`;
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(4177, 'apartment51489', 'apartment5', 'Fantastic Plaza 1489', 'ANN17174'),
	(4178, 'apartment48322', 'apartment4', 'Tinsel Towers 8322', 'CNO96554'),
	(4179, 'apartment36655', 'apartment3', 'Integrity Way 6655', 'IRN76466'),
	(4180, 'apartment58061', 'apartment5', 'Fantastic Plaza 8061', 'NIM40779');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;

-- Dumping structure for table cashout.api_tokens
CREATE TABLE IF NOT EXISTS `api_tokens` (
  `token` varchar(255) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `time` int(25) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.api_tokens: ~0 rows (approximately)
DELETE FROM `api_tokens`;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;

-- Dumping structure for table cashout.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `steam` (`steam`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.bans: ~0 rows (approximately)
DELETE FROM `bans`;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table cashout.bills
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.bills: ~0 rows (approximately)
DELETE FROM `bills`;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;

-- Dumping structure for table cashout.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.crypto: ~0 rows (approximately)
DELETE FROM `crypto`;
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;

-- Dumping structure for table cashout.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=939 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.crypto_transactions: ~0 rows (approximately)
DELETE FROM `crypto_transactions`;
/*!40000 ALTER TABLE `crypto_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto_transactions` ENABLE KEYS */;

-- Dumping structure for table cashout.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.dealers: ~0 rows (approximately)
DELETE FROM `dealers`;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;

-- Dumping structure for table cashout.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cashout.fine_types: ~52 rows (approximately)
DELETE FROM `fine_types`;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(53, 'Misuse of a horn', 30, 0, 1),
	(54, 'Illegally Crossing a continuous Line', 40, 0, 1),
	(55, 'Driving on the wrong side of the road', 250, 0, 100),
	(56, 'Illegal U-Turn', 250, 0, 100),
	(57, 'Illegally Driving Off-road', 170, 0, 100),
	(58, 'Refusing a Lawful Command', 30, 0, 1),
	(59, 'Illegally Stoped of a Vehicle', 150, 0, 100),
	(60, 'Illegal Parking', 70, 0, 1),
	(61, 'Failing to Yield to the right', 70, 0, 1),
	(62, 'Failure to comply with Vehicle Information', 90, 0, 1),
	(63, 'Failing to stop at a Stop Sign ', 105, 0, 100),
	(64, 'Failing to stop at a Red Light', 130, 0, 100),
	(65, 'Illegal Passing', 100, 0, 100),
	(66, 'Driving an illegal Vehicle', 100, 0, 100),
	(67, 'Driving without a License', 1500, 0, 100),
	(68, 'Hit and Run', 800, 0, 100),
	(69, 'Exceeding Speeds Over < 5 mph', 90, 0, 1),
	(70, 'Exceeding Speeds Over 5-15 mph', 120, 0, 100),
	(71, 'Exceeding Speeds Over 15-30 mph', 180, 0, 100),
	(72, 'Exceeding Speeds Over > 30 mph', 300, 0, 100),
	(73, 'Impeding traffic flow', 110, 1, 100),
	(74, 'Public Intoxication', 90, 1, 100),
	(75, 'Disorderly conduct', 90, 1, 100),
	(76, 'Obstruction of Justice', 130, 1, 100),
	(77, 'Insults towards Civilans', 75, 1, 1),
	(78, 'Disrespecting of an LEO', 110, 1, 100),
	(79, 'Verbal Threat towards a Civilan', 90, 1, 100),
	(80, 'Verbal Threat towards an LEO', 150, 1, 100),
	(81, 'Providing False Information', 250, 1, 100),
	(82, 'Attempt of Corruption', 1500, 1, 100),
	(83, 'Brandishing a weapon in city Limits', 120, 2, 100),
	(84, 'Brandishing a Lethal Weapon in city Limits', 300, 2, 100),
	(85, 'No Firearms License', 600, 2, 100),
	(86, 'Possession of an Illegal Weapon', 700, 2, 100),
	(87, 'Possession of Burglary Tools', 300, 2, 100),
	(88, 'Grand Theft Auto', 1800, 2, 100),
	(89, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2, 100),
	(90, 'Frabrication of an Illegal Substance', 1500, 2, 100),
	(91, 'Possession of an Illegal Substance ', 650, 2, 100),
	(92, 'Kidnapping of a Civilan', 1500, 2, 100),
	(93, 'Kidnapping of an LEO', 2000, 2, 100),
	(94, 'Robbery', 650, 2, 100),
	(95, 'Armed Robbery of a Store', 650, 2, 100),
	(96, 'Armed Robbery of a Bank', 1500, 2, 100),
	(97, 'Assault on a Civilian', 2000, 3, 100),
	(98, 'Assault of an LEO', 2500, 3, 100),
	(99, 'Attempt of Murder of a Civilian', 3000, 3, 100),
	(100, 'Attempt of Murder of an LEO', 5000, 3, 100),
	(101, 'Murder of a Civilian', 10000, 3, 100),
	(102, 'Murder of an LEO', 30000, 3, 100),
	(103, 'Involuntary manslaughter', 1800, 3, 100),
	(104, 'Fraud', 2000, 2, 100);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table cashout.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `grades` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.gangs: ~0 rows (approximately)
DELETE FROM `gangs`;
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;

-- Dumping structure for table cashout.gang_territoriums
CREATE TABLE IF NOT EXISTS `gang_territoriums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang` varchar(50) DEFAULT NULL,
  `points` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.gang_territoriums: ~0 rows (approximately)
DELETE FROM `gang_territoriums`;
/*!40000 ALTER TABLE `gang_territoriums` DISABLE KEYS */;
/*!40000 ALTER TABLE `gang_territoriums` ENABLE KEYS */;

-- Dumping structure for table cashout.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.gloveboxitems: ~0 rows (approximately)
DELETE FROM `gloveboxitems`;
/*!40000 ALTER TABLE `gloveboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `gloveboxitems` ENABLE KEYS */;

-- Dumping structure for table cashout.gloveboxitemsnew
CREATE TABLE IF NOT EXISTS `gloveboxitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1555 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.gloveboxitemsnew: ~0 rows (approximately)
DELETE FROM `gloveboxitemsnew`;
/*!40000 ALTER TABLE `gloveboxitemsnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `gloveboxitemsnew` ENABLE KEYS */;

-- Dumping structure for table cashout.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(2) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.houselocations: ~0 rows (approximately)
DELETE FROM `houselocations`;
/*!40000 ALTER TABLE `houselocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `houselocations` ENABLE KEYS */;

-- Dumping structure for table cashout.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7125 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.house_plants: ~0 rows (approximately)
DELETE FROM `house_plants`;
/*!40000 ALTER TABLE `house_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_plants` ENABLE KEYS */;

-- Dumping structure for table cashout.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `grades` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table cashout.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.lapraces: ~0 rows (approximately)
DELETE FROM `lapraces`;
/*!40000 ALTER TABLE `lapraces` DISABLE KEYS */;
/*!40000 ALTER TABLE `lapraces` ENABLE KEYS */;

-- Dumping structure for table cashout.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.mdt_reports: ~4 rows (approximately)
DELETE FROM `mdt_reports`;
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
INSERT INTO `mdt_reports` (`id`, `char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`, `jailtime`) VALUES
	(1, 'CNH70471', 'Ts', 'tr', '{"Driving on the wrong side of the road":1}', 'Kapi Kapi', 'Kapi Kapi', '07-26-2020 04:17:25', 1),
	(2, 'CNH70471', 'Tsouli kapi', 'Tsouli kapi', '{"Driving on the wrong side of the road":1}', 'Kapi Kapi', 'Kapi Kapi', '07-26-2020 04:19:45', NULL),
	(4, 'RKQ69112', 'Evading, Assualt on LEO', 'suspect jumped out the car ran than tried to pull out a knife on me I pull out my gun it jammed so I defened myself with a baton', '{"Assault of an LEO":1}', 'Connor Row', 'Ray Rose', '07-26-2020 20:50:20', 24),
	(5, 'QFL17005', 'test', 'test', '{"Misuse of a horn":1}', 'Kapi Kapi', 'andre williams', '07-27-2020 08:46:09', 2);
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for table cashout.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` varchar(48) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.mdt_warrants: ~0 rows (approximately)
DELETE FROM `mdt_warrants`;
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

-- Dumping structure for table cashout.moneysafes
CREATE TABLE IF NOT EXISTS `moneysafes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `safe` varchar(50) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `transactions`  text NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.moneysafes: ~0 rows (approximately)
DELETE FROM `moneysafes`;
/*!40000 ALTER TABLE `moneysafes` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneysafes` ENABLE KEYS */;

-- Dumping structure for table cashout.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.occasion_vehicles: ~0 rows (approximately)
DELETE FROM `occasion_vehicles`;
/*!40000 ALTER TABLE `occasion_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `occasion_vehicles` ENABLE KEYS */;

-- Dumping structure for table cashout.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.permissions: ~1 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `steam`, `license`, `permission`) VALUES
	(92, 'Vincent', 'steam:11000013374b4d7', 'license:7315614b02543b6e98fde0b173c1368dd0f7f1bc', 'god'),
	(93, 'HairyMuscrat', 'steam:11000010916dd6e', 'license:bba9ab4da601b7f1175aa8f2591197d15e052ac9', 'god'),
	(94, 'Big Flawda', 'steam:11000011108205a', 'license:1e923b6ec34263904f9b81c7f048efabdd8b523f', 'god'),
	(95, 'Sino', 'steam:110000113c8b893', 'license:daade16d81ba40b32e9c2c4831864247d2c81c67', 'god');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table cashout.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `invoiceid` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.phone_invoices: ~0 rows (approximately)
DELETE FROM `phone_invoices`;
/*!40000 ALTER TABLE `phone_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_invoices` ENABLE KEYS */;

-- Dumping structure for table cashout.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=6734 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.phone_messages: ~0 rows (approximately)
DELETE FROM `phone_messages`;
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table cashout.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=5436 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.phone_tweets: ~0 rows (approximately)
DELETE FROM `phone_tweets`;
/*!40000 ALTER TABLE `phone_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_tweets` ENABLE KEYS */;

-- Dumping structure for table cashout.playerammo
CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3638 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.playerammo: ~0 rows (approximately)
DELETE FROM `playerammo`;
/*!40000 ALTER TABLE `playerammo` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerammo` ENABLE KEYS */;

-- Dumping structure for table cashout.playeritems
CREATE TABLE IF NOT EXISTS `playeritems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255891 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.playeritems: ~0 rows (approximately)
DELETE FROM `playeritems`;
/*!40000 ALTER TABLE `playeritems` DISABLE KEYS */;
/*!40000 ALTER TABLE `playeritems` ENABLE KEYS */;

-- Dumping structure for table cashout.players
CREATE TABLE IF NOT EXISTS `players` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`),
  KEY `last_updated` (`last_updated`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB AUTO_INCREMENT=4228 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.players: ~1 rows (approximately)
DELETE FROM `players`;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`#`, `citizenid`, `cid`, `steam`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(4224, 'ANN17174', 1, 'steam:11000013374b4d7', 'license:7315614b02543b6e98fde0b173c1368dd0f7f1bc', 'Vincent', '{"crypto":0,"bank":18360,"cash":340}', '{"nationality":"Italian","backstory":"placeholder backstory","phone":"0614797634","cid":"1","gender":0,"account":"US07CASH8094984765","firstname":"Vincent","lastname":"Bocelli","birthdate":"1988-05-18"}', '{"name":"tow","label":"Tow","payment":100,"onduty":true}', '{"name":"None","label":"No Gang"}', '{"a":63.287464141846,"x":251.25415039063,"y":-356.64459228516,"z":44.636371612549}', '{"licences":{"driver":true,"business":false},"inlaststand":false,"fingerprint":"cX566f07vil1103","tracker":false,"currentapartment":"apartment51489","attachmentcraftingrep":0,"dealerrep":0,"commandbinds":{"F5":{"command":"","argument":""},"F3":{"command":"","argument":""},"F2":{"command":"admin","argument":""},"F6":{"command":"","argument":""},"F7":{"command":"","argument":""},"F10":{"command":"","argument":""},"F9":{"command":"noclip","argument":""}},"bloodtype":"AB+","hunger":87.4,"inside":{"apartment":[]},"stress":0,"callsign":"NO CALLSIGN","armor":0,"phone":[],"craftingrep":0,"injail":0,"criminalrecord":{"hasRecord":false},"walletid":"CA-16585286","jailitems":[],"jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"ishandcuffed":false,"fitbit":[],"isdead":false,"status":[],"thirst":88.6}', '[{"slot":1,"type":"item","amount":1,"name":"phone","info":[]},{"slot":3,"type":"item","amount":1,"name":"whitebandana","info":[]},{"slot":4,"type":"item","amount":1,"name":"ballasbandana","info":[]},{"slot":5,"type":"item","amount":1,"name":"bloodsbandana","info":[]},{"slot":6,"type":"item","amount":2,"name":"water_bottle","info":[]},{"slot":12,"type":"item","amount":1,"name":"vagosbandana","info":[]},{"slot":13,"type":"item","amount":1,"name":"orangebandana","info":[]},{"slot":14,"type":"item","amount":1,"name":"xtcbaggy","info":[]},{"slot":15,"type":"item","amount":1,"name":"weed_sour-diesel","info":[]}]', '2020-08-17 09:09:26'),
	(4225, 'CNO96554', 1, 'steam:11000010916dd6e', 'license:bba9ab4da601b7f1175aa8f2591197d15e052ac9', 'HairyMuscrat', '{"cash":600,"crypto":0,"bank":500}', '{"gender":0,"firstname":"Test","backstory":"placeholder backstory","nationality":"Test","lastname":"Test","account":"US06CASH7242644313","birthdate":"2000-08-09","phone":"0659654405","cid":"1"}', '{"label":"Unemployed","name":"unemployed","onduty":true,"payment":10}', '{"label":"No Gang","name":"None"}', '{"a":0.0,"x":195.15884399414,"y":-932.34362792969,"z":30.686813354492}', '{"criminalrecord":{"hasRecord":false},"currentapartment":"apartment48322","craftingrep":0,"attachmentcraftingrep":0,"stress":0,"commandbinds":{"F5":{"command":"","argument":""},"F6":{"command":"","argument":""},"F7":{"command":"","argument":""},"F3":{"command":"","argument":""},"F2":{"command":"admin","argument":""},"F9":{"command":"","argument":""},"F10":{"command":"","argument":""}},"armor":0,"ishandcuffed":false,"walletid":"CA-25887044","callsign":"NO CALLSIGN","fingerprint":"vi711E30HQp1818","thirst":100,"inside":{"apartment":[]},"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"fitbit":[],"licences":{"business":false,"driver":true},"bloodtype":"AB-","injail":0,"hunger":100,"tracker":false,"isdead":false,"dealerrep":0,"inlaststand":false,"jailitems":[],"phone":[],"status":[]}', '[{"type":"item","slot":1,"name":"metalscrap","info":[],"amount":5}]', '2020-08-17 06:08:19'),
	(4226, 'IRN76466', 1, 'steam:11000011108205a', 'license:1e923b6ec34263904f9b81c7f048efabdd8b523f', 'Big Flawda', '{"cash":384,"crypto":0,"bank":520}', '{"gender":0,"firstname":"Andre","backstory":"placeholder backstory","cid":"1","lastname":"Williams","account":"US02CASH7357530762","birthdate":"1992-12-03","phone":"0632511393","nationality":"Black"}', '{"label":"Unemployed","name":"unemployed","onduty":true,"payment":10}', '{"label":"No Gang","name":"None"}', '{"a":194.81971740723,"x":99.027770996094,"y":-1116.5958251953,"z":29.327062606812}', '{"criminalrecord":{"hasRecord":false},"currentapartment":"apartment36655","craftingrep":0,"inside":{"apartment":[]},"phone":[],"stress":0,"armor":0,"fingerprint":"uq392Y07KWk0308","walletid":"CA-53591579","dealerrep":0,"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"thirst":92.4,"callsign":"NO CALLSIGN","status":[],"bloodtype":"B-","attachmentcraftingrep":0,"ishandcuffed":false,"injail":0,"hunger":91.6,"tracker":false,"isdead":false,"licences":{"business":false,"driver":true},"inlaststand":false,"jailitems":[],"commandbinds":[],"fitbit":[]}', '[{"type":"item","slot":1,"name":"phone","info":[],"amount":1},{"type":"item","slot":2,"name":"bloodsbandana","info":[],"amount":1},{"type":"item","slot":3,"name":"ballasbandana","info":[],"amount":1}]', '2020-08-17 06:05:46'),
	(4227, 'NIM40779', 1, 'steam:110000113c8b893', 'license:daade16d81ba40b32e9c2c4831864247d2c81c67', 'Sino', '{"crypto":0,"bank":12520,"cash":400}', '{"nationality":"african american","backstory":"placeholder backstory","phone":"0665839301","gender":0,"cid":"1","account":"US05CASH5994520959","firstname":"sino","lastname":"jones","birthdate":"2000-08-23"}', '{"name":"police","onduty":false,"payment":6000,"label":"Police"}', '{"name":"None","label":"No Gang"}', '{"a":203.123046875,"x":443.64981079102,"y":-982.19818115234,"z":30.689556121826}', '{"licences":{"driver":true,"business":false},"inlaststand":false,"fingerprint":"jf079i71FEQ0137","tracker":false,"currentapartment":"apartment58061","attachmentcraftingrep":0,"dealerrep":0,"commandbinds":{"F5":{"command":"","argument":""},"F3":{"command":"","argument":""},"F2":{"command":"","argument":""},"F6":{"command":"","argument":""},"F7":{"command":"","argument":""},"F10":{"command":"","argument":""},"F9":{"command":"admin","argument":""}},"bloodtype":"AB+","hunger":83.2,"walletid":"CA-27685546","stress":10,"callsign":"NO CALLSIGN","armor":0,"phone":[],"craftingrep":0,"jailitems":[],"criminalrecord":{"hasRecord":false},"thirst":84.8,"injail":0,"jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"inside":{"apartment":[]},"fitbit":[],"isdead":false,"status":[],"ishandcuffed":false}', '[{"slot":1,"type":"item","amount":1,"name":"phone","info":[]},{"slot":2,"type":"item","amount":1,"name":"cripsbandana","info":[]},{"slot":3,"type":"weapon","amount":1,"name":"weapon_appistol","info":{"ammo":10,"quality":97.6,"serie":"81riR2pg466MJkY"}},{"slot":4,"type":"item","amount":4,"name":"pistol_ammo","info":[]}]', '2020-08-17 09:19:54');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table cashout.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=43123 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.playerskins: ~1 rows (approximately)
DELETE FROM `playerskins`;
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(43109, 'CNO96554', '1885233650', '{"beard":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"hair":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"face":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"glass":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"makeup":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"arms":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"bracelet":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"watch":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"hat":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"ear":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"shoes":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"t-shirt":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"blush":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1}}', 1),
	(43113, 'ANN17174', '1885233650', '{"arms":{"item":16,"defaultItem":0,"defaultTexture":0,"texture":0},"shoes":{"item":10,"defaultItem":1,"defaultTexture":0,"texture":0},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"beard":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"pants":{"item":10,"defaultItem":0,"defaultTexture":0,"texture":0},"lipstick":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"glass":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"face":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":5},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"accessory":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"vest":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"ear":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"ageing":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"blush":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"bag":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0},"mask":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"torso2":{"item":39,"defaultItem":0,"defaultTexture":0,"texture":0},"hair":{"item":9,"defaultItem":0,"defaultTexture":0,"texture":0},"t-shirt":{"item":33,"defaultItem":1,"defaultTexture":0,"texture":0},"watch":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"eyebrows":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"makeup":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1}}', 1),
	(43117, 'IRN76466', '1885233650', '{"ear":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"ageing":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"face":{"defaultTexture":0,"texture":15,"defaultItem":0,"item":2},"t-shirt":{"defaultTexture":0,"texture":1,"defaultItem":1,"item":0},"bag":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":13},"decals":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"shoes":{"defaultTexture":0,"texture":2,"defaultItem":1,"item":0},"bracelet":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"blush":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"arms":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"hat":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"glass":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"torso2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":1},"pants":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":5},"beard":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":6},"watch":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"hair":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":76},"makeup":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"accessory":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"lipstick":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"eyebrows":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"vest":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"mask":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0}}', 1),
	(43122, 'NIM40779', '1885233650', '{"beard":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":5},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"makeup":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"watch":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":1},"hair":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":1},"blush":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"eyebrows":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":3},"ear":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":6},"hat":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"shoes":{"texture":9,"defaultTexture":0,"defaultItem":1,"item":4},"glass":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":13},"torso2":{"texture":3,"defaultTexture":0,"defaultItem":0,"item":3},"ageing":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":2},"lipstick":{"texture":1,"defaultTexture":1,"defaultItem":-1,"item":-1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"face":{"texture":8,"defaultTexture":0,"defaultItem":0,"item":2},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":17},"bracelet":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0}}', 1);
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;

-- Dumping structure for table cashout.player_boats
CREATE TABLE IF NOT EXISTS `player_boats` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_boats: ~0 rows (approximately)
DELETE FROM `player_boats`;
/*!40000 ALTER TABLE `player_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_boats` ENABLE KEYS */;

-- Dumping structure for table cashout.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12434 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_contacts: ~0 rows (approximately)
DELETE FROM `player_contacts`;
/*!40000 ALTER TABLE `player_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_contacts` ENABLE KEYS */;

-- Dumping structure for table cashout.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_houses: ~0 rows (approximately)
DELETE FROM `player_houses`;
/*!40000 ALTER TABLE `player_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_houses` ENABLE KEYS */;

-- Dumping structure for table cashout.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=67045 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_mails: ~0 rows (approximately)
DELETE FROM `player_mails`;
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;

-- Dumping structure for table cashout.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8977 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_outfits: ~0 rows (approximately)
DELETE FROM `player_outfits`;
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;

-- Dumping structure for table cashout.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`#`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB AUTO_INCREMENT=2469 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_vehicles: ~0 rows (approximately)
DELETE FROM `player_vehicles`;
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
INSERT INTO `player_vehicles` (`#`, `steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`) VALUES
	(2468, 'steam:11000013374b4d7', 'ANN17174', '16challenger', '-216150906', '{"modBackWheels":-1,"color2":67,"modExhaust":-1,"modPlateHolder":-1,"model":-216150906,"modSpeakers":-1,"extras":[],"modArmor":-1,"modRearBumper":-1,"modTrimA":-1,"modSuspension":-1,"modOrnaments":-1,"modAirFilter":-1,"color1":68,"modFrame":-1,"modArchCover":-1,"health":1000,"modSteeringWheel":-1,"modAerials":-1,"modGrille":-1,"modDial":-1,"modTank":-1,"plate":"02LFX517","neonColor":[255,0,255],"modEngineBlock":-1,"pearlescentColor":67,"modHorns":-1,"modRoof":-1,"modDashboard":-1,"windowTint":-1,"dirtLevel":1.0009777545929,"neonEnabled":[false,false,false,false],"modAPlate":-1,"wheels":0,"modDoorSpeaker":-1,"modSideSkirt":-1,"modBrakes":-1,"modRightFender":-1,"modFrontWheels":-1,"plateIndex":4,"modHydrolic":-1,"modFender":-1,"modTrunk":-1,"modCustomTyres":false,"modXenon":false,"tyreSmokeColor":[255,255,255],"modFrontBumper":-1,"modSpoilers":-1,"modVanityPlate":-1,"modHood":-1,"modLivery":6,"modTransmission":-1,"modStruts":-1,"wheelColor":8,"modSeats":-1,"modEngine":-1,"modTurbo":false,"modTrimB":-1,"modWindows":-1,"modShifterLeavers":-1,"modSmokeEnabled":false}', '02LFX517', NULL, 'motelgarage', 100, 1000, 1000, 0, 0, 264321, '{"pizzashop":1000.0,"body":1000.0,"engine":1000.0}');
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;

-- Dumping structure for table cashout.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.player_warns: ~0 rows (approximately)
DELETE FROM `player_warns`;
/*!40000 ALTER TABLE `player_warns` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_warns` ENABLE KEYS */;

-- Dumping structure for table cashout.queue
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.queue: ~0 rows (approximately)
DELETE FROM `queue`;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;

-- Dumping structure for table cashout.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15024 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.stashitems: ~0 rows (approximately)
DELETE FROM `stashitems`;
/*!40000 ALTER TABLE `stashitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `stashitems` ENABLE KEYS */;

-- Dumping structure for table cashout.stashitemsnew
CREATE TABLE IF NOT EXISTS `stashitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stash` (`stash`)
) ENGINE=InnoDB AUTO_INCREMENT=2126 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.stashitemsnew: ~1 rows (approximately)
DELETE FROM `stashitemsnew`;
/*!40000 ALTER TABLE `stashitemsnew` DISABLE KEYS */;
INSERT INTO `stashitemsnew` (`id`, `stash`, `items`) VALUES
	(2122, 'apartment51489', '[]'),
	(2123, 'mechanicstash', '[null,null,{"slot":3,"label":"Metalscrap","weight":100,"unique":false,"amount":3,"name":"metalscrap","description":"Metal is good.","useable":false,"info":[],"type":"item","image":"metalscrap.png"}]'),
	(2124, 'apartment36655', '[]'),
	(2125, 'tequilalastash', '[]');
/*!40000 ALTER TABLE `stashitemsnew` ENABLE KEYS */;

-- Dumping structure for table cashout.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.trunkitems: ~0 rows (approximately)
DELETE FROM `trunkitems`;
/*!40000 ALTER TABLE `trunkitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitems` ENABLE KEYS */;

-- Dumping structure for table cashout.trunkitemsnew
CREATE TABLE IF NOT EXISTS `trunkitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1128 DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.trunkitemsnew: ~0 rows (approximately)
DELETE FROM `trunkitemsnew`;
/*!40000 ALTER TABLE `trunkitemsnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitemsnew` ENABLE KEYS */;

-- Dumping structure for table cashout.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.user_convictions: ~0 rows (approximately)
DELETE FROM `user_convictions`;
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Dumping structure for table cashout.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cashout.user_mdt: ~0 rows (approximately)
DELETE FROM `user_mdt`;
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

-- Dumping structure for table cashout.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`steam`),
  UNIQUE KEY `identifier` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cashout.whitelist: ~0 rows (approximately)
DELETE FROM `whitelist`;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
