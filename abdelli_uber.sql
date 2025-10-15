-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 01 oct. 2025 à 18:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bruno_uber`
--

-- --------------------------------------------------------

--
-- Structure de la table `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `chauffeur_id` int(11) NOT NULL,
  `chauffeur_nom` varchar(50) DEFAULT NULL,
  `chauffeur_telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chauffeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chauffeur`
--

INSERT INTO `chauffeur` (`chauffeur_id`, `chauffeur_nom`, `chauffeur_telephone`) VALUES
(1, 'Ali Karim', '0600000001'),
(2, 'Sarah Leïla', '0600000002'),
(3, 'Julien Moreau', '0600000003'),
(4, 'Lina Kassem', '0600000004'),
(5, 'Marc N’Guessan', '0600000005');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL,
  `client_nom` varchar(50) DEFAULT NULL,
  `client_telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`client_id`, `client_nom`, `client_telephone`) VALUES
(1, 'Jean Dubois', '0700000001'),
(2, 'Emma Lemoine', '0700000002'),
(3, 'Sophie Martin', '0700000003'),
(4, 'Youssef Amar', '0700000004'),
(5, 'Carla Ruiz', '0700000005');

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

DROP TABLE IF EXISTS `possede`;
CREATE TABLE IF NOT EXISTS `possede` (
  `client_id` int(11) NOT NULL,
  `trajet_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`trajet_id`),
  KEY `trajet_id` (`trajet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `possede`
--

INSERT INTO `possede` (`client_id`, `trajet_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(2, 3),
(4, 3),
(5, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

DROP TABLE IF EXISTS `trajet`;
CREATE TABLE IF NOT EXISTS `trajet` (
  `trajet_id` int(11) NOT NULL,
  `trajet_date_et_heure` datetime DEFAULT NULL,
  `chauffeur_id` int(11) NOT NULL,
  PRIMARY KEY (`trajet_id`),
  KEY `chauffeur_id` (`chauffeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`trajet_id`, `trajet_date_et_heure`, `chauffeur_id`) VALUES
(1, '2025-06-13 09:00:00', 1),
(2, '2025-06-14 14:30:00', 1),
(3, '2025-06-14 08:15:00', 3),
(4, '2025-06-14 12:45:00', 4),
(5, '2025-06-15 10:00:00', 5);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `voiture_id` int(11) NOT NULL,
  `voiture_marque` varchar(50) DEFAULT NULL,
  `voiture_modele` varchar(50) DEFAULT NULL,
  `voiture_immatriculation` varchar(50) DEFAULT NULL,
  `chauffeur_id` int(11) NOT NULL,
  PRIMARY KEY (`voiture_id`),
  KEY `chauffeur_id` (`chauffeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`voiture_id`, `voiture_marque`, `voiture_modele`, `voiture_immatriculation`, `chauffeur_id`) VALUES
(1, 'Tesla', 'Model 3', 'AB-123-CD', 1),
(2, 'Renault', 'Zoé', 'CD-456-EF', 1),
(3, 'Peugeot', '208', 'EF-789-GH', 2),
(4, 'Dacia', 'Spring', 'GH-321-RT', 3),
(5, 'Volkswagen', 'ID.3', 'JK-852-LM', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `possede`
--
ALTER TABLE `possede`
  ADD CONSTRAINT `possede_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `possede_ibfk_2` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`trajet_id`);

--
-- Contraintes pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD CONSTRAINT `trajet_ibfk_1` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeur` (`chauffeur_id`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`chauffeur_id`) REFERENCES `chauffeur` (`chauffeur_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
