-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 05 Juillet 2014 à 17:36
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `stmc`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `code_categorie` varchar(10) DEFAULT NULL,
  `nom_categorie` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `code_categorie`, `nom_categorie`) VALUES
(1, 'ASS', 'Assainissment'),
(2, 'CAD', 'Catégorie taches Administratives'),
(3, 'CBT', 'Catégorie taches Batiment'),
(4, 'CDV', 'Catégorie taches Diverses'),
(5, 'CEV', 'Catégorie taches Espace Vert'),
(6, 'CVR', 'Catégorie taches Voirie');

-- --------------------------------------------------------

--
-- Structure de la table `comprendre`
--

CREATE TABLE IF NOT EXISTS `comprendre` (
  `id_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `id_intervenant` int(11) NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_intervenant`),
  KEY `FK_Comprendre_id_intervenant` (`id_intervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `id_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `code_equipe` varchar(10) DEFAULT NULL,
  `nom_equipe` varchar(40) DEFAULT NULL,
  `nbre_intervenant` int(11) DEFAULT NULL,
  `id_intervenant` int(11) NOT NULL,
  PRIMARY KEY (`id_equipe`),
  KEY `FK_Equipe_id_intervenant` (`id_intervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE IF NOT EXISTS `intervenant` (
  `id_intervenant` int(11) NOT NULL AUTO_INCREMENT,
  `code_intervenant` varchar(10) DEFAULT NULL,
  `nom_intervenant` varchar(40) DEFAULT NULL,
  `prenom_intervenant` varchar(40) DEFAULT NULL,
  `fonction_intervenant` varchar(80) DEFAULT NULL,
  `Contact_intervenant` varchar(40) DEFAULT NULL,
  `Date_embauche` date DEFAULT NULL,
  `contrat` varchar(60) DEFAULT NULL,
  `terme_contrat` date DEFAULT NULL,
  PRIMARY KEY (`id_intervenant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `intervenant`
--

INSERT INTO `intervenant` (`id_intervenant`, `code_intervenant`, `nom_intervenant`, `prenom_intervenant`, `fonction_intervenant`, `Contact_intervenant`, `Date_embauche`, `contrat`, `terme_contrat`) VALUES
(1, 'ABT01-PS', 'PECHERON', 'Serge', 'Gestion et maintenance Batiment', '0608037366', '2000-10-01', 'CDI', '0000-00-00'),
(2, 'ACE01-GO', 'GRELET', 'Olivier', 'conducteur d''engins', NULL, '1992-01-09', 'CDI', '0000-00-00'),
(3, 'AEV01-LFJ', 'LE FUR', 'Joël', 'Agent espaces verts', NULL, '1988-08-01', 'CDI', '0000-00-00'),
(4, 'AEV02-HD', 'HAMMARD', 'Didier', 'Agent espaces verts', NULL, '2007-11-12', 'CDI', '0000-00-00'),
(5, 'AEV03-DM', 'DEBELLY', 'Michel', 'CDD emploi avenir espaces verts', NULL, '2014-03-03', 'CDD', '0000-00-00'),
(6, 'AEV04-MG', 'MUNUERA', 'Geoffrey', 'CDD agent espaces verts', NULL, '2012-10-22', 'CDD', '0000-00-00'),
(7, 'AVR01-MG', 'MICHEL', 'Guy', 'Agent  voirie', NULL, '2000-09-01', 'CDI', '0000-00-00'),
(8, 'AVR02-TC', 'TRIGANNE', 'Cyril', 'Agent voirie', NULL, '2007-01-01', 'CDI', '0000-00-00'),
(9, 'RST-FP', 'FOUASSIER', 'Pascal', 'responsable services techniques', '0608037344', '2012-05-01', 'CDI', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE IF NOT EXISTS `intervention` (
  `id_intervention` int(11) NOT NULL AUTO_INCREMENT,
  `nom_intervention` varchar(40) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `duree_heures` time DEFAULT NULL,
  `id_type` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  PRIMARY KEY (`id_intervention`),
  KEY `FK_Intervention_id_type` (`id_type`),
  KEY `FK_Intervention_id_local` (`id_local`),
  KEY `FK_Intervention_id_equipe` (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `local`
--

CREATE TABLE IF NOT EXISTS `local` (
  `id_local` int(11) NOT NULL AUTO_INCREMENT,
  `code_local` varchar(10) DEFAULT NULL,
  `nom_local` varchar(80) DEFAULT NULL,
  `id_site` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_local`),
  KEY `FK_Local_id_site` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id_prod` int(11) NOT NULL AUTO_INCREMENT,
  `code_produit` varchar(10) DEFAULT NULL,
  `désignation` varchar(60) DEFAULT NULL,
  `unite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id_prod`, `code_produit`, `désignation`, `unite`) VALUES
(1, '0', 'Acide cellulosique', '0'),
(2, '0', 'Ciment blanc', '0'),
(3, '0', 'Gravier', '0'),
(4, '0', 'Gaz-oil', '0'),
(5, '0', 'Papier peint', '0'),
(6, '0', 'Peinture à huile', '0'),
(7, '0', 'Pelleteuse', '0'),
(8, '0', 'Pelouse synthétique', '0'),
(9, '0', 'Roller ', '0'),
(10, '0', 'Sable à maçonner', '0');

-- --------------------------------------------------------

--
-- Structure de la table `salaire`
--

CREATE TABLE IF NOT EXISTS `salaire` (
  `id_salaire` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut_sal` date DEFAULT NULL,
  `salaire_h` float DEFAULT NULL,
  `date_fin_sal` date DEFAULT NULL,
  `id_intervenant` int(11) NOT NULL,
  PRIMARY KEY (`id_salaire`),
  KEY `FK_Salaire_id_intervenant` (`id_intervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id_site` int(11) NOT NULL AUTO_INCREMENT,
  `code_site` varchar(10) DEFAULT NULL,
  `nom_site` varchar(80) DEFAULT NULL,
  `localisation` int(80) DEFAULT NULL,
  PRIMARY KEY (`id_site`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `site`
--

INSERT INTO `site` (`id_site`, `code_site`, `nom_site`, `localisation`) VALUES
(1, 'DBM-31', 'batiment 31', 31),
(2, 'DBM-37', 'batiment 37', 37),
(3, 'DBM-39', 'batiment 39', 39),
(4, 'DBM-54', 'batiment 54', 54),
(5, 'DBM-AH', 'ALSH', 0),
(6, 'DBM-CS', 'complexe sportif', 0),
(7, 'DBM-EG', 'église', 0),
(8, 'DBM-EM', 'ecole maternelle', 0),
(9, 'DBM-EP', 'ecole primaire', 0),
(10, 'DBM-GP', 'garderie périscolaire', 0),
(11, 'DBM-LO', 'local OMA', 0),
(12, 'DBM-LP', 'logement poste', 0),
(13, 'DBM-LV', 'loge de vigne', 0),
(14, 'DBM-MD', 'médiathèque', 0),
(15, 'DBM-MLA', 'mission locale angevine', 0),
(16, 'DBM-MR', 'mairie', 52),
(17, 'DBM-PT', 'poste', 0),
(18, 'DBM-RS', 'restaurant scolaire', 0),
(19, 'DBM-SJ', 'salle des jeunes', 0),
(20, 'DBM-SP', 'ex stockage materiel des pompiers', 0),
(21, 'DBM-SQ', 'sequoia', 0),
(22, 'DBM-STN', 'services techniques nord', 0),
(23, 'DBM-STS', 'services techniques sud', 0),
(24, 'DEV-ET', 'espaces tonte', 0),
(25, 'DEV-FB', 'fleurissement buses, jardinières, pots au sol', 0),
(26, 'DEV-FM', 'fleurissement massifs', 0),
(27, 'DEV-FS', 'suspension, jardinières, pots plastques', 0),
(28, 'DEV-MA', 'massifs arbustifs', 0),
(29, 'DEV-PP', 'peupleraies', 0),
(30, 'DLP-AJ', 'aires de jeux', 0),
(31, 'DLP-BO', 'bassins d''orage', 0),
(32, 'DLP-CI', 'cimetière', 0),
(33, 'DLP-CV', 'coulée verte', 0),
(34, 'DLP-JP', 'jardins publiques', 0),
(35, 'DVR-VR', 'les voiries', 0);

-- --------------------------------------------------------

--
-- Structure de la table `type_intervention`
--

CREATE TABLE IF NOT EXISTS `type_intervention` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `code_type` varchar(10) DEFAULT NULL,
  `designation_type` varchar(80) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  KEY `FK_Type_intervention_id_categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisation_produit`
--

CREATE TABLE IF NOT EXISTS `utilisation_produit` (
  `id_utilisation` int(11) NOT NULL AUTO_INCREMENT,
  `prix_unitaire` float DEFAULT NULL,
  `quantite` float DEFAULT NULL,
  `id_intervention` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisation`),
  KEY `FK_Utilisation_produit_id_intervention` (`id_intervention`),
  KEY `FK_Utilisation_produit_id_prod` (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comprendre`
--
ALTER TABLE `comprendre`
  ADD CONSTRAINT `FK_Comprendre_id_intervenant` FOREIGN KEY (`id_intervenant`) REFERENCES `intervenant` (`id_intervenant`),
  ADD CONSTRAINT `FK_Comprendre_id_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `FK_Equipe_id_intervenant` FOREIGN KEY (`id_intervenant`) REFERENCES `intervenant` (`id_intervenant`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK_Intervention_id_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`),
  ADD CONSTRAINT `FK_Intervention_id_local` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`),
  ADD CONSTRAINT `FK_Intervention_id_type` FOREIGN KEY (`id_type`) REFERENCES `type_intervention` (`id_type`);

--
-- Contraintes pour la table `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `FK_Local_id_site` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `salaire`
--
ALTER TABLE `salaire`
  ADD CONSTRAINT `FK_Salaire_id_intervenant` FOREIGN KEY (`id_intervenant`) REFERENCES `intervenant` (`id_intervenant`);

--
-- Contraintes pour la table `type_intervention`
--
ALTER TABLE `type_intervention`
  ADD CONSTRAINT `FK_Type_intervention_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `utilisation_produit`
--
ALTER TABLE `utilisation_produit`
  ADD CONSTRAINT `FK_Utilisation_produit_id_prod` FOREIGN KEY (`id_prod`) REFERENCES `produit` (`id_prod`),
  ADD CONSTRAINT `FK_Utilisation_produit_id_intervention` FOREIGN KEY (`id_intervention`) REFERENCES `intervention` (`id_intervention`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
