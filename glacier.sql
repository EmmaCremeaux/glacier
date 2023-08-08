-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 07 août 2023 à 14:48
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.2.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `glacier`
--
CREATE DATABASE IF NOT EXISTS `glacier` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glacier`;

-- --------------------------------------------------------

--
-- Structure de la table `congelateur`
--

DROP TABLE IF EXISTS `congelateur`;
CREATE TABLE `congelateur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL,
  `description` text NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `glace`
--

DROP TABLE IF EXISTS `glace`;
CREATE TABLE `glace` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `volume` bigint(20) NOT NULL,
  `date_production` datetime DEFAULT NULL,
  `date_sortie` datetime DEFAULT NULL,
  `congelateur_id` bigint(20) UNSIGNED NOT NULL,
  `parfum_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parfum`
--

DROP TABLE IF EXISTS `parfum`;
CREATE TABLE `parfum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(190) NOT NULL,
  `mdp` varchar(190) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `congelateur`
--
ALTER TABLE `congelateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_congelateur_utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `glace`
--
ALTER TABLE `glace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `congelateur_id` (`congelateur_id`),
  ADD KEY `parfum_id` (`parfum_id`);

--
-- Index pour la table `parfum`
--
ALTER TABLE `parfum`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-email-utilisateur` (`email`),
  ADD KEY `idx_role_id` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `congelateur`
--
ALTER TABLE `congelateur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `glace`
--
ALTER TABLE `glace`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `parfum`
--
ALTER TABLE `parfum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `congelateur`
--
ALTER TABLE `congelateur`
  ADD CONSTRAINT `fk_congelateur_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `glace`
--
ALTER TABLE `glace`
  ADD CONSTRAINT `fk__glace_parfum_id` FOREIGN KEY (`parfum_id`) REFERENCES `parfum` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_glace_congelateur_id` FOREIGN KEY (`congelateur_id`) REFERENCES `congelateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
