-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2024 at 08:27 AM
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
  `commander_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_location`, `commander_id`) VALUES
('101', 'Infantry', 'Delhi', '001'),
('102', 'Logistics', 'Mumbai', '002'),
('103', 'Communications', 'Bangalore	', '003'),
('104', 'Medical', 'Chennai', '005'),
('105', 'Intelligence', 'Delhi', '005'),
('106', 'Engineering', 'Hyderabad', '006'),
('107', 'Reconnaissance', '	Kolkata', '007'),
('108', 'Cybersecurity', 'Pune', '008'),
('109', 'Artillery', 'Jaipur', '009');

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
('M01', 'Param Vir Chakra', '001'),
('M02', 'Ashoka Chakra', '002'),
('M03', 'Maha Vir Chakra', '001'),
('M04', 'Vir Chakra', '004'),
('M05', 'Sena Medal', '005'),
('M06', 'Vishisht Seva Medal', '006'),
('M07', 'Shaurya Chakra', '007'),
('M08', 'Kirti Chakra', '008'),
('M09', 'Yudh Seva Medal', '009'),
('M10', 'Sarvottam Jeevan Raksha Padak', '010');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `operation_id` varchar(20) NOT NULL,
  `operation_name` varchar(20) DEFAULT NULL,
  `outcome` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `department_id` varchar(20) NOT NULL,
  `soldier_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`operation_id`, `operation_name`, `outcome`, `start_date`, `end_date`, `department_id`, `soldier_id`) VALUES
('OP_001', 'Operation Vijay', 'successful', '2022-05-25', '2022-06-25', '101', '001'),
('OP_002', ' Operation Meghdoot', 'in progress', '2023-04-13', '2023-04-20', '101', '004'),
('OP_003 ', 'Operation Rakshak', 'in progress', '2023-11-01', '2023-11-10', '107', '007'),
('OP_004', 'Operation Rhino', 'successful', '2022-01-01', '2022-09-29', '109', '009'),
('OP_005 ', 'Operation Cactus', 'failed', '2023-11-03', '2023-11-14', '103', '003'),
('OP_006', 'Operation Black Pant', 'successful', '2024-01-24', '2024-02-03', '103', '010');

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
('1000', '2024-01-15', '2024-07-15', '001', 'New Delhi'),
('1001', '2024-03-01', '2024-09-01', '002', 'Mumbai'),
('1002', '2024-02-10', '2024-08-10', '003', '	Bangalore'),
('1003', '2024-04-05', '2024-10-05', '004', 'Kolkata'),
('1004', '2024-05-20', '2024-11-20', '005', 'Chennai'),
('1005', '2024-06-09', '2025-09-12', '006', 'Hyderabad'),
('1006', '2024-07-02', '2025-01-02', '007', 'Pune'),
('1007', '2024-08-15', '2025-02-15', '008', 'Jaipur'),
('1008', '2024-09-28', '2025-03-28', '009', 'Ahmedabad');

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
  `department_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soldier`
--

INSERT INTO `soldier` (`soldier_id`, `name`, `dob`, `gender`, `address`, `salary`, `department_id`) VALUES
('001', 'Rajesh Kumar ', '1985-04-11', 'male', '123, Main Street, Ko', 80000, '101'),
('002', 'Anjali Sharma', '1990-09-24', 'female', '456, Park Avenue, Mu', 90000, '102'),
('003', 'Vikram Singh', '1982-12-02', 'male', '789, Lake Road, Bang', 70000, '103'),
('004', 'Priya Patel', '1993-06-17', 'female', '101, Hill View Apart', 100000, '101'),
('005', 'Sanjay Verma', '1978-08-29', 'male', '234, Gandhi Nagar, C', 90000, '105'),
('006', 'Aman Khanna', '1995-02-13', 'male', '567, River Side, Hyd', 60000, '106'),
('007', 'Meera Rajput ', '1989-11-04', 'female', '890, Lotus Lane, Pun', 120000, '107'),
('008', 'Aditya Kapoor', '1973-03-26', 'male', '112, Ocean View, Jai', 95000, '108'),
('009', 'Nisha Sharma      ', '1980-07-09', 'female', '345, Sunshine Street', 75000, '109'),
('010', 'Karan Malhotra ', '1987-01-17', 'male', '678, Green Valley, K', 110000, '103');

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
,`commander_id` varchar(20)
,`operation_name` varchar(20)
,`outcome` varchar(20)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `soldier_details`  AS SELECT `s`.`soldier_id` AS `soldier_id`, `s`.`name` AS `soldier_name`, `d`.`department_id` AS `department_id`, `d`.`department_name` AS `department_name`, `d`.`commander_id` AS `commander_id`, `o`.`operation_name` AS `operation_name`, `o`.`outcome` AS `outcome`, `p`.`post_id` AS `post_id`, `m`.`medal_name` AS `medal_name` FROM ((((`soldier` `s` left join `department` `d` on(`d`.`department_id` = `s`.`department_id`)) left join `operation` `o` on(`o`.`soldier_id` = `s`.`soldier_id`)) left join `posting` `p` on(`p`.`soldier_id` = `s`.`soldier_id`)) left join `medals` `m` on(`m`.`soldier_id` = `s`.`soldier_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `commander_id` (`commander_id`);

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
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`commander_id`) REFERENCES `soldier` (`soldier_id`) ON DELETE SET NULL;

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
