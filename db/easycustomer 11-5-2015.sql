-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2015 at 07:36 PM
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
  `level` int(4) NOT NULL,
  `level_discount` decimal(10,2) NOT NULL,
  `reference_discount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `alias`, `level`, `level_discount`, `reference_discount`, `created_at`, `updated_at`) VALUES
(1, 'DSC', 'dsc', 5, '30.00', '500.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'MOA and AOA', NULL, 6, '11.00', '540.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Common Seal', NULL, 7, '17.00', '230.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Share book', NULL, 8, '5.50', '110.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pan` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pincode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_documents`
--

CREATE TABLE IF NOT EXISTS `customer_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `delivers`
--

CREATE TABLE IF NOT EXISTS `delivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pincode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facility` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `delivers`
--

INSERT INTO `delivers` (`id`, `pincode`, `facility`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, '123456', 'a', '9099326555', 'darshan.denz@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `facility_pincodes`
--

CREATE TABLE IF NOT EXISTS `facility_pincodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pincode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facility_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
('2015_04_27_160711_create_products_table', 6),
('2015_04_28_153033_create_product_fields_table', 7),
('2015_04_28_154417_create_product_trees_table', 8),
('2015_04_28_155039_create_orders_table', 9),
('2015_04_28_160121_create_user_discounts_table', 9),
('2015_04_28_161225_create_facility_pincodes_table', 10),
('2015_05_03_061257_create_customer_documents_table', 11),
('2015_05_03_061908_create_customers_table', 12),
('2015_05_09_090019_create_order_documents_table', 13),
('2015_05_09_120325_create_pincodes_table', 14),
('2015_05_09_122715_create_settings_table', 15),
('2015_05_09_203700_create_payments_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `product_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `invoice_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_documents`
--

CREATE TABLE IF NOT EXISTS `order_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_trees`
--

CREATE TABLE IF NOT EXISTS `order_trees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `left_child_id` int(11) NOT NULL DEFAULT '0',
  `right_child_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order_trees`
--

INSERT INTO `order_trees` (`id`, `parent_id`, `order_id`, `user_id`, `product_id`, `category_id`, `left_child_id`, `right_child_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 11, 1, 1, 0, 0, '2015-05-10 06:15:16', '2015-05-10 06:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

INSERT INTO `products` (`id`, `name`, `alias`, `category_id`, `normal_amount`, `urgent_amount`, `auto_approve`, `pincode_a_facility`, `pincode_b_facility`, `pincode_general_facility`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'DSC with Token - 1 Year', NULL, 1, '1500.00', '1600.00', 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919191', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'DSC with Token - 2 Year', NULL, 1, '2000.00', '2100.00', 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929292', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DSC without Token - 1 Year', NULL, 1, '1700.00', '1900.00', 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919193', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'DSC without Token - 2 Year', NULL, 1, '1100.00', '1300.00', 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929294', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'DSC class - 1', NULL, 1, '800.00', '850.00', 1, 'A facility', 'B facility', 'General facility', '9595959595', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'DSC class - 3', NULL, 1, '400.00', '600.00', 1, 'DSC class - 3 A', 'DSC class - 3 B', 'DSC class - 3 General', '9696969696', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'MOA and AOA (private) - 25', NULL, 2, '600.00', '500.00', 1, 'facility A', 'facility B', 'facility General', '9797979797', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'MOA and AOA (private) - 50', NULL, 2, '1600.00', '1500.00', 1, 'facility A', 'facility B', 'facility General', '9797979798', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'MOA and AOA (private) - 100', NULL, 2, '2600.00', '2500.00', 1, 'facility A', 'facility B', 'facility General', '9797979799', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'MOA and AOA (public) - 25', NULL, 2, '600.00', '500.00', 1, 'facility A', 'facility B', 'facility General', '9797979201', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'MOA and AOA (public) - 50', NULL, 2, '1600.00', '1500.00', 1, 'facility A', 'facility B', 'facility General', '9797977777', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'MOA and AOA (public) - 100', NULL, 2, '2600.00', '2500.00', 1, 'facility A', 'facility B', 'facility General', '9797979899', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Common Seal', NULL, 3, '2650.00', '2550.00', 1, 'facility A', 'facility B', 'facility General', '9797979699', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Share book (100 pages)', NULL, 4, '2350.00', '2450.00', 1, 'facility A', 'facility B', 'facility General', '9797979899', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_fields`
--

CREATE TABLE IF NOT EXISTS `product_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'deliver_default_email', 'ca.langalia@gmail.com ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'deliver_default_phone', '9099326555', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_discounts`
--

CREATE TABLE IF NOT EXISTS `user_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `total_discount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
