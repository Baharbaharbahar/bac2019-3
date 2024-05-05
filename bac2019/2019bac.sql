-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 04 mai 2024 à 19:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `2019bac`
--

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `IdParticipant` int(11) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Mdp` varchar(6) NOT NULL,
  `Genre` enum('M','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`IdParticipant`, `Mail`, `Mdp`, `Genre`) VALUES
(1, 'kayoussa1980@gmail.com', 'Kham01', 'M'),
(2, 'amouna1981@yahoo.fr', 'Miyar5', 'F'),
(3, 'Walouda1979@laPoste.tn', 'Walid2', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `NumQ` int(11) NOT NULL,
  `NumS` int(11) NOT NULL,
  `Contenu` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`NumQ`, `NumS`, `Contenu`) VALUES
(1, 1, 'Les informations partagées sur les réseaux sociaux sont fiables'),
(1, 2, 'Les jeux vidéo contribuent au développement de la pensée logique'),
(2, 1, 'usage des réseaux sociaux par les enfants doit être sous le contrôle parental'),
(3, 1, 'Les réseaux sociaux deviennent une nécessité pour les citoyens');

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `NumQ` int(11) NOT NULL,
  `NumS` int(11) NOT NULL,
  `IdParticipant` int(11) NOT NULL,
  `Rep` enum('1O','1N','1S','2O','2N','2S','3O','3N','3S') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`NumQ`, `NumS`, `IdParticipant`, `Rep`) VALUES
(1, 1, 1, '1S'),
(2, 1, 1, '2S'),
(3, 1, 1, '3S'),
(1, 1, 2, '1N'),
(2, 1, 2, '2O'),
(3, 1, 2, '3N'),
(1, 1, 3, '1N'),
(2, 1, 3, '2N'),
(3, 1, 3, '3N');

-- --------------------------------------------------------

--
-- Structure de la table `sondage`
--

CREATE TABLE `sondage` (
  `NumS` int(11) NOT NULL,
  `Theme` varchar(50) NOT NULL,
  `DateDebut` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `sondage`
--

INSERT INTO `sondage` (`NumS`, `Theme`, `DateDebut`) VALUES
(1, 'Les réseaux sociaux', '2019-05-01'),
(2, 'Les jeux vidéo', '2019-06-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`IdParticipant`),
  ADD UNIQUE KEY `IdParticipant_2` (`IdParticipant`),
  ADD KEY `IdParticipant` (`IdParticipant`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`NumQ`,`NumS`),
  ADD KEY `NumQ` (`NumQ`),
  ADD KEY `NumS` (`NumS`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD KEY `NumQ` (`NumQ`),
  ADD KEY `NumS` (`NumS`),
  ADD KEY `IdParticipant` (`IdParticipant`);

--
-- Index pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD PRIMARY KEY (`NumS`),
  ADD UNIQUE KEY `NumS_2` (`NumS`),
  ADD KEY `NumS` (`NumS`),
  ADD KEY `NumS_3` (`NumS`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `IdParticipant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sondage`
--
ALTER TABLE `sondage`
  MODIFY `NumS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`NumS`) REFERENCES `sondage` (`NumS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`NumQ`) REFERENCES `question` (`NumQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`NumS`) REFERENCES `sondage` (`NumS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reponse_ibfk_3` FOREIGN KEY (`IdParticipant`) REFERENCES `participant` (`IdParticipant`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
