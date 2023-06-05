-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 28, 2023 at 10:56 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'Test@12345', '28-12-2016 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `consultancyFees` int DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userStatus` int DEFAULT NULL,
  `doctorStatus` int DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ap_status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`, `ap_status`) VALUES
(11, 'General Physician', 12, 8, 0, '2023-05-23', '1:00 PM', '2023-05-22 07:20:12', 0, 1, '2023-05-22 07:20:22', 0),
(13, 'Psychiatrists', 13, 9, 0, '2023-05-20', '11:00 PM', '2023-05-22 17:23:55', 1, 1, '2023-05-22 17:24:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(12, 'General Physician', 'Abc', 'Hatr Ning', 'Free', 1234567890, 'abc@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2023-05-22 05:11:32', NULL),
(13, 'Psychiatrists', 'Sundari', '123/E Germany', 'Free', 1234567890, 'abcd@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2023-05-22 17:14:59', NULL),
(14, 'Psychologists', 'Gandu', '123/a ,Germany', 'Free', 1234567890, 'abcde@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2023-05-22 17:17:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

DROP TABLE IF EXISTS `doctorslog`;
CREATE TABLE IF NOT EXISTS `doctorslog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(41, 12, 'abc@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 10:42:52', '22-05-2023 04:13:03 PM', 1),
(42, 14, 'abcde@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:17:22', '22-05-2023 10:47:27 PM', 1),
(43, 13, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:24:13', '22-05-2023 10:54:30 PM', 1),
(44, 13, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:24:53', '22-05-2023 10:55:02 PM', 1),
(45, 13, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:59:17', '22-05-2023 11:29:24 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

DROP TABLE IF EXISTS `doctorspecilization`;
CREATE TABLE IF NOT EXISTS `doctorspecilization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Gynecologist/Obstetrician', '2016-12-28 06:37:25', '0000-00-00 00:00:00'),
(14, 'Psychiatrists', '2023-05-22 16:59:13', NULL),
(16, 'Psychologists', '2023-05-22 16:59:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

DROP TABLE IF EXISTS `tblcontactus`;
CREATE TABLE IF NOT EXISTS `tblcontactus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint DEFAULT NULL,
  `message` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IsRead` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(4, 'demo', 'demo@gmail.com', 123456789, ' hi, this is a demo', '2020-07-05 01:57:20', 'answered', '2020-07-05 01:57:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

DROP TABLE IF EXISTS `tblmedicalhistory`;
CREATE TABLE IF NOT EXISTS `tblmedicalhistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(7, 5, '80/120', '120', '85', '98.6', 'Rx\r\n\r\nAbc tab\r\nxyz Syrup', '2019-11-10 18:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

DROP TABLE IF EXISTS `tblpatient`;
CREATE TABLE IF NOT EXISTS `tblpatient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Docid` int DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext,
  `PatientAge` int DEFAULT NULL,
  `PatientMedhis` mediumtext,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(7, 12, 'xyz', 123456789, 'xyz@gmail.com', 'male', 'Athani\r\n', 25, 'No', '2023-05-22 10:35:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(42, 8, 'abc@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 10:42:37', '22-05-2023 04:12:47 PM', 1),
(43, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:23:39', '22-05-2023 10:54:05 PM', 1),
(44, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:24:34', '22-05-2023 10:54:46 PM', 1),
(45, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:28:26', '22-05-2023 10:58:57 PM', 1),
(46, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:48:26', '22-05-2023 11:18:44 PM', 1),
(47, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-22 17:50:11', '22-05-2023 11:29:11 PM', 1),
(48, 9, 'abcd@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-25 20:03:17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(8, 'Viraj Patil', 'Athani', 'Athani', 'male', 'abc@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2023-05-22 05:12:22', NULL),
(9, 'Alia Bhatt', 'Chennai', 'Hatr', 'male', 'abcd@gmail.com', '25f9e794323b453885f5181f1b624d0b', '2023-05-22 17:23:22', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
