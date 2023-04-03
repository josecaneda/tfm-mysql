CREATE DATABASE `monitor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

use monitor;

CREATE TABLE `rtus` (
  `rtu` varchar(20) NOT NULL,
  `rtutext` varchar(50) not null,
  `url` varchar(100) not NULL,
  `port` int DEFAULT NULL,
  PRIMARY KEY (`rtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `b1` (
  `b1` varchar(20) NOT NULL,
  `b1text` varchar(50) NOT NULL,
  PRIMARY KEY (`b1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `b2` (
  `b2` varchar(20) NOT NULL,
  `b2text` varchar(50) NOT NULL,
  PRIMARY KEY (`b2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `b3` (
  `b3` varchar(20) NOT NULL,
  `b3text` varchar(50) NOT NULL,
  PRIMARY KEY (`b3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `elemtypes` (
  `elemtype` varchar(20) NOT NULL,
  `alarmlist` bool DEFAULT false,
  `eventlist` bool DEFAULT false,
  `priority` int NOT NULL,
  `mstate_0` int DEFAULT NULL,
  `mstatetext_0` varchar(20) DEFAULT NULL,
  
  `mstate_1` int DEFAULT NULL,
  `mstatetext_1` varchar(20) DEFAULT NULL,
  `active_1` bool default false,
  `mstate_2` int DEFAULT NULL,
  `mstatetext_2` varchar(20) DEFAULT NULL,
  `active_2` bool default false,
  `mstate_3` int DEFAULT NULL,
  `mstatetext_3` varchar(20) DEFAULT NULL,
  `active_3` bool default false,
  `mstate_4` int DEFAULT NULL,
  `mstatetext_4` varchar(20) DEFAULT NULL,
  `active_4` bool default false,
  `mstate_5` int DEFAULT NULL,
  `mstatetext_5` varchar(20) DEFAULT NULL,
  `active_5` bool default false,
  `mstate_6` int DEFAULT NULL,
  `mstatetext_6` varchar(20) DEFAULT NULL,
  `active_6` bool default false,
  `mstate_7` int DEFAULT NULL,
  `mstatetext_7` varchar(20) DEFAULT NULL,
  `active_7` bool default false,
  `cstate_0` int DEFAULT NULL,
  `cstatetext_0` varchar(20) DEFAULT NULL,
  `cstate_1` int DEFAULT NULL,
  `cstatetext_1` varchar(20) DEFAULT NULL,
  `cstate_2` int DEFAULT NULL,
  `cstatetext_2` varchar(20) DEFAULT NULL,
  `cstate_3` int DEFAULT NULL,
  `cstatetext_3` varchar(20) DEFAULT NULL,
  `cstate_4` int DEFAULT NULL,
  `cstatetext_4` varchar(20) DEFAULT NULL,
  `cstate_5` int DEFAULT NULL,
  `cstatetext_5` varchar(20) DEFAULT NULL,
  `cstate_6` int DEFAULT NULL,
  `cstatetext_6` varchar(20) DEFAULT NULL,
  `cstate_7` int DEFAULT NULL,
  `cstatetext_7` varchar(20) DEFAULT NULL,
  `mvalue` decimal(10,5) DEFAULT NULL,
  `coefficient` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`elemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `elements` (
  `elem` varchar(20) NOT NULL,
  `elemtext` varchar(50) NOT NULL,
  `elemtype` varchar(20) NOT NULL,
  PRIMARY KEY (`elem`),
  KEY `elemtype` (`elemtype`),
  CONSTRAINT `elements_ibfk_1` FOREIGN KEY (`elemtype`) REFERENCES `elemtypes` (`elemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `points` (
  `kid` int NOT NULL AUTO_INCREMENT,
  `b1` varchar(20) NOT NULL,
  `b2` varchar(20),
  `b3` varchar(20),
  `elem` varchar(20),
  `rtu` varchar(20) NOT NULL,
  `mon_nodeid` varchar(50),
  `mon_quality_nodeid` varchar(50),
  `mon_time_nodeid` varchar(50),
  `con_nodeid` varchar(50),
  `inversion` bool default false,
  PRIMARY KEY (`kid`),
  UNIQUE KEY `uq_b1_b2_b3_elem` (`b1`,`b2`,`b3`,`elem`),
  KEY `b2` (`b2`),
  KEY `b3` (`b3`),
  KEY `elem` (`elem`),
  KEY `rtu` (`rtu`),
  CONSTRAINT `points_ibfk_1` FOREIGN KEY (`b1`) REFERENCES `b1` (`b1`),
  CONSTRAINT `points_ibfk_2` FOREIGN KEY (`b2`) REFERENCES `b2` (`b2`),
  CONSTRAINT `points_ibfk_3` FOREIGN KEY (`b3`) REFERENCES `b3` (`b3`),
  CONSTRAINT `points_ibfk_4` FOREIGN KEY (`elem`) REFERENCES `elements` (`elem`),
  CONSTRAINT `points_ibfk_5` FOREIGN KEY (`rtu`) REFERENCES `rtus` (`rtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `status` (
  `kid` int NOT NULL AUTO_INCREMENT,
  `b1` varchar(20) not null,
  `b2` varchar(20),
  `b3` varchar(20),
  `elem` varchar(20),
  `monstate` int,
  `monstatetext` varchar(20),
  `constate` int,
  `constatetext` varchar(20),
  `monvalue` decimal(10,5),
  `quality` int DEFAULT NULL,
  `opcquality` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ack_timestamp` timestamp null default null,
	`active` bool, 
  PRIMARY KEY (`kid`),
  UNIQUE KEY `uq_b1_b2_b3_elem` (`b1`,`b2`,`b3`,`elem`),
  KEY `b2` (`b2`),
  KEY `b3` (`b3`),
  KEY `elem` (`elem`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`b1`) REFERENCES `b1` (`b1`),
  CONSTRAINT `status_ibfk_2` FOREIGN KEY (`b2`) REFERENCES `b2` (`b2`),
  CONSTRAINT `status_ibfk_3` FOREIGN KEY (`b3`) REFERENCES `b3` (`b3`),
  CONSTRAINT `status_ibfk_4` FOREIGN KEY (`elem`) REFERENCES `elements` (`elem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `events` (
  `kid` int NOT NULL AUTO_INCREMENT,
  `b1` varchar(20) NOT NULL,
  `b2` varchar(20) DEFAULT NULL,
  `b3` varchar(20) DEFAULT NULL,
  `elem` varchar(20) DEFAULT NULL,
  `monstate` int DEFAULT NULL,
  `monstatetext` varchar(20) DEFAULT NULL,
  `constate` int DEFAULT NULL,
  `constatetext` varchar(20) DEFAULT NULL,
  `monvalue` decimal(10,5) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `opcquality` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ack_timestamp` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alarms` (
  `kid` int NOT NULL AUTO_INCREMENT,
  `b1` varchar(20) NOT NULL,
  `b2` varchar(20) DEFAULT NULL,
  `b3` varchar(20) DEFAULT NULL,
  `elem` varchar(20) DEFAULT NULL,
  `monstate` int DEFAULT NULL,
  `monstatetext` varchar(20) DEFAULT NULL,
  `constate` int DEFAULT NULL,
  `constatetext` varchar(20) DEFAULT NULL,
  `monvalue` decimal(10,5) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `opcquality` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ack_timestamp` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


    



