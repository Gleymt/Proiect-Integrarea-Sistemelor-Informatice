-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pana
CREATE DATABASE IF NOT EXISTS `pana` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pana`;

-- Dumping structure for table pana.client
CREATE TABLE IF NOT EXISTS `client` (
  `CodCl` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(50) NOT NULL,
  `Prenume` varchar(50) NOT NULL,
  `Cetatenie` varchar(50) NOT NULL,
  `DataN` date NOT NULL,
  PRIMARY KEY (`CodCl`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pana.client: ~5 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
REPLACE INTO `client` (`CodCl`, `Nume`, `Prenume`, `Cetatenie`, `DataN`) VALUES
	(1, 'Morosan', 'George', 'roman', '2000-01-19'),
	(2, 'Plugaru', 'Andrei', 'roman', '1994-01-13'),
	(3, 'Vlad', 'Ioan', 'roman', '1978-01-29'),
	(4, 'Andra', 'Andreea', 'roman', '1991-01-14'),
	(5, 'Popescu', 'George', 'roman', '1988-01-20'),
	(6, 'Potlogaru', 'Fanica', 'Moldova', '1987-05-25');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Dumping structure for table pana.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `table_row` int(11) NOT NULL,
  `command` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pana.logs: ~17 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
REPLACE INTO `logs` (`id`, `username`, `table_name`, `table_row`, `command`, `created_at`) VALUES
	(1, 'admin', 'tranzactii', 1, 'insert', '2021-01-13 18:21:54'),
	(2, 'admin', 'tranzactii', 2, 'insert', '2021-01-13 18:22:33'),
	(3, 'admin ', 'tranzactii', 2, 'insert', '2021-01-13 18:24:17'),
	(4, 'admin', 'tranzactii', 3, 'insert', '2021-01-13 20:25:44'),
	(5, 'admin', 'tranzactii', 3, 'delete', '2021-01-13 20:25:58'),
	(6, 'admin', 'client', 6, 'insert', '2021-01-13 20:38:39'),
	(7, 'admin', 'client', 6, 'insert', '2021-01-13 20:39:02'),
	(8, 'admin', 'client', 6, 'insert', '2021-01-13 20:42:02'),
	(9, 'admin', 'tranzactii', 3, 'insert', '2021-01-13 21:04:56'),
	(10, 'admin', 'tranzactii', 3, 'insert', '2021-01-13 21:04:56'),
	(11, 'admin', 'client', 6, 'insert', '2021-01-13 21:17:33'),
	(12, 'admin', 'client', 6, 'insert', '2021-01-13 21:17:56'),
	(13, 'admin', 'client', 6, 'insert', '2021-01-13 21:24:07'),
	(14, 'admin', 'client', 4, 'insert', '2021-01-13 21:29:38'),
	(15, 'admin', 'client', 6, 'insert', '2021-01-13 21:36:36'),
	(16, 'admin', 'tranzactii', 4, 'insert', '2021-01-13 21:41:56'),
	(17, 'admin', 'client', 6, 'update', '2021-01-13 21:47:03'),
	(18, 'admin', 'client', 6, 'update', '2021-01-13 21:47:14'),
	(19, 'admin', 'client', 6, 'update', '2021-01-13 21:49:33'),
	(20, 'admin', 'client', 6, 'update', '2021-01-14 12:54:14'),
	(21, 'admin', 'tranzactii', 4, 'update', '2021-01-14 13:09:22'),
	(22, 'admin', 'tranzactii', 4, 'update', '2021-01-14 13:09:27'),
	(23, 'admin', 'client', 6, 'update', '2021-01-14 13:09:36'),
	(24, 'admin', 'client', 6, 'update', '2021-01-14 13:23:44'),
	(25, 'admin', 'client', 1, 'update', '2021-01-14 13:24:17'),
	(26, 'admin', 'client', 2, 'update', '2021-01-14 13:25:06'),
	(27, 'admin', 'client', 3, 'update', '2021-01-14 13:25:24'),
	(28, 'admin', 'client', 4, 'update', '2021-01-14 13:25:43'),
	(29, 'admin', 'client', 5, 'update', '2021-01-14 13:26:11'),
	(30, 'admin', 'client', 1, 'update', '2021-01-14 13:26:19'),
	(31, 'admin', 'client', 2, 'update', '2021-01-14 13:26:28'),
	(32, 'admin', 'client', 3, 'update', '2021-01-14 13:26:37'),
	(33, 'admin', 'client', 4, 'update', '2021-01-14 13:26:45'),
	(34, 'admin', 'client', 6, 'update', '2021-01-14 13:26:52'),
	(35, 'admin', 'tranzactii', 1, 'update', '2021-01-14 13:27:19'),
	(36, 'admin', 'tranzactii', 1, 'update', '2021-01-14 13:27:28'),
	(37, 'admin', 'tranzactii', 2, 'update', '2021-01-14 13:27:36'),
	(38, 'admin', 'tranzactii', 2, 'update', '2021-01-14 13:27:45'),
	(39, 'admin', 'tranzactii', 3, 'update', '2021-01-14 13:27:48'),
	(40, 'admin', 'tranzactii', 4, 'update', '2021-01-14 13:27:58'),
	(41, 'admin', 'tranzactii', 4, 'update', '2021-01-14 13:28:02'),
	(42, 'admin', 'tranzactii', 3, 'update', '2021-01-14 13:28:25'),
	(43, 'admin', 'tranzactii', 3, 'update', '2021-01-14 13:28:36'),
	(44, 'admin', 'tranzactii', 4, 'update', '2021-01-14 13:29:10'),
	(45, 'admin', 'users', 1, 'delete', '2021-01-14 13:36:05'),
	(46, 'admin', 'users', 2, 'delete', '2021-01-14 13:36:08'),
	(47, 'admin', 'users', 3, 'delete', '2021-01-14 13:36:09'),
	(48, 'admin', 'users', 4, 'delete', '2021-01-14 13:36:11'),
	(49, 'admin', 'users', 1, 'insert', '2021-01-14 13:36:22'),
	(50, 'admin', 'users', 2, 'insert', '2021-01-14 13:36:36'),
	(51, 'admin', 'users', 3, 'insert', '2021-01-14 13:36:46');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table pana.tranzactii
CREATE TABLE IF NOT EXISTS `tranzactii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CodCl` int(11) DEFAULT NULL,
  `Cnp` varchar(50) NOT NULL,
  `sumacli` varchar(11) NOT NULL,
  `sumacs` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pana.tranzactii: ~2 rows (approximately)
/*!40000 ALTER TABLE `tranzactii` DISABLE KEYS */;
REPLACE INTO `tranzactii` (`id`, `CodCl`, `Cnp`, `sumacli`, `sumacs`) VALUES
	(2, 2, '1849845527534', '100 EUR', '482 RON'),
	(3, 1, '1702353223423', '240 RON', '48 EUR'),
	(4, 6, '1976564385643', '150000 RON', '30700 EUR');
/*!40000 ALTER TABLE `tranzactii` ENABLE KEYS */;

-- Dumping structure for table pana.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pana.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `username`, `password`, `created_at`, `role`) VALUES
	(1, 'admin', 'admin', '2021-01-14 13:36:22', 'admin'),
	(2, 'angajat', 'angajat', '2021-01-14 13:36:36', 'angajat'),
	(3, 'client', 'client', '2021-01-14 13:36:46', 'client');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
