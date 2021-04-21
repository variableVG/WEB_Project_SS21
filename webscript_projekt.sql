-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2021 um 19:28
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `webscript_projekt`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausgewaehlte_termine`
--

CREATE TABLE `ausgewaehlte_termine` (
  `id` int(11) NOT NULL,
  `termin_id` int(11) NOT NULL,
  `termin_datum` date NOT NULL,
  `termin_zeit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ausgewaehlte_termine`
--

INSERT INTO `ausgewaehlte_termine` (`id`, `termin_id`, `termin_datum`, `termin_zeit`) VALUES
(27, 105, '2021-04-23', '15:16:00'),
(28, 105, '2021-04-25', '15:16:00'),
(29, 106, '2021-04-26', '15:16:00'),
(30, 106, '2021-04-30', '15:16:00'),
(31, 106, '0000-00-00', '09:00:00'),
(32, 106, '0000-00-00', '09:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kommentare`
--

CREATE TABLE `kommentare` (
  `id` int(11) NOT NULL,
  `termin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inhalte` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `termine`
--

CREATE TABLE `termine` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `termin_creation_date` date NOT NULL DEFAULT current_timestamp(),
  `ablauf_termin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `author_id` int(11) NOT NULL,
  `beschreibung` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dauer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `termine`
--

INSERT INTO `termine` (`id`, `name`, `ort`, `termin_creation_date`, `ablauf_termin`, `author_id`, `beschreibung`, `dauer`) VALUES
(105, 'Termin 1', 'Home', '2021-04-21', '2021-05-09', 102, 'laskjdfoi uouoiajsdf', '1h'),
(106, 'Termin2', 'Online', '2021-04-21', '2021-06-04', 103, 'aisjdfasjd qoiueoasjdfadasdf', '3h');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ausgewaehlte_termine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `ausgewaehlte_termine_id`) VALUES
(6, 'Violeta', NULL),
(7, 'asdf', NULL),
(8, 'Vio', NULL),
(9, 'Vioa', NULL),
(10, 'Violeta', NULL),
(11, 'asdf', NULL),
(12, 'asf', NULL),
(13, 'Violeta2', NULL),
(14, 'asdfasdf', NULL),
(15, 'asf', NULL),
(16, 'asdf', NULL),
(17, 'asf', NULL),
(18, 'afesfasd', NULL),
(19, 'asdf', NULL),
(20, 'asf', NULL),
(21, 'asdf', NULL),
(22, 'asdf', NULL),
(23, 'asf', NULL),
(24, 'as', NULL),
(25, 'asdf', NULL),
(26, '', NULL),
(27, 'vioas', NULL),
(28, 'asdf', NULL),
(29, '', NULL),
(30, '', NULL),
(31, '', NULL),
(32, '', NULL),
(33, 'asdf', NULL),
(34, '', NULL),
(35, '', NULL),
(36, '', NULL),
(37, '', NULL),
(38, '', NULL),
(39, '', NULL),
(40, '', NULL),
(41, '', NULL),
(42, '', NULL),
(43, '', NULL),
(44, '', NULL),
(45, '', NULL),
(46, '', NULL),
(47, '', NULL),
(48, '', NULL),
(49, '', NULL),
(50, '', NULL),
(51, '', NULL),
(52, '', NULL),
(53, 'Amal', NULL),
(54, 'Amal', NULL),
(55, 'Amal', NULL),
(56, 'Amal', NULL),
(57, 'Amal', NULL),
(58, 'Violeta', NULL),
(59, 'asdf', NULL),
(60, 'Amal', NULL),
(61, 'Amal', NULL),
(62, 'Amal', NULL),
(63, 'Violeta', NULL),
(64, '', NULL),
(65, '', NULL),
(66, 'asf', NULL),
(67, 'Neue Termin', NULL),
(68, 'Violeta', NULL),
(69, 'Violeta', NULL),
(70, 'Violeta', NULL),
(71, 'Violeta', NULL),
(72, 'Violeta', NULL),
(73, 'Violeta', NULL),
(74, 'Violeta', NULL),
(75, 'Violeta', NULL),
(76, 'Violeta', NULL),
(77, 'Violeta', NULL),
(78, 'Violeta', NULL),
(79, 'Violeta', NULL),
(80, 'Violeta', NULL),
(81, 'Violeta', NULL),
(82, 'Violeta', NULL),
(83, 'Violeta', NULL),
(84, 'Violeta', NULL),
(85, 'Violeta', NULL),
(86, 'Violeta', NULL),
(87, 'A', NULL),
(88, 'Amal', NULL),
(89, 'Violeta Garcia Espin', NULL),
(90, '', NULL),
(91, '', NULL),
(92, 'Violeta Garcia Espin', NULL),
(93, 'Violeta Garcia Espin', NULL),
(94, 'Violeta Garcia Espin', NULL),
(95, 'Violeta Garcia Espin', NULL),
(96, 'Violeta Garcia Espin', NULL),
(97, 'Violeta Garcia Espin', NULL),
(98, 'Violeta Garcia Espin', NULL),
(99, 'Violeta Garcia Espin', NULL),
(100, 'Newname', NULL),
(101, 'Newname', NULL),
(102, 'Violeta', NULL),
(103, 'Amal', NULL),
(104, 'Mariano', 28),
(105, 'akku', 28),
(106, 'porque', 28),
(107, 'wtf', 31),
(108, 'wtf', 32),
(109, 'Francisco', 28);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ausgewaehlte_termine`
--
ALTER TABLE `ausgewaehlte_termine`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kommentare_user` (`user_id`),
  ADD KEY `kommentare_termine` (`termin_id`);

--
-- Indizes für die Tabelle `termine`
--
ALTER TABLE `termine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_user` (`author_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ausgewaehlte_termine`
--
ALTER TABLE `ausgewaehlte_termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `termine`
--
ALTER TABLE `termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  ADD CONSTRAINT `kommentare_termine` FOREIGN KEY (`termin_id`) REFERENCES `termine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kommentare_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `termine`
--
ALTER TABLE `termine`
  ADD CONSTRAINT `author_user` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
