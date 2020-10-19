-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 14 sep. 2020 à 22:30
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Planning`
--
CREATE DATABASE IF NOT EXISTS `Planning` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Planning`;

-- --------------------------------------------------------

--
-- Structure de la table `Gere`
--

CREATE TABLE `Gere` (
  `id_gestionnaire` int(11) NOT NULL,
  `nom_court_salle` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Gere`
--

INSERT INTO `Gere` (`id_gestionnaire`, `nom_court_salle`) VALUES
(1, 'Amphi1'),
(1, 'Amphi2'),
(1, 'B112'),
(1, 'B300'),
(1, 'BN1'),
(1, 'F105'),
(2, 'B112'),
(2, 'BN1'),
(3, 'BN1'),
(3, 'F105');

-- --------------------------------------------------------

--
-- Structure de la table `Gestionnaire`
--

CREATE TABLE `Gestionnaire` (
  `id_gestionnaire` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Gestionnaire`
--

INSERT INTO `Gestionnaire` (`id_gestionnaire`, `nom`, `prenom`, `telephone`) VALUES
(1, 'Nom1', 'Prenom1', 'tel1'),
(2, 'Nom2', 'Prenom2', 'tel2'),
(3, 'Nom3', 'Prenom3', 'tel3'),
(4, 'Nom4', 'Prenom3', 'tel4'),
(5, 'Nom6', 'Prenom6', 'tel6');

-- --------------------------------------------------------

--
-- Structure de la table `Salle`
--

CREATE TABLE `Salle` (
  `nom_court_salle` varchar(10) NOT NULL,
  `libelle_salle` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Salle`
--

INSERT INTO `Salle` (`nom_court_salle`, `libelle_salle`, `capacite`) VALUES
('Amphi1', 'Amphithéâtre 1', 800),
('Amphi2', 'Amphithâtre 2', 350),
('B112', 'Salle B112', 50),
('B300', 'Salle B300', 30),
('BN1', 'Bâtiment N, salle 1', 32),
('BN4', 'Bâtiment N, salle 4', 36),
('C302', 'Salle C302', 30),
('F105', 'Salle F105', 32);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Gere`
--
ALTER TABLE `Gere`
  ADD PRIMARY KEY (`id_gestionnaire`,`nom_court_salle`),
  ADD KEY `fk_salle` (`nom_court_salle`);

--
-- Index pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  ADD PRIMARY KEY (`id_gestionnaire`);

--
-- Index pour la table `Salle`
--
ALTER TABLE `Salle`
  ADD PRIMARY KEY (`nom_court_salle`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Gestionnaire`
--
ALTER TABLE `Gestionnaire`
  MODIFY `id_gestionnaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Gere`
--
ALTER TABLE `Gere`
  ADD CONSTRAINT `fk_gestionnaire` FOREIGN KEY (`id_gestionnaire`) REFERENCES `Gestionnaire` (`id_gestionnaire`),
  ADD CONSTRAINT `fk_salle` FOREIGN KEY (`nom_court_salle`) REFERENCES `Salle` (`nom_court_salle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
