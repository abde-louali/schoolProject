-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project
DROP DATABASE IF EXISTS `project`;
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `project`;

-- Dumping structure for table project.director
DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `idD` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `passwordd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project.director: ~1 rows (approximately)
DELETE FROM `director`;
INSERT INTO `director` (`idD`, `username`, `passwordd`) VALUES
	(1, 'admin', 'admin');

-- Dumping structure for table project.model
DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `Nmodul` varchar(80) NOT NULL,
  PRIMARY KEY (`Nmodul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project.model: ~3 rows (approximately)
DELETE FROM `model`;
INSERT INTO `model` (`Nmodul`) VALUES
	('php'),
	('python'),
	('sql');

-- Dumping structure for table project.notes
DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `cin` varchar(30) DEFAULT NULL,
  `Nmodul` varchar(80) DEFAULT NULL,
  `note1` float DEFAULT 0,
  `note2` float DEFAULT NULL,
  `note3` float DEFAULT NULL,
  `notef` float DEFAULT truncate((`note1` + `note2` + `note3`) / 3,2),
  KEY `cin` (`cin`),
  KEY `Nmodul` (`Nmodul`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`cin`) REFERENCES `student` (`cin`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`Nmodul`) REFERENCES `model` (`Nmodul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project.notes: ~8 rows (approximately)
DELETE FROM `notes`;
INSERT INTO `notes` (`cin`, `Nmodul`, `note1`, `note2`, `note3`, `notef`) VALUES
	('U20264', 'php', 19, 20, 19, 19.33),
	('U20264', 'sql', 20, 18, 16, 18),
	('da14711', 'php', 10, 15, 16, 13.66),
	('da14711', 'sql', 17, 15, 3, 11.66),
	('u99036', 'php', 20, 15, 19, 18),
	('VA279968', 'sql', 15, 20, 18, 17.66),
	('DD100', 'php', 19, 19, 20, 19.33),
	('DD100', 'sql', 18, 19, 20, 19),
	('j123232323', 'python', 12, 13, 13, 12.66),
	('j123232323', 'php', 14, 13, 16, 14.33);

-- Dumping structure for table project.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `cin` varchar(30) NOT NULL,
  `fname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `pasword` varchar(60) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cin`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project.student: ~10 rows (approximately)
DELETE FROM `student`;
INSERT INTO `student` (`cin`, `fname`, `lname`, `email`, `pasword`, `id`) VALUES
	('ab12345', 'omar', 'bouazzaoui', 'oumar@gmail.com', 'omar123', 21),
	('da1047111', 'abdessamad', ' louali', 'abdou@gmail.com', 'abdourz15', 16),
	('da14711', 'abdessamad', 'louali', 'abdourz15@gmail.com', 'abdes123', 11),
	('DD100', 'omar', 'bouazzaoui', 'omar@gmail.com', 'omar123', 14),
	('dd10000', 'abdo', 'ssamad', 'abdou@gmail.com', 'abdou12345', 20),
	('j123232323', 'zakariya', 'benchakouk', 'zakariaben@gmail.com', 'qwerty123456', 15),
	('sa1234', 'amine', 'jasim', 'abdou@gmail.com', '1231231', 18),
	('U20264', 'fatemazahrae ', 'ben rachid', 'fatima@gmail.com', 'fati20', 10),
	('u99036', 'qbdou', 'louali', 'abdourz15@gmail.com', '1234567', 12),
	('VA279968', 'aboubakr', 'taouil', 'ataouil90@gmail.com', 'azrou123', 13);

-- Dumping structure for table project.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `username` varchar(80) DEFAULT NULL,
  `PASSWORD` varchar(80) DEFAULT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project.teacher: ~3 rows (approximately)
DELETE FROM `teacher`;
INSERT INTO `teacher` (`username`, `PASSWORD`) VALUES
	('elheyyani', 'elheyyani123'),
	('elghazi', 'elghazi123'),
	('Omar12', 'omar123');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
