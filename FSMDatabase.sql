-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 25, 2023 at 07:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FSMDatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bill_Master`
--

CREATE TABLE `Bill_Master` (
  `Bill_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Cid` int(11) DEFAULT NULL,
  `Created_by` int(11) DEFAULT NULL,
  `Total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Bill_Master`
--

INSERT INTO `Bill_Master` (`Bill_id`, `Date`, `Cid`, `Created_by`, `Total`) VALUES
(3, '2023-12-25', 1, 1, 199),
(4, '2023-12-25', 4, 1, 997),
(5, '2023-12-25', 3, 1, 399);

-- --------------------------------------------------------

--
-- Table structure for table `Bill_Product`
--

CREATE TABLE `Bill_Product` (
  `BP_id` int(11) NOT NULL,
  `Bill_id` int(11) DEFAULT NULL,
  `Pid` int(11) DEFAULT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total_Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Bill_Product`
--

INSERT INTO `Bill_Product` (`BP_id`, `Bill_id`, `Pid`, `Price`, `Quantity`, `Total_Price`) VALUES
(3, 3, 2, 199, 1, 199),
(4, 4, 1, 399, 2, 798),
(5, 4, 2, 199, 1, 199),
(6, 5, 1, 399, 1, 399);

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `Bid` int(11) NOT NULL,
  `BName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`Bid`, `BName`) VALUES
(1, 'PARAGON'),
(2, 'VKC'),
(3, 'CAMPUS');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerbillview`
-- (See below for the actual view)
--
CREATE TABLE `customerbillview` (
`Bill_Id` int(11)
,`CustomerName` varchar(200)
,`CustomerMobileNo` varchar(20)
,`Total` float
,`Date` date
,`CreatedBy` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Data`
--

CREATE TABLE `Customer_Data` (
  `CId` int(11) NOT NULL,
  `CName` varchar(200) NOT NULL,
  `CMobileNo` varchar(20) NOT NULL,
  `CEmail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customer_Data`
--

INSERT INTO `Customer_Data` (`CId`, `CName`, `CMobileNo`, `CEmail`) VALUES
(1, 'Nihal Wasta', '9850252994', 'nihalwasta@gmail.com'),
(2, 'Uzaif Isani', '7038878891', 'uzaifisani8@gmail.com'),
(3, 'Najma Isani', '7022789843', 'najmaisani@gamil.com'),
(4, 'Aafrin Isani', '8408895951', 'aisani@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `DUser`
--

CREATE TABLE `DUser` (
  `Uid` int(11) NOT NULL,
  `UName` varchar(200) NOT NULL,
  `UEmail` varchar(200) DEFAULT NULL,
  `UMobile_Number` varchar(10) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Security_Question` varchar(200) NOT NULL,
  `Answer` varchar(200) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DUser`
--

INSERT INTO `DUser` (`Uid`, `UName`, `UEmail`, `UMobile_Number`, `Address`, `Password`, `Security_Question`, `Answer`, `Status`) VALUES
(1, 'Uzaif Rafiq Isani', 'uzaifisani8@gmail.com', '7038478692', 'Jail Road, Ratnagiri', 'admin', 'Who is your best friend?', 'nihal', 'true'),
(2, 'Nihal Wasta', 'nihalwasta@gmail.com', '9850252995', 'Diera,Dubai', 'nihal', 'Who is your best friend?', 'uzaif', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `Pid` int(11) NOT NULL,
  `ArticleNo` varchar(50) NOT NULL,
  `Brand` int(11) DEFAULT NULL,
  `Quantity` float NOT NULL,
  `Mrp` float NOT NULL,
  `PP` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`Pid`, `ArticleNo`, `Brand`, `Quantity`, `Mrp`, `PP`) VALUES
(1, 'PG594Z', 1, 2, 399, 200),
(2, 'VL1684', 2, 3, 199, 134);

-- --------------------------------------------------------

--
-- Structure for view `customerbillview`
--
DROP TABLE IF EXISTS `customerbillview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fsmdatabase`.`customerbillview`  AS SELECT `bm`.`Bill_id` AS `Bill_Id`, `c`.`CName` AS `CustomerName`, `c`.`CMobileNo` AS `CustomerMobileNo`, `bm`.`Total` AS `Total`, `bm`.`Date` AS `Date`, `u`.`UName` AS `CreatedBy` FROM ((`fsmdatabase`.`bill_master` `bm` join `fsmdatabase`.`customer_data` `c` on(`bm`.`Cid` = `c`.`CId`)) join `fsmdatabase`.`duser` `u` on(`bm`.`Created_by` = `u`.`Uid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bill_Master`
--
ALTER TABLE `Bill_Master`
  ADD PRIMARY KEY (`Bill_id`),
  ADD KEY `Cid` (`Cid`),
  ADD KEY `Created_by` (`Created_by`);

--
-- Indexes for table `Bill_Product`
--
ALTER TABLE `Bill_Product`
  ADD PRIMARY KEY (`BP_id`),
  ADD KEY `Bill_id` (`Bill_id`),
  ADD KEY `Pid` (`Pid`);

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`Bid`);

--
-- Indexes for table `Customer_Data`
--
ALTER TABLE `Customer_Data`
  ADD PRIMARY KEY (`CId`);

--
-- Indexes for table `DUser`
--
ALTER TABLE `DUser`
  ADD PRIMARY KEY (`Uid`),
  ADD UNIQUE KEY `UEmail` (`UEmail`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Pid`),
  ADD KEY `Brand` (`Brand`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bill_Master`
--
ALTER TABLE `Bill_Master`
  MODIFY `Bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Bill_Product`
--
ALTER TABLE `Bill_Product`
  MODIFY `BP_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Brand`
--
ALTER TABLE `Brand`
  MODIFY `Bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Customer_Data`
--
ALTER TABLE `Customer_Data`
  MODIFY `CId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DUser`
--
ALTER TABLE `DUser`
  MODIFY `Uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `Pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bill_Master`
--
ALTER TABLE `Bill_Master`
  ADD CONSTRAINT `bill_master_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `Customer_Data` (`CId`),
  ADD CONSTRAINT `bill_master_ibfk_2` FOREIGN KEY (`Created_by`) REFERENCES `DUser` (`Uid`);

--
-- Constraints for table `Bill_Product`
--
ALTER TABLE `Bill_Product`
  ADD CONSTRAINT `bill_product_ibfk_1` FOREIGN KEY (`Bill_id`) REFERENCES `Bill_Master` (`Bill_id`),
  ADD CONSTRAINT `bill_product_ibfk_2` FOREIGN KEY (`Pid`) REFERENCES `Product` (`Pid`);

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Brand`) REFERENCES `Brand` (`Bid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
