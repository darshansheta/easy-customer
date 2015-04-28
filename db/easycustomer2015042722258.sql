-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2015 at 07:27 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `easycustomer`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'DSC', 'dsc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'MOA and AOA', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Common Seal', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Share book', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_tokens`
--

CREATE TABLE IF NOT EXISTS `login_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `os` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_version` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_version` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`, `os`, `os_version`, `browser`, `browser_version`) VALUES
(1, 1, '0fce6d567697307dd78c8c4ca1d248b0', '2015-04-25 14:38:17', '2015-04-26 09:48:12', 'Windows', '6.1', 'Firefox', '37.0');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_04_18_192023_create_users_table', 1),
('2015_04_18_193003_create_login_tokens_table', 2),
('2015_04_25_074655_add_two_fields_to_login_tokens_table', 3),
('2015_04_25_193331_add_two_fields_to_login_tokens_table', 4),
('2015_04_27_154751_create_categories_table', 5),
('2015_04_27_160711_create_products_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `normal_amount` decimal(10,2) NOT NULL,
  `urgent_amount` decimal(10,2) NOT NULL,
  `reference_discount` decimal(10,2) NOT NULL,
  `level_discount` decimal(10,2) NOT NULL,
  `level` int(11) NOT NULL,
  `auto_approve` tinyint(1) NOT NULL DEFAULT '1',
  `pincode_a_facility` text COLLATE utf8_unicode_ci NOT NULL,
  `pincode_b_facility` text COLLATE utf8_unicode_ci NOT NULL,
  `pincode_general_facility` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `alias`, `category_id`, `normal_amount`, `urgent_amount`, `reference_discount`, `level_discount`, `level`, `auto_approve`, `pincode_a_facility`, `pincode_b_facility`, `pincode_general_facility`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'DSC with Token - 1 Year', NULL, 1, '1500.00', '1600.00', '100.00', '20.00', 10, 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919191', 'dscwithtokenoneyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'DSC with Token - 2 Year', NULL, 1, '2000.00', '2100.00', '250.00', '35.00', 10, 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929292', 'dscwithtokentwoyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DSC without Token - 1 Year', NULL, 2, '1700.00', '1900.00', '150.00', '25.00', 6, 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919193', 'dscwithtokenoneyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'DSC without Token - 2 Year', NULL, 2, '1100.00', '1300.00', '150.00', '15.00', 10, 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929294', 'dscwithtokentwoyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'DSC class - 1', NULL, 2, '800.00', '850.00', '50.00', '10.00', 6, 1, 'A facility', 'B facility', 'General facility', '9595959595', 'productfive@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'DSC class - 3', NULL, 2, '400.00', '600.00', '50.00', '8.00', 5, 1, 'DSC class - 3 A', 'DSC class - 3 B', 'DSC class - 3 General', '9696969696', 'testsample@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'MOA and AOA (private) - 25', NULL, 3, '600.00', '500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797979797', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'MOA and AOA (private) - 50', NULL, 3, '1600.00', '1500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797979798', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'MOA and AOA (private) - 100', NULL, 3, '2600.00', '2500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797979799', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'MOA and AOA (public) - 25', NULL, 3, '600.00', '500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797979201', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'MOA and AOA (public) - 50', NULL, 3, '1600.00', '1500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797977777', 'templcate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'MOA and AOA (public) - 100', NULL, 3, '2600.00', '2500.00', '60.00', '9.00', 6, 1, 'facility A', 'facility B', 'facility General', '9797979899', 'templdgate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Common Seal', NULL, 4, '2650.00', '2550.00', '65.00', '9.00', 7, 1, 'facility A', 'facility B', 'facility General', '9797979699', 'templdgate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Share book (100 pages)', NULL, 6, '2350.00', '2450.00', '55.00', '7.00', 5, 1, 'facility A', 'facility B', 'facility General', '9797979899', 'templdgsfdsdate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `verification_code` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `verfied` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_user_id` int(11) NOT NULL DEFAULT '0',
  `delivery_charge` decimal(10,2) NOT NULL,
  `credit_limit` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `verification_code`, `active`, `verfied`, `remember_token`, `address`, `city`, `state`, `pincode`, `phone`, `reference_user_id`, `delivery_charge`, `credit_limit`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'Darshan', 'darshan@gmail.com', '$2y$10$RrGBPg1y1rgaLWeCGiRTTOprkQQYbHK.o6nakeuqLIhkCUIAKa2s6', '', 1, 0, 'carnrXIABGNkRfxWCSx6MjMcfngoTWUM2ZMfu8jioS36XIZdO6KwSIACJZ1W', NULL, NULL, NULL, NULL, NULL, 0, '0.00', '0.00', '0.00', '2015-04-25 04:44:50', '2015-04-26 09:48:12'),
(2, 'Darshan', 'darshan1@gmail.com', '$2y$10$URJFnTqL6ymIZ8SK56sXtuJ72wvZ7WhSEojtThxE8QfZ74FnpeWjW', '', 1, 0, NULL, '170,Harimdham', 'surat', 'gujrat', '223444', NULL, 0, '0.00', '0.00', '0.00', '2015-04-27 09:59:01', '2015-04-27 09:59:01'),
(3, 'Darshan', 'darshan2@gmail.com', '$2y$10$ATqIem.5I2Fe5PaWxs6d0OVqacesdG5x4kzZj8xan794rReUH7NI6', '', 1, 0, NULL, 'dsfdfg,345', 'sdfsd', 'gujrat', '123131', NULL, 0, '0.00', '0.00', '0.00', '2015-04-27 10:15:13', '2015-04-27 10:15:13'),
(4, 'Darshan', 'darshan4@gmail.com', '$2y$10$Stm6ecTa2a.XISf4oZ.DJeNJU21sv30hBfajrbWdPSKg6e1z5W.cO', '', 1, 0, NULL, 'sdf', 'surat', 'gujrat', '234232', '2423524353', 0, '0.00', '0.00', '0.00', '2015-04-27 10:15:56', '2015-04-27 10:15:56');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
