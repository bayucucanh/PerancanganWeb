-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2020 at 06:17 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertemuan8_lat1`
--

-- --------------------------------------------------------

--
-- Table structure for table `ajar`
--

CREATE TABLE `ajar` (
  `ID_Dosen` char(10) DEFAULT NULL,
  `ID_Kuliah` char(10) DEFAULT NULL,
  `Tanggal_Ajar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `ID_Dosen` char(9) NOT NULL,
  `Nama_Depan_Dosen` varchar(10) NOT NULL,
  `Nama_Belakang_Dosen` varchar(10) NOT NULL,
  `Email_Dosen` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`ID_Dosen`, `Nama_Depan_Dosen`, `Nama_Belakang_Dosen`, `Email_Dosen`) VALUES
('010140001', 'Benjamin', 'Fadli', 'benjaminfadli@gmail.com'),
('010220002', 'Galih', 'Ginanjar', 'galih23@gmail.com'),
('010220004', 'Ferdinand', 'Gunawan', 'ferdinandg33@gmail.com'),
('010230003', 'Hasan', 'Rahman', 'hasanrahman@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kuliah`
--

CREATE TABLE `kuliah` (
  `ID_Kuliah` char(9) NOT NULL,
  `Nama_Kuliah` varchar(20) NOT NULL,
  `SKS` int(2) NOT NULL,
  `ID_Dosen` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuliah`
--

INSERT INTO `kuliah` (`ID_Kuliah`, `Nama_Kuliah`, `SKS`, `ID_Dosen`) VALUES
('010102001', 'Perancangan Basis Da', 3, '010140001'),
('010103001', 'Matematika Logika', 2, '010220002'),
('010103002', 'Dasar Pemograman', 3, '010220004'),
('010103003', 'Pemograman Web', 3, '010230003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajar`
--
ALTER TABLE `ajar`
  ADD KEY `ID_Dosen` (`ID_Dosen`),
  ADD KEY `ID_Kuliah` (`ID_Kuliah`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`ID_Dosen`),
  ADD KEY `Nama_Dosen` (`Nama_Depan_Dosen`,`Nama_Belakang_Dosen`) USING BTREE;

--
-- Indexes for table `kuliah`
--
ALTER TABLE `kuliah`
  ADD PRIMARY KEY (`ID_Kuliah`),
  ADD KEY `ID_Dosen` (`ID_Dosen`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ajar`
--
ALTER TABLE `ajar`
  ADD CONSTRAINT `ajar_ibfk_1` FOREIGN KEY (`ID_Dosen`) REFERENCES `dosen` (`ID_Dosen`),
  ADD CONSTRAINT `ajar_ibfk_2` FOREIGN KEY (`ID_Kuliah`) REFERENCES `kuliah` (`ID_Kuliah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kuliah`
--
ALTER TABLE `kuliah`
  ADD CONSTRAINT `kuliah_ibfk_1` FOREIGN KEY (`ID_Dosen`) REFERENCES `dosen` (`ID_Dosen`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
