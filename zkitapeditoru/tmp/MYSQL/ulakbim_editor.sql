-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2014 at 02:32 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ulakbim_editor`
--
CREATE DATABASE IF NOT EXISTS `ulakbim_editor` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `ulakbim_editor`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `account_balances`
--
DROP VIEW IF EXISTS `account_balances`;
CREATE TABLE IF NOT EXISTS `account_balances` (
`transaction_id` varchar(45)
,`transaction_type` varchar(15)
,`transaction_method` varchar(10)
,`transaction_amount` decimal(10,0)
,`transaction_unit_price` decimal(10,0)
,`transaction_amount_equvalent` decimal(10,0)
,`transaction_currency_code` int(11)
,`transaction_start_date` timestamp
,`transaction_end_date` timestamp
,`transaction_result` mediumint(9)
,`transaction_explanation` longtext
,`transaction_book_id` varchar(44)
,`transaction_host_id` varchar(12)
,`transaction_reader_id` varchar(45)
,`transaction_user_id` int(11)
,`transaction_organisation_id` varchar(44)
,`transaction_host_ip` text
,`transaction_remote_ip` text
);
-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `workspace_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `publish_time` timestamp NULL DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  `pdf_file` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `workspace_id`, `title`, `author`, `created`, `publish_time`, `data`, `pdf_file`) VALUES
('fgbB06nzNnn0qbcwznSd8pRUzbKAptZJ2tOcGFIvRnDM', 'fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD', 'egemen', 'egemeb', '2014-11-03 10:07:15', NULL, '{"size":{"width":"1024","height":"768"}}', NULL),
('iWMlIVS8g7hYK3vMciAyQJvyITOie52lzRnGlKNvqL5r', 'fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD', 'egemen2', 'ege2', '2014-11-03 10:09:07', NULL, '{"size":{"width":"1024","height":"768"}}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

DROP TABLE IF EXISTS `book_categories`;
CREATE TABLE IF NOT EXISTS `book_categories` (
  `category_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `category_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `organisation_id` varchar(44) COLLATE utf8_bin DEFAULT NULL,
  `periodical` tinyint(1) NOT NULL DEFAULT '0',
  `parent_category` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `book_users`
--

DROP TABLE IF EXISTS `book_users`;
CREATE TABLE IF NOT EXISTS `book_users` (
  `user_id` int(11) NOT NULL,
  `book_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `type` enum('owner','editor','user','') COLLATE utf8_bin NOT NULL DEFAULT 'user',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `book_users`
--

INSERT INTO `book_users` (`user_id`, `book_id`, `type`, `created`) VALUES
(1, 'fgbB06nzNnn0qbcwznSd8pRUzbKAptZJ2tOcGFIvRnDM', 'owner', '2014-11-03 10:07:15'),
(1, 'iWMlIVS8g7hYK3vMciAyQJvyITOie52lzRnGlKNvqL5r', 'owner', '2014-11-03 10:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE IF NOT EXISTS `chapter` (
  `chapter_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `book_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `start_page` int(11) DEFAULT NULL,
  `order` double NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`chapter_id`, `title`, `book_id`, `start_page`, `order`, `created`, `data`) VALUES
('grPuUEZ2h8mD6lOP4JGg1rVKcqOgWZ2HrZUPylG2qNwP', 'Bölüm 1', 'iWMlIVS8g7hYK3vMciAyQJvyITOie52lzRnGlKNvqL5r', NULL, 0, '2014-11-03 10:09:07', NULL),
('w4ycPleIHa2Vbj5oNs61PMGjX8f4lh7SxgQUqLdxTrdS', 'Bölüm 1', 'fgbB06nzNnn0qbcwznSd8pRUzbKAptZJ2tOcGFIvRnDM', NULL, 0, '2014-11-03 10:07:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `id` varchar(44) COLLATE utf8_bin NOT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `page_id` varchar(44) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
`faq_id` int(42) NOT NULL,
  `faq_question` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `faq_answer` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `faq_frequency` int(11) DEFAULT '0',
  `lang` enum('tr','en','','') COLLATE utf8_bin DEFAULT 'tr',
  `rate` float DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

DROP TABLE IF EXISTS `faq_category`;
CREATE TABLE IF NOT EXISTS `faq_category` (
  `faq_category_id` varchar(42) COLLATE utf8_bin NOT NULL,
  `faq_category_title` varchar(244) COLLATE utf8_bin NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` enum('tr','en','','') COLLATE utf8_bin NOT NULL DEFAULT 'tr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category_faq`
--

DROP TABLE IF EXISTS `faq_category_faq`;
CREATE TABLE IF NOT EXISTS `faq_category_faq` (
  `faq_category_id` varchar(42) COLLATE utf8_bin NOT NULL,
  `faq_id` int(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ids`
--
DROP VIEW IF EXISTS `ids`;
CREATE TABLE IF NOT EXISTS `ids` (
`id` varchar(44)
,`type` varchar(9)
);
-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
CREATE TABLE IF NOT EXISTS `invitation` (
`id` int(11) NOT NULL,
  `invitation_key` text COLLATE utf8_bin NOT NULL,
  `type` enum('book','workspace','organisation','') COLLATE utf8_bin NOT NULL,
  `type_id` text COLLATE utf8_bin NOT NULL,
  `type_data` text COLLATE utf8_bin,
  `user_id` int(11) DEFAULT NULL,
  `new_user` int(11) NOT NULL DEFAULT '0',
  `inviter` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
CREATE TABLE IF NOT EXISTS `keywords` (
  `keyword_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `lang` enum('tr','en','','') COLLATE utf8_bin NOT NULL DEFAULT 'tr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `keywords_faq`
--

DROP TABLE IF EXISTS `keywords_faq`;
CREATE TABLE IF NOT EXISTS `keywords_faq` (
  `keyword_id` varchar(42) COLLATE utf8_bin NOT NULL,
  `faq_id` int(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
CREATE TABLE IF NOT EXISTS `login_history` (
  `user_email` text COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `ip` text COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`user_email`, `time`, `status`, `ip`, `message`) VALUES
('egemen@linden-tech.com', '2014-10-20 11:08:17', 1, '193.140.83.1', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-20 11:09:24', 0, '193.140.83.1', 'SITE:LOGIN:SignIn:0:{"user":"egemen@linden-tech.com","userId":"1"}'),
('egemen@linden-tech.com', '2014-10-20 13:12:11', 0, '193.140.83.1', 'SITE:LOGIN:SignIn:0:{"user":"egemen@linden-tech.com","userId":"1"}'),
('egemen@linden-tech.com', '2014-10-21 06:18:33', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egemen@linden-tech.com","userId":"1"}'),
('egemen@linden-tech.com', '2014-10-21 08:20:24', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:20:35', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:20:47', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:22:58', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:23:02', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:23:12', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egemen@linden-tech.com', '2014-10-21 08:23:19', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egementaskin@gmail.com', '2014-10-21 08:24:33', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:31:26', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:31:30', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.comx', '2014-10-21 10:31:40', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egementaskin@gmail.comx","password":"12548442"}'),
('egementaskin@gmail.com', '2014-10-21 10:31:45', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:32:43', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:36:34', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:37:49', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:05', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:13', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:30', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:36', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:52', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:39:57', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:00', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:09', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:12', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:17', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:20', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:40:51', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:41:30', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:42:28', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egemen@linden-tech.com', '2014-10-21 10:43:47', 1, '193.140.100.5', 'SITE:LOGIN:SignIn:1:{"email":"egemen@linden-tech.com","password":"12548442"}'),
('egementaskin@gmail.com', '2014-10-21 10:44:00', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:48:39', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:49:01', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:49:05', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:49:08', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:49:17', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:49:21', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:50:10', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:50:42', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 10:53:03', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 11:02:06', 0, '193.140.100.5', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}'),
('egementaskin@gmail.com', '2014-10-21 11:05:09', 0, '193.140.83.1', 'SITE:LOGIN:SignIn:0:{"user":"egementaskin@gmail.com","userId":"1"}');

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `organisation_name` text COLLATE utf8_bin NOT NULL,
  `organisation_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`organisation_id`, `organisation_name`, `organisation_admin`) VALUES
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'ulakbim', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organisations_meta`
--

DROP TABLE IF EXISTS `organisations_meta`;
CREATE TABLE IF NOT EXISTS `organisations_meta` (
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `meta` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `organisations_meta`
--

INSERT INTO `organisations_meta` (`organisation_id`, `meta`, `value`) VALUES
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'template', 'fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD');

-- --------------------------------------------------------

--
-- Table structure for table `organisation_hostings`
--

DROP TABLE IF EXISTS `organisation_hostings`;
CREATE TABLE IF NOT EXISTS `organisation_hostings` (
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `hosting_client_IP` varchar(120) COLLATE utf8_bin NOT NULL,
  `hosting_client_port` int(11) NOT NULL DEFAULT '2222',
  `hosting_client_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `hosting_client_key1` text COLLATE utf8_bin NOT NULL,
  `hosting_client_key2` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `organisation_invitation`
--

DROP TABLE IF EXISTS `organisation_invitation`;
CREATE TABLE IF NOT EXISTS `organisation_invitation` (
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `invitation_id` varchar(44) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `organisation_users`
--

DROP TABLE IF EXISTS `organisation_users`;
CREATE TABLE IF NOT EXISTS `organisation_users` (
  `user_id` int(11) NOT NULL,
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `role` enum('owner','manager','user') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `organisation_users`
--

INSERT INTO `organisation_users` (`user_id`, `organisation_id`, `role`) VALUES
(1, 'mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `organisation_workspaces`
--

DROP TABLE IF EXISTS `organisation_workspaces`;
CREATE TABLE IF NOT EXISTS `organisation_workspaces` (
  `organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `workspace_id` varchar(44) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `organisation_workspaces`
--

INSERT INTO `organisation_workspaces` (`organisation_id`, `workspace_id`) VALUES
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD'),
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'hK9ogv9rsMd4I3Q9IaBR0irKBHcdWzpm3yOazuTp10G5'),
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'mhZYEFqUIlbrQID16LIHREXsKPbLY7K8KO45UgBDXUIq'),
('mZuOG4MGwJ1I8gXEEAAn3uoyWU6uDYqFfBVOPNBrWwlv', 'yBwFA9U1KsdGXuAQO54Cskw7nVRt8NfdYlRbVxb7t8Pu');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `page_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `chapter_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `data` longtext COLLATE utf8_bin,
  `order` int(11) NOT NULL,
  `pdf_data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `created`, `chapter_id`, `data`, `order`, `pdf_data`) VALUES
('H2lg9lhsZkTV86DpiZIOU2KkfJtmZ8xa6TCeE2FrFAcA', '2014-11-03 10:07:15', 'w4ycPleIHa2Vbj5oNs61PMGjX8f4lh7SxgQUqLdxTrdS', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAABZCAYAAAD1lOBBAAABRklEQVR4Xu3VgQ0AMAiEwLr/0LXpGOTcAMjHue+OyxoYgbNtP5jA7b4Cx/sKLHDdQJzPDxY4biCOZ8ECxw3E8SxY4LiBOJ4FCxw3EMezYIHjBuJ4Fixw3EAcz4IFjhuI41mwwHEDcTwLFjhuII5nwQLHDcTxLFjguIE4ngULHDcQx7NggeMG4ngWLHDcQBzPggWOG4jjWbDAcQNxPAsWOG4gjmfBAscNxPEsWOC4gTieBQscNxDHs2CB4wbieBYscNxAHM+CBY4biONZsMBxA3E8CxY4biCOZ8ECxw3E8SxY4LiBOJ4FCxw3EMezYIHjBuJ4Fixw3EAcz4IFjhuI41mwwHEDcTwLFjhuII5nwQLHDcTxLFjguIE4ngULHDcQx7NggeMG4ngWLHDcQBzPggWOG4jjWbDAcQNxPAsWOG4gjmfB8cAL9FVjBR9bF2UAAAAASUVORK5CYII=', 0, ''),
('H8H2vxUL02J0lGyxoCpwkv42NsdW9tqA1n239p25hlMA', '2014-11-03 10:09:07', 'grPuUEZ2h8mD6lOP4JGg1rVKcqOgWZ2HrZUPylG2qNwP', NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `publish_queue`
--

DROP TABLE IF EXISTS `publish_queue`;
CREATE TABLE IF NOT EXISTS `publish_queue` (
  `book_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `publish_data` mediumtext COLLATE utf8_bin NOT NULL,
  `is_in_progress` tinyint(1) NOT NULL DEFAULT '0',
  `success` tinyint(1) DEFAULT NULL,
  `message` text COLLATE utf8_bin,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trial` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
CREATE TABLE IF NOT EXISTS `readers` (
  `reader_id` varchar(39) COLLATE utf8_bin NOT NULL,
  `reader_key` text COLLATE utf8_bin NOT NULL,
  `reader_code` text COLLATE utf8_bin NOT NULL,
  `reader_name` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `transaction_type` enum('pdf','epdf','epub','hosting_disk','hosting_traffic','sale','sale_share','publishing','credit','timestamp','isbn','plan') COLLATE utf8_bin NOT NULL,
  `transaction_method` enum('deposit','withdrawal') COLLATE utf8_bin NOT NULL,
  `transaction_amount` decimal(10,0) NOT NULL,
  `transaction_unit_price` decimal(10,0) NOT NULL DEFAULT '1',
  `transaction_amount_equvalent` decimal(10,0) NOT NULL,
  `transaction_currency_code` int(11) NOT NULL DEFAULT '840',
  `transaction_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_end_date` timestamp NULL DEFAULT NULL,
  `transaction_result` mediumint(9) NOT NULL DEFAULT '-1',
  `transaction_explanation` longtext COLLATE utf8_bin,
  `transaction_book_id` varchar(44) COLLATE utf8_bin DEFAULT NULL,
  `transaction_host_id` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `transaction_reader_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `transaction_user_id` int(11) DEFAULT NULL,
  `transaction_organisation_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `transaction_host_ip` text COLLATE utf8_bin,
  `transaction_remote_ip` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_offerings`
--

DROP TABLE IF EXISTS `transaction_offerings`;
CREATE TABLE IF NOT EXISTS `transaction_offerings` (
  `packet_id` varchar(60) COLLATE utf8_bin NOT NULL,
  `transaction_type` enum('epub','hosting_disk','hosting_traffic','sale','sale_share','publishing','credit','timestamp','isbn','doi','branding1','branding2','branding3','branding4','support1','support2','support3','support4','publishing-others','epub-export','epub-export-withoutwatermark') COLLATE utf8_bin NOT NULL,
  `transaction_amount` int(11) NOT NULL,
  `transaction_price` int(11) NOT NULL,
  `transaction_unit` enum('each','hourly','daily','month','mb','gb') COLLATE utf8_bin NOT NULL,
  `transaction_description` text COLLATE utf8_bin NOT NULL,
  `transaction_details` text COLLATE utf8_bin NOT NULL,
  `transaction_valid_days` int(11) NOT NULL DEFAULT '-1',
  `transaction_free_with_register` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `data` blob,
  `tel` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `created`, `password`, `email`, `data`, `tel`) VALUES
(1, 'Egemen ', 'Taşkın', '2014-10-19 23:09:10', 'd803de07569b65f8429d3e73bb4c47c5', 'egementaskin@gmail.com', NULL, '+905435181337');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE IF NOT EXISTS `user_meta` (
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(200) COLLATE utf8_bin NOT NULL,
  `meta_value` longtext COLLATE utf8_bin NOT NULL,
  `created` int(24) DEFAULT NULL,
`id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=39417 ;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`user_id`, `meta_key`, `meta_value`, `created`, `id`) VALUES
(1, 'emailVerify', 'CmaVZtn2aBcFRxjNJaQA', 1413881558, 37306),
(1, 'confirm', 'confirmed', 1413803351, 37307),
(1, 'lastEditedBook', 'SUtfI7eUCIFELWZ2eW0ysN3f9swfMcQ0BQp3zN16leUN', 1413804303, 37309),
(1, 'lastEditedBook', 'GYiKSOEwuLYX19ocqhL01kLW1QhlAbjLS7ihmRkMkjnx', 1413804881, 37316),
(1, 'lastEditedBook', 'xMslkyNYdvEhBGE1f1qaPCHXxTsSf9qzJceaxMG17wN9', 1413804962, 37317),
(1, 'lastEditedBook', 'ChUVcqTzU6vmfNYA4ivVLx7vHkJbp7dn9WVv9toIm3mC', 1413804981, 37318);
INSERT INTO `user_meta` (`user_id`, `meta_key`, `meta_value`, `created`, `id`) VALUES
(1, 'profilePicture', 'data:image/png;base64,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', 1413811527, 37349);
INSERT INTO `user_meta` (`user_id`, `meta_key`, `meta_value`, `created`, `id`) VALUES
(1, 'lastEditedBook', '1bt5TqiPD0p1MjTCyAEsSvWzjhEgwPnRq5BbMgbtkR0X', 1413815710, 37373),
(1, 'lastEditedBook', 'sQRWKm41dfko0X5CzBNIbBUcFM3BJea4YYOdQ5ef5FHu', 1413883871, 37399),
(1, 'lastEditedBook', 'cggHmRN71yIJVtItx8XCbnPlUPZQoeeWzYbToX51bKre', 1413891419, 37406),
(1, 'lastEditedBook', 's90NeK4oDQJlupvFFEjVy0bP3omNdVEDiCm1ORxkvPRU', 1413891745, 37416),
(1, 'lastEditedBook', 'o1kjCWeylFZeVAGs8DlWudm3ZCrswOTkUktCvtQ2kuJt', 1413892780, 37422),
(1, 'lastEditedBook', 'gSpCwdi2RixnpXGeGq0on25uHVXoOO5CWvaVEF3eIZwJ', 1413973855, 37475),
(1, 'lastEditedBook', 'cEZCQELwdSPX8XKXBuYyaznJuqJ4UznLZuY98EHap0YX', 1413977089, 37479),
(1, 'lastEditedBook', 'EjQH7PV0TfbbYAdM5IOCETg5OX3ShEAwx4W7c0n31p4a', 1413979213, 37488),
(1, 'lastEditedBook', '3rTwMWWlge4vmwGxeU5IRlWJzNzm9IA6Fkyvz5bw10vl', 1413979483, 37491),
(1, 'lastEditedBook', 'roKk3UWTOaiRqOvFIcUVUv9utRa49Xtso62e0AH7tW20', 1413983423, 37498),
(1, 'lastEditedBook', '0svhedRIireYdU0NVS6Biq2ACmSYCUaZmsk1twx3Ycms', 1413983437, 37500),
(1, 'lastEditedBook', 'gBMi3wtmxq9MAB6Cxt5cB2XQ67scGwZT2Tpwfugm2UQc', 1414074954, 37526),
(1, 'lastEditedBook', 'Hl7pH5trmRO7uIKJaB5UbR2YC0hbWBg2BcoxNmqYrfWX', 1414075617, 37527),
(1, 'lastEditedBook', 'ZWa58OHgFRZ4q938Xa0ROk4U6oqYln6GSTcb3FzlYkYk', 1414132681, 37529),
(1, 'lastEditedBook', 'yjQ4OMPNiGuEJeC2hqXrMIkwDrnZuiZFqMpcfGih0Ayl', 1414133083, 37530),
(1, 'lastEditedBook', 'R0M8sbVb6fLQ7uT3ZbxWP7NR2CoNyoFu3hkqlApG9fPD', 1414133830, 37531),
(1, 'lastEditedBook', 'FkLHkM7GjGBUBxNJlXdiXQ9U8jKt6TISB9BPoNUVUEO1', 1414133893, 37532),
(1, 'lastEditedBook', 'PwyFOX6ZmsJ6iDkZ56L67F1JbT40HpIv8G9XSmEOpYsW', 1414135624, 37537),
(1, 'lastEditedBook', 'H83L0Etjdz9cKSoxJfLx9lGOPGwX8obT7CqkH2QPhWw1', 1414136878, 37552),
(1, 'lastEditedBook', 'mpt2JGKpjcbtHCpd8fV0mUrpUzam5YUzXSrVtHIzJ11K', 1414138716, 37559),
(1, 'lastEditedBook', 'WPLP18J27I9upRmYhPgBUdAYWToRHwRAmO0mFJylEO3L', 1414139037, 37561),
(1, 'lastEditedBook', 'YNHx4hLKIgQ6kOY3mAzQS5z47LV0n5TdEmqnwiWV3Dug', 1414139279, 37562),
(1, 'lastEditedBook', 'hydRbqUwHBED8HBIIxHYOTCL99aP1Ntm56K7Vo3tVVpx', 1414151267, 37563),
(1, 'lastEditedBook', 'zkpXAN0DC2kr0PwCD5ZQvYU5mZRRj2rLjSsvgqJ9JLne', 1414156847, 37576),
(1, 'lastEditedBook', 'f9nCURj0ZzNyEYrmnAMhl7sSi0IkG9pBHt4QM09S2Dpz', 1414156891, 37582),
(1, 'lastEditedBook', 'AjyAm12f2Cbn4wHMHvOjiGLTMhyY7hyk0VX6tK2dJDKj', 1414156993, 37588),
(1, 'lastEditedBook', '9ovfwexwqs7royhIy7FRO7wQkB170Vpi3Z0WsFeItFHR', 1414157208, 37596),
(1, 'lastEditedBook', 'rBKV9fEodiqUwoqU0GXKHnqWCpWpfSyMz4OgzDBk3A7w', 1414157230, 37598),
(1, 'lastEditedBook', 'iJxIWXfvJcpgbYMZZGIgEd54s0TSdXsspNGYo5ewPanx', 1414157424, 37614),
(1, 'lastEditedBook', 'xpQRFrhgE7wKrEcdrYt96ioGCJeIgx7CC4sdLPjAQLy4', 1414158154, 37615),
(1, 'lastEditedBook', 'HmDGiLzix2DivZXmCbCTJ5PNXUjPUs4WFiClwYNfNwVb', 1414158730, 37618),
(1, 'lastEditedBook', '6dk4eQcoIFfFwKUpKNRG6IM26ookBr7qwm9plPqkdQUo', 1414158772, 37621),
(1, 'lastEditedBook', 's5uDDwiqgDlSJ5wSQYRRUrMY1UCtFkXW9OO1k2BxKevf', 1414158780, 37622),
(1, 'lastEditedBook', 'og64O9ZRh6aasNQMUuQLDiMzuQMUeiE4S3Rg2CRtzD3p', 1414158833, 37630),
(1, 'lastEditedBook', 'LeHMXCJFbXz5jdPdLcHU51yxNQ87VkvX1FaK3FocibQp', 1414396725, 37636),
(1, 'lastEditedBook', 'gEjEaaEgbhZY9zW0QO8ZP5YxchmxTxWNdQeDra7c50r9', 1414396775, 37639),
(1, 'lastEditedBook', 'RVQCo4DDCbbYHLkvngIi1PhkW1zDUz04lK1xDkPnasrk', 1414396864, 37645),
(1, 'lastEditedBook', '96wk6cXgKrUmO1mt4bRjSnJI5wnKTEruXVPEXbhK6YHp', 1414396969, 37646),
(1, 'lastEditedBook', 'amcSB9lCMkG4DTHinm0qa5PLajs7U8xz6BT2TuXcdlOP', 1414397421, 37659),
(1, 'lastEditedBook', 'HbGstqOVlNWDqdeMtCN6rvSMvErY6HHhAv7QHyIIot9X', 1414397437, 37662),
(1, 'lastEditedBook', 'eXmWqKzunZlwqKMCfkBsEPeRXkmUw1Zp1e694ohEkyb1', 1414397478, 37665),
(1, 'lastEditedBook', 'dBbCxpbaXljz3ylwlGe2x5JhjzK9YAAW5r4zh1QmgFHX', 1414397543, 37666),
(1, 'lastEditedBook', 'Dx7lU6p5SZ1U6wYoOyCJSZM0F9CBUsWtgnTPu667clIK', 1414661839, 37725),
(1, 'lastEditedBook', 'EBm1O9Ye0VkI43PyURnawWxZrme90MqtUt0DzOV1DLmc', 1414670571, 37729),
(1, 'lastEditedBook', 'rDEHhcwDjWG2vFuRq8z8a5lmM6GzSbFwtezqeSohiiP3', 1414672228, 37769),
(1, 'lastEditedBook', 'aZRb66yU5AG9TOSzU6EfkJdLg7O9Jb2DEFCLDR14zihN', 1414673054, 37775),
(1, 'lastEditedBook', 'a2B4XxbCr4waQLjJ8Py7hc9WOgcf3P2Uj6OcfT3RB7I8', 1414673092, 37776),
(1, 'lastEditedBook', 'rbXHlcVgilinIiwTZJRcIaz1aapyvXdf652DJra810Wn', 1414673454, 37783),
(1, 'lastEditedBook', 'Aw6bookhTHNpe76D5ctjQZqOLhtKrr89wNqDpf2sBsV0', 1414673489, 37784),
(1, 'lastEditedBook', 'aoIO5f05ZE3j2EphiGs1oNeK6hgECZ0uOcgxReZOJ7cP', 1414673874, 37787),
(1, 'lastEditedBook', 'YhtV0G6IC0P9EnAlOGKPIoPn9e9KV2O6fVeTyDvQMxSe', 1414674539, 37792),
(1, 'lastEditedBook', '3HKl4WjKUMWwMbEjZB2yYu62gNma6KvhT0nNeyFRuPty', 1414675114, 37806),
(1, 'lastEditedBook', 'fNceuLgzjNzvZjzPu64wbIaBKpOiLNZIkJa0zymMeEDK', 1414675310, 37811),
(1, 'lastEditedBook', 'TP4GL5AiXNjFbmMZfwBKIRKua7hRrylG1DImA1xwODoV', 1414675575, 37815),
(1, 'lastEditedBook', 'Ntba4o3LQVsYvOE1nQOU3b32WRm6KyvIsyzAQbOdNnra', 1414675621, 37817),
(1, 'lastEditedBook', '7aeE3jUepWj0zD0x82NYa1LRBSA1H5FjaKAIBWjM4e79', 1414675974, 37818),
(1, 'lastEditedBook', 'K2qbTCUxnIPI47V1bqxCu8XjgMjJ4DReOk1OgQDS5226', 1414676386, 37824),
(1, 'lastEditedBook', 'pHbUA4fqqimCYdf3qZB4qeekiyn8wIaCK3tC1b22dE3P', 1414680401, 37851),
(1, 'lastEditedBook', 'TeCcSMBGgCXWeGc9rnf1aqTlMvLDcgvRufohxPBMv32B', 1414680412, 37854),
(1, 'lastEditedBook', '7KVwiiHOJhZnJ5bEod80Yzg92kG4bTQ97INKqzPYj72x', 1414680992, 37865),
(1, 'lastEditedBook', 'gRs9jWJeZ7wxWx83S6gr5rHLaHch1pdEjKuB9JGuy68v', 1414681212, 37879),
(1, 'lastEditedBook', '6cb7mpp0Dv6NdxdfcgH29sBS3jIRMlH41uS01qbLmw0M', 1414740193, 37907),
(1, 'lastEditedBook', 'GbZ3eeubJvmqCjwlH8l7uosAn0aJxDOPRg5TuK88cbYI', 1414740337, 37908),
(1, 'lastEditedBook', '1AV8VjgBCe5kkR52CgFXvdxyBKDHxPJovbQ2i2if6nfA', 1414740374, 37911),
(1, 'lastEditedBook', 'wO1BUMaaunibISfDlBHpj6E2u1y7SxC9E345PXoIuGy0', 1414741543, 37938),
(1, 'lastEditedBook', 'blsnivraAV9MRPEZUfiDnOe5XbsCRGRHLl1Ky9nHLvBP', 1414741891, 37947),
(1, 'lastEditedBook', 'pn2T1IuuwlmOKeJUIvRnzujsnxdYhoImPZfz7af6fKuY', 1414743224, 37951),
(1, 'lastEditedBook', 'Lb802Xdmn7EUudjcPX7GTaBQWsrU6pLatSTuoYl5cW6c', 1414746037, 37954),
(1, 'lastEditedBook', '71LOnZOE4MLMYzAFuoFakiqpbOBVeMtc3TAZC5v9Mkik', 1414746592, 37978),
(1, 'lastEditedBook', 'DgeEK3BcRVf2J0CN1PWcsbPcf92eu5riQHWon3SiOJCo', 1414746684, 37982),
(1, 'lastEditedBook', '5eoSrCTZlEKpG5T92j13IR7Om9nOtefU4Ipz8Fd0yBOJ', 1414746935, 38000),
(1, 'lastEditedBook', '2PcTuChmtSmoqz8vzSe8GTJ3qPPQdqy568vZ5nFycUJU', 1414747281, 38010),
(1, 'lastEditedBook', 'd3zrW8Jhv5dktktXJNcTmHqtqZCMgpEHuiTClm70ePAk', 1414747411, 38014),
(1, 'lastEditedBook', 'FAXGAzKmzfmZCpZ8lDQiais2f0GewNtnS3BzdoitA8lW', 1414747523, 38016),
(1, 'lastEditedBook', 'QdTIV5Z2tNOpJrMxOAgCkNuPZT5Wrlb4GjXhPIm3aCCU', 1414747601, 38017),
(1, 'lastEditedBook', 'BjI57A993cWCaGBbr3XyE5O0hKMSQCun3PXh0W7LMJew', 1414747753, 38022),
(1, 'lastEditedBook', 'UdfVqnRdr5YPaFA3EiYcPU1plmAFny6OuGSKBtYLvyS9', 1414748254, 38025),
(1, 'lastEditedBook', 'uge2XqkXgEzVlhMMaeCpYr016uqqPHAT3GmeUuU4SgC9', 1414748377, 38027),
(1, 'lastEditedBook', 'pdXcjJLDE8iIsP4PLQQOk1LwX3ErRbuYLcIhoYCMFwnV', 1414755571, 38052),
(1, 'lastEditedBook', 'V4WoNcJdCU46gAlAK9M5dglIuPEAsyU9hNXLQ13rFmvH', 1414757312, 38072),
(1, 'lastEditedBook', 'q8RFVcqdAWWpcYIpbVI9hTkm6hM9CPsTszoyBBAiRoDO', 1414758547, 38077),
(1, 'lastEditedBook', 'YBI0Jk6SSFH0dR70zlhy5dc5IjL6k8vuwLrYVSUlvKNu', 1414758702, 38083),
(1, 'lastEditedBook', 'Jc7CiRG4spJwjo8EYbyQvxmQc5vEgYLi2gqkiteRfUM9', 1414758906, 38089),
(1, 'lastEditedBook', 'bxqQmg0Z1dCMIIQYmZn37hnXnI91geoOXPX5HY436Fw5', 1414760036, 38091),
(1, 'lastEditedBook', 'SaSi4xm7WizqqIATLyT7PjWfjzawzCXdPo9HFkGacllt', 1414760222, 38092),
(1, 'lastEditedBook', 'IWFo6Vh0YLPO542t4UcBExtlBK5ye2eSOzx1KYG3RFPs', 1414761527, 38093),
(1, 'lastEditedBook', 'OvNnRUPk9oWeQJ5VqydRe2EY6NZcHUdf65vx4qyg9muH', 1414763081, 38110),
(1, 'lastEditedBook', 'KqXwM0UjvPsLWEJqyY1SinXKCMITUsDQ8e0yAFS6Jjbg', 1414764067, 38125),
(1, 'lastEditedBook', 'QJF7Fb3FEBQx7kcGuXwcF5JNeX0putqGptgKnUCm8prV', 1414764075, 38126),
(1, 'lastEditedBook', 'fgbB06nzNnn0qbcwznSd8pRUzbKAptZJ2tOcGFIvRnDM', 1415009241, 38142),
(1, 'lastEditedBook', 'iWMlIVS8g7hYK3vMciAyQJvyITOie52lzRnGlKNvqL5r', 1415009347, 38143),
(1, 'lastEditedBook', '9CKNvQ7cHU087AZMmtTxpcNl5NdZbbaDDNxQTSIWh6Rm', 1415086733, 38153),
(1, 'lastEditedBook', 'FJzJZioAbY9mA90PgSPySt7woVNZsD5gaB4nYJpSGg8e', 1415086745, 38154),
(1, 'lastEditedBook', 't2c5kuYCymvcmTzDnUX3WISfgZrNpYkruRCVItleeWwg', 1415102886, 38167),
(1, 'lastEditedBook', 'h1gYZb6Pjp9n5XPcK7zJlfy4gqToEqe1ArQe1Ws4oxOq', 1415109304, 38175),
(1, 'lastEditedBook', 'YUqvJ018Rkz6R8L0rIKj0r7eUPKzK2Rfibwli5aZjxDB', 1415169689, 38180),
(1, 'lastEditedBook', 'tzM43oufWfUeRc0nBlXeCFtdRX6zGCWFxyTAlaMhxEsZ', 1415170788, 38183),
(1, 'lastEditedBook', '6J4DSFzP0D0tbBJPyC73IFunyVTwsLRz45f9gf7r7uTk', 1415171464, 38188),
(1, 'lastEditedBook', '91Um5ZB2uSyejsPWCqxrzCT7w2lUHelvd4z8c3OiWnYF', 1415171994, 38196),
(1, 'lastEditedBook', 'zKpco8KHAuE6RL0FXI2qHtZ2C9ZxrmPzPuCE9cti5qTj', 1415172189, 38202),
(1, 'lastEditedBook', 'qeOwfvMHGubARw5VxjyrTqBS4o3dre39ZuXERviU6dRa', 1415172237, 38205),
(1, 'lastEditedBook', 'SKQfpEPI5fZpi5WbbFuWIbNGzEW1an4W8MuMkiEtVJuo', 1415172653, 38209),
(1, 'lastEditedBook', 'si5LVldQfFTY9K4mgnCAn2nFLaug0oknBa18KfsYVqJq', 1415172851, 38224),
(1, 'lastEditedBook', 'MGYJgs62YZJibtwmhtYP9CeMfvTurohivamKNPewA3ho', 1415173089, 38238),
(1, 'lastEditedBook', 'SX7kvWYIpTcUW4BFRrV3BYZuA62LF1QkUVz71TXlYj6C', 1415174781, 38247),
(1, 'lastEditedBook', 'shcjTFn83Tywd0fsGcJJHZGNxcPCwWgmKDieJ2LBL28z', 1415177695, 38284),
(1, 'lastEditedBook', 'rt9IgBkVxqMgWnGzPN1N0OXK6rIkELB2OjKoRR2zYHSE', 1415177753, 38296),
(1, 'lastEditedBook', '6OIrIHQVX26yWkMELi666gF7WJFfX8peHbQuR05aQo0M', 1415178192, 38308),
(1, 'lastEditedBook', '6CTfKOMcSvzTEyyV3k9xac3TDYBKVpfDum0ywyOwsO5p', 1415178249, 38323),
(1, 'lastEditedBook', 'aTjgzh6GHbBnGhUWqDD1TIkZMg7uy20g36ZIRdv0IhcV', 1415178328, 38331),
(1, 'lastEditedBook', '08pRfagu6fok2F7QYBkAVY3SVzW68HJLhVb2xb4FLsg3', 1415178822, 38386),
(1, 'lastEditedBook', '2nF8LOfIQaLSvCyn5vUTIIBj4nYGNrKyphM8kigBRmNP', 1415179255, 38427),
(1, 'lastEditedBook', 'qkH8RFUtYsMlwg68V6Jv3kCBiRz77tUmtqrGQK8sFVd5', 1415180198, 38436),
(1, 'lastEditedBook', 'nqoU4AFROY3AVL46tEuarwjowHiw6kPt2uu2Uu0t4Bzv', 1415180255, 38441),
(1, 'lastEditedBook', 'ulJtRZ6FJppm5WWIKyWh9ynV6dhddUuoygIAzhIcLTvF', 1415184146, 38444),
(1, 'lastEditedBook', 'OqOUSIwS2A8N5ME6TdgDqWoHV5UVZBZRZJUcYwXBLpAH', 1415184149, 38445),
(1, 'lastEditedBook', 'lyAPuOglMqobGldoAKCfjbW7m7TZBiFQh0zLBn6QEnN9', 1415184203, 38451),
(1, 'lastEditedBook', 'hpHjl7Ap7hRA7IZcP4nxpXo18l0SmQnIlVG3LM2bzt4A', 1415189445, 38474),
(1, 'lastEditedBook', '3FBArNsV7nDQKqdh8HB39Jf9qAUyFPoPh63Hqb43mJ8E', 1415190006, 38526),
(1, 'lastEditedBook', 'SSUTBMPV09FaHUJDb8dhE7amS4hZJDAzgkDgN9reyF0L', 1415190088, 38532),
(1, 'lastEditedBook', 'Q4rnVQhTYA6IIrBTvqt7jaGJv2nJMWnE4X1IIjpG2m1r', 1415192728, 38633),
(1, 'lastEditedBook', 'ZPXIlD04WG706Oyv1y5NC33JRA3QcZFFvEcT0AzwA3rn', 1415195085, 38782),
(1, 'lastEditedBook', '9T5dA0mnziDUu2jbPc6aq3JBgAkyoFJsbu6zM4kc38S3', 1415195715, 38792),
(1, 'lastEditedBook', 'tVq5FLmMNxrLQ8bomqW8EUStAYibNOdUmR0nXbVsTiVi', 1415195733, 38793),
(1, 'lastEditedBook', '1WUWDJGtsMuYXgUcJHukchwHnVZfb0OTvYGd5hBeP6wv', 1415195869, 38798),
(1, 'lastEditedBook', 'L00DWrMXteElO8u1dqCrVD22RVeCcryQla7yJWv8vnDh', 1415195871, 38799),
(1, 'lastEditedBook', 'xboaJTDrOWOj8XT8yHbIiUrvVjRnESOrXgj5LPrG051a', 1415271351, 38806),
(1, 'lastEditedBook', 'dXIRTb0AKS3cprOycH69spZ4Sq2XOYOXWlk1Ogc7wcNU', 1415282587, 38943),
(1, 'lastEditedBook', 'cJC6ciUsLqxd2CFofgozIf7UZYbijX2MOUVpqDT6ip0j', 1415343852, 38953),
(1, 'lastEditedBook', '9MHJU3YoXjvtCLLi7i4QYasDacUx9vuiTnR1MKHLhryc', 1415344334, 38961),
(1, 'lastEditedBook', '6GsKSAFAECzGVw4odgLz1sLy8OSm02GIHvinROTh3mDL', 1415344477, 38966),
(1, 'lastEditedBook', 'LDLnvfbfsK3P07M0UvKuc4JGqGRWoQNJKTy4c55tzgr1', 1415350595, 39006),
(1, 'lastEditedBook', '65LK4gLki9OlnYYFMnT2sLsWN3jzVXPVWbleIrbtvlWn', 1415355946, 39016),
(1, 'lastEditedBook', 'H5oXT6ByN9OnCAqG5OAFHbAqeby630S3hmvmoCjkCceV', 1415358285, 39045),
(1, 'lastEditedBook', 'HM28W8qpanRwHfunlBz6y8YKu2nvtQ9Ks8i03nmtgZfH', 1415358294, 39046),
(1, 'lastEditedBook', 'TeHGqOYPkkH87sfGQ9IY6KujgAZhR5kH2W6Aa8G5aHJB', 1415358301, 39050),
(1, 'lastEditedBook', 'OEu2xU9ejkbopIaqSbOPNecFv0uzRYigNJ0MX5mtpWrT', 1415358315, 39056),
(1, 'lastEditedBook', 'TyNGeAu9TZ43SO4tDYRPzVusEiuGpW2xaK62PrQfxtU1', 1415358364, 39069),
(1, 'lastEditedBook', 'Uah6ox5g2RqRMZSCjA9cCpKCwR0KCFUNNLjeJeDLyGPy', 1415358453, 39072),
(1, 'lastEditedBook', 'XgwNwYdRdge3JYWRL8U6C2UHSPsPnT0qikvZuf1FZ7nq', 1415358463, 39074),
(1, 'lastEditedBook', 'ZMVkY2Uc8bQxnYOGZP4v2v3XD2JwwHPHqoluCr5HFc6o', 1415358466, 39077),
(1, 'lastEditedBook', 'YbhDq8Udy7IbmYpGxP0S5p6vzik72TGHl3vC6Nh3oxWH', 1415358498, 39087),
(1, 'lastEditedBook', 'a43afNmryb704feQBcv7E4fwzzpZchbysuyRrGIO4iKj', 1415358545, 39098),
(1, 'lastEditedBook', 'YoYx5hSp5sV5idFR6SIDyIpFBBC8H57z52r9h9wbtDqb', 1415358550, 39100),
(1, 'lastEditedBook', 'tScVgGpDuqeLCnecdcZnGC1qJ6mc9crDwhBudjPvHVDC', 1415358565, 39107),
(1, 'lastEditedBook', 'tf1GZoregYJL8r0vwvDqq8zIjrU31l1ruGA4BL5MqjbE', 1415358567, 39108),
(1, 'lastEditedBook', 'v1krTQhDmdRiqO5Q0rcaCOW4knKP5cwT4NtdKrvxeki3', 1415358569, 39109),
(1, 'lastEditedBook', 'xk7uUnbuPByvwUInXqlt8RpoAt1DPTYlL1ojUoaPKPV6', 1415358572, 39111),
(1, 'lastEditedBook', 'cAGix7prak8z2rjnUM5wi9sH6a7K2Zto87eYdCQr6BSr', 1415358578, 39114),
(1, 'lastEditedBook', 'fRDqRLI0Pe6TrZ0hq7bSksyUXuGotk1fjB5aq8qZa0L3', 1415358584, 39117),
(1, 'lastEditedBook', 'haEp5RJdiBfS4nYdLWZjVD29jeYYecgkWoKhaJhFYx6s', 1415358594, 39122),
(1, 'lastEditedBook', 'xYbJC9WpK4lpKKbPjjdn0BfYeGBv68uNrA95LesnOK22', 1415358775, 39144),
(1, 'lastEditedBook', 'ygcGz1T19J4onu9XNLG3JQYffVaFcIbgcdEkDCoViBPb', 1415358783, 39145),
(1, 'lastEditedBook', 'qjDbt9L5Krg0kCq7nYeKfKPRHE8jkVd6tuDe1pGGbAOi', 1415358902, 39157),
(1, 'lastEditedBook', '0UpiuZcxpgoArs15zqkZqQ02YJWR5cmO4saq6f3OSVmI', 1415360998, 39185),
(1, 'lastEditedBook', '3nunbu0xnDn3bBf4QSbjEb4uMf7s93TLyYQk3pc7aAoh', 1415361558, 39192),
(1, 'lastEditedBook', 'wZCcvf9sjtGyEAiNSCKYVq2ca4BcrlJqSou9eC33AKwm', 1415363443, 39206),
(1, 'lastEditedBook', 'Uvv6YQABpSwQ5ne4idtTBBq2Yo7HFwDm2HMEOabUhCha', 1415364635, 39223),
(1, 'lastEditedBook', 'pMS3boebZ4x0eE26P5bRuPmHT7wirG8iXl72v5nihmzv', 1415565051, 39305),
(1, 'lastEditedBook', 'V96ZYYJrRoOX2cLuxX840orDhWBwZRho1GAOlL07DxPK', 1415863735, 39311),
(1, 'lastEditedBook', 'BfD59NFcChQNLwtrfb3YvpN4uDPjJUzYy4g94tX5BBwf', 1415865663, 39330),
(1, 'lastEditedBook', '1rmoNYoa4lgTF8xdrnEnWFOPcKZSwB33IBSoX73tmAjx', 1415865697, 39339),
(1, 'lastEditedBook', 'rywrBzySYIt3TuXdzqOlupUmiwKSY8X4dKiTHAjGyZLu', 1415865704, 39340),
(1, 'lastEditedBook', 'gZcdSV3ravB2Qt9DFlAfTY5mia6MED8gt45WLhiY0cdi', 1415865970, 39347),
(1, 'lastEditedBook', '57Q1f4Oj7I6OByzdupmrruyYwYFr2LuMk5L2qGaahKjU', 1415887644, 39350),
(1, 'lastEditedBook', 'Pp9mN61le9glQAZAV4g6wzTGVaGYuzwISTarBloNjeFu', 1415887652, 39351),
(1, 'lastEditedBook', 'VYimOWcWceCnB0LDcW6KaRVE5w5tAnWY4mNH3hiNCc9p', 1415887661, 39352),
(1, 'lastEditedBook', 'j8X6yKOjO9AcXehdyykvjUQlQT3GheuAlx605SKEJoK5', 1415887672, 39353),
(1, 'lastEditedBook', 'ToPbBaLHmuOk0bFhU3Ajc8adeWbbOiB8nvKDwmsliZjH', 1415889835, 39388),
(1, 'lastEditedBook', 'jr3iVcoleR7bEJ1Iw2xeiEdDFEjZPgU1yNoJUDbjnHyS', 1415891153, 39400),
(1, 'lastEditedBook', 'GdJdKIo5g0kndvwFe2M5y0RvpiuhlRGd75Ov51rLa4O1', 1415891170, 39401),
(1, 'lastEditedBook', 'iwGCEmml3yxDxZqvNMWKSQ3End0S0uFxJHnPNJTWgfpr', 1415892093, 39416);

-- --------------------------------------------------------

--
-- Table structure for table `video_id`
--

DROP TABLE IF EXISTS `video_id`;
CREATE TABLE IF NOT EXISTS `video_id` (
  `id` varchar(44) COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `video_id`
--

INSERT INTO `video_id` (`id`, `created`) VALUES
('filehTiPefxD6wBIqQgqTwPgHRIdeUNBe27tIarqBs8W', '2014-10-21 13:05:44'),
('filey6AIMFYCXQb5MhhJAI18pWpsZgXcqfXtzX4pCGIw', '2014-10-21 13:07:52'),
('fileIvFwOwueSVsTnRiSc8caA7QFKzEw36N21zDkzdxX', '2014-10-21 13:09:45'),
('fileoi03SZX3J07erhMss8HlzCsyks62ZP45BLsS7vmD', '2014-10-21 13:19:27'),
('filezz5MUp9RB9pfHAFlckhkveIxpTM1doSYxZcfNRVG', '2014-10-21 13:28:40'),
('filezWWH6gtgsaGr2Vxp7Oo7RAO51CJRQ8BA2MSxifxB', '2014-10-21 13:43:47'),
('filew0QGjPv0s26MP2DuQdfXIpmTBWTFvRy2AwfILvPe', '2014-10-22 06:48:45'),
('fileDBHsZw2nquwL9FFKheW85RO0WKJsrDgRNS4omsNq', '2014-10-27 08:04:25'),
('fileTkN2LcKZ5CUZv17LX1ZxlcmM7tcwVdS2iSPoLHjs', '2014-11-13 14:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
CREATE TABLE IF NOT EXISTS `workspaces` (
  `workspace_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `workspace_name` text COLLATE utf8_bin NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`workspace_id`, `workspace_name`, `creation_time`) VALUES
('fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD', 'ulakbim Şablonlar', '2014-10-19 23:09:11'),
('hK9ogv9rsMd4I3Q9IaBR0irKBHcdWzpm3yOazuTp10G5', 'mahonun alanı33', '2014-10-21 11:59:53'),
('mhZYEFqUIlbrQID16LIHREXsKPbLY7K8KO45UgBDXUIq', 'Z-Kitapçılar', '2014-11-04 13:55:40'),
('yBwFA9U1KsdGXuAQO54Cskw7nVRt8NfdYlRbVxb7t8Pu', 'ulakbim', '2014-10-19 23:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `workspaces_users`
--

DROP TABLE IF EXISTS `workspaces_users`;
CREATE TABLE IF NOT EXISTS `workspaces_users` (
  `workspace_id` varchar(44) COLLATE utf8_bin NOT NULL,
  `userid` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `owner` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `workspaces_users`
--

INSERT INTO `workspaces_users` (`workspace_id`, `userid`, `added`, `owner`) VALUES
('fr3Dm8rJCmoqTmVlNxEzDp2kgYpqs58sjHtW8AXC1mnD', 1, '2014-10-19 23:09:11', '1'),
('hK9ogv9rsMd4I3Q9IaBR0irKBHcdWzpm3yOazuTp10G5', 1, '2014-10-21 11:59:53', '1'),
('mhZYEFqUIlbrQID16LIHREXsKPbLY7K8KO45UgBDXUIq', 1, '2014-11-04 13:55:40', '1'),
('yBwFA9U1KsdGXuAQO54Cskw7nVRt8NfdYlRbVxb7t8Pu', 1, '2014-10-19 23:09:11', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `workspace_owners`
--
DROP VIEW IF EXISTS `workspace_owners`;
CREATE TABLE IF NOT EXISTS `workspace_owners` (
`organisation_id` varchar(44)
,`type` varchar(12)
);
-- --------------------------------------------------------

--
-- Structure for view `account_balances`
--
DROP TABLE IF EXISTS `account_balances`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `account_balances` AS (select `transactions`.`transaction_id` AS `transaction_id`,`transactions`.`transaction_type` AS `transaction_type`,`transactions`.`transaction_method` AS `transaction_method`,`transactions`.`transaction_amount` AS `transaction_amount`,`transactions`.`transaction_unit_price` AS `transaction_unit_price`,`transactions`.`transaction_amount_equvalent` AS `transaction_amount_equvalent`,`transactions`.`transaction_currency_code` AS `transaction_currency_code`,`transactions`.`transaction_start_date` AS `transaction_start_date`,`transactions`.`transaction_end_date` AS `transaction_end_date`,`transactions`.`transaction_result` AS `transaction_result`,`transactions`.`transaction_explanation` AS `transaction_explanation`,`transactions`.`transaction_book_id` AS `transaction_book_id`,`transactions`.`transaction_host_id` AS `transaction_host_id`,`transactions`.`transaction_reader_id` AS `transaction_reader_id`,`transactions`.`transaction_user_id` AS `transaction_user_id`,`transactions`.`transaction_organisation_id` AS `transaction_organisation_id`,`transactions`.`transaction_host_ip` AS `transaction_host_ip`,`transactions`.`transaction_remote_ip` AS `transaction_remote_ip` from `transactions` where ((`transactions`.`transaction_result` = 0) and (`transactions`.`transaction_method` = 'deposit'))) union (select `transactions`.`transaction_id` AS `transaction_id`,`transactions`.`transaction_type` AS `transaction_type`,`transactions`.`transaction_method` AS `transaction_method`,`transactions`.`transaction_amount` AS `transaction_amount`,`transactions`.`transaction_unit_price` AS `transaction_unit_price`,`transactions`.`transaction_amount_equvalent` AS `transaction_amount_equvalent`,`transactions`.`transaction_currency_code` AS `transaction_currency_code`,`transactions`.`transaction_start_date` AS `transaction_start_date`,`transactions`.`transaction_end_date` AS `transaction_end_date`,`transactions`.`transaction_result` AS `transaction_result`,`transactions`.`transaction_explanation` AS `transaction_explanation`,`transactions`.`transaction_book_id` AS `transaction_book_id`,`transactions`.`transaction_host_id` AS `transaction_host_id`,`transactions`.`transaction_reader_id` AS `transaction_reader_id`,`transactions`.`transaction_user_id` AS `transaction_user_id`,`transactions`.`transaction_organisation_id` AS `transaction_organisation_id`,`transactions`.`transaction_host_ip` AS `transaction_host_ip`,`transactions`.`transaction_remote_ip` AS `transaction_remote_ip` from `transactions` where ((`transactions`.`transaction_result` = 0) and (`transactions`.`transaction_method` = 'withdrawal'))) union (select `transactions`.`transaction_id` AS `transaction_id`,`transactions`.`transaction_type` AS `transaction_type`,`transactions`.`transaction_method` AS `transaction_method`,`transactions`.`transaction_amount` AS `transaction_amount`,`transactions`.`transaction_unit_price` AS `transaction_unit_price`,`transactions`.`transaction_amount_equvalent` AS `transaction_amount_equvalent`,`transactions`.`transaction_currency_code` AS `transaction_currency_code`,`transactions`.`transaction_start_date` AS `transaction_start_date`,`transactions`.`transaction_end_date` AS `transaction_end_date`,`transactions`.`transaction_result` AS `transaction_result`,`transactions`.`transaction_explanation` AS `transaction_explanation`,`transactions`.`transaction_book_id` AS `transaction_book_id`,`transactions`.`transaction_host_id` AS `transaction_host_id`,`transactions`.`transaction_reader_id` AS `transaction_reader_id`,`transactions`.`transaction_user_id` AS `transaction_user_id`,`transactions`.`transaction_organisation_id` AS `transaction_organisation_id`,`transactions`.`transaction_host_ip` AS `transaction_host_ip`,`transactions`.`transaction_remote_ip` AS `transaction_remote_ip` from `transactions` where (`transactions`.`transaction_result` <> 0)) order by `transaction_start_date` desc;

-- --------------------------------------------------------

--
-- Structure for view `ids`
--
DROP TABLE IF EXISTS `ids`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ids` AS select `book`.`book_id` AS `id`,'book' AS `type` from `book` union select `chapter`.`chapter_id` AS `id`,'chapter' AS `type` from `chapter` union select `page`.`page_id` AS `id`,'page' AS `type` from `page` union select `component`.`id` AS `id`,'component' AS `type` from `component`;

-- --------------------------------------------------------

--
-- Structure for view `workspace_owners`
--
DROP TABLE IF EXISTS `workspace_owners`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `workspace_owners` AS select `organisations`.`organisation_id` AS `organisation_id`,'organisation' AS `type` from `organisations` union select `user`.`id` AS `id`,'user' AS `type` from `user`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`book_id`), ADD KEY `workspace_id` (`workspace_id`);

--
-- Indexes for table `book_categories`
--
ALTER TABLE `book_categories`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `book_users`
--
ALTER TABLE `book_users`
 ADD PRIMARY KEY (`user_id`,`book_id`), ADD KEY `book_users_ibfk_2` (`book_id`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
 ADD PRIMARY KEY (`chapter_id`), ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `component`
--
ALTER TABLE `component`
 ADD PRIMARY KEY (`id`), ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
 ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
 ADD PRIMARY KEY (`faq_category_id`);

--
-- Indexes for table `faq_category_faq`
--
ALTER TABLE `faq_category_faq`
 ADD PRIMARY KEY (`faq_category_id`,`faq_id`), ADD KEY `faq_id` (`faq_id`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
 ADD PRIMARY KEY (`id`), ADD KEY `inviter` (`inviter`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
 ADD PRIMARY KEY (`keyword_id`);

--
-- Indexes for table `keywords_faq`
--
ALTER TABLE `keywords_faq`
 ADD PRIMARY KEY (`keyword_id`,`faq_id`), ADD KEY `faq_id` (`faq_id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
 ADD PRIMARY KEY (`organisation_id`), ADD KEY `organisation_admin` (`organisation_admin`);

--
-- Indexes for table `organisations_meta`
--
ALTER TABLE `organisations_meta`
 ADD PRIMARY KEY (`organisation_id`,`meta`), ADD KEY `organisation_id` (`organisation_id`);

--
-- Indexes for table `organisation_hostings`
--
ALTER TABLE `organisation_hostings`
 ADD PRIMARY KEY (`hosting_client_id`), ADD KEY `hosting_client_IP` (`hosting_client_IP`,`hosting_client_port`), ADD KEY `organisation_id` (`organisation_id`);

--
-- Indexes for table `organisation_invitation`
--
ALTER TABLE `organisation_invitation`
 ADD PRIMARY KEY (`invitation_id`), ADD KEY `organisation_id` (`organisation_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `organisation_users`
--
ALTER TABLE `organisation_users`
 ADD PRIMARY KEY (`user_id`,`organisation_id`), ADD KEY `user_id` (`user_id`), ADD KEY `organisation_id` (`organisation_id`);

--
-- Indexes for table `organisation_workspaces`
--
ALTER TABLE `organisation_workspaces`
 ADD PRIMARY KEY (`organisation_id`,`workspace_id`), ADD KEY `workspace_id` (`workspace_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
 ADD PRIMARY KEY (`page_id`), ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `publish_queue`
--
ALTER TABLE `publish_queue`
 ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `readers`
--
ALTER TABLE `readers`
 ADD PRIMARY KEY (`reader_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`transaction_id`), ADD KEY `transaction_organisation_id` (`transaction_organisation_id`);

--
-- Indexes for table `transaction_offerings`
--
ALTER TABLE `transaction_offerings`
 ADD PRIMARY KEY (`packet_id`), ADD UNIQUE KEY `packet_id` (`packet_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
 ADD PRIMARY KEY (`workspace_id`), ADD KEY `workspace_id` (`workspace_id`), ADD KEY `workspace_id_2` (`workspace_id`);

--
-- Indexes for table `workspaces_users`
--
ALTER TABLE `workspaces_users`
 ADD PRIMARY KEY (`workspace_id`,`userid`), ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
MODIFY `faq_id` int(42) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `invitation`
--
ALTER TABLE `invitation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39417;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_users`
--
ALTER TABLE `book_users`
ADD CONSTRAINT `book_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `book_users_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `component`
--
ALTER TABLE `component`
ADD CONSTRAINT `component_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_category_faq`
--
ALTER TABLE `faq_category_faq`
ADD CONSTRAINT `faq_category_faq_ibfk_1` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_category` (`faq_category_id`) ON DELETE CASCADE,
ADD CONSTRAINT `faq_category_faq_ibfk_2` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`faq_id`) ON DELETE CASCADE;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`inviter`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keywords_faq`
--
ALTER TABLE `keywords_faq`
ADD CONSTRAINT `keywords_faq_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`) ON DELETE CASCADE,
ADD CONSTRAINT `keywords_faq_ibfk_2` FOREIGN KEY (`faq_id`) REFERENCES `faq` (`faq_id`) ON DELETE CASCADE;

--
-- Constraints for table `organisations`
--
ALTER TABLE `organisations`
ADD CONSTRAINT `organisations_ibfk_1` FOREIGN KEY (`organisation_admin`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisations_meta`
--
ALTER TABLE `organisations_meta`
ADD CONSTRAINT `organisations_meta_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisation_hostings`
--
ALTER TABLE `organisation_hostings`
ADD CONSTRAINT `organisation_hostings_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisation_invitation`
--
ALTER TABLE `organisation_invitation`
ADD CONSTRAINT `organisation_invitation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisation_users`
--
ALTER TABLE `organisation_users`
ADD CONSTRAINT `organisation_users_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `organisation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisation_workspaces`
--
ALTER TABLE `organisation_workspaces`
ADD CONSTRAINT `organisation_id_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `organisation_workspaces_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page`
--
ALTER TABLE `page`
ADD CONSTRAINT `page_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`transaction_organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
ADD CONSTRAINT `user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workspaces_users`
--
ALTER TABLE `workspaces_users`
ADD CONSTRAINT `workspaces_users_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `workspaces_users_ibfk_2` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
