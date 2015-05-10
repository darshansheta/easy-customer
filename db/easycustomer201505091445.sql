-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2015 at 11:15 AM
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
  `dob` date NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pincode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `name`, `email`, `phone`, `dob`, `gender`, `address`, `city`, `state`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 1, 'Darshan', 'darshan@gmail.com', '2424234232', '0000-00-00', 'male', 'xcg', 'xcvb', 'xcvxvc', '345345', '2015-05-03 09:26:47', '2015-05-03 09:26:47'),
(2, 1, 'Darshan', 'darshan@gmail.com', '2424234232', '0000-00-00', 'female', 'bc', 'Surat', 'Gujrat', '234234', '2015-05-03 09:32:34', '2015-05-03 09:32:34'),
(3, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'asda', 'Surat', 'cbcvbcb', '234234', '2015-05-03 09:55:25', '2015-05-03 09:55:25'),
(4, 1, 'Darshan', 'darshan@gmail.com', '2424234232', '0000-00-00', 'male', 'fg', 'dsdsf', 'sdfsdf', '132123', '2015-05-03 09:59:45', '2015-05-03 09:59:45'),
(5, 1, 'sdfsf', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'dfyhf', 'dhfgh', 'dfgh', '131231', '2015-05-03 10:02:52', '2015-05-03 10:02:52'),
(6, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 11:49:50', '2015-05-06 11:49:50'),
(7, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 11:53:59', '2015-05-06 11:53:59'),
(8, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 11:55:29', '2015-05-06 11:55:29'),
(9, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 11:56:18', '2015-05-06 11:56:18'),
(10, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 11:57:23', '2015-05-06 11:57:23'),
(11, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:00:46', '2015-05-06 12:00:46'),
(12, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:01:10', '2015-05-06 12:01:10'),
(13, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:01:52', '2015-05-06 12:01:52'),
(14, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:03:24', '2015-05-06 12:03:24'),
(15, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:04:58', '2015-05-06 12:04:58'),
(16, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:05:14', '2015-05-06 12:05:14'),
(17, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:06:39', '2015-05-06 12:06:39'),
(18, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:07:07', '2015-05-06 12:07:07'),
(19, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:07:43', '2015-05-06 12:07:43'),
(20, 1, 'dfgd', 'fsdd@sdf.h', '1232322432', '0000-00-00', 'female', 'sdfd', 'df', 'dfg', '123131', '2015-05-06 12:10:40', '2015-05-06 12:10:40'),
(21, 1, 'sdfsdf', 'darshan@gmail.com', '2424234232', '0000-00-00', 'male', 'sfd', 'df', 'Gujrat', '123131', '2015-05-06 12:15:24', '2015-05-06 12:15:24'),
(22, 1, 'Darshan', 'darshan@gmail.com', '2424234232', '0000-00-00', 'male', 'vuy', 'Surat', 'Gujrat', '234234', '2015-05-06 12:19:22', '2015-05-06 12:19:22'),
(23, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:20:31', '2015-05-06 12:20:31'),
(24, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:20:57', '2015-05-06 12:20:57'),
(25, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:22:35', '2015-05-06 12:22:35'),
(26, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:23:18', '2015-05-06 12:23:18'),
(27, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:26:28', '2015-05-06 12:26:28'),
(28, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:28:15', '2015-05-06 12:28:15'),
(29, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:29:29', '2015-05-06 12:29:29'),
(30, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:30:06', '2015-05-06 12:30:06'),
(31, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:31:48', '2015-05-06 12:31:48'),
(32, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:32:18', '2015-05-06 12:32:18'),
(33, 1, 'Darshan', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'g', 'df', 'Gujrat', '123131', '2015-05-06 12:32:50', '2015-05-06 12:32:50'),
(34, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:49:13', '2015-05-08 06:49:13'),
(35, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:49:24', '2015-05-08 06:49:24'),
(36, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:49:40', '2015-05-08 06:49:40'),
(37, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:50:20', '2015-05-08 06:50:20'),
(38, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:51:16', '2015-05-08 06:51:16'),
(39, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:51:29', '2015-05-08 06:51:29'),
(40, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:51:43', '2015-05-08 06:51:43'),
(41, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:51:53', '2015-05-08 06:51:53'),
(42, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 06:54:21', '2015-05-08 06:54:21'),
(43, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:02:17', '2015-05-08 07:02:17'),
(44, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:03:33', '2015-05-08 07:03:33'),
(45, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:03:42', '2015-05-08 07:03:42'),
(46, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:03:45', '2015-05-08 07:03:45'),
(47, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:03:50', '2015-05-08 07:03:50'),
(48, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:05:52', '2015-05-08 07:05:52'),
(49, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:06:07', '2015-05-08 07:06:07'),
(50, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:08:03', '2015-05-08 07:08:03'),
(51, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:08:13', '2015-05-08 07:08:13'),
(52, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:08:46', '2015-05-08 07:08:46'),
(53, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:08:54', '2015-05-08 07:08:54'),
(54, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:09:56', '2015-05-08 07:09:56'),
(55, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:18:23', '2015-05-08 07:18:23'),
(56, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:18:35', '2015-05-08 07:18:35'),
(57, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:18:42', '2015-05-08 07:18:42'),
(58, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:18:48', '2015-05-08 07:18:48'),
(59, 1, '123rt', 'dfg@dfg.fg', '2424234232', '0000-00-00', 'male', 'sdf', 'cbvbvcb', 'Gujrat', '234234', '2015-05-08 07:21:11', '2015-05-08 07:21:11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `customer_documents`
--

INSERT INTO `customer_documents` (`id`, `user_id`, `customer_id`, `type`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'address_proof', '20150503143225_59326.png', '2015-05-03 09:02:25', '2015-05-03 09:02:25'),
(2, 1, 1, 'id_proof', '20150503144545_58373.png', '2015-05-03 09:15:45', '2015-05-03 09:26:47'),
(3, 1, 1, 'address_proof', '20150503144552_53200.jpg', '2015-05-03 09:15:52', '2015-05-03 09:26:47'),
(4, 1, 2, 'id_proof', '20150503150224_56382.jpg', '2015-05-03 09:32:24', '2015-05-03 09:32:34'),
(5, 1, 2, 'address_proof', '20150503150227_77837.jpg', '2015-05-03 09:32:27', '2015-05-03 09:32:34'),
(6, 1, 0, 'id_proof', '20150503150644_64992.jpg', '2015-05-03 09:36:44', '2015-05-03 09:36:44'),
(7, 1, 0, 'address_proof', '20150503150649_52441.jpg', '2015-05-03 09:36:49', '2015-05-03 09:36:49'),
(8, 1, 0, 'address_proof', '20150503150729_55156.jpg', '2015-05-03 09:37:29', '2015-05-03 09:37:29'),
(9, 1, 0, 'address_proof', '20150503150827_17426.jpg', '2015-05-03 09:38:27', '2015-05-03 09:38:27'),
(10, 1, 0, 'id_proof', '20150503150906_77389.jpg', '2015-05-03 09:39:06', '2015-05-03 09:39:06'),
(11, 1, 3, 'id_proof', '20150503152518_79920.jpg', '2015-05-03 09:55:18', '2015-05-03 09:55:25'),
(12, 1, 3, 'address_proof', '20150503152521_25409.jpg', '2015-05-03 09:55:21', '2015-05-03 09:55:25'),
(13, 1, 4, 'id_proof', '20150503152827_83078.jpg', '2015-05-03 09:58:27', '2015-05-03 09:59:45'),
(14, 1, 4, 'address_proof', '20150503152830_41804.jpg', '2015-05-03 09:58:30', '2015-05-03 09:59:45'),
(15, 1, 5, 'id_proof', '20150503153230_19400.jpg', '2015-05-03 10:02:30', '2015-05-03 10:02:52'),
(16, 1, 5, 'address_proof', '20150503153232_81534.jpg', '2015-05-03 10:02:32', '2015-05-03 10:02:52'),
(17, 1, 20, 'id_proof', '20150506171937_56434.jpg', '2015-05-06 11:49:37', '2015-05-06 12:10:40'),
(18, 1, 20, 'address_proof', '20150506171947_45955.jpg', '2015-05-06 11:49:47', '2015-05-06 12:10:40'),
(19, 1, 21, 'id_proof', '20150506174504_57904.jpg', '2015-05-06 12:15:04', '2015-05-06 12:15:24'),
(20, 1, 21, 'address_proof', '20150506174509_53436.jpg', '2015-05-06 12:15:09', '2015-05-06 12:15:24'),
(21, 1, 22, 'id_proof', '20150506174907_31152.jpg', '2015-05-06 12:19:07', '2015-05-06 12:19:22'),
(22, 1, 22, 'address_proof', '20150506174911_12426.jpg', '2015-05-06 12:19:11', '2015-05-06 12:19:22'),
(23, 1, 33, 'id_proof', '20150506175025_58837.jpg', '2015-05-06 12:20:25', '2015-05-06 12:32:50'),
(24, 1, 33, 'address_proof', '20150506175029_32929.jpg', '2015-05-06 12:20:29', '2015-05-06 12:32:50'),
(25, 1, 59, 'id_proof', '20150508121726_49191.jpg', '2015-05-08 06:47:26', '2015-05-08 07:21:11'),
(26, 1, 59, 'address_proof', '20150508121729_53708.jpg', '2015-05-08 06:47:29', '2015-05-08 07:21:11'),
(27, 1, 0, 'id_proof', '20150509090404_12304.jpg', '2015-05-09 03:34:04', '2015-05-09 03:34:04'),
(28, 1, 0, 'id_proof', '20150509090535_96921.jpg', '2015-05-09 03:35:35', '2015-05-09 03:35:35'),
(29, 1, 0, 'id_proof', '20150509090602_96500.jpg', '2015-05-09 03:36:02', '2015-05-09 03:36:02');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`, `os`, `os_version`, `browser`, `browser_version`) VALUES
(1, 1, '0fce6d567697307dd78c8c4ca1d248b0', '2015-04-25 14:38:17', '2015-04-28 12:39:03', 'Windows', '6.1', 'Firefox', '37.0'),
(2, 1, 'efb82969b3ae27518322c68ab5cd4c16', '2015-05-02 06:59:52', '2015-05-03 08:59:09', 'Windows', '6.1', 'Chrome', '42.0.2311.135');

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
('2015_05_09_090019_create_order_documents_table', 13);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order_documents`
--

INSERT INTO `order_documents` (`id`, `user_id`, `order_id`, `type`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'subscriber_page', '20150509090908_38858.jpg', '2015-05-09 03:39:08', '2015-05-09 03:39:08'),
(2, 1, 0, 'coi', '20150509090928_73290.jpg', '2015-05-09 03:39:28', '2015-05-09 03:39:28'),
(3, 1, 0, 'coi', '20150509090938_74986.jpg', '2015-05-09 03:39:38', '2015-05-09 03:39:38');

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
(1, 'DSC with Token - 1 Year', NULL, 1, '1500.00', '1600.00', 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919191', 'dscwithtokenoneyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'DSC with Token - 2 Year', NULL, 1, '2000.00', '2100.00', 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929292', 'dscwithtokentwoyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DSC without Token - 1 Year', NULL, 1, '1700.00', '1900.00', 1, 'Home delivery A class,\r\nCOD available A class', 'Home delivery B class,\r\nCOD available B class', 'Home delivery General class,\r\nCOD available General class,\r\nnot available', '9191919193', 'dscwithtokenoneyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'DSC without Token - 2 Year', NULL, 1, '1100.00', '1300.00', 1, 'Home delivery A class two,\r\nCOD available A class', 'Home delivery A class,\r\nCOD available A class two', 'Home delivery A class,\r\nCOD available A class Genral two', '9292929294', 'dscwithtokentwoyear@email.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'DSC class - 1', NULL, 1, '800.00', '850.00', 1, 'A facility', 'B facility', 'General facility', '9595959595', 'productfive@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'DSC class - 3', NULL, 1, '400.00', '600.00', 1, 'DSC class - 3 A', 'DSC class - 3 B', 'DSC class - 3 General', '9696969696', 'testsample@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'MOA and AOA (private) - 25', NULL, 2, '600.00', '500.00', 1, 'facility A', 'facility B', 'facility General', '9797979797', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'MOA and AOA (private) - 50', NULL, 2, '1600.00', '1500.00', 1, 'facility A', 'facility B', 'facility General', '9797979798', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'MOA and AOA (private) - 100', NULL, 2, '2600.00', '2500.00', 1, 'facility A', 'facility B', 'facility General', '9797979799', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'MOA and AOA (public) - 25', NULL, 2, '600.00', '500.00', 1, 'facility A', 'facility B', 'facility General', '9797979201', 'template@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'MOA and AOA (public) - 50', NULL, 2, '1600.00', '1500.00', 1, 'facility A', 'facility B', 'facility General', '9797977777', 'templcate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'MOA and AOA (public) - 100', NULL, 2, '2600.00', '2500.00', 1, 'facility A', 'facility B', 'facility General', '9797979899', 'templdgate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Common Seal', NULL, 3, '2650.00', '2550.00', 1, 'facility A', 'facility B', 'facility General', '9797979699', 'templdgate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Share book (100 pages)', NULL, 4, '2350.00', '2450.00', 1, 'facility A', 'facility B', 'facility General', '9797979899', 'templdgsfdsdate@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `name`, `email`, `password`, `verification_code`, `active`, `verfied`, `remember_token`, `address`, `city`, `state`, `pincode`, `phone`, `reference_user_id`, `delivery_charge`, `credit_limit`, `discount`, `created_at`, `updated_at`) VALUES
(1, 0, 'Darshan', 'darshan@gmail.com', '$2y$10$RrGBPg1y1rgaLWeCGiRTTOprkQQYbHK.o6nakeuqLIhkCUIAKa2s6', '', 1, 0, 'VuSPt2xdp8VOO5CAxM4XhtoKMpHLEMqtZ47J4VBxgNyPqhRi9JgXblRO6GtH', NULL, NULL, NULL, NULL, NULL, 0, '0.00', '0.00', '0.00', '2015-04-25 04:44:50', '2015-05-03 08:59:09'),
(2, 0, 'Darshan', 'darshan1@gmail.com', '$2y$10$URJFnTqL6ymIZ8SK56sXtuJ72wvZ7WhSEojtThxE8QfZ74FnpeWjW', '', 1, 0, NULL, '170,Harimdham', 'surat', 'gujrat', '223444', NULL, 0, '0.00', '0.00', '0.00', '2015-04-27 09:59:01', '2015-04-27 09:59:01'),
(3, 0, 'Darshan', 'darshan2@gmail.com', '$2y$10$ATqIem.5I2Fe5PaWxs6d0OVqacesdG5x4kzZj8xan794rReUH7NI6', '', 1, 0, NULL, 'dsfdfg,345', 'sdfsd', 'gujrat', '123131', NULL, 0, '0.00', '0.00', '0.00', '2015-04-27 10:15:13', '2015-04-27 10:15:13'),
(4, 0, 'Darshan', 'darshan4@gmail.com', '$2y$10$Stm6ecTa2a.XISf4oZ.DJeNJU21sv30hBfajrbWdPSKg6e1z5W.cO', '', 1, 0, NULL, 'sdf', 'surat', 'gujrat', '234232', '2423524353', 0, '0.00', '0.00', '0.00', '2015-04-27 10:15:56', '2015-04-27 10:15:56');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_discounts`
--

INSERT INTO `user_discounts` (`id`, `user_id`, `category_id`, `total_discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '280.00', '0000-00-00 00:00:00', '2015-05-08 07:21:12'),
(2, 1, 2, '100.00', '0000-00-00 00:00:00', '2015-05-05 09:46:19'),
(3, 1, 3, '100.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 4, '100.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
