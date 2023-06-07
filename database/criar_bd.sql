-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 05:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beauty_salon_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `employeeact`
--

CREATE TABLE `employeeact` (
  `Cut` int(2) NOT NULL,
  `Wash` int(2) NOT NULL,
  `Cat` int(2) NOT NULL,
  `Dog` int(2) NOT NULL,
  `EmployeeUser` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employeeact`
--

INSERT INTO `employeeact` (`Cut`, `Wash`, `Cat`, `Dog`, `EmployeeUser`) VALUES
(1, 1, 1, 1, 'joao'),
(1, 0, 1, 0, 'joana'),
(0, 1, 1, 1, 'maria');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `idClient` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `pet` varchar(20) NOT NULL,
  `serviceType` varchar(20) NOT NULL,
  `EmployeeUser` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Login` varchar(25) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telephone` int(9) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Login`, `Password`, `Name`, `Email`, `Telephone`, `Type`) VALUES
('admin', 'admin', 'admin', 'admin@gmail.com', 93505147, 1),
('azij', 'azij', 'azij', 'sdfysdf@dfsdfd', 337377, 4),
('aziz', 'aziz', 'aziz', 'azizzina000@gmail.com', 9347390, 4),
('client', 'client', 'client', 'client@outlook.com', 24696124, 3),
('dgrkjbgk', 'flksjdbfksudbf', 'ksdgsdkfg', 'hjgdsbkdhgb@jhyf', 74646252, 4),
('joana', 'joana', 'joana', 'joana@gmail.com', 93505387, 2),
('joao', 'joao', 'joao', 'joao@yahoo.fr', 98417306, 2),
('maria', 'maria', 'maria', 'maria@ipcb.pt', 24696407, 2),
('patrick', 'patrick', 'patrick', 'patrick@gmail.com', 94849, 4),
('rafik', 'rafik', 'rafik', 'rafik@gmail.com', 37463726, 4);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'admin'),
(2, 'employee'),
(3, 'valid user'),
(4, 'non valid user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
