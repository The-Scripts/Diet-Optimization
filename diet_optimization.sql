-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Mar 2023, 19:05
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `diet_optimization`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `consumed_food`
--

CREATE TABLE `consumed_food` (
  `MealName` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Calories` decimal(5,2) DEFAULT NULL,
  `Carbs` decimal(5,2) DEFAULT NULL,
  `Proteins` decimal(5,2) DEFAULT NULL,
  `Fats` decimal(5,2) DEFAULT NULL,
  `Salt` decimal(5,2) DEFAULT NULL,
  `Other` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `consumed_food`
--

INSERT INTO `consumed_food` (`MealName`, `Date`, `Calories`, `Carbs`, `Proteins`, `Fats`, `Salt`, `Other`, `UserID`) VALUES
('Male', '2022-08-22', '6.02', '70.66', '98.44', '66.20', '11.68', 'ibuprofen', 5),
('Male', '2022-07-14', '48.25', '78.45', '41.79', '33.12', '73.41', 'DayQuil', 3),
('Female', '2022-08-16', '28.85', '81.38', '34.59', '29.80', '74.81', 'healthy accents all day pain relief', 4),
('Male', '2022-11-05', '47.60', '71.54', '41.04', '37.71', '22.40', 'PRED-G', 3),
('Female', '2022-04-26', '65.15', '12.21', '45.71', '26.54', '41.23', 'SmartRx Natural Pain Relief Sleeve WRIST', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `params`
--

CREATE TABLE `params` (
  `Gender` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `Height` decimal(3,2) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `PhysicalActivity` varchar(10) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Goal` varchar(14) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `params`
--

INSERT INTO `params` (`Gender`, `Weight`, `Height`, `Age`, `PhysicalActivity`, `Goal`, `UserID`) VALUES
('Male', '79.74', '1.05', 33, 'not to bad', 'burn calories', 1),
('Male', '67.02', '1.24', 32, 'bad', 'lose weight', 2),
('Female', '42.66', '1.39', 64, 'bad', 'eat better', 3),
('Male', '79.31', '1.76', 41, 'bad', 'eat better', 4),
('Male', '61.58', '1.77', 24, 'bad', 'burn calories', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(80) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `LastName` varchar(160) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Nickname` varchar(60) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Phone` varchar(14) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `Nickname`, `Phone`, `Email`) VALUES
(1, 'Archie', 'Yakubovics', 'ayakubovics0', '273-998-5981', 'ayakubovics0@vkontakte.ru'),
(2, 'Lemuel', 'Marians', 'lmarians1', '891-561-0763', 'lmarians1@cdbaby.com'),
(3, 'Yalonda', 'Cooling', 'ycooling2', '195-316-7685', 'ycooling2@wp.com'),
(4, 'Kessiah', 'Hannibal', 'khannibal3', '720-112-3916', 'khannibal3@weebly.com'),
(5, 'Terrie', 'Childs', 'tchilds4', '969-907-8334', 'tchilds4@comcast.net');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `consumed_food`
--
ALTER TABLE `consumed_food`
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `params`
--
ALTER TABLE `params`
  ADD KEY `UserID` (`UserID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `consumed_food`
--
ALTER TABLE `consumed_food`
  ADD CONSTRAINT `consumed_food_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Ograniczenia dla tabeli `params`
--
ALTER TABLE `params`
  ADD CONSTRAINT `params_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
