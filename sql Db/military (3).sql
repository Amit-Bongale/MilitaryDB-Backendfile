-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 05:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `military`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `count_departments`
-- (See below for the actual view)
--
CREATE TABLE `count_departments` (
`no_of_departments` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `count_soldier`
-- (See below for the actual view)
--
CREATE TABLE `count_soldier` (
`no_of_soldier` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(20) NOT NULL,
  `department_name` varchar(20) DEFAULT NULL,
  `department_location` varchar(20) DEFAULT NULL,
  `commander_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_location`, `soldier_id`) VALUES
('', '', '', ''),
('12345', 'test', 'bng', 'S1004'),
('D002', 'Finance', 'Chicago', 'S1003'),
('D003', 'Human Resources', 'San Francisco', 'S1004');

-- --------------------------------------------------------

--
-- Table structure for table `medals`
--

CREATE TABLE `medals` (
  `medal_id` varchar(20) NOT NULL,
  `medal_name` varchar(50) DEFAULT NULL,
  `soldier_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medals`
--

INSERT INTO `medals` (`medal_id`, `medal_name`, `soldier_id`) VALUES
('', '', ''),
('M002', 'Silver Star', 'S1002'),
('M003', 'Gold Medal', 'S1003'),
('M004', 'Purple Heart', 'S1004');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `operation_id` varchar(20) NOT NULL,
  `operation_name` varchar(20) DEFAULT NULL,
  `outcome` varchar(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `department_id` varchar(20) NOT NULL,
  `soldier_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`operation_id`, `operation_name`, `outcome`, `start_date`, `end_date`, `department_id`, `soldier_id`) VALUES
('901', 'sd', 'failed', '2024-02-28', '2024-03-06', 'D002', 'S1003'),
('O002', 'Operation Bravo', 'failed', '2022-02-05', '2022-02-10', 'D002', 'S1002');

-- --------------------------------------------------------

--
-- Stand-in structure for view `operation_summary`
-- (See below for the actual view)
--
CREATE TABLE `operation_summary` (
`total_operations` bigint(21)
,`successful_operations` decimal(22,0)
,`failed_operations` decimal(22,0)
,`in_progress_operations` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `posting`
--

CREATE TABLE `posting` (
  `post_id` varchar(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `soldier_id` varchar(20) NOT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posting`
--

INSERT INTO `posting` (`post_id`, `start_date`, `end_date`, `soldier_id`, `location`) VALUES
('', '0000-00-00', '0000-00-00', '', ''),
('P002', '2022-02-05', '2022-04-20', 'S1002', 'Base B'),
('P004', '2022-04-15', '2022-06-30', 'S1004', 'Base D'),
('wee', '0000-00-00', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `soldier`
--

CREATE TABLE `soldier` (
  `soldier_id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `department_id` varchar(20) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soldier`
--

INSERT INTO `soldier` (`soldier_id`, `name`, `dob`, `gender`, `address`, `salary`) VALUES
('', '', '0000-00-00', '', '', 0),
('67456475', 'ad', '2024-03-07', 'sfddsadfa', 'sdfa', 0),
('6745647523', 'tyr', '2024-03-06', 'ma', 'fggs', 0),
('67456475232', 'tyr', '2024-03-06', 'ma', 'fggs', 0),
('674564752321', 'tyr', '2024-03-06', 'ma', 'fggs', 0),
('87978', 'adghfgh', '2024-03-07', 'sfddsadfa', 'sdfa', 0),
('8797889', 'adghfgh', '2024-03-07', 'sfddsadfa', 'sdfa', 0),
('879788923', 'adghfgh', '2024-03-07', 'sfddsadfa', 'sdfa', 0),
('amit2', 'ad', '2024-03-07', 'sfddsadfa', 'sdfa', 0),
('S1002', 'Jane Smith', '1988-08-20', 'Female', '456 Oak Avenue, Town', 55000),
('S1003', 'Bob Johnson', '1995-03-10', 'Male', '789 Pine Street, Vil', 48000),
('S1004', 'Alice Brown', '1992-11-25', 'Female', '101 Cedar Road, Haml', 52000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `soldier_details`
-- (See below for the actual view)
--
CREATE TABLE `soldier_details` (
`soldier_id` varchar(20)
,`soldier_name` varchar(20)
,`department_id` varchar(20)
,`department_name` varchar(20)
,`operation_name` varchar(20)
,`outcome` varchar(10)
,`post_id` varchar(20)
,`medal_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `count_departments`
--
DROP TABLE IF EXISTS `count_departments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_departments`  AS SELECT count(`department`.`department_id`) AS `no_of_departments` FROM `department` ;

-- --------------------------------------------------------

--
-- Structure for view `count_soldier`
--
DROP TABLE IF EXISTS `count_soldier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_soldier`  AS SELECT count(0) AS `no_of_soldier` FROM `soldier` ;

-- --------------------------------------------------------

--
-- Structure for view `operation_summary`
--
DROP TABLE IF EXISTS `operation_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `operation_summary`  AS SELECT count(`operation`.`operation_id`) AS `total_operations`, sum(case when `operation`.`outcome` = 'successful' then 1 else 0 end) AS `successful_operations`, sum(case when `operation`.`outcome` = 'failed' then 1 else 0 end) AS `failed_operations`, sum(case when `operation`.`outcome` = 'in progress' then 1 else 0 end) AS `in_progress_operations` FROM `operation` ;

-- --------------------------------------------------------

--
-- Structure for view `soldier_details`
--
DROP TABLE IF EXISTS `soldier_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `soldier_details`  AS SELECT `s`.`soldier_id` AS `soldier_id`, `s`.`name` AS `soldier_name`, `d`.`department_id` AS `department_id`, `d`.`department_name` AS `department_name`, `o`.`operation_name` AS `operation_name`, `o`.`outcome` AS `outcome`, `p`.`post_id` AS `post_id`, `m`.`medal_name` AS `medal_name` FROM ((((`soldier` `s` join `department` `d` on(`s`.`soldier_id` = `d`.`soldier_id`)) join `operation` `o` on(`s`.`soldier_id` = `o`.`soldier_id`)) join `posting` `p` on(`s`.`soldier_id` = `p`.`soldier_id`)) join `medals` `m` on(`s`.`soldier_id` = `m`.`soldier_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`,`soldier_id`),
  ADD KEY `soldier_id` (`soldier_id`);

--
-- Indexes for table `medals`
--
ALTER TABLE `medals`
  ADD PRIMARY KEY (`medal_id`,`soldier_id`),
  ADD KEY `soldier_id` (`soldier_id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`operation_id`,`soldier_id`,`department_id`),
  ADD KEY `soldier_id` (`soldier_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`post_id`,`soldier_id`),
  ADD KEY `soldier_id` (`soldier_id`);

--
-- Indexes for table `soldier`
--
ALTER TABLE `soldier`
  ADD PRIMARY KEY (`soldier_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`) ON DELETE CASCADE;

--
-- Constraints for table `medals`
--
ALTER TABLE `medals`
  ADD CONSTRAINT `medals_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`) ON DELETE CASCADE;

--
-- Constraints for table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `posting`
--
ALTER TABLE `posting`
  ADD CONSTRAINT `posting_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
