-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 08 jan. 2024 à 20:37
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hopital_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `localis_chamb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_lit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_lit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_chamb` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `personnel_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `code_pat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_pers` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_consult` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frais_consult` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_consult` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231217112744', '2023-12-17 12:27:57', 418);

-- --------------------------------------------------------

--
-- Structure de la table `hospitalisation`
--

CREATE TABLE `hospitalisation` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `code_pat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_chambre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_arrive` date NOT NULL,
  `date_sort` date NOT NULL,
  `observation` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_secu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `naissance` date NOT NULL,
  `telephone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gendre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `nom`, `prenom`, `n_secu`, `adresse`, `naissance`, `telephone`, `email`, `gendre`) VALUES
(652, 'illum', 'distinctio', '13', '914, impasse Morin\n36646 Masson', '1988-01-18', '08 14 97 43 00', 'ilecomte@live.com', 'Homme'),
(653, 'eveniet', 'unde', '7', '28, place Fernandes\n19551 Martin', '1983-01-03', '0406112525', 'ucolin@huet.com', 'Femme'),
(654, 'id', 'quidem', '10', '89, rue Nath Wagner\n76 416 Pascal', '1998-12-25', '+33 5 35 12 62 2', 'richard.bouvier@mace.com', 'Femme'),
(655, 'saepe', 'mollitia', '9', '5, chemin de Torres\n01 204 Noel-sur-Valette', '1987-11-16', '+33 8 13 06 92 4', 'hebert.andre@robin.org', 'Homme'),
(656, 'modi', 'id', '12', '198, impasse Gillet\n18 513 Marques-les-Bains', '1980-10-15', '06 63 48 39 03', 'patrick.lesage@gallet.fr', 'Homme'),
(657, 'ipsa', 'sunt', '13', '15, rue de Lamy\n50406 Lenoir', '1986-03-04', '05 95 81 91 13', 'cbarbe@tele2.fr', 'Homme'),
(658, 'id', 'qui', '1', '703, rue de Cordier\n73 647 Pires', '1993-09-16', '02 33 87 20 34', 'hugues.renault@laposte.net', 'Femme'),
(659, 'ut', 'sapiente', '12', '713, impasse de Vallee\n36 468 Le Rouxnec', '1978-03-26', '07 48 53 00 34', 'dbourdon@garcia.fr', 'Homme'),
(660, 'id', 'architecto', '3', '8, impasse Émilie Gonzalez\n80 053 Hubert', '1999-08-25', '0360220955', 'timothee.collet@laposte.net', 'Homme'),
(661, 'consectetur', 'error', '1', 'chemin Roger Legrand\n31 334 Pascal', '1993-09-08', '+33 9 82 92 65 0', 'juliette41@laposte.net', 'Femme'),
(662, 'ex', 'et', '11', 'boulevard Anaïs Lucas\n29 105 LebonVille', '1998-08-19', '0179600764', 'thibaut.legoff@peron.fr', 'Homme'),
(663, 'minus', 'officia', '13', '210, boulevard Denis\n51768 Hoarau', '1994-07-02', '0607885311', 'laurent18@letellier.net', 'Homme'),
(664, 'itaque', 'veritatis', '11', 'chemin de Briand\n80 405 Masson', '1968-06-12', '05 62 43 34 70', 'rousset.claire@tele2.fr', 'Homme'),
(665, 'et', 'rem', '6', '999, rue Louis\n84294 Dumont', '1994-07-11', '06 45 00 34 51', 'hugues89@chartier.fr', 'Homme'),
(666, 'magnam', 'quia', '12', '1, rue Adam\n16591 Fouquet-sur-Mer', '1971-08-12', '0990999087', 'helene.renaud@free.fr', 'Homme'),
(667, 'quia', 'quam', '12', '51, rue Émile Laroche\n14 297 Dumas', '1985-06-15', '+33 (0)7 85 39 7', 'charles.allain@gauthier.com', 'Femme'),
(668, 'dolor', 'adipisci', '13', '68, rue de Pichon\n06322 Masse-sur-Marin', '1979-05-27', '09 47 19 93 62', 'jcolin@free.fr', 'Homme'),
(669, 'magnam', 'natus', '9', '53, place Chauvin\n27 060 MarchalVille', '1988-12-24', '+33 (0)1 36 01 0', 'amelie40@wanadoo.fr', 'Homme'),
(670, 'repellat', 'assumenda', '13', '20, impasse Duval\n88 160 Bousquet', '1975-04-24', '0362018349', 'ischneider@noos.fr', 'Femme'),
(671, 'vel', 'sint', '8', '5, chemin de Louis\n27 398 Pineau', '1964-11-21', '04 33 60 06 34', 'manon.vasseur@chretien.com', 'Femme'),
(672, 'sed', 'vitae', '1', '21, impasse de Potier\n53741 Coste-sur-Thierry', '1968-10-12', '+33 9 43 79 15 1', 'edith20@live.com', 'Homme'),
(673, 'doloribus', 'voluptatem', '11', '87, chemin Diallo\n55 531 Evrard', '1990-01-16', '+33 3 19 30 75 4', 'alice99@klein.fr', 'Femme'),
(674, 'omnis', 'rerum', '6', '69, chemin Noel\n82370 Teixeiradan', '1966-01-24', '03 76 25 64 35', 'benard.anne@orange.fr', 'Homme'),
(675, 'id', 'deleniti', '5', 'rue Baron\n49096 Lemonnier', '1969-05-06', '+33 5 49 50 65 8', 'juliette42@leroy.com', 'Femme'),
(676, 'quo', 'aspernatur', '4', '4, avenue Alexandre Chauveau\n74958 LelievreBourg', '1989-02-22', '03 28 29 23 04', 'theophile98@thibault.fr', 'Homme'),
(677, 'harum', 'a', '13', '98, boulevard Gomez\n76 530 Blot-la-Forêt', '2002-11-28', '07 33 71 96 97', 'ffabre@wanadoo.fr', 'Homme'),
(678, 'aut', 'occaecati', '8', '19, impasse Faivre\n90263 Bailly', '2002-08-27', '+33 (0)2 33 59 6', 'mfaivre@tele2.fr', 'Femme'),
(679, 'amet', 'placeat', '1', '147, avenue de Royer\n51549 Prevost', '1990-08-19', '06 82 03 67 75', 'zlambert@olivier.com', 'Homme'),
(680, 'eveniet', 'qui', '9', 'avenue de Lefevre\n10057 Roussetboeuf', '2002-01-04', '+33 6 41 54 00 6', 'michaud.ines@club-internet.fr', 'Homme'),
(681, 'quos', 'explicabo', '9', 'chemin Alix Ferreira\n60 530 Robert', '1966-10-07', '+33 (0)7 40 14 7', 'victoire28@live.com', 'Femme'),
(682, 'molestiae', 'est', '5', 'rue de Bertin\n08198 LeblancBourg', '1978-09-17', '09 62 60 99 37', 'ugrenier@laporte.org', 'Femme'),
(683, 'sint', 'quaerat', '3', '32, place David\n79 613 PerrinBourg', '1990-02-10', '+33 4 00 23 77 6', 'camus.alain@live.com', 'Homme'),
(684, 'sapiente', 'odit', '9', '37, rue Georges\n10 778 Bouvet-sur-Clerc', '1998-12-16', '07 34 42 79 76', 'dcaron@orange.fr', 'Homme'),
(685, 'aperiam', 'dolorem', '6', '98, avenue Toussaint\n68976 Bouvet-la-Forêt', '2003-09-25', '+33 1 67 10 82 3', 'theodore.blanc@bourdon.net', 'Femme'),
(686, 'consectetur', 'aut', '11', '79, boulevard Baron\n52 180 Perrier-la-Forêt', '2003-09-01', '+33 2 46 59 03 5', 'monique88@rossi.fr', 'Homme'),
(687, 'et', 'aperiam', '9', '701, rue Normand\n09 469 Descamps', '1973-02-08', '+33 9 06 28 63 0', 'jacqueline84@renard.fr', 'Femme'),
(688, 'in', 'placeat', '13', '968, impasse Alain Jacques\n03154 Michel', '1986-08-25', '+33 8 92 15 63 1', 'cgaudin@merle.fr', 'Homme'),
(689, 'earum', 'iure', '9', '11, rue Fabre\n96238 LouisBourg', '1999-06-05', '+33 (0)7 53 36 7', 'eolivier@hotmail.fr', 'Femme'),
(690, 'debitis', 'pariatur', '4', '30, place Margaret Guibert\n98550 Herve-sur-Parent', '1985-07-21', '+33 (0)4 81 45 1', 'marty.anastasie@bruneau.fr', 'Femme'),
(691, 'sint', 'ipsum', '11', 'avenue Roussel\n08839 Hubert', '1996-12-16', '+33 (0)8 08 30 6', 'lmartel@gmail.com', 'Femme'),
(692, 'quisquam', 'natus', '3', '92, boulevard Édouard Baudry\n22932 Merle', '1972-01-30', '+33 (0)5 24 59 7', 'lemaitre.jacques@fabre.com', 'Homme'),
(693, 'quia', 'itaque', '1', '257, place Deschamps\n50347 LeblancVille', '1997-05-31', '+33 3 55 56 69 1', 'tguibert@gmail.com', 'Femme'),
(694, 'exercitationem', 'error', '5', '863, rue Henriette De Oliveira\n03 911 Roux', '2001-12-17', '+33 2 90 31 22 6', 'aime02@tele2.fr', 'Homme'),
(695, 'magni', 'beatae', '1', '10, boulevard Camille Benard\n17895 Gilles-sur-Auger', '1986-10-10', '03 30 70 30 54', 'paul.perrot@live.com', 'Homme'),
(696, 'nam', 'sit', '4', '6, impasse Yves Blondel\n58266 Meunier-sur-Benoit', '1968-01-26', '02 56 84 57 44', 'veronique02@club-internet.fr', 'Homme'),
(697, 'quisquam', 'in', '7', '49, avenue Marc Grenier\n77 701 Gaudin', '1987-12-24', '0247050678', 'gabrielle75@besnard.fr', 'Femme'),
(698, 'fugit', 'est', '3', '36, rue Martel\n60 196 Martineau', '1983-07-29', '+33 8 27 92 08 7', 'cecile33@tele2.fr', 'Homme'),
(699, 'omnis', 'velit', '6', '58, rue de Chevalier\n04 710 Brunel', '1997-09-30', '+33 (0)4 38 08 4', 'boulanger.etienne@marty.fr', 'Homme'),
(700, 'molestias', 'et', '5', '71, avenue Etienne\n63 281 Carpentier-sur-Chartier', '1994-02-25', '+33 (0)9 13 74 7', 'emmanuel.salmon@riou.fr', 'Femme'),
(701, 'est', 'consequatur', '3', '90, chemin de Morin\n50 675 Fischer-les-Bains', '2000-01-06', '03 38 00 80 94', 'flesage@dijoux.com', 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `id` int(11) NOT NULL,
  `code_pers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_pers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gendre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `naissance` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_service` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `code_pers`, `nom_pers`, `gendre`, `naissance`, `email`, `telephone`, `adresse`, `fonction`, `code_service`) VALUES
(597, '3377', 'repellendus', 'Homme', '2000-07-14', 'oimbert@hotmail.fr', '03 49 11 06 99', '18, impasse Raymond Blanchet\n03 889 Colindan', 'Chef de médecins', '4331'),
(598, '4616', 'enim', 'Femme', '1987-11-23', 'lacombe.nicole@dupre.net', '0176353967', '49, rue de Guillot\n46 685 Pinto', 'Chef de operation', '4047'),
(599, '3124', 'pariatur', 'Femme', '1970-08-08', 'carre.hortense@club-internet.fr', '0264912225', '2, place Christophe Verdier\n18777 Blanchard-sur-Bouvier', 'Chef de infermieres', '2304'),
(600, '9785', 'repudiandae', 'Femme', '1975-05-17', 'munoz.louise@yahoo.fr', '+33 1 48 19 90 8', '37, place de Ledoux\n55 885 Grosnec', 'Chef de médecins', '3629'),
(601, '6669', 'et', 'Homme', '1970-12-24', 'njacques@marchal.net', '+33 1 65 21 42 2', 'rue Maggie Coste\n90627 Texier', 'Chef de médecins', '7497'),
(602, '5379', 'sint', 'Homme', '2002-05-26', 'michele.gros@live.com', '+33 7 81 52 23 7', '76, chemin de Marechal\n86 626 Launay', 'Chef de infermieres', '4024'),
(603, '3932', 'enim', 'Femme', '2005-01-13', 'suzanne.mallet@blot.fr', '0569699713', '2, avenue Antoinette Didier\n16302 JourdanBourg', 'Chef de operation', '2472'),
(604, '7922', 'fuga', 'Femme', '2002-05-01', 'pleclerc@ribeiro.net', '+33 (0)9 86 34 7', '14, boulevard Élodie Lemaire\n35421 Baudry', 'Chef de infermieres', '2282'),
(605, '2694', 'fugit', 'Femme', '1990-08-25', 'ibertrand@gilles.fr', '+33 (0)5 70 38 2', '5, chemin de Legendre\n96 845 BernardVille', 'Chef de infermieres', '8909'),
(606, '1357', 'non', 'Homme', '1966-02-11', 'dufour.benjamin@noos.fr', '05 21 45 31 62', '86, chemin Gallet\n55 863 Roux-sur-Bernard', 'Chef de infermieres', '2224'),
(607, '1320', 'quia', 'Femme', '1977-05-17', 'jweber@raymond.com', '+33 (0)9 53 95 4', '4, rue de Delahaye\n69 227 Faure-sur-Potier', 'Chef de infermieres', '9104'),
(608, '5639', 'nulla', 'Femme', '1990-01-07', 'nicolas.alexandre@mercier.com', '0235860722', '68, avenue Laure Gosselin\n68 630 Dumas-sur-Poirier', 'Chef de operation', '1959'),
(609, '7265', 'necessitatibus', 'Femme', '1990-09-27', 'ltanguy@noos.fr', '+33 7 41 78 31 2', '6, place Martine Cousin\n42274 Torres', 'Chef de operation', '7226'),
(610, '5878', 'in', 'Femme', '1967-09-03', 'aperrot@verdier.net', '08 97 99 12 71', '974, avenue de Nicolas\n58 035 Devaux', 'Chef de infermieres', '4240'),
(611, '5586', 'quis', 'Homme', '1965-03-31', 'fdelorme@richard.fr', '02 22 21 20 31', '30, chemin de Mathieu\n73 072 Lefebvre', 'Chef de médecins', '8740'),
(612, '4400', 'non', 'Femme', '1965-11-04', 'leon.normand@marin.com', '09 25 99 48 43', '265, boulevard Lacroix\n59 505 Allain-sur-Barthelemy', 'Chef de operation', '6284'),
(613, '6974', 'distinctio', 'Homme', '1995-07-11', 'laurence85@schmitt.net', '+33 (0)7 98 58 4', 'avenue de Antoine\n79566 Dupont-sur-Merle', 'Chef de operation', '9377'),
(614, '3990', 'magnam', 'Homme', '1975-10-29', 'rchevalier@yahoo.fr', '+33 (0)1 73 36 0', '53, rue Susanne Charrier\n69 258 Gilbert-les-Bains', 'Chef de infermieres', '4167'),
(615, '1333', 'recusandae', 'Femme', '1998-06-12', 'emmanuelle.chauvin@coste.com', '+33 3 73 64 11 8', 'avenue de Bouvet\n63520 Le Goff', 'Chef de médecins', '8475'),
(616, '1632', 'maiores', 'Femme', '1984-10-20', 'denis.manon@mace.fr', '09 62 80 82 22', '72, place David Legros\n31039 Bertrand', 'Chef de infermieres', '5164'),
(617, '2907', 'sunt', 'Homme', '2000-10-31', 'arenaud@lefevre.net', '08 26 41 40 83', '97, boulevard Xavier Carpentier\n83 262 Lenoir', 'Chef de médecins', '8010'),
(618, '7453', 'dolorem', 'Homme', '1995-04-16', 'louise87@yahoo.fr', '0455092242', '4, rue Pierre Bigot\n91 756 Torres', 'Chef de médecins', '4921'),
(619, '8931', 'id', 'Femme', '1964-05-02', 'bouvier.frederic@yahoo.fr', '+33 9 12 18 64 2', '67, place Marin\n37 042 Laroche-sur-Mer', 'Chef de médecins', '8294'),
(620, '8294', 'eligendi', 'Homme', '1992-08-17', 'margaud91@dbmail.com', '+33 (0)8 28 58 3', '70, chemin Bonnet\n02062 Marie', 'Chef de operation', '9308'),
(621, '1736', 'accusamus', 'Homme', '1969-05-06', 'fjoly@schneider.fr', '04 48 89 27 82', '4, avenue Cousin\n05637 Roche-les-Bains', 'Chef de operation', '2564'),
(622, '1800', 'ea', 'Homme', '1996-07-18', 'caroline.leclerc@noos.fr', '+33 8 18 49 11 2', 'rue de Meunier\n50742 Marchal-sur-Guillaume', 'Chef de médecins', '8140'),
(623, '8634', 'adipisci', 'Femme', '1970-04-06', 'irobin@hotmail.fr', '0383629764', 'boulevard de Gallet\n88 880 Tessier', 'Chef de operation', '4519'),
(624, '6777', 'eius', 'Homme', '1964-08-26', 'jacques.leblanc@wanadoo.fr', '+33 1 69 60 47 1', '782, avenue Honoré Prevost\n31 532 Peltier', 'Chef de operation', '9903'),
(625, '8153', 'enim', 'Homme', '1975-04-08', 'lucie10@wagner.com', '+33 1 23 11 17 5', '25, impasse Édouard Bourdon\n76816 Roux', 'Chef de operation', '5182'),
(626, '2049', 'vel', 'Femme', '1968-09-23', 'thierry.girard@letellier.com', '0139964391', '73, impasse Patricia Lefevre\n99 519 LelievreBourg', 'Chef de infermieres', '1835'),
(627, '3895', 'rem', 'Femme', '2005-08-31', 'martel.diane@boutin.net', '0378541048', 'rue Teixeira\n76099 Gosselin', 'Chef de médecins', '8298'),
(628, '9829', 'provident', 'Homme', '1980-02-24', 'marchand.monique@tele2.fr', '04 52 07 66 54', 'rue de Bousquet\n31845 Marteldan', 'Chef de médecins', '4745'),
(629, '5615', 'optio', 'Femme', '1979-11-07', 'lucie.gaillard@brunel.com', '0425564643', '17, rue Guyon\n35898 Rodriguez-sur-Lefevre', 'Chef de médecins', '2318'),
(630, '2801', 'recusandae', 'Femme', '1989-04-06', 'celine17@laposte.net', '0614274247', '648, rue Meyer\n50 897 Bernier', 'Chef de médecins', '9101'),
(631, '2683', 'dolor', 'Femme', '1970-01-19', 'yguyon@pineau.net', '0936845027', 'place Gosselin\n67652 Brun-les-Bains', 'Chef de médecins', '5194'),
(632, '7122', 'soluta', 'Femme', '2003-08-26', 'caroline.lacombe@noos.fr', '+33 7 56 19 31 6', '37, avenue Gosselin\n12517 Normand', 'Chef de infermieres', '7677'),
(633, '2798', 'quia', 'Femme', '1987-12-22', 'marie29@live.com', '0898601818', '2, rue Alex Da Costa\n63 943 Perrotnec', 'Chef de infermieres', '8409'),
(634, '4735', 'aut', 'Femme', '2001-02-17', 'michelle.alexandre@coste.org', '03 68 67 53 71', '672, boulevard de Lebrun\n19 491 Marty-les-Bains', 'Chef de médecins', '4164'),
(635, '1454', 'illo', 'Femme', '1982-11-25', 'kherve@jourdan.fr', '08 91 11 74 62', '76, chemin Bodin\n08 198 Lemaitreboeuf', 'Chef de operation', '5914'),
(636, '1370', 'et', 'Homme', '1983-06-20', 'ines.marechal@free.fr', '08 15 35 27 18', 'impasse Maillot\n58 577 Collet-sur-Mer', 'Chef de operation', '2226'),
(637, '5541', 'sequi', 'Femme', '1978-12-11', 'alix79@gmail.com', '+33 (0)1 96 55 0', '74, place Lesage\n69459 David-la-Forêt', 'Chef de operation', '3057'),
(638, '6559', 'ut', 'Homme', '1983-04-02', 'victor.blanc@toussaint.net', '0577894640', '162, boulevard Antoine Gaudin\n80 559 Loiseau-sur-Laine', 'Chef de operation', '8429'),
(639, '7572', 'qui', 'Femme', '1980-10-14', 'ebodin@devaux.org', '+33 (0)4 38 88 3', '877, avenue Bazin\n16 767 Poulainnec', 'Chef de infermieres', '8640'),
(640, '5540', 'soluta', 'Homme', '1965-08-08', 'ypotier@maillot.fr', '+33 (0)5 65 67 5', '70, place Clerc\n58459 Delmas', 'Chef de operation', '6117'),
(641, '1791', 'dolore', 'Femme', '1994-04-11', 'francois.chevalier@laposte.net', '0528058621', '5, rue Guyon\n46 730 Le Goffdan', 'Chef de médecins', '3066'),
(642, '5581', 'aspernatur', 'Femme', '1971-01-19', 'nmaillet@guilbert.com', '0175263453', 'rue de Mace\n69302 Caron', 'Chef de infermieres', '1305'),
(643, '7981', 'distinctio', 'Femme', '1964-07-28', 'hguillot@tele2.fr', '05 88 74 89 73', '20, place Moreno\n05 793 Ruiz-la-Forêt', 'Chef de infermieres', '3490'),
(644, '1076', 'rerum', 'Femme', '1982-06-15', 'chartier.gabriel@vallee.net', '0986393103', '66, chemin de Deschamps\n25 387 Caron', 'Chef de operation', '6987'),
(645, '8993', 'officia', 'Homme', '1991-12-01', 'laure00@yahoo.fr', '+33 3 07 28 34 2', '434, avenue Renard\n93341 Brunelnec', 'Chef de médecins', '6799'),
(646, '8981', 'harum', 'Homme', '1986-12-26', 'marechal.christine@dbmail.com', '01 54 10 88 64', '99, avenue Da Silva\n74243 Dijoux-sur-Mer', 'Chef de médecins', '1680');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `code_pat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_maladie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observation` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  `etat_pat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1015, 'maggie.schneider@dbmail.com', '[\"ROLE_USER\"]', ')vi-aUdo*5\"'),
(1016, 'srolland@roux.com', '[\"ROLE_USER\"]', 'g-Gmf$av;X9dLs'),
(1017, 'grondin.bernard@robin.fr', '[\"ROLE_USER\"]', '?Px=qVT,R/_OR'),
(1018, 'tbodin@live.com', '[\"ROLE_USER\"]', 'PDtTQ+?5'),
(1019, 'frederic98@club-internet.fr', '[\"ROLE_USER\"]', '\"EU=[8pHo;\"M3Z'),
(1020, 'wherve@foucher.com', '[\"ROLE_USER\"]', 'M-v>CW0};7VL@7jK'),
(1021, 'barbier.capucine@albert.fr', '[\"ROLE_USER\"]', 'l%p>hFat/?kh&+SSSW'),
(1022, 'guillaume.yves@masson.fr', '[\"ROLE_USER\"]', 'x]`$f)[BJu7W;D^{'),
(1023, 'marc.besnard@free.fr', '[\"ROLE_USER\"]', 'Agy^,!ymL%j*iC15\"&y'),
(1024, 'margot59@dumont.fr', '[\"ROLE_USER\"]', ':A;y&\"S6N`SF)'),
(1025, 'emasse@didier.net', '[\"ROLE_USER\"]', '!0w(cJ$'),
(1026, 'wvoisin@club-internet.fr', '[\"ROLE_USER\"]', 'c%XEG]Pn`-b\"'),
(1027, 'franck.merle@tele2.fr', '[\"ROLE_USER\"]', '+:\'\']KTqL_=D-`<H'),
(1028, 'chernandez@orange.fr', '[\"ROLE_USER\"]', 'nS:tJ<SYDTq\'Ddvmx>s:'),
(1029, 'laure.benoit@fischer.fr', '[\"ROLE_USER\"]', '<cg5*|zI-=B'),
(1030, 'louis.martin@richard.fr', '[\"ROLE_USER\"]', '$vJAo\'A:b|61FRx@$TAx'),
(1031, 'loiseau.david@laposte.net', '[\"ROLE_USER\"]', '=6LyG3'),
(1032, 'martel.antoinette@tele2.fr', '[\"ROLE_USER\"]', ',bbqu|{0We<m-xR+0\"YU'),
(1033, 'ndurand@charpentier.fr', '[\"ROLE_USER\"]', '^,AI(WM7])Xg8\"/t'),
(1034, 'guichard.eric@rousseau.net', '[\"ROLE_USER\"]', 'q\'%-{^F:|s}&F<'),
(1035, 'picard.victor@orange.fr', '[\"ROLE_USER\"]', '@OB{9Es>'),
(1036, 'alice37@lamy.com', '[\"ROLE_USER\"]', 'Mlm^Wo'),
(1037, 'rdiallo@laposte.net', '[\"ROLE_USER\"]', 'M\'P>C{QWvGT|p&=|_g9%'),
(1038, 'crobin@live.com', '[\"ROLE_USER\"]', '4%Bf0O~e$?e|'),
(1039, 'lfernandes@club-internet.fr', '[\"ROLE_USER\"]', 'leh\\smh^GiN00FX<'),
(1040, 'theodore65@sfr.fr', '[\"ROLE_USER\"]', '`Q^_3W&Em>NZZ'),
(1041, 'penelope13@perrin.net', '[\"ROLE_USER\"]', 'f?h]<H.d'),
(1042, 'royer.margot@roy.com', '[\"ROLE_USER\"]', ']o.\"NDpc6zA_z2n'),
(1043, 'franck02@dias.com', '[\"ROLE_USER\"]', '_$|N/QGR.A?(5dN'),
(1044, 'ibonnet@lemoine.com', '[\"ROLE_USER\"]', 'nq-Z|I_m{#`ll&[Kr'),
(1045, 'roland03@yahoo.fr', '[\"ROLE_USER\"]', 'p%=)v~'),
(1046, 'susan.fabre@yahoo.fr', '[\"ROLE_USER\"]', ':1d$#_$;d]PFm&:UT,'),
(1047, 'marc.morel@dbmail.com', '[\"ROLE_USER\"]', '4?\'F(-,>dPZw]77n$TA'),
(1048, 'dmuller@morel.fr', '[\"ROLE_USER\"]', 'qwe$z=>,sW~WnD'),
(1049, 'nmarion@club-internet.fr', '[\"ROLE_USER\"]', '^6YPcG#njBvL\'v]J5\\U'),
(1050, 'vleveque@club-internet.fr', '[\"ROLE_USER\"]', '#Cgxi-~P_Ph'),
(1051, 'cjacquot@carre.fr', '[\"ROLE_USER\"]', 'g0?lD@0H&Bo{?e'),
(1052, 'claudine99@colas.com', '[\"ROLE_USER\"]', 'eL\\{d:0E2(be5'),
(1053, 'aurore83@free.fr', '[\"ROLE_USER\"]', 'n,](Fk'),
(1054, 'colas.arthur@gmail.com', '[\"ROLE_USER\"]', 'N2H[kKkF_dZ]_@|,>['),
(1055, 'erichard@noos.fr', '[\"ROLE_USER\"]', 'm_<Vb;&_z'),
(1056, 'frederique.boulay@pelletier.fr', '[\"ROLE_USER\"]', ']~l_igBo1njiQz^G-8'),
(1057, 'theodore23@humbert.com', '[\"ROLE_USER\"]', '86Cv2\'JMV2w0'),
(1058, 'chauvet.sophie@salmon.fr', '[\"ROLE_USER\"]', 'SiThLr_$\\k,s^sU_?O^'),
(1059, 'fbouchet@neveu.fr', '[\"ROLE_USER\"]', '=(J,Of0Y#=jYi7A'),
(1060, 'emmanuel32@yahoo.fr', '[\"ROLE_USER\"]', 'uQ6\"2@9eJm]'),
(1061, 'louise.bouvier@aubry.org', '[\"ROLE_USER\"]', 'H!Y<l#s!'),
(1062, 'benjamin.torres@benoit.org', '[\"ROLE_USER\"]', '}I;\\lm]-9El`&e\")o'),
(1063, 'edith.chauvet@durand.fr', '[\"ROLE_USER\"]', 'n].$/n3Bx7C2aWT~D/'),
(1064, 'alice53@live.com', '[\"ROLE_USER\"]', 'Qu/-=P~1<zc,B!\"'),
(1065, 'firas@fake.com', '[\"ROLE_ADMIN\", \"ROLE_USER\", \"ROLE_PERSONNEL\"]', '$2y$13$drs7T4T28ZWbn98QuxKNJOPrI3pEjrgzksytifj6wr0zfbKACx.2S'),
(1066, 'Jacky@fake.com', '[\"ROLE_PERSONNEL\"]', '$2y$13$ySTrs2OIKc56vHygANkUMubwjCo3pVpPvHVL8tLm7Ul1ZjwFQq.XW'),
(1067, 'bruce@fake.com', '[\"ROLE_PERSONNEL\"]', '$2y$13$efM4/Td2udzR8QM9I6iBGO5yU2Xb.q4Z16KVRiAOEn/xQv78d26uO');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_964685A61C109075` (`personnel_id`),
  ADD KEY `IDX_964685A66B899279` (`patient_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `hospitalisation`
--
ALTER TABLE `hospitalisation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67C059596B899279` (`patient_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2A356D276B899279` (`patient_id`),
  ADD KEY `IDX_2A356D271C109075` (`personnel_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT pour la table `hospitalisation`
--
ALTER TABLE `hospitalisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=647;

--
-- AUTO_INCREMENT pour la table `traitement`
--
ALTER TABLE `traitement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1068;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FK_964685A61C109075` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  ADD CONSTRAINT `FK_964685A66B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `hospitalisation`
--
ALTER TABLE `hospitalisation`
  ADD CONSTRAINT `FK_67C059596B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `FK_2A356D271C109075` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`),
  ADD CONSTRAINT `FK_2A356D276B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
