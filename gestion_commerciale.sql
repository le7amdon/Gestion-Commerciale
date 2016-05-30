-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2016 at 01:03 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gestion_commerciale`
--

-- --------------------------------------------------------

--
-- Table structure for table `bon_de_livraison`
--

CREATE TABLE IF NOT EXISTS `bon_de_livraison` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `id_facture` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livraison_facture` (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bon_de_sortie`
--

CREATE TABLE IF NOT EXISTS `bon_de_sortie` (
  `id` int(6) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bon_entree`
--

CREATE TABLE IF NOT EXISTS `bon_entree` (
  `id` int(6) NOT NULL,
  `id_facture_a_voir` int(6) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_association4_facture` (`id_facture_a_voir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(6) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `tel` int(15) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `id_societe` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_societe` (`id_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `id_fournisseur` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commande_produit`
--

CREATE TABLE IF NOT EXISTS `commande_produit` (
  `id_commande` int(6) NOT NULL,
  `id_produit` int(6) NOT NULL,
  `qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `fk_association_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `decaissement`
--

CREATE TABLE IF NOT EXISTS `decaissement` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `prix_total` double DEFAULT NULL,
  `id_facture_a_voir` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture` (`id_facture_a_voir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devis`
--

CREATE TABLE IF NOT EXISTS `devis` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `prix_total` double DEFAULT NULL,
  `id_client` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_devis_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devis_produit`
--

CREATE TABLE IF NOT EXISTS `devis_produit` (
  `id_devis` int(6) NOT NULL DEFAULT '0',
  `id_produit` int(6) NOT NULL DEFAULT '0',
  `qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_devis`,`id_produit`),
  KEY `fk_association2_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `id_devis` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_devis` (`id_devis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facture_a_voir`
--

CREATE TABLE IF NOT EXISTS `facture_a_voir` (
  `id` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `prix_total` double DEFAULT NULL,
  `id_commande` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_commande` (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int(6) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `tel` int(15) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `id_societe` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fournisseur_societe` (`id_societe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE IF NOT EXISTS `marque` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(6) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prix_achat` double DEFAULT NULL,
  `prix_vente` double DEFAULT NULL,
  `qte_stock` int(11) DEFAULT NULL,
  `id_categorie` int(6) DEFAULT NULL,
  `id_marque` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produit_marque` (`id_marque`),
  KEY `fk_produit_categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `tel` int(15) NOT NULL,
  `fax` int(15) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `matricule_fiscale` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sortie_produit`
--

CREATE TABLE IF NOT EXISTS `sortie_produit` (
  `qte` int(11) DEFAULT NULL,
  `id_produit` int(6) NOT NULL DEFAULT '0',
  `id_bon_de_sortie` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produit`,`id_bon_de_sortie`),
  KEY `fk_bon_de_sortie` (`id_bon_de_sortie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bon_de_livraison`
--
ALTER TABLE `bon_de_livraison`
  ADD CONSTRAINT `fk_livraison_facture` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id`);

--
-- Constraints for table `bon_entree`
--
ALTER TABLE `bon_entree`
  ADD CONSTRAINT `fk_association4_facture` FOREIGN KEY (`id_facture_a_voir`) REFERENCES `facture_a_voir` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`);

--
-- Constraints for table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `fk_association_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `fk_association_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`);

--
-- Constraints for table `decaissement`
--
ALTER TABLE `decaissement`
  ADD CONSTRAINT `fk_facture` FOREIGN KEY (`id_facture_a_voir`) REFERENCES `facture_a_voir` (`id`);

--
-- Constraints for table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `fk_devis_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Constraints for table `devis_produit`
--
ALTER TABLE `devis_produit`
  ADD CONSTRAINT `fk_association2_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `fk_association2_devis` FOREIGN KEY (`id_devis`) REFERENCES `devis` (`id`);

--
-- Constraints for table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_devis` FOREIGN KEY (`id_devis`) REFERENCES `devis` (`id`);

--
-- Constraints for table `facture_a_voir`
--
ALTER TABLE `facture_a_voir`
  ADD CONSTRAINT `fk_facture_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`);

--
-- Constraints for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fk_fournisseur_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`);

--
-- Constraints for table `sortie_produit`
--
ALTER TABLE `sortie_produit`
  ADD CONSTRAINT `fk_association3_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `fk_bon_de_sortie` FOREIGN KEY (`id_bon_de_sortie`) REFERENCES `bon_de_sortie` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
