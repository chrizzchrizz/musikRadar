# ************************************************************
# Sequel Ace SQL dump
# Version 20096
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.6.23-MariaDB-0ubuntu0.22.04.1)
# Datenbank: n8n
# Verarbeitungszeit: 2026-01-29 14:44:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Tabellen-Dump review_lastsend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_lastsend`;

CREATE TABLE `review_lastsend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;



# Tabellen-Dump review_receipients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_receipients`;

CREATE TABLE `review_receipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;



# Tabellen-Dump review_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review_reviews`;

CREATE TABLE `review_reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `album` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `appleMusicLink` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `coverUrl` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
