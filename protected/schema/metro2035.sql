-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 20 2015 г., 15:00
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `metro2033-loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `m_army`
--

CREATE TABLE IF NOT EXISTS `m_army` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ent_id` int(10) unsigned NOT NULL COMMENT 'army entity commander id',
  `name` varchar(255) NOT NULL,
  `exp` int(10) unsigned NOT NULL,
  `exp_attack1` int(10) unsigned NOT NULL,
  `exp_attack2` int(10) unsigned NOT NULL,
  `exp_shield1` int(10) unsigned NOT NULL,
  `exp_shield2` int(10) unsigned NOT NULL,
  `exp_health` int(10) unsigned NOT NULL,
  `exp_speed` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `m_army`
--

INSERT INTO `m_army` (`id`, `user_id`, `ent_id`, `name`, `exp`, `exp_attack1`, `exp_attack2`, `exp_shield1`, `exp_shield2`, `exp_health`, `exp_speed`, `event_id`) VALUES
(1, 1, 19, '', 0, 0, 0, 0, 0, 0, 0, NULL),
(2, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `m_army_entity`
--

CREATE TABLE IF NOT EXISTS `m_army_entity` (
  `army_id` int(10) unsigned NOT NULL,
  `ent_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `m_army_entity`
--

INSERT INTO `m_army_entity` (`army_id`, `ent_id`, `quantity`) VALUES
(1, 1, 5),
(1, 2, 10),
(1, 3, 7),
(1, 4, 1),
(2, 5, 1),
(2, 6, 4),
(2, 7, 3),
(2, 8, 7),
(1, 6, 2),
(1, 8, 3),
(1, 14, 2),
(1, 16, 1),
(2, 20, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `m_entity`
--

CREATE TABLE IF NOT EXISTS `m_entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `speed` int(10) unsigned NOT NULL,
  `attack1` int(10) unsigned NOT NULL,
  `attack2` int(10) unsigned NOT NULL,
  `shield1` int(10) unsigned NOT NULL,
  `shield2` int(10) unsigned NOT NULL,
  `health` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `m_entity`
--

INSERT INTO `m_entity` (`id`, `type`, `name`, `speed`, `attack1`, `attack2`, `shield1`, `shield2`, `health`) VALUES
(1, 5, NULL, 0, 0, 0, 0, 0, 0),
(2, 5, NULL, 0, 0, 0, 0, 0, 0),
(3, 5, NULL, 0, 0, 0, 0, 0, 0),
(4, 5, NULL, 0, 0, 0, 0, 0, 0),
(5, 5, NULL, 0, 0, 0, 0, 0, 0),
(6, 5, NULL, 0, 0, 0, 0, 0, 0),
(7, 5, NULL, 0, 0, 0, 0, 0, 0),
(8, 5, NULL, 0, 0, 0, 0, 0, 0),
(9, 4, NULL, 0, 0, 0, 0, 0, 0),
(10, 1, NULL, 0, 0, 0, 0, 0, 0),
(11, 2, NULL, 0, 0, 0, 0, 0, 0),
(12, 4, NULL, 0, 0, 0, 0, 0, 0),
(13, 4, NULL, 0, 0, 0, 0, 0, 0),
(14, 5, NULL, 0, 0, 0, 0, 0, 0),
(15, 2, NULL, 0, 0, 0, 0, 0, 0),
(16, 3, NULL, 0, 0, 0, 0, 0, 0),
(17, 4, NULL, 0, 0, 0, 0, 0, 0),
(18, 4, NULL, 0, 0, 0, 0, 0, 0),
(19, 1, NULL, 0, 0, 0, 0, 0, 0),
(20, 3, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `m_entity_type`
--

CREATE TABLE IF NOT EXISTS `m_entity_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `m_entity_type`
--

INSERT INTO `m_entity_type` (`id`, `name`, `comment`) VALUES
(1, 'player', ''),
(2, 'commander', 'командир, может управлять солдатами'),
(3, 'driver', 'погонщик, может управлять монстрами'),
(4, 'soldier', ''),
(5, 'monster', '');

-- --------------------------------------------------------

--
-- Структура таблицы `m_event`
--

CREATE TABLE IF NOT EXISTS `m_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_invite`
--

CREATE TABLE IF NOT EXISTS `m_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `m_invite`
--

INSERT INTO `m_invite` (`id`, `code`, `user_id`) VALUES
(1, 'ieHoh9oh', 3),
(2, 'wopi2Gi1', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `m_user`
--

CREATE TABLE IF NOT EXISTS `m_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password_crc` varchar(40) NOT NULL,
  `username_crc` varchar(250) NOT NULL,
  `reg_time` datetime NOT NULL,
  `last_visit_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_crc` (`username_crc`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `m_user`
--

INSERT INTO `m_user` (`id`, `username`, `email`, `password_crc`, `username_crc`, `reg_time`, `last_visit_time`) VALUES
(1, 'admin', 'admin@admin.ru', '', 'admin', '2013-12-16 00:00:00', '2013-12-17 03:12:42'),
(3, '', 'admin2@admin.ru', '9131DA6A52C71E8029886AF9C706F94C', '', '2013-12-17 02:59:20', '2015-05-17 21:33:45');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `m_invite`
--
ALTER TABLE `m_invite`
  ADD CONSTRAINT `m_invite_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
