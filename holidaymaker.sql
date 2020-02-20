-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                5.7.29-log - MySQL Community Server (GPL)
-- Server-OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumpar databasstruktur för holidaymaker
CREATE DATABASE IF NOT EXISTS `holidaymaker` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `holidaymaker`;

-- Dumpar struktur för tabell holidaymaker.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `guest_id` (`guest_id`),
  CONSTRAINT `FK__hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_booking_guest` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dataexport var bortvalt.

-- Dumpar struktur för tabell holidaymaker.guest
CREATE TABLE IF NOT EXISTS `guest` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_name` varchar(50) NOT NULL DEFAULT '0',
  `guest_address` varchar(250) DEFAULT NULL,
  `guest_phone_number` int(11) DEFAULT '0',
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dataexport var bortvalt.

-- Dumpar struktur för tabell holidaymaker.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(50) DEFAULT NULL,
  `hotel_address` varchar(50) DEFAULT NULL,
  `hotel_phone_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dataexport var bortvalt.

-- Dumpar struktur för tabell holidaymaker.hotel_room
CREATE TABLE IF NOT EXISTS `hotel_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` int(11) NOT NULL DEFAULT '0',
  `hotel_id` int(11) NOT NULL DEFAULT '0',
  `room_type` int(11) NOT NULL DEFAULT '0',
  `number_of_beds` int(11) NOT NULL DEFAULT '0',
  `room_size` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `FK_hotel_room_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dataexport var bortvalt.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
