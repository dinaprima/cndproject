-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Янв 09 2021 г., 14:04
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
  `FIO` varchar(255) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Masters`
--

INSERT INTO `Masters` (`id_master`, `FIO`, `id_service`) VALUES
(1, 'Анастасия Гнутова', 2),
(2, 'Диана Салахитинова', 1),
(3, 'Ксения Чебыкина', 3);

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
-- Дамп данных таблицы `Services`
--

INSERT INTO `Services` (`id_service`, `Name_of_service`, `Cost`) VALUES
(1, 'Маникюр без покрытия', '800'),
(2, 'Стрижка женская (модельная)', '900'),
(3, 'Чистка лица (механическая)', '1500');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Klients`
--
ALTER TABLE `Klients`
  ADD PRIMARY KEY (`id_klient`),
  ADD KEY `id_klient` (`id_klient`);

--
-- Индексы таблицы `Masters`
--
ALTER TABLE `Masters`
  ADD PRIMARY KEY (`id_master`),
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_service` (`id_service`);

--
-- Индексы таблицы `Recording`
--
ALTER TABLE `Recording`
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_klient` (`id_klient`),
  ADD KEY `id_master_2` (`id_master`),
  ADD KEY `id_service_2` (`id_service`),
  ADD KEY `id_klient_2` (`id_klient`);

--
-- Индексы таблицы `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_service_2` (`id_service`);

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
  MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Services`
--
ALTER TABLE `Services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Masters`
--
ALTER TABLE `Masters`
  ADD CONSTRAINT `masters_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `Services` (`id_service`);

--
-- Ограничения внешнего ключа таблицы `Recording`
--
ALTER TABLE `Recording`
  ADD CONSTRAINT `recording_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `Services` (`id_service`),
  ADD CONSTRAINT `recording_ibfk_2` FOREIGN KEY (`id_master`) REFERENCES `Masters` (`id_master`),
  ADD CONSTRAINT `recording_ibfk_3` FOREIGN KEY (`id_klient`) REFERENCES `Klients` (`id_klient`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
