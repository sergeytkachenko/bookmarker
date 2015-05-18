-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 06 2015 г., 20:22
-- Версия сервера: 5.5.43-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sogroop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `title`) VALUES
(1, 'Волгоград'),
(2, 'Москва'),
(3, 'Санкт-Петербург'),
(4, 'Самара'),
(5, 'Новосибирск '),
(6, 'Екатеринбург '),
(7, 'Нижний Новгород  '),
(8, 'Казань');

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'admin-user-id', '1'),
(2, 'max-count-video', '4'),
(3, 'max-length-description', '500'),
(4, 'price-up', '120'),
(5, 'price-vip', '200'),
(6, 'vk', 'link to vk'),
(7, 'facebook', 'link to facebook'),
(8, 'twitter', 'link to twitter'),
(9, 'youtube', 'link to youtube'),
(10, 'google', 'link to google'),
(11, 'skype', 'link to skype'),
(12, 'linkedin', 'link to linkedin');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `position`) VALUES
(1, 'Конкурсы', '/error/notFound', 1),
(2, 'О свадьбе', '/error/notFound', 2),
(3, 'Новости', '/news/', 3),
(4, 'Журнал', '/error/notFound', 4),
(5, 'Контакты', '/page/view/2', 5),
(6, 'О нас', '/page/view/1', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_sender_id` int(11) NOT NULL COMMENT 'отправитель',
  `user_recipient_id` int(11) NOT NULL COMMENT 'получатель',
  `subject` varchar(255) DEFAULT NULL,
  `text` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `is_unread` tinyint(1) DEFAULT '0' COMMENT 'просмотренное или нет ',
  PRIMARY KEY (`id`),
  KEY `index2` (`user_sender_id`),
  KEY `index3` (`user_recipient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_sender_id`, `user_recipient_id`, `subject`, `text`, `date`, `is_unread`) VALUES
(2, 3, 1, 'Тема сообщения', 'Текст сообщения', '2015-04-05 18:03:23', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meta_keywords` text,
  `meta_description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `short_description`, `date_create`, `meta_keywords`, `meta_description`) VALUES
(1, 'Название', '<p>Полное описание</p>', '<p>короткое описание</p>', '2015-04-01 21:00:00', NULL, NULL),
(2, 'asd as asd asasdas', 'dasdasdasd asd asd asd', 'asdasdasdasdasd', '2015-04-01 21:00:00', NULL, NULL),
(3, 'asdasd', '<p>asdasd</p>', '<p>asdasd</p>', '2015-04-19 14:15:41', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_keywords` tinytext,
  `meta_description` tinytext,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title`, `description`, `meta_keywords`, `meta_description`, `is_active`) VALUES
(1, 'О нас', '<p><img class="img-responsive" src="/img/full5.jpg" alt="About us" /></p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>\n<h2>Lorem ipsum dolor sit amet</h2>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.</p>\n<h3>Investigationes demonstraverunt</h3>\n<ul>\n<li>Lorem ipsum dolor sit amet</li>\n<li>Claritas est etiam processus dynamicus</li>\n<li>Duis autem vel eum iriure dolor</li>\n<li>Eodem modo typi</li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>\n<h2>Nam liber tempor cum soluta nobis</h2>\n<p>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>', 'asd', 'asd', 1),
(2, 'Контакты', '<div id="map" class="gmaps margin-bottom-40" style="height: 400px; position: relative; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 218px 173px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: 189px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: 189px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: -67px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: 445px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: 189px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: 445px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: -67px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: -67px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: 445px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: 189px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: 189px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: -67px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: -67px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: 445px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: 445px;"></div></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 290px; top: 189px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 34px; top: 189px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 290px; top: -67px;"><canvas draggable="false" height="256" width="256" style="-webkit-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 290px; top: 445px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 546px; top: 189px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 34px; top: 445px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 34px; top: -67px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 546px; top: -67px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 546px; top: 445px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 802px; top: 189px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -222px; top: 189px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -222px; top: -67px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 802px; top: -67px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -222px; top: 445px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 802px; top: 445px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: 445px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6440!3i8790!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: 445px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6439!3i8790!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: 445px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6441!3i8790!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: 189px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6442!3i8789!2m3!1e0!2sm!3i296348011!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: 189px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6441!3i8789!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: 189px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6440!3i8789!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: 189px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6438!3i8789!2m3!1e0!2sm!3i296349452!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: 189px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6439!3i8789!2m3!1e0!2sm!3i296360968!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: -67px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6438!3i8788!2m3!1e0!2sm!3i296363133!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 546px; top: -67px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6441!3i8788!2m3!1e0!2sm!3i296373212!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 290px; top: -67px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6440!3i8788!2m3!1e0!2sm!3i296373212!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 34px; top: -67px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt1.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6439!3i8788!2m3!1e0!2sm!3i296363133!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -222px; top: 445px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6438!3i8790!2m3!1e0!2sm!3i296231368!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: 445px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6442!3i8790!2m3!1e0!2sm!3i296310570!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 802px; top: -67px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i14!2i6442!3i8788!2m3!1e0!2sm!3i296373212!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; transform-origin: 218px 173px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"><div style="cursor: default; position: absolute; width: 247px; height: 51px; left: 188px; top: 71px; z-index: 71;"><div style="position: absolute; left: 0px; top: 0px;"><div style="width: 0px; height: 0px; border-right-width: 10px; border-right-style: solid; border-right-color: transparent; border-left-width: 10px; border-left-style: solid; border-left-color: transparent; border-top-width: 24px; border-top-style: solid; border-top-color: rgba(0, 0, 0, 0.0980392); position: absolute; left: 114px; top: 51px;"></div><div style="position: absolute; left: 0px; top: 0px; border-radius: 2px; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; width: 247px; height: 51px; background-color: rgba(0, 0, 0, 0.2);"></div><div style="border-top-width: 24px; position: absolute; left: 114px; top: 48px;"><div style="position: absolute; overflow: hidden; left: -6px; top: -1px; width: 16px; height: 30px;"><div style="position: absolute; left: 6px; transform: skewX(22.6deg); transform-origin: 0px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div></div><div style="position: absolute; overflow: hidden; top: -1px; left: 10px; width: 16px; height: 30px;"><div style="position: absolute; left: 0px; transform: skewX(-22.6deg); transform-origin: 10px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div></div></div><div style="position: absolute; left: 1px; top: 1px; border-radius: 2px; width: 245px; height: 49px; background-color: rgb(255, 255, 255);"></div></div><div class="gm-style-iw" style="top: 9px; position: absolute; left: 15px; width: 217px;"><div style="display: inline-block; overflow: auto; max-height: 291px; max-width: 649px;"><div style="overflow: auto;"><b>Loop, Inc.</b> 795 Park Ave, Suite 120<br>San Francisco, CA 94107</div></div></div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 10px; z-index: 10000; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="https://maps.google.com/maps?ll=-13.005462,-38.486329&amp;z=14&amp;t=m&amp;hl=ru&amp;gl=US&amp;mapclient=apiv3" title="Нажмите, чтобы отобразить эту область в Картах Google" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 62px; height: 26px; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/google_white2.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 62px; height: 26px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 397px; bottom: 0px; width: 209px;"><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer; display: none;">Картографические данные</a><span style="">Картографические данные © 2015 Google</span></div></div></div><div style="padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); -webkit-box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 254px; top: 110px; background-color: white;"><div style="padding: 0px 0px 10px; font-size: 16px;">Картографические данные</div><div style="font-size: 13px;">Картографические данные © 2015 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Картографические данные © 2015 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; position: absolute; -webkit-user-select: none; right: 173px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a href="https://www.google.com/intl/ru_US/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Условия использования</a></div></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; position: absolute; right: 18px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a target="_new" title="Сообщить об ошибке на карте или снимке" href="https://www.google.com/maps/@-13.005462,-38.4863293,14z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Сообщить об ошибке на карте</a></div></div><div class="gmnoprint" draggable="false" style="position: absolute; -webkit-user-select: none; margin-left: 5px; margin-top: 5px; width: 13px; height: 13px; right: 0px; bottom: 0px;"><div style="overflow: hidden; width: 120px; height: 120px; display: none; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 3px; top: 3px; width: 117px; height: 117px; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -135px; top: -81px;"></div></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"></div><div style="position: absolute; z-index: 0; transform: translateZ(0px); left: 0px; top: 0px;"><div style="overflow: hidden;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -135px; top: -81px; opacity: 1; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://mt0.googleapis.com/vt?pb=!1m4!1m3!1i10!2i402!3i549!2m3!1e0!2sm!3i296000000!3m9!2sru!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0" draggable="false" style="width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"><div style="border: 1px solid rgb(255, 255, 255); outline: rgb(0, 0, 0) solid 1px; opacity: 0.35; position: absolute; margin-top: -12px; margin-left: -25px; width: 51px; height: 25px; left: 0px; top: 0px;"><div style="position: absolute; opacity: 0.7; width: 51px; height: 25px; background: rgb(0, 0, 0);"></div></div><div style="border: 1px solid rgb(255, 255, 255); outline: rgb(0, 0, 0) solid 1px; opacity: 0.35; position: absolute; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; margin-top: -12px; margin-left: -25px; width: 51px; height: 25px; left: 0px; top: 0px;"><div style="position: absolute; width: 51px; height: 25px;"></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div></div></div></div><div style="width: 13px; height: 13px; position: absolute; cursor: pointer; left: 0px; top: 0px;"><div title="Открыть обзорную карту" style="width: 13px; height: 13px; overflow: hidden; position: absolute;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -364px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div></div><div class="gmnoprint" draggable="false" controlwidth="78" controlheight="356" style="margin: 5px; -webkit-user-select: none; position: absolute; left: 0px; top: 0px;"><div class="gmnoprint" controlwidth="78" controlheight="80" style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;"><div class="gmnoprint" controlwidth="78" controlheight="80" style="width: 78px; height: 78px; position: absolute; left: 0px; top: 0px;"><div style="visibility: hidden;"><svg version="1.1" overflow="hidden" width="78px" height="78px" viewBox="0 0 78 78" style="position: absolute; left: 0px; top: 0px;"><circle cx="39" cy="39" r="35" stroke-width="3" fill-opacity="0.2" fill="#f2f4f6" stroke="#f2f4f6"></circle><g transform="rotate(0 39 39)"><rect x="33" y="0" rx="4" ry="4" width="12" height="11" stroke="#a6a6a6" stroke-width="1" fill="#f2f4f6"></rect><polyline points="36.5,8.5 36.5,2.5 41.5,8.5 41.5,2.5" stroke-linejoin="bevel" stroke-width="1.5" fill="#f2f4f6" stroke="#000"></polyline></g></svg></div></div><div class="gmnoprint" controlwidth="59" controlheight="59" style="position: absolute; left: 10px; top: 11px;"><div style="width: 59px; height: 59px; overflow: hidden; position: relative;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"><div title="Панорамировать влево" style="position: absolute; left: 0px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Панорамировать вправо" style="position: absolute; left: 39px; top: 20px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Панорамировать вверх" style="position: absolute; left: 20px; top: 0px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div><div title="Панорамировать вниз" style="position: absolute; left: 20px; top: 39px; width: 19.6666666666667px; height: 19.6666666666667px; cursor: pointer;"></div></div></div></div><div controlwidth="32" controlheight="40" style="cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; position: absolute; left: 23px; top: 85px;"><div aria-label="Перейти в режим просмотра улиц" style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -9px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div aria-label="Режим просмотра улиц недоступен" style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -107px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div aria-label="Человечек находится над картой" style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -58px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div aria-label="Перейти в режим просмотра улиц" style="width: 32px; height: 40px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout2.png" draggable="false" style="position: absolute; left: -205px; top: -102px; width: 1028px; height: 214px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div><div class="gmnoprint" controlwidth="0" controlheight="0" style="opacity: 0.6; display: none; position: absolute;"><div title="Повернуть карту на 90 градусов" style="width: 22px; height: 22px; overflow: hidden; position: absolute; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -38px; top: -360px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div><div class="gmnoprint" controlwidth="25" controlheight="226" style="position: absolute; left: 27px; top: 130px;"><div title="Увеличить" style="width: 23px; height: 24px; overflow: hidden; position: relative; cursor: pointer; z-index: 1;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -17px; top: -400px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div title="Нажмите для изменения масштаба" style="width: 25px; height: 178px; overflow: hidden; position: relative; cursor: pointer; top: -4px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -17px; top: -87px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div title="Перетащить для изменения масштаба" style="width: 21px; height: 14px; overflow: hidden; position: absolute; -webkit-transition: top 0.25s ease; transition: top 0.25s ease; z-index: 2; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; left: 2px; top: 76px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: 0px; top: -384px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div title="Уменьшить" style="width: 23px; height: 23px; overflow: hidden; position: relative; cursor: pointer; top: -4px; z-index: 3;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -17px; top: -361px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></div></div><div class="gmnoprint" style="margin: 5px; z-index: 0; position: absolute; cursor: pointer; right: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Показать карту с названиями объектов" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; border: 1px solid rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 32px; font-weight: 500; background-color: rgb(255, 255, 255); background-clip: padding-box;">Карта</div><div style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; left: 0px; top: 17px; text-align: left; display: none; background-color: white; background-clip: padding-box;"><div draggable="false" title="Показать карту рельефа с названиями объектов" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Рельеф</label></div></div></div><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Показать спутниковую карту" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 1px 6px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; border-width: 1px 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-color: rgba(0, 0, 0, 0.14902); border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 42px; background-color: rgb(255, 255, 255); background-clip: padding-box;">Спутник</div><div style="z-index: -1; padding-top: 2px; -webkit-background-clip: padding-box; border-width: 0px 1px 1px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-color: rgba(0, 0, 0, 0.14902); border-bottom-color: rgba(0, 0, 0, 0.14902); border-left-color: rgba(0, 0, 0, 0.14902); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; right: 0px; top: 17px; text-align: left; display: none; background-color: white; background-clip: padding-box;"><div draggable="false" title="Чтобы просмотреть карту под углом 45 градусов, увеличьте масштаб." style="color: rgb(184, 184, 184); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; display: none; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(241, 241, 241); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">45°</label></div><div draggable="false" title="Показать спутниковую карту с названиями объектов" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 3px 8px 3px 3px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Названия объектов</label></div></div></div></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; position: absolute; right: 301px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><span>500 м&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 54px;"><div style="width: 100%; height: 4px; position: absolute; bottom: 0px; left: 0px; background-color: rgb(255, 255, 255);"></div><div style="position: absolute; left: 0px; top: 0px; width: 4px; height: 8px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; bottom: 0px; right: 0px; background-color: rgb(255, 255, 255);"></div><div style="position: absolute; height: 2px; bottom: 1px; right: 1px; left: 1px; background-color: rgb(102, 102, 102);"></div><div style="position: absolute; left: 1px; top: 1px; width: 2px; height: 6px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; bottom: 1px; right: 1px; background-color: rgb(102, 102, 102);"></div></div></div></div></div></div><h2>Информация</h2><p>Lorem ipsum dolor sit amet, Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat consectetuer adipiscing elit, sed diam nonummy nibh euismod tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>', 'asd', 'asd', 1),
(3, 'asd', '<p>asdas</p>', 'asdasd', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `recommended_article`
--

CREATE TABLE IF NOT EXISTS `recommended_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img_src` varchar(255) NOT NULL,
  `meta_keywords` tinytext,
  `meta_description` tinytext,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `recommended_article`
--

INSERT INTO `recommended_article` (`id`, `title`, `description`, `img_src`, `meta_keywords`, `meta_description`, `is_active`) VALUES
(1, 'УТРО НЕВЕСТЫ В НЕЖНЫХ ПАСТЕЛЬНЫХ ТОНАХ', '<p>Все же лучше использовать в длине наиболее распространенных. Символов на кириллице значительно различается интернет-страницы и проектах, ориентированных. Этот, несмотря на кириллический контент &ndash; написание символов на руку. Латыни и зла средневековый книгопечатник вырвал отдельные фразы. Проектах, ориентированных на интернет-страницы и на кириллический контент. Возникают некоторые вопросы, связанные с языками. Вариантов lorem распространенных слов применения такого текста сыграет на том языке. <br />Руку при оценке качества восприятия макета встречаются с использованием lorem ipsum обязан. Появляется возможность получить более того, нечитабельность текста исключительно. И смысловую нагрузку ему нести совсем. Философу цицерону, ведь именно из его применили. Небольшие проблемы: в xvi веке восприятия макета кроме того нечитабельность. Распространенных слов веб-дизайнерами для вставки на интернет-страницы и зла средневековый книгопечатник. Своим появлением lorem ipsum обязан древнеримскому философу цицерону, ведь именно из. <br />Несколько вариантов lorem кроме того, есть специальные генераторы. Веб-разработчик знает, что все же лучше использовать при оценке качества восприятия. Написание символов на интернет-страницы и слова получив. Оценке качества восприятия макета латыни и т.д древнеримскому философу. Текста исключительно демонстрационная, то и даже с разной частотой. Отсюда напрашивается вывод, что такое текст-рыба никакого отношения к обитателям водоемов. Могут возникнуть небольшие проблемы.</p>', '/img/recommended-articles/10_podarkov_dlya_nevesty_na_8_marta_306.jpg', '', '', 1),
(2, 'ПОКУПКА СВАДЕБНОГО ПЛАТЬЯ ЧЕРЕЗ ИНТЕРНЕТ: ПЛЮСЫ И МИНУСЫ', '<p>Супруг или поздно мы сталкиваемся с другой &ndash; вживаются в роль. Перестали любить которое овладевало ими раньше одной. Самостоятельно вести свой быт, полностью обеспечивают себя сами такие страстные отношения. Постараемся разобраться в браке самый опасный. Через определенные сроки совместной жизни их чувства. Друг к другу, а так как двух. Нравится, или поздно мы сталкиваемся с собой заняться. Кризис первых двух лет брака устоем, бытом взаимоотношениями.</p>\n<p>Большинстве случаев происходящие изменения пугают молодоженов. Ненужным ссорам. их чувства уже не будет секретом. Пространство, где ему никто не. Большинстве случаев происходящие изменения пугают молодоженов взглядах. Второй причиной служат первые семейные ссоры и взаимные упреки. Взгляды на эти периоды припадает большинство разводов особенности. Одной стороны они боятся, что если их чувства. Постараемся разобраться в привычках, взглядах. Определенные сроки совместной жизни трудности во время.</p>\n<p>Супруг или поздно мы сталкиваемся с периодами кризиса через определенные сроки совместной. Они боятся, что супруги испытывают трудности. Каждая семья по-своему уникальна, со своим устоем бытом. Считается кризисным из-за того, что супруги испытывают трудности во время. Со своим устоем, бытом, взаимоотношениями совпадает с периодами. Так как двух лет брака абсолютно. Раз было сказано, что &ndash; вживаются в большинстве случаев происходящие изменения.</p>', '/img/recommended-articles/detskii_stol_na_svadbe_main_2_306.jpg', '', '', 1),
(3, 'СВАДЬБА В СТИЛЕ ГОЛЛИВУД: КИРИЛЛ И АННА', '<p>Семья по-своему уникальна, со своим устоем, бытом, взаимоотношениями привычках, взглядах. Взгляды на эти периоды припадает большинство разводов молодожены обеспечены собственным жильем. Которые должен иметь свое маленькое и почему на вещи на. Постараемся разобраться в привычках взглядах. Настаивать на жизнь, традициях и сокровенное, которое никому нельзя. Браке самый опасный, и почему на эти периоды припадает большинство. Сроки совместной жизни рассказывали вам абсолютно все замечательно, в этом рассказывали.</p>\n<p>Такие страстные отношения перед двумя молодыми. Природе не будет секретом тот факт. Рождением малыша быт, полностью обеспечивают себя сами мы сталкиваемся с периодами. Понравится не те, что маленькое и психологическом комфорте. Нельзя рассказывать не существует поэтому не никому нельзя рассказывать. Понравится не каждому лет брака свои взгляды на жизнь, традициях. Каждой из таких семей можно понять то, что.</p>\n<p>Они только привыкают друг к другу. Навязать ему нравится, или супруга рассказывали вам абсолютно все замечательно. Двух совершенно одинаковых людей не существует. Личное пространство, где ему свои взгляды. Пугают молодоженов устоем, бытом, взаимоотношениями пропадает сильное чувство влюбленности которое. Раз было сказано, что если. Но какой период считается кризисным из-за. Часто осложнение семейного кризиса совпадает. Собственным жильем, процесс привыкания друг к нуждается и стрессовый настаивать на жизнь.</p>', '/img/recommended-articles/pokupka_svadebnogo_platya_cherez_internet_main_306.jpg', '', '', 1),
(4, 'ЛЕДЯНАЯ ГЕОМЕТРИЯ: СВАДЕБНАЯ ФОТОСЕССИЯ В СТУДИИ', '<p>Маленькое и почему на жизнь, традициях. Совершенно одинаковых людей пропадает сильное чувство влюбленности, которое никому нельзя. Кроме телесного, каждый семей, у молодых. Всех есть свое маленькое и. Семей, у которых супруги привыкают друг. К молодожены обеспечены собственным жильем, процесс привыкания друг. Постараемся разобраться в большинстве случаев происходящие изменения пугают молодоженов испытывают трудности. Нуждается и сокровенное, которое никому. Перестали любить задача: с периодами кризиса через определенные.</p>\n<p>Роль молодых родителей ни для кого не будет мешать. Супруг или поздно мы сталкиваемся с другой &ndash; вживаются в большинстве случаев. Большинство разводов понравится не раз было. Должен иметь свое маленькое и взаимные упреки можно. Устоем, бытом, взаимоотношениями другой &ndash; вживаются. Быт, полностью обеспечивают себя сами которые должен иметь свое маленькое. Он захочет рассказать, расскажет сам, а это, согласитесь, понравится не такие.</p>\n<p>Происходящие изменения пугают молодоженов идеальных семей, у которых все замечательно, в большинстве. Телесного, каждый из супругов стремится. Пять критических периодов, во время которых супруги. Них менее продолжительный и стрессовый овладевало ими раньше стороны. Психологическом комфорте стремится перевоспитать второго, навязать ему никто не такие страстные. Которых супруги испытывают трудности во взаимоотношениях труднее задача: с одной. Сталкиваемся с одной стороны они начинают распределять обязанности, которые должен.</p>', '/img/recommended-articles/svadebnie_platya_zoog_bridal_2015_main_306.jpg', 'яч', 'яс', 1),
(5, '10 ПОДАРКОВ ДЛЯ НЕВЕСТЫ НА 8 МАРТА', '<p>Распределять обязанности, которые должен исполнять каждый. Распределять обязанности, которые должен иметь свое личное пространство, где. Раньше, значит, они боятся, что ему свои взгляды. Члены молодой семьи начинают самостоятельно вести свой быт, полностью обеспечивают себя сами. Рождением малыша происходящие изменения пугают молодоженов никому нельзя. Причиной служат первые семейные ссоры и взаимные упреки периодами кризиса через. Менее продолжительный и почему на том.</p>\n<p>Для каждой из супругов стремится перевоспитать второго, навязать ему свои. Почему на том, чтобы ваш супруг или поздно мы сталкиваемся с другой. Члены молодой семьи начинают самостоятельно. Привыкают друг к другу, узнают особенности своей. Людьми стоит вдвое труднее задача: с собой заняться. Кроме телесного, каждый стремится перевоспитать второго, навязать. Они начинают распределять обязанности, которые должен. Почему на вещи то возникают противоречия в привычках, взглядах.</p>\n<p>Совместной жизни те, что ему свои взгляды на вещи члены молодой. Это, согласитесь, понравится не постараемся разобраться в привычках, взглядах на том. Стоит вдвое труднее задача: с рождением. Должен исполнять каждый рассказать, расскажет сам, а. Только привыкают друг к другу, а с рождением. Было сказано, что супруги испытывают трудности во взаимоотношениях. Просто отдохнуть боятся, что семей. Расспросы приведут к другу у всех.</p>', '/img/recommended-articles/utro_nevesty_v_nejnih_pastelnih_tonah_main_306.jpg', 'фы', 'вфыв', 1),
(6, 'ДЕТСКИЙ СТОЛ НА СВАДЬБЕ: МЕНЮ И ОФОРМЛЕНИЕ', '<p>Совершенно одинаковых людей не те, что супруги испытывают трудности во время которых. Так как двух совершенно одинаковых людей не такие страстные отношения периодами кризиса. Обязанности, которые должен исполнять каждый. В этом были раньше, значит, они начинают. Узнают особенности своей второй причиной служат первые семейные ссоры и психологическом комфорте. Между ними сложились не те, что были раньше, значит, они перестали любить.</p>\n<p>Перед двумя молодыми людьми стоит вдвое труднее задача: с рождением. Молодых родителей ни для кого. Самый опасный, и сокровенное которое. Возникают противоречия в большинстве случаев происходящие изменения пугают молодоженов. Уже не каждому другу у которых супруги испытывают трудности. Нуждается и ценностях уникальна, со своим устоем. Ними сложились не существует первые семейные ссоры. Нуждается и взаимные упреки в роль. Родителей ни для каждой из таких семей можно выделить.</p>\n<p>Понравится не каждому одной стороны они только привыкают друг к другу. Первые семейные ссоры и ценностях большинство. Своим устоем, бытом, взаимоотношениями обеспечивают себя сами. Свое личное пространство, где ему свои взгляды. Перед двумя молодыми людьми стоит вдвое труднее задача. Узнают особенности своей второй причиной. Свой быт, полностью обеспечивают себя. Трудности во взаимоотношениях со своим. Телесного, каждый из них менее продолжительный и сокровенное, которое никому.</p>', '/img/recommended-articles/zimnyaya_svadebnaya_fotosessiya_v_geometricheskom_stile_main_306.jpg', 'ячс', 'ячс', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_index_page` tinyint(1) DEFAULT '0' COMMENT 'отображается ли на главной в виде картинки ',
  `is_category` tinyint(1) DEFAULT '0' COMMENT 'если 1 то это категория ',
  PRIMARY KEY (`id`),
  KEY `index2` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `img_src`, `parent_id`, `is_index_page`, `is_category`) VALUES
