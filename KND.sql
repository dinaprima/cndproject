-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Дек 29 2020 г., 12:35
-- Версия сервера: 5.7.26
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `KND`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Klients`
--

CREATE TABLE `Klients` (
  `id_klient` int(11) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `E-mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Masters`
--

CREATE TABLE `Masters` (
  `id_master` int(11) NOT NULL,
  `FIO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Recording`
--

CREATE TABLE `Recording` (
  `id_master` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_klient` int(11) NOT NULL,
  `date_of_recording` date NOT NULL,
  `time_of_recording` time(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Services`
--

CREATE TABLE `Services` (
  `id_service` int(11) NOT NULL,
  `Name_of_service` varchar(255) NOT NULL,
  `Cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Klients`
--
ALTER TABLE `Klients`
  ADD PRIMARY KEY (`id_klient`);

--
-- Индексы таблицы `Masters`
--
ALTER TABLE `Masters`
  ADD PRIMARY KEY (`id_master`);

--
-- Индексы таблицы `Recording`
--
ALTER TABLE `Recording`
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_klient` (`id_klient`);

--
-- Индексы таблицы `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Klients`
--
ALTER TABLE `Klients`
  MODIFY `id_klient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Masters`
--
ALTER TABLE `Masters`
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Services`
--
ALTER TABLE `Services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Klients`
--
ALTER TABLE `Klients`
  ADD CONSTRAINT `klients_ibfk_1` FOREIGN KEY (`id_klient`) REFERENCES `Recording` (`id_klient`);

--
-- Ограничения внешнего ключа таблицы `Masters`
--
ALTER TABLE `Masters`
  ADD CONSTRAINT `masters_ibfk_1` FOREIGN KEY (`id_master`) REFERENCES `Recording` (`id_master`);

--
-- Ограничения внешнего ключа таблицы `Services`
--
ALTER TABLE `Services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `Recording` (`id_service`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
