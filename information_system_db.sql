-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 09 Octobre 2014 à 20:18
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `information_system_db`
--
CREATE DATABASE IF NOT EXISTS `information_system_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `information_system_db`;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `event_description` text CHARACTER SET latin1,
  `event_image_link` text CHARACTER SET latin1,
  `event_date` date DEFAULT NULL,
  `event_creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_creator` (`event_creator`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=48 ;

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_description`, `event_image_link`, `event_date`, `event_creator`) VALUES
(46, 'test', 'test', 'http://www.freevector.com/site_media/preview_images/FreeVector-Business-Meeting.jpg', '2018-11-14', 1),
(47, 'test', 'test', 'd', '2014-10-02', 1);

-- --------------------------------------------------------

--
-- Structure de la table `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `subscription_user` int(11) NOT NULL,
  `subscription_event` int(11) NOT NULL,
  PRIMARY KEY (`subscription_user`,`subscription_event`),
  KEY `subscription_event` (`subscription_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `subscription`
--

INSERT INTO `subscription` (`subscription_user`, `subscription_event`) VALUES
(1, 47);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `user_first_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `user_last_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user_id`, `user_login`, `user_first_name`, `user_last_name`, `password`) VALUES
(1, 'saberkan', 'ABERKAN', 'Salahddine', 'saberkan'),
(2, 'saberkan2', 'saberkan2', 'saberkan2', 'saberkan2');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_creator`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`subscription_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`subscription_event`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
