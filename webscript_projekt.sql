-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Apr 2021 um 20:46
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
(14, 65, '2021-04-21', '19:59:00'),
(15, 65, '2021-04-22', '21:59:00'),
(16, 66, '2021-04-27', '21:59:00'),
(17, 66, '2021-04-28', '03:59:00'),
(18, 68, '2021-04-08', '20:44:00'),
(19, 69, '2021-04-08', '20:44:00'),
(20, 69, '2021-05-01', '20:44:00');

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
(65, 'Web', 'Wien', '2021-04-20', '2021-04-30', 62, 'aoisudfas ', '1h'),
(66, 'Web 2', 'Online', '2021-04-20', '2021-05-09', 63, 'Aaifja ljaksdjfaoisueorqiwer', '2h'),
(67, '', '', '2021-04-20', '', 64, '', ''),
(68, '', '', '2021-04-20', '', 65, 'efasdf', ''),
(69, 'asdf', 'as', '2021-04-20', '2021-05-09', 66, 'efaassdf', 'asdf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`) VALUES
(6, 'Violeta'),
(7, 'asdf'),
(8, 'Vio'),
(9, 'Vioa'),
(10, 'Violeta'),
(11, 'asdf'),
(12, 'asf'),
(13, 'Violeta2'),
(14, 'asdfasdf'),
(15, 'asf'),
(16, 'asdf'),
(17, 'asf'),
(18, 'afesfasd'),
(19, 'asdf'),
(20, 'asf'),
(21, 'asdf'),
(22, 'asdf'),
(23, 'asf'),
(24, 'as'),
(25, 'asdf'),
(26, ''),
(27, 'vioas'),
(28, 'asdf'),
(29, ''),
(30, ''),
(31, ''),
(32, ''),
(33, 'asdf'),
(34, ''),
(35, ''),
(36, ''),
(37, ''),
(38, ''),
(39, ''),
(40, ''),
(41, ''),
(42, ''),
(43, ''),
(44, ''),
(45, ''),
(46, ''),
(47, ''),
(48, ''),
(49, ''),
(50, ''),
(51, ''),
(52, ''),
(53, 'Amal'),
(54, 'Amal'),
(55, 'Amal'),
(56, 'Amal'),
(57, 'Amal'),
(58, 'Violeta'),
(59, 'asdf'),
(60, 'Amal'),
(61, 'Amal'),
(62, 'Amal'),
(63, 'Violeta'),
(64, ''),
(65, ''),
(66, 'asf');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `termine`
--
ALTER TABLE `termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
