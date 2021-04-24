-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Apr 2021 um 11:20
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
(33, 107, '2021-04-23', '20:40:00'),
(34, 108, '2021-04-25', '19:40:00'),
(35, 108, '2021-04-29', '21:40:00'),
(36, 108, '2021-04-25', '21:41:00'),
(37, 108, '2021-04-26', '22:41:00'),
(38, 109, '2021-04-23', '21:48:00'),
(39, 110, '2021-04-23', '17:49:00'),
(40, 110, '2021-04-23', '16:53:00'),
(41, 112, '2021-04-23', '21:52:00'),
(42, 112, '2021-05-02', '22:52:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kommentare`
--

CREATE TABLE `kommentare` (
  `id` int(11) NOT NULL,
  `termin_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `inhalte` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kommentare`
--

INSERT INTO `kommentare` (`id`, `termin_id`, `user_id`, `username`, `inhalte`, `datum`) VALUES
(2, 107, NULL, 'asf', 'asfd', '2021-04-22'),
(3, 107, NULL, 'sdf', 'asfd', '2021-04-22'),
(4, 107, NULL, 'asdf', 'asdf', '2021-04-22'),
(5, 107, NULL, 'asdf', 'asdfasdf', '2021-04-22'),
(6, 107, NULL, 'asfd', 'asdf', '2021-04-22'),
(7, 107, NULL, 'asf', 'asdf', '2021-04-22'),
(8, 107, NULL, 'asdf', 'asdf', '2021-04-22'),
(9, 107, NULL, 'gasdf', 'asdfafsd', '2021-04-22'),
(10, 107, NULL, 'asdf', 'asdfasdfasdf', '2021-04-22'),
(11, 107, NULL, 'asf', 'asfd', '2021-04-22'),
(12, 110, NULL, '', '', '2021-04-22'),
(13, 107, NULL, 'j', 'k', '2021-04-22'),
(14, 107, NULL, 'hm', 'jmhgtt', '2021-04-22'),
(15, 108, NULL, 'wtf', 'wtf', '2021-04-22'),
(16, 109, NULL, 'op', 'opera', '2021-04-22'),
(17, 108, NULL, '', '', '2021-04-22'),
(18, 108, NULL, '', '', '2021-04-22'),
(19, 108, NULL, '', '', '2021-04-22'),
(20, 108, NULL, '', '', '2021-04-22'),
(21, 108, NULL, '', '', '2021-04-22'),
(22, 108, NULL, 'G', 'I will write a comment here', '2021-04-22'),
(23, 109, NULL, 'JP', 'This is a comment', '2021-04-23'),
(24, 107, NULL, '', '', '2021-04-23');

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
(107, 'Web1', 'Online', '2021-04-22', '2021-04-24', 110, 'aiousfdoiu', '1h'),
(108, 'Web2', 'Online', '2021-04-22', '2021-05-01', 111, 'asfdasd', '3h'),
(109, 'Web3', 'Online', '2021-04-22', '2021-04-30', 112, 'oai', '4h'),
(110, 'Web4', 'Wien', '2021-04-22', '2021-04-30', 113, 'ioausfasfd', '5h'),
(111, 'Av', 'as', '2021-04-22', '2021-05-04', 114, 'aesfwqerqer', 'as'),
(112, 'asdf', 'asdf', '2021-04-22', '2021-05-05', 115, 'asdf', 'asdf');

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
(110, 'Violeta', NULL),
(111, 'Amal', NULL),
(112, 'Vio', NULL),
(113, 'Violeta2', NULL),
(114, 'Web5', NULL),
(115, 'ANother', NULL),
(116, 'Violeta', 37),
(117, 'Violeta', 35),
(118, 'Globuli', 36),
(119, 'Globuli', 35),
(120, 'Amal', 35);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT für Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `termine`
--
ALTER TABLE `termine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