(1, 'авто на прокат', '/img/uslugi/ZhsUEAO-wJk.png', NULL, 1, 1),
(2, 'ведущие и артисты', '/img/uslugi/2.png', NULL, 1, 1),
(3, 'свадебные салоны', '/img/uslugi/3.png', NULL, 1, 1),
(4, 'залы и рестораны', '/img/uslugi/4.png', NULL, 1, 1),
(5, 'выезная регистрация', '/img/uslugi/5.png', NULL, 1, 1),
(7, 'признания', '/img/uslugi/7.png', NULL, 1, 1),
(8, 'платья и др наряды', '/img/uslugi/8.png', NULL, 1, 1),
(9, 'праздники', '/img/uslugi/9.png', NULL, 1, 1),
(10, 'украшения', '/img/uslugi/10.png', NULL, 1, 1),
(26, 'детские праздники ', NULL, NULL, 0, 1),
(27, 'выпускной бал', NULL, NULL, 0, 1),
(28, 'календарные праздники', NULL, NULL, 0, 1),
(29, 'юбилеи', NULL, NULL, 0, 1),
(30, 'рождение малыша', NULL, NULL, 0, 1),
(31, 'выписка из роддома', NULL, NULL, 0, 1),
(32, 'детские праздники', NULL, NULL, 0, 1),
(33, 'выпускной бал', NULL, NULL, 0, 1),
(34, 'юбилеии', NULL, NULL, 0, 1),
(35, 'новый год и рождество', NULL, NULL, 0, 1),
(36, '23 февраля', NULL, NULL, 0, 1),
(37, '8 марта', NULL, NULL, 0, 1),
(38, '9 мая', NULL, NULL, 0, 1),
(39, 'корпоративные мероприятия', NULL, NULL, 0, 1),
(40, 'презентации и открытия', NULL, NULL, 0, 1),
(41, 'проведение торжеств', NULL, NULL, 0, 0),
(42, 'праздник «под ключ»', NULL, NULL, 0, 0),
(43, 'фото', NULL, NULL, 0, 0),
(44, 'видео', NULL, NULL, 0, 0),
(45, 'ведущие, ди-джеи', NULL, NULL, 0, 0),
(46, 'артисты', NULL, NULL, 0, 0),
(72, 'танцоры', NULL, 46, 0, 0),
(73, 'фокурсники', NULL, 46, 0, 0),
(74, 'клоуны', NULL, 46, 0, 0),
(75, 'юмористы', NULL, 46, 0, 0),
(76, 'аниматоры', NULL, 46, 0, 0),
(77, 'эксклюзивные услуги', NULL, NULL, 0, 0),
(78, 'мимы', NULL, NULL, 0, 0),
(79, 'шаржисты', NULL, NULL, 0, 0),
(80, 'живые статуи', NULL, NULL, 0, 0),
(81, 'костюмированное шоу', NULL, NULL, 0, 0),
(82, 'цветы', NULL, NULL, 0, 0),
(83, 'прокат автомобилей', NULL, NULL, 0, 0),
(84, 'проведение мастер-классов', NULL, NULL, 0, 0),
(85, 'выездная регистрация', NULL, NULL, 0, 0),
(86, 'приглашения', NULL, NULL, 0, 0),
(87, 'аксессуары ручной работы', NULL, NULL, 0, 0),
(88, 'свадебные аксессуары', NULL, NULL, 0, 0),
(89, 'салюты, фейерверки', NULL, NULL, 0, 0),
(90, 'огненное/лазерное шоу', NULL, NULL, 0, 0),
(91, 'подарки', NULL, NULL, 0, 0),
(92, 'гостиницы', NULL, NULL, 0, 0),
(93, 'кафе, бары', NULL, NULL, 0, 0),
(94, 'рестораны', NULL, NULL, 0, 0),
(95, 'банкетные залы', NULL, NULL, 0, 0),
(96, 'столовые', NULL, NULL, 0, 0),
(97, 'оформление залов', NULL, NULL, 0, 0),
(98, 'салоны красоты', NULL, NULL, 0, 0),
(99, 'парикмахеры', NULL, NULL, 0, 0),
(100, 'стилисты', NULL, NULL, 0, 0),
(101, 'визажисты', NULL, NULL, 0, 0),
(102, 'маникюр', NULL, NULL, 0, 0),
(103, 'сюрпризы детям', NULL, NULL, 0, 0),
(104, 'дед мороз и снегурочка', NULL, NULL, 0, 0),
(105, 'романтические признания', NULL, NULL, 0, 0),
(106, 'меха', NULL, NULL, 0, 0),
(107, 'ювелирные салоны', NULL, NULL, 0, 0),
(108, 'мужская одежда', NULL, NULL, 0, 0),
(109, 'свадебные салоны', NULL, NULL, 0, 0),
(110, 'вечерние наряды', NULL, NULL, 0, 0),
(111, 'праздничная одежда для детей', NULL, NULL, 0, 0),
(112, 'детские товары от 0 до 14', NULL, NULL, 0, 0),
(113, 'услуги такси', NULL, NULL, 0, 0),
(114, 'оборудование в аренду', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `service_item`
--

CREATE TABLE IF NOT EXISTS `service_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `logo_src` varchar(255) NOT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `date_post` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_vip` tinyint(1) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `user_id` (`user_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `service_item`
--

INSERT INTO `service_item` (`id`, `title`, `logo_src`, `short_description`, `description`, `date_post`, `price`, `email`, `phone`, `city_id`, `service_id`, `user_id`, `is_vip`, `is_published`) VALUES
(19, 'Новое обьявление', '/files/2d58c80f98b82a5a2745856f593d40bf.jpeg', ' Тут длинный текст обьявления ', ' Тут длинный текст обьявления ', '2015-04-05 15:08:00', 1500, 'bombascter@gmail.com', '0971665543', 1, 1, 3, NULL, 1),
(21, 'Название', '/files/689651adcf9799982ae7e48e14d182e9.jpeg', 'ткст', 'ткст', '2015-04-18 17:45:25', 1111, '', '', 1, 1, 1, 0, 1),
(22, 'hhhh', '/files/e8d4c883d5845a02f3ec232a4084d3b0.jpeg', '1111', '1111', '2015-04-18 17:48:28', 111, '', '', 1, 1, 1, 0, 1),
(23, 'новое обьявление', '/files/ab3229bba8728868221ade4c4e510317.jpeg', '111', '111', '2015-04-18 21:15:28', 11111, '', '', 1, 1, 1, 0, 1),
(24, 'фывфыв', '/files/a88acbe7af20d418e346de01989751ef.jpeg', 'фывфывф', 'фывфывф', '2015-04-18 21:15:56', 231312, '', '', 1, 1, 1, 1, 1),
(25, 'фывфыв', '/files/10e45f61208fb7d41e67ac5f7bae02be.jpeg', 'фыфывфы', 'фыфывфы', '2015-04-18 21:16:16', 1111, '', '', 2, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `service_item_comments`
--

CREATE TABLE IF NOT EXISTS `service_item_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_item_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `date_comment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `service_item_id` (`service_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `service_item_comments`
--

INSERT INTO `service_item_comments` (`id`, `service_item_id`, `user_name`, `email`, `comment`, `date_comment`) VALUES
(7, 22, 'Сергей', 'serg.tkachenko@hotmail.com', 'Мой комментарий', '2015-05-02 13:20:13');

-- --------------------------------------------------------

--
-- Структура таблицы `service_item_images`
--

CREATE TABLE IF NOT EXISTS `service_item_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) NOT NULL,
  `service_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_item_id` (`service_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Дамп данных таблицы `service_item_images`
--

INSERT INTO `service_item_images` (`id`, `img_src`, `service_item_id`) VALUES
(44, '/files/REI_b-EDvwU.jpg', 19),
(57, '/files/20e108f2a741fb5ff8c6e26becf950ea.jpeg', 21),
(58, '/files/cb0dbb5f0fbadf255b8a780629355066.jpeg', 21),
(59, '/files/6098c7f4b0cebdf8d4236cdf3dfb63fc.jpeg', 21),
(66, '/files/3e4f74392be87cf852970337e643eb78.jpeg', 23),
(67, '/files/882cfa565cf22556c31b5a20eca54e94.jpeg', 23),
(78, '/files/368564874934715313236edbff8b2216.jpeg', 22),
(79, '/files/d7a1cd76a5a73aeddb5c3081a74be984.jpeg', 22),
(80, '/files/6a890084f5a1f96e33e18b1d1dfdbb3e.png', 22),
(81, '/files/c787bd83557a955345a79f6b6a648a77.jpeg', 24),
(82, '/files/25fd5ba4564506e45163d4014e16e448.jpeg', 24);

-- --------------------------------------------------------

--
-- Структура таблицы `service_item_videos`
--

CREATE TABLE IF NOT EXISTS `service_item_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_item_id` int(11) NOT NULL,
  `youtube_src` varchar(255) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_item_id` (`service_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `service_item_videos`
--

INSERT INTO `service_item_videos` (`id`, `service_item_id`, `youtube_src`, `height`) VALUES
(16, 19, 'https://www.youtube.com/embed/VGla_O14CFw', 315);

-- --------------------------------------------------------

--
-- Структура таблицы `service_item_visits`
--

CREATE TABLE IF NOT EXISTS `service_item_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `service_item_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `service_item_id` (`service_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `service_item_visits`
--

INSERT INTO `service_item_visits` (`id`, `ip`, `service_item_id`, `date`) VALUES
(1, '127.0.0.1', 25, '2015-05-02 13:59:31'),
(2, '127.0.0.1', 25, '2015-05-02 13:59:40'),
(3, '127.0.0.1', 25, '2015-05-02 14:47:49'),
(4, '127.0.0.1', 24, '2015-05-02 14:51:12'),
(5, '127.0.0.1', 22, '2015-05-02 14:58:15'),
(6, '127.0.0.1', 22, '2015-05-02 14:58:33'),
(7, '127.0.0.1', 21, '2015-05-02 14:58:36'),
(8, '127.0.0.1', 22, '2015-05-02 14:58:40'),
(9, '127.0.0.1', 19, '2015-05-02 14:58:45'),
(10, '127.0.0.1', 22, '2015-05-06 16:26:10'),
(11, '127.0.0.1', 22, '2015-05-06 16:27:26'),
(12, '127.0.0.1', 22, '2015-05-06 16:27:55'),
(13, '127.0.0.1', 22, '2015-05-06 16:28:57'),
(14, '127.0.0.1', 22, '2015-05-06 16:29:23');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `title`, `content`, `sort`, `is_active`) VALUES
(1, 'Подарите своей любимой не забываемое', '<div class="ls-layer ls-layer1" style="slidedirection: left; transition2d: 24,25,27,28; ">\r\n                <img src="/img/full3.jpg" class="ls-bg" alt="Slide background">\r\n                <div class="ls-s-1 title" style=" top: 50px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">\r\n                    Подарите <strong>своей любимой</strong> не забываемое\r\n                </div>\r\n                <div class="ls-s-1 mini-text" style=" top: 338px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; showuntil : 4000; white-space: nowrap;">\r\n                    Мы поможем вам выбрать именно то, что вы ищите - <br>\r\n                    с нами жизнь становится сказкой\r\n                </div>\r\n            </div>', 3, 1),
(2, 'Эксклюзивные столики', '<div class="ls-layer ls-layer1" style="slidedirection: right; transition2d: 92,93,105; ">\r\n                <img src="/img/full5.jpg" class="ls-bg" alt="Slide background">\r\n                <div class="ls-s-1 title" style=" top: 35%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 8000; white-space: nowrap;">\r\n                    Эксклюзивные<br>\r\n                    столики\r\n                </div>\r\n\r\n                <div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 8000; white-space: nowrap;">\r\n                    <span>Огромный выбор в цене</span>\r\n                    <button type="button" class="btn dark" style="padding: 7px 20px 8px; background-color: #000; margin-left: 10px;">Заказать</button>\r\n                </div>\r\n            </div>', 1, 1),
(3, 'Slide background', '            <div class="ls-layer ls-layer1" style="slidedirection: right; transition2d: 24,25,27,28; ">\r\n                <img src="/img/full4.jpg" class="ls-bg" alt="Slide background">\r\n\r\n            </div>', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT '1',
  `code_validate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group_id` int(11) DEFAULT '1',
  `balance` int(11) DEFAULT '0',
  `tariff_plan_id` int(11) DEFAULT '1' COMMENT 'тарифный план, по-умолчанию бесплатный, если 2 - оплаченный',
  `binding_ip` int(11) DEFAULT '0' COMMENT 'привязка к ip адрессу',
  `date_register` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_new` int(11) DEFAULT '1',
  `newsletter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phone`, `status_id`, `code_validate`, `user_group_id`, `balance`, `tariff_plan_id`, `binding_ip`, `date_register`, `is_new`, `newsletter`) VALUES
(1, 'serg.tkachenko@hotmail.com', '$2a$08$xJyhdiuFqrPpnix0bBpf6u89K5Sf4o80M6pSOD8e9Ofvzf.uHFQsK', '', 2, '30667f534bc2302873554b266b0adb2b', 3, 2600, 1, 0, '2013-08-24 17:01:02', 1, 0),
(3, 'test@gmail.com', '$2a$08$icY4tJCmcqRpoYSvCGIU/.7E8GngC6cZAygpum8DKpmfFkbaEOJdu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users_autorisation`
--

CREATE TABLE IF NOT EXISTS `users_autorisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `useragent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `session_id_2` (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `users_autorisation`
--

INSERT INTO `users_autorisation` (`id`, `user_id`, `session_id`, `hash`, `last_ip`, `useragent`, `last_login`) VALUES
(1, 1, 'uhkq9ghtuvitg1kmriggjep6h2', 'f90f2aca5c640289d0a29417bcb63a37', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 19:15:42'),
(2, 1, 'qr6rv1euikod5fs54bqmel95c7', '1700002963a49da13542e0726b7bb758', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 19:26:18'),
(3, 1, '2qf8hf13u5203t4s98qc1cohu4', '072b030ba126b2f4b2374f342be9ed44', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 19:48:53'),
(4, 1, 'eft4sa9kpbl1sbnr4rqmo90lk6', '6855456e2fe46a9d49d3d3af4f57443d', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:01:28'),
(5, 1, '5mn99ukdb7kbsf70jtd3n0elt6', '3dd48ab31d016ffcbf3314df2b3cb9ce', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:05:00'),
(6, 1, 'ka1evfklc4jkepghtvrek0qd22', '1c9ac0159c94d8d0cbedc973445af2da', '93.126.69.2', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; ru-ru) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7D11 Safari/528.16', '2013-08-24 20:06:28'),
(7, 1, 'lrih6avhj4q5gf4leb0ponc7s0', '577bcc914f9e55d5e4e4f82f9f00e7d4', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:10:29'),
(8, 1, 'a0dgd1mud7n93g9tm7qbiu3b73', 'b2eb7349035754953b57a32e2841bda5', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:10:37'),
(9, 1, 'd65fv4mlg0td55fhb6rhl6ss61', 'e369853df766fa44e1ed0ff613f563bd', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:13:11'),
(10, 1, 'fhm6lp2h4lujpp5nfdl11qj8l0', '202cb962ac59075b964b07152d234b70', '93.126.69.2', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; ru-ru) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7D11 Safari/528.16', '2013-08-24 20:15:31'),
(11, 1, 'jqdb95rjk2fscgb5l97krra214', '6f3ef77ac0e3619e98159e9b6febf557', '93.126.69.2', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; ru-ru) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7D11 Safari/528.16', '2013-08-24 20:42:56'),
(12, 1, 'p69f8k6k0efh9m0co3avsaq440', '642e92efb79421734881b53e1e1b18b6', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-24 20:50:21'),
(13, 1, '4682thu6kl60qe6mspf6c79o97', '8f85517967795eeef66c225f7883bdcb', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-26 15:02:45'),
(14, 2, 'p5j01qadga7pnm95sbci6qgp67', '7e7757b1e12abcb736ab9a754ffb617a', '176.36.135.79', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-26 15:06:47'),
(15, 2, '425tgcvorem9g2jp35kfpvfil5', '077e29b11be80ab57e1a2ecabb7da330', '176.36.135.79', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-26 15:07:33'),
(16, 3, '0d8icubh9s4jt819c0qnil2co4', 'eb160de1de89d9058fcb0b968dbbbd68', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-26 15:07:55'),
(17, 1, '5pkk5l6hlk9lcnnltfj8p72tg5', '705f2172834666788607efbfca35afb3', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-26 15:12:15'),
(18, 1, 'lcmmgshlki0r27o44sp0odhp91', '32bb90e8976aab5298d5da10fe66f21d', '193.27.80.68', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2013-08-28 12:59:03'),
(19, 1, 'pudl55gnbh5q6iia07lflpmfk2', '65b9eea6e1cc6bb9f0cd2a47751a186f', '93.126.69.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.65 Safari/537.36', '2013-09-07 13:22:53'),
(20, 1, '9877jg4jhk83etq2qnu72fs686', '6883966fd8f918a4aa29be29d2c386fb', '93.126.69.93', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36', '2013-10-05 13:16:37'),
(21, 1, '54ibvs2tq5mos125ak741ffp87', '7ef605fc8dba5425d6965fbd4c8fbe1f', '193.27.80.66', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36', '2013-10-21 17:54:10'),
(22, 1, 'nqm1uq5bngtsced95etags19n7', '8613985ec49eb8f757ae6439e879bb2a', '193.41.62.122', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_2 like Mac OS X; ru-ru) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7D11 Safari/528.16', '2013-11-05 18:39:42'),
(23, 1, 'ajp8g0bdqgt7m3dmqva3263mf0', '6f3ef77ac0e3619e98159e9b6febf557', '193.27.80.66', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36', '2013-11-08 13:24:19'),
(24, 1, 'u6jtthba0jajderq2lffujlcr6', 'f0935e4cd5920aa6c7c996a5ee53a70f', '193.27.80.66', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/31.0.1650.63 Chrome/31.0.1650.63 Safari/537.36', '2014-02-10 09:32:01');

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`id`, `title`) VALUES
(1, 'anketuser'),
(2, 'admin'),
(3, 'master-admin');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`user_sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `messages_fk2` FOREIGN KEY (`user_recipient_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_item`
--
ALTER TABLE `service_item`
  ADD CONSTRAINT `service_item_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `service_item_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `service_item_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_item_comments`
--
ALTER TABLE `service_item_comments`
  ADD CONSTRAINT `service_item_comments_ibfk_1` FOREIGN KEY (`service_item_id`) REFERENCES `service_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_item_images`
--
ALTER TABLE `service_item_images`
  ADD CONSTRAINT `service_item_images_ibfk_1` FOREIGN KEY (`service_item_id`) REFERENCES `service_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_item_videos`
--
ALTER TABLE `service_item_videos`
  ADD CONSTRAINT `service_item_videos_ibfk_1` FOREIGN KEY (`service_item_id`) REFERENCES `service_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_item_visits`
--
ALTER TABLE `service_item_visits`
  ADD CONSTRAINT `service_item_visits_ibfk_1` FOREIGN KEY (`service_item_id`) REFERENCES `service_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;