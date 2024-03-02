-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 02:23 PM
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
  `soldier_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_location`, `soldier_id`) VALUES
('D001', 'Marketing', 'New York', 'S1002'),
('D002', 'Finance', 'Chicago', 'S1003'),
('D003', 'Human Resources', 'San Francisco', 'S1004'),
('D004', 'Research and Develop', 'Boston', 'S1005'),
('D005', 'Customer Support', 'Seattle', 'S1001');

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
('M001', 'Bronze Star', 'S1001'),
('M002', 'Silver Star', 'S1002'),
('M003', 'Gold Medal', 'S1003'),
('M004', 'Purple Heart', 'S1004'),
('M005', 'Distinguished Service Cross', 'S1005');

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
('O001', 'Operation Alpha', 'Success', '2022-01-10', '2022-01-15', 'D001', 'S1001'),
('O002', 'Operation Bravo', 'Failure', '2022-02-05', '2022-02-10', 'D002', 'S1002'),
('O003', 'Operation Charlie', 'Success', '2022-03-20', '2022-03-25', 'D003', 'S1003'),
('O004', 'Operation Delta', 'Success', '2022-04-15', '2022-04-20', 'D004', 'S1004'),
('O005', 'Operation Echo', 'Failure', '2022-05-01', '2022-05-05', 'D005', 'S1005');

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
('P001', '2022-01-10', '2022-03-15', 'S1001', 'Base A'),
('P002', '2022-02-05', '2022-04-20', 'S1002', 'Base B'),
('P003', '2022-03-20', '2022-05-25', 'S1003', 'Base C'),
('P004', '2022-04-15', '2022-06-30', 'S1004', 'Base D'),
('P005', '2022-05-01', '2022-07-15', 'S1005', 'Base E');

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
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soldier`
--

INSERT INTO `soldier` (`soldier_id`, `name`, `dob`, `gender`, `address`, `salary`) VALUES
('S1001', 'John Doe', '1990-05-15', 'Male', '123 Main Street, Cit', 50000),
('S1002', 'Jane Smith', '1988-08-20', 'Female', '456 Oak Avenue, Town', 55000),
('S1003', 'Bob Johnson', '1995-03-10', 'Male', '789 Pine Street, Vil', 48000),
('S1004', 'Alice Brown', '1992-11-25', 'Female', '101 Cedar Road, Haml', 52000),
('S1005', 'Charlie Wilson', '1985-07-05', 'Male', '202 Maple Lane, Coun', 60000);

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
-- Structure for view `count_soldier`
--
DROP TABLE IF EXISTS `count_soldier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_soldier`  AS SELECT count(0) AS `no_of_soldier` FROM `soldier` ;

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
