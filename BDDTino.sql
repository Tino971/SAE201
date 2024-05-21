-- phpMyAdmin SQL Dump
-- version 6.0.0-dev
-- https://www.phpmyadmin.net/
--
-- Hôte : 192.168.30.22
-- Généré le : Mar. 21 Mai 2024 à 09:06
-- Version du serveur : 10.4.8-MariaDB-1:10.4.8+maria~stretch-log
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `BDDTino`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adherents`
--

CREATE TABLE `Adherents` (
  `NUMERO_ADHERENT` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `BENEVOLE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Adherents`
--

INSERT INTO `Adherents` (`NUMERO_ADHERENT`, `Nom`, `Prenom`, `DATE_DE_NAISSANCE`, `BENEVOLE`) VALUES
(1, 'Nom1', 'Prenom1', '1990-01-01', 1),
(2, 'Nom2', 'Prenom2', '1985-05-15', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Adhesions`
--

CREATE TABLE `Adhesions` (
  `ADHESION_ID` int(11) NOT NULL,
  `NUMERO_ADHERENT` int(11) DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `DATE_ADHESION` date DEFAULT NULL,
  `MONTANT` decimal(10,2) DEFAULT NULL,
  `DON` decimal(10,2) DEFAULT NULL,
  `MOYEN_DE_PAIEMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Adhesions`
--

INSERT INTO `Adhesions` (`ADHESION_ID`, `NUMERO_ADHERENT`, `Annee`, `DATE_ADHESION`, `MONTANT`, `DON`, `MOYEN_DE_PAIEMENT`) VALUES
(1, 1, 2020, '2020-01-15', 100.00, 10.00, 'Carte Bancaire'),
(2, 1, 2021, '2021-01-10', 120.00, 15.00, 'Chèque'),
(3, 2, 2020, '2020-02-20', 80.00, 5.00, 'Espèces'),
(4, 2, 2021, '2021-03-25', 90.00, 10.00, 'Carte Bancaire');

-- --------------------------------------------------------

--
-- Structure de la table `Adresses`
--

CREATE TABLE `Adresses` (
  `ADRESSE_ID` int(11) NOT NULL,
  `NUMERO_ADHERENT` int(11) DEFAULT NULL,
  `Rue` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Latitude_Ville` float DEFAULT NULL,
  `Longitude_Ville` float DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Adresses`
--

INSERT INTO `Adresses` (`ADRESSE_ID`, `NUMERO_ADHERENT`, `Rue`, `Ville`, `Latitude_Ville`, `Longitude_Ville`, `Etat`) VALUES
(1, 1, 'Rue1', 'Ville1', 48.8566, 2.3522, 'Etat1'),
(2, 2, 'Rue2', 'Ville2', 45.764, 4.8357, 'Etat2');

-- --------------------------------------------------------

--
-- Structure de la table `Contacts`
--

CREATE TABLE `Contacts` (
  `CONTACT_ID` int(11) NOT NULL,
  `NUMERO_ADHERENT` int(11) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Contacts`
--

INSERT INTO `Contacts` (`CONTACT_ID`, `NUMERO_ADHERENT`, `TELEPHONE`, `EMAIL`) VALUES
(1, 1, '0123456789', 'email1@example.com'),
(2, 2, '0987654321', 'email2@example.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Adherents`
--
ALTER TABLE `Adherents`
  ADD PRIMARY KEY (`NUMERO_ADHERENT`);

--
-- Index pour la table `Adhesions`
--
ALTER TABLE `Adhesions`
  ADD PRIMARY KEY (`ADHESION_ID`),
  ADD KEY `NUMERO_ADHERENT` (`NUMERO_ADHERENT`);

--
-- Index pour la table `Adresses`
--
ALTER TABLE `Adresses`
  ADD PRIMARY KEY (`ADRESSE_ID`),
  ADD KEY `NUMERO_ADHERENT` (`NUMERO_ADHERENT`);

--
-- Index pour la table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`CONTACT_ID`),
  ADD KEY `NUMERO_ADHERENT` (`NUMERO_ADHERENT`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Adhesions`
--
ALTER TABLE `Adhesions`
  MODIFY `ADHESION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Adresses`
--
ALTER TABLE `Adresses`
  MODIFY `ADRESSE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Adhesions`
--
ALTER TABLE `Adhesions`
  ADD CONSTRAINT `Adhesions_ibfk_1` FOREIGN KEY (`NUMERO_ADHERENT`) REFERENCES `Adherents` (`NUMERO_ADHERENT`);

--
-- Contraintes pour la table `Adresses`
--
ALTER TABLE `Adresses`
  ADD CONSTRAINT `Adresses_ibfk_1` FOREIGN KEY (`NUMERO_ADHERENT`) REFERENCES `Adherents` (`NUMERO_ADHERENT`);

--
-- Contraintes pour la table `Contacts`
--
ALTER TABLE `Contacts`
  ADD CONSTRAINT `Contacts_ibfk_1` FOREIGN KEY (`NUMERO_ADHERENT`) REFERENCES `Adherents` (`NUMERO_ADHERENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
