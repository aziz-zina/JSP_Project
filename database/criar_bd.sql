-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 06:13 AM
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
(0, 1, 1, 1, 'maria'),
(1, 0, 0, 1, 'rafik');

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

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `idClient`, `date`, `time`, `pet`, `serviceType`, `EmployeeUser`) VALUES
(8, 'patrick', '2023-06-09', '12:00:00', 'Cat', 'Both', 'joao'),
(9, 'maria', '2023-06-05', '15:00:00', 'Cat', 'Wash', 'maria'),
(12, 'joana', '2023-06-14', '18:00:00', 'Dog', 'Cut', 'joana'),
(18, 'client', '2023-07-05', '17:00:00', 'Dog', 'Cut', 'joao'),
(19, 'client', '2023-07-05', '10:00:00', 'Dog', 'Cut', 'joao'),
(20, 'joao', '2023-07-05', '14:00:00', 'Dog', 'Cut', 'joao'),
(21, 'rafik', '2023-06-15', '10:00:00', 'Dog', 'Cut', 'joao');

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
('ahmed', 'ahmed', 'ahmed', 'ahmed@gmail.com', 746382, 4),
('aziz', 'aziz', 'aziz', 'azizzina000@gmail.com', 9347390, 4),
('client', 'client', 'client', 'client@outlook.com', 24696124, 3),
('hamma', 'hamma', 'hamma', 'hamma@gmail.com', 9876, 4),
('joana', 'joana', 'joana', 'joana@gmail.com', 93505387, 2),
('joao', 'joao', 'joao', 'joao@gmail.com', 24696124, 2),
('maria', 'maria', 'maria', 'maria@ipcb.pt', 24696407, 2),
('patrick', 'patrick123', 'patrick', 'patrick@gmail.com', 94849, 3),
('rafik', 'rafik', 'rafik', 'rafik@gmail.com', 1234, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employeeact`
--
ALTER TABLE `employeeact`
  ADD KEY `EmployeeUser` (`EmployeeUser`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `EmployeeUser` (`EmployeeUser`),
  ADD KEY `EmployeeUser_2` (`EmployeeUser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeeact`
--
ALTER TABLE `employeeact`
  ADD CONSTRAINT `employeeact_ibfk_1` FOREIGN KEY (`EmployeeUser`) REFERENCES `user` (`Login`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `user` (`Login`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`EmployeeUser`) REFERENCES `user` (`Login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
