-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Apr 2021 um 15:12
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.10

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
  `user_id` int(11) NOT NULL,
  `termin_datum` date NOT NULL,
  `termin_zeit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `termin_creation_date` date NOT NULL,
  `ablauf_termin` date NOT NULL,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ausgewaehlte_termine`
--
ALTER TABLE `ausgewaehlte_termine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termin_user` (`termin_id`),
  ADD KEY `user_termin` (`user_id`);

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
  ADD KEY `auhtor_termin` (`author`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ausgewaehlte_termine`
--
ALTER TABLE `ausgewaehlte_termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `termine`
--
ALTER TABLE `termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `ausgewaehlte_termine`
--
ALTER TABLE `ausgewaehlte_termine`
  ADD CONSTRAINT `termin_user` FOREIGN KEY (`termin_id`) REFERENCES `termine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_termin` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `auhtor_termin` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
