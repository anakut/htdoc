-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 13, 2020 at 05:24 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chay_laty`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `rpsale`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `rpsale`;
CREATE TABLE IF NOT EXISTS `rpsale` (
`sale_id` int(11) unsigned
,`product_id` int(11) unsigned
,`product_name` varchar(255)
,`bestprice` decimal(40,8)
,`saleprice` decimal(40,8)
,`profite` decimal(42,8)
,`discount` decimal(40,8)
,`quantity` decimal(15,4)
,`date` timestamp
,`cost` decimal(25,4)
,`price` decimal(25,4)
,`name` varchar(55)
,`product_code` varchar(55)
);

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

DROP TABLE IF EXISTS `sma_addresses`;
CREATE TABLE IF NOT EXISTS `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

DROP TABLE IF EXISTS `sma_adjustments`;
CREATE TABLE IF NOT EXISTS `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
CREATE TABLE IF NOT EXISTS `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
CREATE TABLE IF NOT EXISTS `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

DROP TABLE IF EXISTS `sma_calendar`;
CREATE TABLE IF NOT EXISTS `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

DROP TABLE IF EXISTS `sma_captcha`;
CREATE TABLE IF NOT EXISTS `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

DROP TABLE IF EXISTS `sma_categories`;
CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(101, 'ប្រេង', 'ប្រេង', NULL, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

DROP TABLE IF EXISTS `sma_combo_items`;
CREATE TABLE IF NOT EXISTS `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(1, 27, 'CE-165', '1.0000', '200.0000'),
(2, 27, 'M800', '1.0000', '300.0000'),
(3, 27, 'M150', '1.0000', '200.0000'),
(5, 29, '86787485', '1.0000', '2500.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

DROP TABLE IF EXISTS `sma_companies`;
CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `table` varchar(50) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` tinyint(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text CHARACTER SET utf8mb4,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `identity` int(55) DEFAULT '0',
  `pob` varchar(255) DEFAULT NULL,
  `swarehouse_id` int(11) DEFAULT '0',
  `salary` float(11,2) DEFAULT '0.00',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `nation` varchar(54) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `childrens` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `table`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `identity`, `pob`, `swarehouse_id`, `salary`, `order_tax_id`, `order_tax`, `total_tax`, `nation`, `position_id`, `childrens`) VALUES
(30, 3, 'table', NULL, NULL, 'តុលេខ1', 'តុលេខ1', 'walkin', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 3, 'table', NULL, NULL, 'តុលេខ2', 'តុលេខ2', 'walkin', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 3, 'table', NULL, NULL, 'តុលេខ3', 'តុលេខ3', 'walkin', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 3, 'table', NULL, NULL, 'តុលេខ4', 'តុលេខ4', 'walkin', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 3, 'table', NULL, NULL, 'អតិថិជនទូទៅ', 'អតិថិជនទូទៅ', 'អតិថិជនទូទៅ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'walkin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 3, 'table', NULL, NULL, 'តុលេខ5', 'តុលេខ5', 'តុលេខ5', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 3, 'table', NULL, NULL, 'តុលេខ6', 'តុលេខ6', 'តុលេខ6', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 3, 'table', NULL, NULL, 'តុលេខ7', 'តុលេខ7', 'តុលេខ7', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 3, 'table', NULL, NULL, 'តុលេខ8', 'តុលេខ8', 'តុលេខ8', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 3, 'table', NULL, NULL, 'A5', 'A5', 'A5', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 3, 'table', NULL, NULL, 'A6', 'A6', 'A6', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 3, 'table', NULL, NULL, 'A7', 'A7', 'A7', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 3, 'table', NULL, NULL, 'VIP 88', 'VIP 88', 'VIP 88', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 3, 'table', NULL, NULL, 'VIP 99', 'VIP 99', 'VIP 99', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 3, 'table', NULL, NULL, 'VIP 36', 'VIP 36', 'VIP 36', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 3, 'table', NULL, NULL, 'VIP 17', 'VIP 17', 'VIP 17', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 3, 'table', NULL, NULL, 'VIP 18', 'VIP 18', 'VIP 18', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 3, 'table', NULL, NULL, 'VIP 63', 'VIP 63', 'VIP 63', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 3, 'table', NULL, NULL, 'VIP 72', 'VIP 72', 'VIP 72', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 3, 'table', NULL, NULL, 'VIP A', 'VIP A', 'VIP A', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 3, 'table', NULL, NULL, 'VIP B', 'VIP B', 'VIP B', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 3, 'table', NULL, NULL, '13', '13', '13', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 3, 'table', NULL, NULL, 'ច្រក', 'ច្រក', 'ច្រក', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 3, 'table', NULL, NULL, 'VIP2', 'VIP2', 'VIP2', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 3, 'table', NULL, NULL, 'VIP1', 'VIP1', 'VIP1', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 3, 'table', NULL, NULL, 'ច្រក1', 'ច្រក1', 'ច្រក1', NULL, '', '', '', '', '', '', 'walkin@gmail.com', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 5, 'staff', NULL, NULL, 'test', '', 'test', NULL, 'pp', 'pp', 'ភ្នំពេញ', '5654', 'Country', '0969946219', 'lay_layveasnana@gmail.com', NULL, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 364451, 'test', 1, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 5, 'staff', NULL, NULL, 'sdfsdf', '', 'sdfsdf', NULL, '', '', '', '', '', '', '', NULL, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, 'sfsdf', 1, 210.00, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 5, 'staff', NULL, NULL, 'kaka sok', '', '855', NULL, '', '', '', '5654', 'Country', '0969946219', 'kaka@gmail.com', NULL, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 24584, 'kampot', 1, 500.00, NULL, NULL, NULL, 'khmer', 1, NULL),
(180, 5, 'staff', NULL, NULL, 'sdfsdf', '', 'test', NULL, '', '', '', '5654', 'Country', '', 'admin@admin.com', NULL, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 32131, 'kampot', 2, 600.00, 2, '60.0000', '60.0000', 'khmer', 1, 5),
(182, 3, 'customer', 1, 'General', 'ចែមួយ ដើមពុទ្រា', '', 'ចែមួយ ដើមពុទ្រា', '', 'ភូមិក្បាលស្ពាន សង្កាត់ប៉ោយប៉ែតក្រុងប៉ោយប៉ែតខេត្តបន្ទាយមានជ័យ', 'ក្រុងប៉ោយប៉ែត', '', '', '', '0976351134', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, '20000.0000', NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 3, 'customer', 1, 'General', 'Walkin', '', 'Walkin', '', 'Phnom Phen', 'Phnom Phen', '', '', '', '0969946219', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(192, NULL, 'biller', NULL, NULL, 'CHHAY LATY', '', 'CHHAY LATY', '', 'phnom phen', 'phnom phen', '', '', '', '011358686/069358686/060356767', 'ahchangl.gsm@gmail.com', 0, '', '', '', '', '', '', 0, 'in_head.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 4, 'supplier', NULL, NULL, 'PA PA Petrolium', '', 'PA PA Petrolium', '', '', 'phnom phen', '', '', '', '', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 3, 'customer', 1, 'General', 'ចែនាង', '', 'ចែនាង', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 4, 'supplier', NULL, NULL, 'savimec', '', 'savimec', '', '', 'កំពង់ធំ', '', '', '', '', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 4, 'supplier', NULL, NULL, 'CHHAY LATY', '', 'PA PA Petrolium', '', '', 'phnom phen', '', '', '', '', '', 0, '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
CREATE TABLE IF NOT EXISTS `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(18, '2020-07-11', 30, 36, 21, 15, '1.0000', '0.4202', '0.4200', '0.5625', '0.5600', '988.0000', 1, 0, NULL),
(19, '2020-07-12', 30, 37, 22, 15, '1.0000', '0.4202', '0.4200', '0.5625', '0.5600', '987.0000', 1, 0, NULL),
(20, '2020-07-12', 30, 38, 23, 15, '1.0000', '0.4202', '0.4200', '0.5625', '0.5600', '997.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

DROP TABLE IF EXISTS `sma_currencies`;
CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, NULL),
(3, 'REL', 'riel', '4000.0000', 0, 'r');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
CREATE TABLE IF NOT EXISTS `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10),
(5, 'ម៉ូយ', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

DROP TABLE IF EXISTS `sma_date_format`;
CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

DROP TABLE IF EXISTS `sma_deliveries`;
CREATE TABLE IF NOT EXISTS `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

DROP TABLE IF EXISTS `sma_deposits`;
CREATE TABLE IF NOT EXISTS `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deposits`
--

INSERT INTO `sma_deposits` (`id`, `date`, `company_id`, `amount`, `paid_by`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2020-06-26 23:59:00', 182, '10000.0000', '', '', 1, 0, NULL),
(2, '2020-07-11 06:41:00', 182, '10000.0000', '', '', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

DROP TABLE IF EXISTS `sma_expenses`;
CREATE TABLE IF NOT EXISTS `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

DROP TABLE IF EXISTS `sma_expense_categories`;
CREATE TABLE IF NOT EXISTS `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expent_type`
--

DROP TABLE IF EXISTS `sma_expent_type`;
CREATE TABLE IF NOT EXISTS `sma_expent_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_name` varchar(54) DEFAULT NULL,
  `expend_description` varchar(54) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expent_type`
--

INSERT INTO `sma_expent_type` (`id`, `expend_name`, `expend_description`, `date`, `reference`) VALUES
(1, 'ចំណាយបុគ្កលិក', '', '2020-06-27 16:17:00', 'EXP/2020/06/0001'),
(2, 'ចំណាយផ្សេងៗ', '', '2020-06-27 16:17:00', 'EXP/2020/06/0001'),
(3, 'ចំណាយលើឡាន', '', '2020-06-27 16:18:00', 'EXP/2020/06/0001');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gasolin_machine`
--

DROP TABLE IF EXISTS `sma_gasolin_machine`;
CREATE TABLE IF NOT EXISTS `sma_gasolin_machine` (
  `machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(55) CHARACTER SET utf8 DEFAULT NULL,
  `default_num` decimal(11,4) DEFAULT NULL,
  `note` text,
  `deleted` int(1) DEFAULT NULL,
  `gas_premium_num` decimal(11,4) DEFAULT NULL,
  `gas_gold_number` decimal(11,4) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `gold_product` int(11) DEFAULT NULL,
  `premuim_product` int(11) DEFAULT NULL,
  `gas_premium_num_2` decimal(11,4) DEFAULT NULL,
  `gas_gold_number_2` decimal(11,4) DEFAULT NULL,
  `default_num_2` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_gasolin_machine`
--

INSERT INTO `sma_gasolin_machine` (`machine_id`, `code`, `name`, `default_num`, `note`, `deleted`, `gas_premium_num`, `gas_gold_number`, `product_id`, `gold_product`, `premuim_product`, `gas_premium_num_2`, `gas_gold_number_2`, `default_num_2`) VALUES
(2, 'ទូទី១', 'ទូទី១', '300390.1200', NULL, 0, '198490.1200', '36670.4400', 30, 31, 31, '0.0000', '0.0000', '0.0000'),
(3, 'ទូទី២', 'ទូទី២', '100109.2700', NULL, 0, '168641.4800', '13917.8800', 30, 31, 31, '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

DROP TABLE IF EXISTS `sma_gift_cards`;
CREATE TABLE IF NOT EXISTS `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

DROP TABLE IF EXISTS `sma_gift_card_topups`;
CREATE TABLE IF NOT EXISTS `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

DROP TABLE IF EXISTS `sma_groups`;
CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'cashier', 'cashier'),
(7, 'stock', 'controll stock');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

DROP TABLE IF EXISTS `sma_login_attempts`;
CREATE TABLE IF NOT EXISTS `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

DROP TABLE IF EXISTS `sma_migrations`;
CREATE TABLE IF NOT EXISTS `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

DROP TABLE IF EXISTS `sma_notifications`;
CREATE TABLE IF NOT EXISTS `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-14 15:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

DROP TABLE IF EXISTS `sma_order_ref`;
CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 251, 2, 225, 5, 1055, 1, 1232, 1, 1, 1, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

DROP TABLE IF EXISTS `sma_payments`;
CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  `expend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`, `expend_id`) VALUES
(10, '2020-07-11 12:09:52', 21, NULL, NULL, 'IPAY/2020/07/1230', NULL, 'cash', '', '', '', '', '', '', '2250.0000', NULL, 1, NULL, 'received', '', '2250.0000', '0.0000', NULL, NULL),
(11, '2020-07-12 06:46:00', 21, NULL, NULL, 'IPAY/2020/07/1231', NULL, 'cash', '', '', '', '', '', 'Visa', '-2249.4375', NULL, 1, NULL, 'received', '', '-2249.4375', '0.0000', NULL, NULL),
(12, '2020-07-12 06:49:49', 22, NULL, NULL, 'IPAY/2020/07/1231', NULL, 'cash', '', '', '', '', '', '', '2250.0000', NULL, 1, NULL, 'received', '', '2250.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payment_record`
--

DROP TABLE IF EXISTS `sma_payment_record`;
CREATE TABLE IF NOT EXISTS `sma_payment_record` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount_usd` varchar(50) NOT NULL,
  `amount_r` varchar(50) NOT NULL,
  `amount_b` varchar(50) NOT NULL,
  `delete` int(10) NOT NULL,
  `billers` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payment_record`
--

INSERT INTO `sma_payment_record` (`rec_id`, `cus_id`, `date`, `amount_usd`, `amount_r`, `amount_b`, `delete`, `billers`) VALUES
(1, 182, '2020-07-11', '210', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payment_record_detail`
--

DROP TABLE IF EXISTS `sma_payment_record_detail`;
CREATE TABLE IF NOT EXISTS `sma_payment_record_detail` (
  `record_detailid` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount_usd` varchar(50) NOT NULL,
  `amount_r` varchar(50) NOT NULL,
  `amount_b` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  PRIMARY KEY (`record_detailid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payment_record_detail`
--

INSERT INTO `sma_payment_record_detail` (`record_detailid`, `rec_id`, `sale_id`, `amount_usd`, `amount_r`, `amount_b`, `payment_status`) VALUES
(1, 1, 11, '210.00', '', '', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

DROP TABLE IF EXISTS `sma_paypal`;
CREATE TABLE IF NOT EXISTS `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

DROP TABLE IF EXISTS `sma_permissions`;
CREATE TABLE IF NOT EXISTS `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `reports-profit_and_loss` tinyint(1) DEFAULT NULL,
  `reports-warehouse_chat` tinyint(1) DEFAULT NULL,
  `reports-stock_in_out_report` tinyint(1) DEFAULT NULL,
  `reports-register_report` tinyint(1) DEFAULT NULL,
  `account_receivable` tinyint(1) DEFAULT NULL,
  `account_payable` tinyint(1) DEFAULT NULL,
  `add-purchases-expenses` tinyint(1) DEFAULT NULL,
  `sum_purchases_payment` tinyint(1) DEFAULT NULL,
  `list_purchases_payment` tinyint(1) DEFAULT NULL,
  `list_staff` tinyint(1) DEFAULT NULL,
  `add_staff` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `reports-profit_and_loss`, `reports-warehouse_chat`, `reports-stock_in_out_report`, `reports-register_report`, `account_receivable`, `account_payable`, `add-purchases-expenses`, `sum_purchases_payment`, `list_purchases_payment`, `list_staff`, `add_staff`) VALUES
(1, 5, 1, NULL, 1, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 6, 1, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_position`
--

DROP TABLE IF EXISTS `sma_position`;
CREATE TABLE IF NOT EXISTS `sma_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) DEFAULT NULL,
  `position_level` varchar(45) DEFAULT NULL,
  `position_rate` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_position`
--

INSERT INTO `sma_position` (`id`, `position_name`, `position_level`, `position_rate`) VALUES
(1, 'Manager', NULL, NULL),
(2, 'Sale', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

DROP TABLE IF EXISTS `sma_pos_register`;
CREATE TABLE IF NOT EXISTS `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2020-07-10 09:43:08', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

DROP TABLE IF EXISTS `sma_pos_settings`;
CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.2.2',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 36, 98, 34, 192, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, NULL, 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.2.2', 0, 0, 0, '', 1, NULL, 'null', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

DROP TABLE IF EXISTS `sma_price_groups`;
CREATE TABLE IF NOT EXISTS `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

DROP TABLE IF EXISTS `sma_printers`;
CREATE TABLE IF NOT EXISTS `sma_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

DROP TABLE IF EXISTS `sma_products`;
CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `rank`, `warehouse_id`) VALUES
(30, '68744471', 'ម៉ាស៊ូត', 6, '0.0000', '2250.0000', '0.0000', 'no_image.png', 101, NULL, '', '', '', '', '', '', '997.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, '0', NULL, '0.0000', NULL, 0),
(31, '86787485', 'សាំង', 9, '2000.0000', '2500.0000', '0.0000', 'no_image.png', 101, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 9, 9, 0, '0', NULL, '0.0000', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

DROP TABLE IF EXISTS `sma_product_photos`;
CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_price`
--

DROP TABLE IF EXISTS `sma_product_price`;
CREATE TABLE IF NOT EXISTS `sma_product_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(11,4) DEFAULT NULL,
  `discount` varchar(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

DROP TABLE IF EXISTS `sma_product_prices`;
CREATE TABLE IF NOT EXISTS `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

DROP TABLE IF EXISTS `sma_product_variants`;
CREATE TABLE IF NOT EXISTS `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

DROP TABLE IF EXISTS `sma_purchases`;
CREATE TABLE IF NOT EXISTS `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `reference` varchar(255) DEFAULT NULL,
  `exType_id` int(11) DEFAULT NULL,
  `abroad_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `abroad_shipping` decimal(25,4) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `reference`, `exType_id`, `abroad_date`, `abroad_shipping`, `staff_id`) VALUES
(14, 'PO/2020/07/0224', '2020-07-11 07:03:00', 198, 'PA PA Petrolium', 1, '', '420.1681', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '420.1681', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, '2020-07-11 07:03:55', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

DROP TABLE IF EXISTS `sma_purchase_items`;
CREATE TABLE IF NOT EXISTS `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `product_unit_in` varchar(255) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `stockout_id` int(11) DEFAULT '0',
  `price_perton` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `product_unit_in`, `unit_quantity`, `stockout_id`, `price_perton`) VALUES
(15, 14, NULL, 30, '68744471', 'ម៉ាស៊ូត', NULL, '0.4202', '1000.0000', 1, '0.0000', NULL, '', NULL, '0.0000', NULL, '420.1700', '997.0000', '2020-07-11', 'received', '0.4200', '0.4202', '1000.0000', NULL, NULL, 6, 'លីត្រ​(ម៉ា', 'តោន(ម៉ាស៉ូត)', '1000.0000', 0, '500.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_receive`
--

DROP TABLE IF EXISTS `sma_purchase_receive`;
CREATE TABLE IF NOT EXISTS `sma_purchase_receive` (
  `receive_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ref_no` varchar(45) DEFAULT NULL,
  `by` varchar(45) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `receive_no` varchar(45) DEFAULT NULL,
  `invoice_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`receive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_receive`
--

INSERT INTO `sma_purchase_receive` (`receive_id`, `purchase_id`, `receive_date`, `ref_no`, `by`, `no`, `receive_no`, `invoice_no`) VALUES
(1, 1, '2019-03-23 09:22:00', 'PO/2019/03/0171', 'owner', 1, 'RC201903-0001', ''),
(2, 2, '2019-03-23 09:24:00', 'PO/2019/03/0172', 'owner', 2, 'RC201903-0002', ''),
(3, 3, '2019-06-03 11:30:00', 'PO/2019/06/0173', 'owner', 3, 'RC201906-0003', ''),
(4, 4, '2020-06-27 15:49:00', 'PO/2020/06/0174', 'owner', 4, 'RC202006-0004', ''),
(5, 4, '2020-06-27 15:51:00', 'PO/2020/06/0174', 'owner', 5, 'RC202006-0005', ''),
(6, 7, '2020-06-28 09:45:00', 'PO/2020/06/0175', 'mavuthy', 6, 'RC202006-0006', ''),
(7, 8, '2020-07-03 08:53:00', 'PO/2020/07/0176', 'owner', 7, 'RC202007-0007', ''),
(8, 1, '2020-07-10 09:06:00', 'PO/2020/07/0183', 'owner', 8, 'RC202007-0008', '2132143'),
(9, 4, '2020-07-10 12:43:00', 'PO/2020/07/0186', 'owner', 9, 'RC202007-0009', '2132143'),
(10, 6, '2020-07-10 12:46:00', 'PO/2020/07/0188', 'owner', 10, 'RC202007-0010', '12345'),
(11, 7, '2020-07-10 12:54:00', 'PO/2020/07/0189', 'owner', 11, 'RC202007-0011', '121'),
(12, 4, '2020-07-10 12:56:00', '55555555', 'owner', 12, 'RC202007-0012', '12'),
(13, 8, '2020-07-10 12:58:00', 'PO/2020/07/0190', 'owner', 13, 'RC202007-0013', '121'),
(14, 9, '2020-07-10 13:11:00', 'PO/2020/07/0191', 'owner', 14, 'RC202007-0014', '2132143'),
(15, 10, '2020-07-10 13:24:00', 'PO/2020/07/0192', 'owner', 15, 'RC202007-0015', '2143'),
(16, 11, '2020-07-10 13:27:00', 'PO/2020/07/0193', 'owner', 16, 'RC202007-0016', '2143'),
(17, 1, '2020-07-10 13:35:00', 'PO/2020/07/0194', 'owner', 17, 'RC202007-0017', '2132143'),
(18, 2, '2020-07-10 13:38:00', 'PO/2020/07/0195', 'owner', 18, 'RC202007-0018', '214323'),
(19, 3, '2020-07-10 13:42:00', 'PO/2020/07/0196', 'owner', 19, 'RC202007-0019', '121'),
(20, 4, '2020-07-10 13:52:00', 'PO/2020/07/0197', 'owner', 20, 'RC202007-0020', '2132143'),
(21, 5, '2020-07-10 13:53:00', 'PO/2020/07/0198', 'owner', 21, 'RC202007-0021', '121'),
(22, 9, '2020-07-10 14:35:00', 'PO/2020/07/0202', 'owner', 22, 'RC202007-0022', '2132143'),
(23, 8, '2020-07-10 14:35:00', 'PO/2020/07/0201', 'owner', 23, 'RC202007-0023', '214323'),
(24, 10, '2020-07-10 14:38:00', 'PO/2020/07/0203', 'owner', 24, 'RC202007-0024', '2132143'),
(25, 11, '2020-07-10 14:40:00', 'PO/2020/07/0204', 'owner', 25, 'RC202007-0025', '214323'),
(26, 12, '2020-07-10 14:44:00', 'PO/2020/07/0205', 'owner', 26, 'RC202007-0026', '3'),
(27, 13, '2020-07-10 14:49:00', 'PO/2020/07/0206', 'owner', 27, 'RC202007-0027', '121'),
(28, 16, '2020-07-10 15:07:00', 'PO/2020/07/0209', 'owner', 28, 'RC202007-0028', '2132143'),
(29, 1, '2020-07-10 15:11:00', 'PO/2020/07/0210', 'owner', 29, 'RC202007-0029', '2132143'),
(30, 4, '2020-07-10 15:26:00', 'PO/2020/07/0214', 'owner', 30, 'RC202007-0030', '2132143'),
(31, 5, '2020-07-10 15:28:00', 'PO/2020/07/0215', 'owner', 31, 'RC202007-0031', '2143');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_receive_item`
--

DROP TABLE IF EXISTS `sma_purchase_receive_item`;
CREATE TABLE IF NOT EXISTS `sma_purchase_receive_item` (
  `receive_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` decimal(11,4) DEFAULT '0.0000',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cost` decimal(11,4) DEFAULT NULL,
  `purchase_itemid` int(11) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `not_include` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `adjust_id` int(11) DEFAULT NULL,
  `old_stock` decimal(11,4) DEFAULT NULL,
  `internal_usage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`receive_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_receive_item`
--

INSERT INTO `sma_purchase_receive_item` (`receive_item_id`, `receive_id`, `item_id`, `quantity`, `date`, `cost`, `purchase_itemid`, `trans_date`, `not_include`, `warehouse_id`, `transfer_id`, `adjust_id`, `old_stock`, `internal_usage_id`) VALUES
(1, 1, 26, '10.0000', '2019-03-23 09:22:00', '0.0000', 26, '2019-03-23 09:22:39', NULL, 1, NULL, NULL, NULL, NULL),
(2, 2, 26, '5.0000', '2019-03-23 09:24:00', '0.0000', 27, '2019-03-23 09:24:22', NULL, 1, NULL, NULL, '10.0000', NULL),
(3, 3, 28, '1000.0000', '2019-06-03 11:30:00', '0.0000', 28, '2019-06-03 11:30:13', NULL, 1, NULL, NULL, NULL, NULL),
(4, 3, 29, '1000.0000', '2019-06-03 11:30:00', '0.0000', 29, '2019-06-03 11:30:13', NULL, 1, NULL, NULL, NULL, NULL),
(5, 3, 30, '1000.0000', '2019-06-03 11:30:00', '0.0000', 30, '2019-06-03 11:30:13', NULL, 1, NULL, NULL, NULL, NULL),
(6, 4, 31, '16000.0000', '2020-06-27 15:49:00', '0.0000', 32, '2020-06-27 15:50:21', NULL, 1, NULL, NULL, '0.0000', NULL),
(7, 4, 30, '15000.0000', '2020-06-27 15:49:00', '0.0000', 33, '2020-06-27 15:50:21', NULL, 1, NULL, NULL, '-300.0000', NULL),
(8, 5, 30, '17000.0000', '2020-06-27 15:51:00', '0.0000', 33, '2020-06-27 15:51:28', NULL, 1, NULL, NULL, '14700.0000', NULL),
(9, 6, 30, '10000.0000', '2020-06-28 09:45:00', '0.0000', 34, '2020-06-28 09:45:32', NULL, 1, NULL, NULL, '-4317.0000', NULL),
(10, 6, 31, '10000.0000', '2020-06-28 09:45:00', '0.0000', 35, '2020-06-28 09:45:32', NULL, 1, NULL, NULL, '-4132.0000', NULL),
(11, 7, 30, '3000.0000', '2020-07-03 08:53:00', '0.0000', 37, '2020-07-03 08:53:49', NULL, 1, NULL, NULL, '5575.0000', NULL),
(12, 8, 31, '2000.0000', '2020-07-10 09:06:00', '0.0000', 1, '2020-07-10 09:06:52', NULL, 1, NULL, NULL, '0.0000', NULL),
(13, 10, 31, '10000.0000', '2020-07-10 12:46:00', '0.0000', 6, '2020-07-10 12:46:12', NULL, 1, NULL, NULL, '0.0000', NULL),
(14, 13, 31, '1000.0000', '2020-07-10 12:58:00', '0.0000', 8, '2020-07-10 12:58:27', NULL, 1, NULL, NULL, '0.0000', NULL),
(15, 14, 31, '1000.0000', '2020-07-10 13:11:00', '0.0000', 9, '2020-07-10 13:11:43', NULL, 1, NULL, NULL, '0.0000', NULL),
(16, 15, 31, '10000.0000', '2020-07-10 13:24:00', '0.0000', 10, '2020-07-10 13:24:20', NULL, 1, NULL, NULL, '0.0000', NULL),
(17, 16, 31, '1000.0000', '2020-07-10 13:27:00', '0.0000', 11, '2020-07-10 13:27:39', NULL, 1, NULL, NULL, '0.0000', NULL),
(18, 18, 31, '1000.0000', '2020-07-10 13:38:00', '0.0000', 2, '2020-07-10 13:38:34', NULL, 1, NULL, NULL, '0.0000', NULL),
(19, 18, 30, '1000.0000', '2020-07-10 13:38:00', '0.0000', 3, '2020-07-10 13:38:34', NULL, 1, NULL, NULL, '0.0000', NULL),
(20, 19, 31, '1000.0000', '2020-07-10 13:42:00', '0.0000', 4, '2020-07-10 13:42:31', NULL, 1, NULL, NULL, '0.0000', NULL),
(21, 21, 31, '1000.0000', '2020-07-10 13:53:00', '0.0000', 6, '2020-07-10 13:53:55', NULL, 1, NULL, NULL, '990.0000', NULL),
(22, 22, 31, '9000.0000', '2020-07-10 14:35:00', '0.0000', 10, '2020-07-10 14:35:44', NULL, 1, NULL, NULL, '0.0000', NULL),
(23, 25, 31, '9000.0000', '2020-07-10 14:40:00', '0.0000', 12, '2020-07-10 14:40:55', NULL, 1, NULL, NULL, '0.0000', NULL),
(24, 26, 31, '1000.0000', '2020-07-10 14:44:00', '0.0000', 13, '2020-07-10 14:44:58', NULL, 1, NULL, NULL, '0.0000', NULL),
(25, 27, 31, '1000.0000', '2020-07-10 14:49:00', '0.0000', 14, '2020-07-10 14:49:50', NULL, 1, NULL, NULL, '0.0000', NULL),
(26, 28, 31, '1000.0000', '2020-07-10 15:07:00', '0.0000', 17, '2020-07-10 15:07:39', NULL, 1, NULL, NULL, '0.0000', NULL),
(27, 29, 31, '1388000.0000', '2020-07-10 15:11:00', '0.0000', 1, '2020-07-10 15:11:19', NULL, 1, NULL, NULL, '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

DROP TABLE IF EXISTS `sma_quotes`;
CREATE TABLE IF NOT EXISTS `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

DROP TABLE IF EXISTS `sma_quote_items`;
CREATE TABLE IF NOT EXISTS `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `pay_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `statement_status` varchar(20) DEFAULT '',
  `gas_sale` int(11) DEFAULT '0',
  `d_old` decimal(11,2) DEFAULT NULL,
  `g_old` decimal(11,2) DEFAULT NULL,
  `p_old` decimal(11,2) DEFAULT NULL,
  `g_new` decimal(11,2) DEFAULT NULL,
  `p_new` decimal(11,2) DEFAULT NULL,
  `d_new` decimal(11,2) DEFAULT NULL,
  `sold_by` varchar(55) DEFAULT NULL,
  `d_old_2` decimal(11,2) DEFAULT NULL,
  `g_old_2` decimal(11,2) DEFAULT NULL,
  `p_old_2` decimal(11,2) DEFAULT NULL,
  `d_new_2` decimal(11,2) DEFAULT NULL,
  `g_new_2` decimal(11,2) DEFAULT NULL,
  `p_new_2` decimal(11,2) DEFAULT NULL,
  `shift` varchar(55) DEFAULT NULL,
  `actual_amount` decimal(25,4) DEFAULT NULL,
  `difference` decimal(25,4) DEFAULT NULL,
  `clearance` decimal(25,4) DEFAULT NULL,
  `due_record` int(1) DEFAULT '0',
  `due_amount` decimal(11,4) NOT NULL,
  `rate` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `pay_date`, `statement_status`, `gas_sale`, `d_old`, `g_old`, `p_old`, `g_new`, `p_new`, `d_new`, `sold_by`, `d_old_2`, `g_old_2`, `p_old_2`, `d_new_2`, `g_new_2`, `p_new_2`, `shift`, `actual_amount`, `difference`, `clearance`, `due_record`, `due_amount`, `rate`) VALUES
(14, '2020-07-11 11:17:00', '2020/07/0249', 189, 'Walkin', 4, '855SOLUTION', 2, '', '0', '18.1300', '0.0000', '0', '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '18.1250', 'pending', 'due', 0, '2020-07-11', NULL, NULL, NULL, 30, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, 'Morning', NULL, NULL, NULL, 1, '0.0000', '4000.0000'),
(15, '2020-07-11 11:24:00', '2020/07/0250', 182, 'ចែមួយ ដើមពុទ្រា', 4, '855SOLUTION', 2, '', '0', '18.1300', '0.0000', '0', '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '18.1250', 'pending', 'due', 0, '2020-07-11', NULL, NULL, NULL, 30, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', NULL, NULL, NULL, NULL, NULL, NULL, 'Morning', NULL, NULL, NULL, 1, '0.0000', '4000.0000'),
(21, '2020-07-11 12:09:52', '/POS/2020/07/1052', 34, 'អតិថិជនទូទៅ', 192, 'CHHAY LATY', 1, 'nullPay US&equals;2250&comma; Pay riels&equals;', '', '0.5625', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.5625', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '0.5625', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'c578238e4aac67ce402dcd5d094f2ac00815187c290ef8e7dceb850502721353', '2020-07-12 06:46:41', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0.0000', '4000.0000'),
(22, '2020-07-12 06:49:49', '/POS/2020/07/1053', 34, 'អតិថិជនទូទៅ', 192, 'CHHAY LATY', 1, 'nullPay US&equals;2250&comma; Pay riels&equals;', '', '0.5625', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.5625', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '0.5625', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '5349f4f3acd174dcc2e5d820f378ce7fb9fe4630b35a98103462ffbd69aa8ad6', '2020-07-12 06:49:49', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0.0000', '4000.0000'),
(23, '2020-07-12 06:56:18', '/POS/2020/07/1054', 34, 'អតិថិជនទូទៅ', 192, 'CHHAY LATY', 1, 'nullPay US&equals;&comma; Pay riels&equals;', '', '0.5625', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.5625', 'completed', 'due', 0, NULL, 1, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '7362c7cc9d61e50101863bf14d653cc662cd87359c07e16ef5d48e580ad8e415', NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0.0000', '4000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

DROP TABLE IF EXISTS `sma_sale_items`;
CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `sdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `invoice_dis` varchar(54) DEFAULT NULL,
  `item_invoice_dis` decimal(55,4) DEFAULT NULL,
  `engine_front` int(1) DEFAULT '0',
  `gas_type` varchar(1) DEFAULT NULL,
  `sale_unit` varchar(255) DEFAULT NULL,
  `rate` decimal(22,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `pay_date`, `sdate`, `invoice_dis`, `item_invoice_dis`, `engine_front`, `gas_type`, `sale_unit`, `rate`) VALUES
(19, 14, 30, '68744471', 'ម៉ាស៊ូត', 'standard', 0, '0.5625', '0.5625', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '5.6300', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'D', NULL, NULL),
(20, 14, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '6.2500', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'P', NULL, NULL),
(21, 14, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '6.2500', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'G', NULL, NULL),
(22, 14, 30, '68744471', 'ម៉ាស៊ូត', 'standard', 0, '0.5625', '0.5625', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'D', NULL, NULL),
(23, 14, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'P', NULL, NULL),
(24, 14, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'G', NULL, NULL),
(25, 15, 30, '68744471', 'ម៉ាស៊ូត', 'standard', 0, '0.5625', '0.5625', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '5.6300', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'D', NULL, '4000.0000'),
(26, 15, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '6.2500', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'P', NULL, '4000.0000'),
(27, 15, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '10.0000', 2, '0.0000', 0, '0', '0', '0.0000', '6.2500', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '10.0000', NULL, NULL, NULL, NULL, NULL, 1, 'G', NULL, '4000.0000'),
(28, 15, 30, '68744471', 'ម៉ាស៊ូត', 'standard', 0, '0.5625', '0.5625', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'D', NULL, '4000.0000'),
(29, 15, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'P', NULL, '4000.0000'),
(30, 15, 31, '86787485', 'សាំង', 'standard', 0, '0.6250', '0.6250', '0.0000', 2, '0.0000', 0, '0', '0', '0.0000', '0.0000', '0', '0.0000', NULL, 6, 'លីត្រ​(ម៉ា', '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 'G', NULL, '4000.0000'),
(36, 21, 30, '68744471', 'ម៉ាស៊ូត', 'standard', NULL, '0.5625', '0.5600', '1.0000', 1, '0.0000', NULL, '', NULL, '0.0000', '0.5600', '', '0.5625', NULL, 6, 'លីត្រ​(ម៉ា', '1.0000', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, '4000.0000'),
(37, 22, 30, '68744471', 'ម៉ាស៊ូត', 'standard', NULL, '0.5625', '0.5600', '1.0000', 1, '0.0000', NULL, '', NULL, '0.0000', '0.5600', '', '0.5625', NULL, 6, 'លីត្រ​(ម៉ា', '1.0000', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, '4000.0000'),
(38, 23, 30, '68744471', 'ម៉ាស៊ូត', 'standard', NULL, '0.5625', '0.5600', '1.0000', 1, '0.0000', NULL, '', NULL, '0.0000', '0.5600', '', '0.5625', NULL, 6, 'លីត្រ​(ម៉ា', '1.0000', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, '4000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
CREATE TABLE IF NOT EXISTS `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0s50r5f8v32u6tlq8euivtucqce3tbjr', '::1', 1594468040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436373739333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436383034303b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b72656d6f76655f706f736c737c693a313b),
('0triiqprb0ngepei851heja0d9oaobmg', '::1', 1594463430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436333337313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333338363b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('1rt2tujrnvqv5to8rp36gs2e3latvfuo', '::1', 1594538509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533373531383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343530323530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343533383530393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('2mgqjhnm7ev443e08oi264sqcn1qcme6', '::1', 1594462218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436323035373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343435303730323b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b),
('5f8f34ej90nmritd2bhpedqn9sqa7rqk', '::1', 1594464980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436343836313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('6nh0d8e51ru0e6bco2msr0v2o4d11v2n', '::1', 1594468776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436383438313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436383737363b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('6v6sm9rul5ae62jl9ebgc5a6t12iuvt2', '::1', 1594536259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533363235393b),
('8dcdn1bt3urd9qdnphi606h62ouo67aa', '::1', 1594462555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436323533373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436323535343b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('98ogaaqla8tem3f6v25t5dieen3951hp', '::1', 1594466943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436363634383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('99cv9qgh3ube1isb4aviqfqu1kjalea9', '::1', 1594464775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436343531363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('bi9cv53853jahququ5npbm0409uh1gim', '::1', 1594536401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533363235393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343530323530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343533363430313b),
('c0i0jfu4dpudteqnr7i2tckgvku7h3s4', '::1', 1594467164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436373030363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('doqmuh7086k9qqblst3jq1k9i2anh03p', '::1', 1594536877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533363537373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343530323530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343533363837373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('e88bhhd99j92attuj48usoe8b33kakos', '::1', 1594617219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343631373139303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934353336323937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2275306c534c6b47526d36376a33584846506f4931223b),
('h9okj0hk0s261bi6gs9qjl5fl1aead2d', '::1', 1594464217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436333932373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('le34a36oa6mmvnauitthc9enl97h7ffk', '::1', 1594537480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533373230393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343530323530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343533373335303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('m55dtigev90d5erunrsoep8lnlrptqmm', '::1', 1594617190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343631373139303b),
('m7iaiflr5o2kfmk70mluu4me2tro2klh', '::1', 1594547250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343534373234393b7265717565737465645f706167657c733a31353a2261646d696e2f706f732f73616c6573223b),
('nk5g9cpnmi3852915ag738bi6o61r3li', '::1', 1594467706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436373431303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436373730363b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('ogneufk7nmcfflkqvuu8rmkmqhlhshh8', '::1', 1594468392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436383131353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436383339323b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b72656d6f76655f706f736c737c693a313b),
('padb42k4j68afnb6d2rv05sflk1vgijs', '::1', 1594469065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436383739343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436393036353b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('r0u49dflqda2h82o2minti47dio3l8p1', '::1', 1594469407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436393133393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436393430373b757365725f637372667c733a32303a22676432797536464d4c45424f734b6f5770683849223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('ttvmnobu62cin7gu0ffh01toaslvugpa', '::1', 1594537187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343533363838383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343530323530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343533373138373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b72656d6f76655f706f736c737c693a313b),
('vj77iijkioj4840j23g7ju1coin27e7l', '::1', 1594466264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436353335313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b),
('vrj9dbghrr5bt6ft6ki8543so6i88esu', '::1', 1594466503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436363237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343439333839223b6c6173745f69707c733a31323a223139322e3136382e312e3131223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313539343436333932373b757365725f637372667c733a32303a226a727879663569307370636738596c566b77574b223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d30372d31302031363a34333a3038223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`) VALUES
(1, 'logo9.png', 'header_logo1.png', 'CHHAY LATY', 'english', 1, 0, 'USD', 0, 100, '3.2.3', 1, 5, '', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 1, 'default', 0, 1, 0, 1, 0, 1, 0, 1, 0, 'Asia/Phnom_Penh', 800, 800, 150, 150, 0, NULL, NULL, NULL, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 0, 0, 2, 0, 0, 0, 2, 2, '.', ',', 0, 192, 'ryrun168', 'aec99605-5703-48fb-a0cc-8a55aded76f2', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

DROP TABLE IF EXISTS `sma_skrill`;
CREATE TABLE IF NOT EXISTS `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

DROP TABLE IF EXISTS `sma_stock_counts`;
CREATE TABLE IF NOT EXISTS `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

DROP TABLE IF EXISTS `sma_stock_count_items`;
CREATE TABLE IF NOT EXISTS `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_subcategories`
--

DROP TABLE IF EXISTS `sma_subcategories`;
CREATE TABLE IF NOT EXISTS `sma_subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

DROP TABLE IF EXISTS `sma_suspended_bills`;
CREATE TABLE IF NOT EXISTS `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

DROP TABLE IF EXISTS `sma_suspended_items`;
CREATE TABLE IF NOT EXISTS `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_table`
--

DROP TABLE IF EXISTS `sma_table`;
CREATE TABLE IF NOT EXISTS `sma_table` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

DROP TABLE IF EXISTS `sma_tax_rates`;
CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

DROP TABLE IF EXISTS `sma_transfers`;
CREATE TABLE IF NOT EXISTS `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

DROP TABLE IF EXISTS `sma_transfer_items`;
CREATE TABLE IF NOT EXISTS `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

DROP TABLE IF EXISTS `sma_units`;
CREATE TABLE IF NOT EXISTS `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  `is_tons` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`, `is_tons`) VALUES
(6, 'លីត្រ​(ម៉ាស៉ូត)', 'លីត្រ​(ម៉ាស៉ូត)', NULL, NULL, NULL, NULL, 0),
(8, 'តោន(ម៉ាស៉ូត)', 'តោន(ម៉ាស៉ូត)', 6, '*', NULL, '1190', 1),
(9, 'លិត្រ(សាំង)', 'លិត្រ(សាំង)', NULL, NULL, NULL, NULL, 0),
(10, 'តោន(តោនសាំង)', 'តោន(តោនសាំង)', 9, '*', NULL, '1390', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
CREATE TABLE IF NOT EXISTS `sma_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  `print_invoice` tinyint(1) DEFAULT NULL,
  `print_receipt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`, `print_invoice`, `print_receipt`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '586a1fba89145e289a7b5a6c58c086ff2616b700', NULL, 'admin@855solution.com', NULL, NULL, NULL, 'e7fa1bce74f667d7c792ab92ec868bba6c3b69fb', 1351661704, 1594617198, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(2, 0x3139322e3136382e312e3135, 0x3139322e3136382e312e313237, 'mavuthy', '8f1794ac35ca4b3c48b2a07abed5eeb8c6d70506', NULL, 'ma.vuthy.doe@moeys.gov.kh', NULL, NULL, NULL, NULL, 1593252511, 1593309807, 1, 'Ma Vuthy', 'Ma Vuthy', 'CHHAY LATY', '095 27 27 53', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, NULL),
(3, NULL, 0x3139322e3136382e312e313237, 'tongyi', '818b0d431c40fc7f8ae729018e5f6a9a4ec9813b', NULL, 'tongyi@gmail.com', NULL, NULL, NULL, NULL, 1593312358, 1593312358, 1, 'Tong Yi', 'Tong Yi', 'CHHAY LATY', '011595656', NULL, 'female', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, NULL),
(4, NULL, 0x3139322e3136382e312e313237, 'chanrith', 'a20353045d3af53afe4568eba3843427437475aa', NULL, 'sochanrith@gmail.com', NULL, NULL, NULL, NULL, 1593312474, 1593312474, 1, 'So chanrith', 'So chanrith', 'CHHAY LATY', '017 42 63 64', NULL, 'male', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, NULL),
(5, NULL, 0x3139322e3136382e312e313237, 'limkhun', 'bbf59ee6014690dd609b714a4be0aa715667bdcf', NULL, 'solimkhun@gmail.com', NULL, NULL, NULL, NULL, 1593312645, 1593312645, 1, 'So Limkhun', 'So Limkhun', 'CHHAY LATY', '077 90 90 43', NULL, 'male', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, NULL),
(6, 0x3a3a31, 0x3a3a31, 'admin1', '17ff2b395eafe96edb6543ff85f1bad54dd62696', NULL, 'luckyluchloy@yahoo.com', NULL, NULL, NULL, NULL, 1594107148, 1594107289, 1, 'luch', 'luch', 'Tab Luch', '35835035345345435435', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

DROP TABLE IF EXISTS `sma_user_logins`;
CREATE TABLE IF NOT EXISTS `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-22 08:04:40'),
(2, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-22 19:12:23'),
(3, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-24 01:19:09'),
(4, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-24 17:53:40'),
(5, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-24 21:03:51'),
(6, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-04-09 03:53:37'),
(7, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-23 20:19:55'),
(8, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-27 19:57:37'),
(9, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-02 08:35:35'),
(10, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-02 19:23:59'),
(11, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-03 20:58:16'),
(12, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-26 23:55:14'),
(13, 1, NULL, 0x3139322e3136382e312e313237, 'admin@855solution.com', '2020-06-27 00:14:48'),
(14, 1, NULL, 0x3139322e3136382e312e313237, 'admin@855solution.com', '2020-06-27 01:31:10'),
(15, 1, NULL, 0x3139322e3136382e312e313237, 'admin@855solution.com', '2020-06-27 02:12:26'),
(16, 2, NULL, 0x3139322e3136382e312e313237, 'Mavuthy', '2020-06-27 03:09:06'),
(17, 2, NULL, 0x3139322e3136382e312e313237, 'Mavuthy', '2020-06-27 03:11:43'),
(18, 2, NULL, 0x3139322e3136382e312e313237, 'Mavuthy', '2020-06-27 03:31:10'),
(19, 2, NULL, 0x3139322e3136382e312e313237, 'Mavuthy', '2020-06-27 17:54:40'),
(20, 2, NULL, 0x3139322e3136382e312e3135, 'Mavuthy', '2020-06-27 19:03:27'),
(21, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-02 18:30:50'),
(22, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-05 00:26:20'),
(23, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-05 22:35:08'),
(24, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-06 18:44:00'),
(25, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-06 23:41:22'),
(26, 6, NULL, 0x3a3a31, 'admin1', '2020-07-07 00:33:02'),
(27, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-07 00:33:11'),
(28, 6, NULL, 0x3a3a31, 'admin1', '2020-07-07 00:34:49'),
(29, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-07 00:49:56'),
(30, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-09 06:54:23'),
(31, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-10 01:36:54'),
(32, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-10 07:01:22'),
(33, 1, NULL, 0x3139322e3136382e312e3131, 'admin@855solution.com', '2020-07-11 06:36:29'),
(34, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-11 06:50:50'),
(35, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-12 06:44:57'),
(36, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-07-13 05:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
CREATE TABLE IF NOT EXISTS `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

DROP TABLE IF EXISTS `sma_warehouses`;
CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'CHHAY LATY', 'CHHAY LATY', '<p>Phnom Penh</p>', NULL, '069282275', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

DROP TABLE IF EXISTS `sma_warehouses_products`;
CREATE TABLE IF NOT EXISTS `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(33, 30, 1, '997.0000', NULL, '0.4202'),
(34, 30, 2, '0.0000', NULL, '2000.0000'),
(37, 26, 1, '0.0000', NULL, '130.0000'),
(38, 1, 1, '0.0000', NULL, NULL),
(39, 31, 1, '0.0000', NULL, '526.4237'),
(40, 31, 2, '0.0000', NULL, '0.0000'),
(41, 28, 1, '0.0000', NULL, '3000.0000'),
(42, 29, 1, '0.0000', NULL, '3000.0000'),
(43, 29, 2, '0.0000', NULL, NULL),
(44, 28, 2, '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
CREATE TABLE IF NOT EXISTS `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `rpsale`
--
DROP TABLE IF EXISTS `rpsale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`c855sys7_wathbo`@`localhost` SQL SECURITY DEFINER VIEW `rpsale`  AS  select `sma_sale_items`.`sale_id` AS `sale_id`,`sma_sale_items`.`product_id` AS `product_id`,`sma_sale_items`.`product_name` AS `product_name`,(`sma_products`.`cost` * `sma_sale_items`.`quantity`) AS `bestprice`,(`sma_products`.`price` * `sma_sale_items`.`quantity`) AS `saleprice`,(((`sma_products`.`price` * `sma_sale_items`.`quantity`) - (`sma_products`.`cost` * `sma_sale_items`.`quantity`)) - (`sma_sale_items`.`item_discount` * `sma_sale_items`.`quantity`)) AS `profite`,(`sma_sale_items`.`item_discount` * `sma_sale_items`.`quantity`) AS `discount`,`sma_sale_items`.`quantity` AS `quantity`,`sma_sales`.`date` AS `date`,`sma_products`.`cost` AS `cost`,`sma_products`.`price` AS `price`,`sma_categories`.`name` AS `name`,`sma_sale_items`.`product_code` AS `product_code` from (((`sma_sale_items` join `sma_sales` on((`sma_sales`.`id` = `sma_sale_items`.`sale_id`))) join `sma_products` on((`sma_products`.`id` = `sma_sale_items`.`product_id`))) join `sma_categories` on((`sma_products`.`category_id` = `sma_categories`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
