-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 01, 2020 at 05:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BDNotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `A OBTENU NOTE`
--

CREATE TABLE `A OBTENU NOTE` (
  `numero` int(11) NOT NULL,
  `nom_module` varchar(30) NOT NULL,
  `nom_note` varchar(30) NOT NULL,
  `valeur` float NOT NULL,
  `parite_semestre` int(1) NOT NULL,
  `millesime` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `numero` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Module`
--

CREATE TABLE `Module` (
  `nom_module` varchar(30) NOT NULL,
  `nom_niveau` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `A OBTENU NOTE`
--
ALTER TABLE `A OBTENU NOTE`
  ADD PRIMARY KEY (`numero`,`nom_module`,`nom_note`),
  ADD KEY `nom_mod_FK` (`nom_module`);

--
-- Indexes for table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`numero`);

--
-- Indexes for table `Module`
--
ALTER TABLE `Module`
  ADD PRIMARY KEY (`nom_module`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `A OBTENU NOTE`
--
ALTER TABLE `A OBTENU NOTE`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Etudiant`
--
ALTER TABLE `Etudiant`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `A OBTENU NOTE`
--
ALTER TABLE `A OBTENU NOTE`
  ADD CONSTRAINT `Num_FK` FOREIGN KEY (`numero`) REFERENCES `Etudiant` (`numero`),
  ADD CONSTRAINT `nom_mod_FK` FOREIGN KEY (`nom_module`) REFERENCES `Module` (`nom_module`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
