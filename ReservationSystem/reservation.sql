-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2015 at 10:44 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `matric_no` varchar(10) NOT NULL,
  `password` varchar(225) NOT NULL,
  `tel_no` varchar(20) NOT NULL,
  `email` varchar(225) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `name`, `matric_no`, `password`, `tel_no`, `email`, `type`) VALUES
('aaa', 'aaa', 'a13cs0193', 'aaa', '12345', 'aaa', 'admin'),
('bbb', 'bbb', 'a1234', 'bbb', 'bb', 'bb', 'utmUser'),
('ccc', 'ccc', '', 'ccc', 'ccc', 'ccc', 'guest'),
('hema', 'hema', 'hema', 'hema', '', '', 'hema');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE IF NOT EXISTS `venue` (
  `venueID` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venueID`, `description`) VALUES
(1, 'DSI'),
(2, 'L50_BK1'),
(3, 'L50_BK2'),
(4, 'L50_BK3'),
(5, 'L50_BK4'),
(6, 'L50_BK5'),
(7, 'L50_Foyer'),
(8, 'N24_BK1');

-- --------------------------------------------------------

--
-- Table structure for table `venue_reservation`
--

CREATE TABLE IF NOT EXISTS `venue_reservation` (
  `reservationID` int(11) NOT NULL,
  `venueID` int(20) NOT NULL,
  `username` varchar(225) NOT NULL,
  `approval_status` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue_reservation`
--

INSERT INTO `venue_reservation` (`reservationID`, `venueID`, `username`, `approval_status`, `date`, `time`) VALUES
(1, 3, 'ccc', 'approved', '12/26/2015', '4-6pm'),
(2, 1, 'ccc', 'approved', '12/17/2015', '12-2pm'),
(3, 1, 'ccc', 'rejected', '12/25/2015', '8-10am'),
(4, 5, 'ccc', 'approved', '12/18/2015', '2-4pm'),
(5, 7, 'ccc', 'rejected', '12/26/2015', '6-8pm'),
(6, 2, 'bbb', 'rejected', '12/31/2015', '2-4pm'),
(7, 4, 'bbb', 'rejected', '12/26/2015', '4-6pm'),
(8, 4, 'bbb', 'approved', '12/26/2015', '6-8pm'),
(9, 4, 'ccc', 'pending', '01/28/2016', '12-2pm'),
(10, 7, 'ccc', 'pending', '12/28/2015', '12-2pm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueID`);

--
-- Indexes for table `venue_reservation`
--
ALTER TABLE `venue_reservation`
  ADD PRIMARY KEY (`reservationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venueID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `venue_reservation`
--
ALTER TABLE `venue_reservation`
  MODIFY `reservationID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
