-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 03, 2021 at 06:54 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poco_loco`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_cat`, `nom`) VALUES
(1, 'Starters'),
(2, 'Main dishes'),
(3, 'Desserts'),
(4, 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(64) NOT NULL,
  `telephone` int(10) NOT NULL,
  `statut` varchar(10) NOT NULL DEFAULT 'client',
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `email`, `mdp`, `nom`, `prenom`, `adresse`, `cp`, `ville`, `telephone`, `statut`) VALUES
(1, 'example@email.com', '$2y$10$U0e1TffESZDYdMfxKsQaiOqjSfouH.IghjsNlYphzZB4gcdfqmYTO', 'Smith', 'Joe', 'rue des minimes', 17000, 'La rochelle', 606060606, 'admin'),
(2, 'example.client@mail.com', '$2y$10$eOm0Mb47gYuELFRYV585ouuujsfoA/J9tioUWznHLp3YVxBuoWXrO', 'Dupont', 'Paul', 'rue Albert Einstein', 17000, 'La Rochelle', 707070707, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prix_total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_client`, `date`, `prix_total`) VALUES
(1, 100, '2020-12-27 19:00:22', '100.00'),
(2, 2, '2020-12-27 19:04:10', '0.00'),
(3, 2, '2020-12-28 15:23:25', '0.00'),
(4, 2, '2020-12-28 15:25:29', '10.50'),
(5, 2, '2021-01-03 15:59:56', '11.50'),
(6, 2, '2021-01-03 16:01:23', '11.50'),
(7, 2, '2021-01-03 18:11:11', '11.50'),
(8, 2, '2021-01-03 18:12:08', '11.50'),
(9, 2, '2021-01-03 18:12:43', '11.50'),
(10, 2, '2021-01-03 18:13:00', '11.50');

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_repas` int(11) NOT NULL,
  `qte_repas` int(20) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_repas` (`id_repas`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id_commande`, `id_repas`, `qte_repas`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 1, 2),
(4, 1, 2),
(5, 1, 2),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 1, 2),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 1),
(21, 1, 1),
(22, 1, 1),
(23, 1, 1),
(24, 1, 1),
(25, 1, 1),
(26, 1, 1),
(27, 1, 1),
(28, 1, 1),
(29, 4, 1),
(30, 4, 1),
(31, 10, 1),
(32, 10, 1),
(33, 10, 1),
(34, 10, 1),
(35, 10, 1),
(36, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `repas`
--

DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `id_repas` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `designation` varchar(128) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `tva` decimal(5,1) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(64) NOT NULL,
  `quantite` int(3) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id_repas`),
  KEY `id_cat` (`id_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repas`
--

INSERT INTO `repas` (`id_repas`, `id_cat`, `designation`, `prix`, `tva`, `description`, `img`, `quantite`) VALUES
(1, 1, 'Southern Fried Chicken', '6.00', '7.5', 'Southern fried chicken with mexican spice, comes with a sauce of your choice.', 'images/fried_chicken.jpg', 7),
(2, 3, 'Homemade Chocolat Brownie', '4.00', '5.5', 'Homemade chocolate brownie cake with chocolate sauce and whipped cream.', 'images/brownie.jpg', 10),
(3, 2, 'Mince Beef Burritos', '9.00', '12.0', 'Mince beef and vegetable burritos, comes with a side dish of your choice.', 'images/burritos.jpg', 10),
(4, 2, 'Mince Beef Tacos', '8.00', '10.5', 'Mince beef tacos accompanied with a fresh salad.', 'images/taco.jpg', 9),
(5, 1, 'Onion Rings', '3.00', '4.5', 'Fried onion rings accompanied with a sauce of your choice.', 'images/onion_rings.jpg', 10),
(6, 4, 'Pina Colada Cocktail', '4.00', '6.0', ' Fresh Pina Colada cocktail toped with a pineapple slice.', 'images/pina_colada.jpg', 10),
(7, 1, 'Chilli Cheese Nachos', '5.00', '6.5', ' Spicy mince beef nachos with chillies and cheese to share between two', 'images/nachos.jpg', 10),
(8, 4, 'Spritz Cocktail', '4.00', '5.5', 'Spritz cocktail topped with orange slice', 'images/spritz.jpg', 9),
(9, 4, 'Cuba Libre', '4.00', '5.5', 'Cuba Libre cocktail with lemon slice', 'images/cubalibre.jpg', 10),
(10, 3, 'Red Fruit Panna Cotta', '4.00', '5.0', 'Panna cotta with strawberry, rasberry and blueberry coulis', 'images/pannacotta.jpg', 9),
(11, 3, 'Strawberry Cheese Cake', '5.00', '6.0', 'Strawberry cheese cake topped with a strawberry coulis', 'images/cheesecake.jpg', 10),
(12, 3, 'Apple Pie', '4.00', '5.5', 'Homemade apple and cinnamon pie, served warm', 'images/applepie.jpg', 10),
(13, 4, 'Margarita Cocktail', '5.00', '6.5', 'Margarita cocktail with crushed ice and citrus fruits', 'images/margarita.jpg', 9),
(14, 1, 'Grilled chicken salad', '6.00', '8.0', 'A variety of fresh salad with delicious Mexican fried chicken', 'images/salad.jpg', 10),
(15, 2, 'Spicy Chicken Fajitas', '10.00', '12.5', 'Spicy chicken fajitas accompanied with wraps and salsa', 'images/fajita.jpg', 10),
(16, 2, 'Spicy Beef Fajitas', '10.00', '12.5', 'Spicy beef fajitas accompanied with wraps and salsa', 'images/beef.jpg', 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
