-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2019 at 03:07 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'iPhone'),
(2, 'SamSung'),
(3, 'Oppo'),
(4, 'Xiaomi'),
(5, 'Realme'),
(6, 'Vivo'),
(7, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `link_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `link_name` varchar(1024) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`link_id`, `product_name`, `link_name`, `price`) VALUES
(62, 'Samsung Galaxy A30', 'https://www.thegioididong.com/dtdd/samsung-galaxy-a30', 5790000),
(63, 'Samsung Galaxy A30', 'https://www.thegioididong.com/dtdd/samsung-galaxy-a30-32gb', 4990000),
(64, 'Samsung Galaxy A30', 'https://fptshop.com.vn/dien-thoai/samsung-galaxy-a30', 4990000),
(65, 'Samsung Galaxy A30', 'https://fptshop.com.vn/dien-thoai/samsung-galaxy-a30-64gb', 5790000),
(66, 'Samsung Galaxy A30', 'https://viettelstore.vn/dien-thoai/samsung-galaxy-a30-pid133351.html', 0),
(67, 'Samsung Galaxy A30', 'https://m.viettelstore.vn/dien-thoai/samsung-galaxy-a30-3gb-32gb-pid135861.html', 0),
(68, 'Samsung Galaxy A30', 'https://www.samsung.com/vn/smartphones/galaxy-a30-a305/SM-A305FZBDXXV/', 0),
(69, 'Samsung Galaxy A30', 'https://www.dienmayxanh.com/dien-thoai/samsung-galaxy-a30', 0),
(70, 'Samsung Galaxy A30', 'https://www.nguyenkim.com/dien-thoai-samsung-galaxy-a30.html', 0),
(71, 'Xiaomi Mi 9T', 'https://www.thegioididong.com/dtdd/xiaomi-mi-9t', 7990000),
(72, 'Xiaomi Mi 9T', 'https://fptshop.com.vn/dien-thoai/xiaomi-mi-9t', 9490000),
(73, 'Xiaomi Mi 9T', 'https://hoanghamobile.com/xiaomi-mi-9t-chinh-hang-p15311.html', 6990000),
(74, 'Xiaomi Mi 9T', 'https://didongthongminh.vn/xiaomi-mi-9t-64gb-ram-6gb', 0),
(75, 'Xiaomi Mi 9T', 'https://mobilecity.vn/xiaomi/xiaomi-mi-9t.html', 0),
(76, 'Xiaomi Mi 9T', 'https://www.dienmayxanh.com/dien-thoai/xiaomi-mi-9t', 0),
(77, 'Xiaomi Mi 9T', 'https://clickbuy.com.vn/xiaomi-mi-9t-ram-6gb-64gb-cong-ty-dgw/', 0),
(78, 'Xiaomi Mi 9T', 'https://didongviet.vn/xiaomi-mi-9t-6gb-64gb', 6890000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_in`
--

CREATE TABLE `inventory_in` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `import_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_in`
--

INSERT INTO `inventory_in` (`inventory_id`, `product_id`, `import_date`, `quantity`) VALUES
(1, 1, '2019-11-01 00:00:00', 11),
(2, 2, '2019-11-01 00:00:00', 12),
(3, 3, '2019-11-01 00:00:00', 13),
(4, 4, '2019-11-01 00:00:00', 14),
(5, 5, '2019-11-01 00:00:00', 15),
(6, 6, '2019-11-01 00:00:00', 16),
(7, 7, '2019-11-01 00:00:00', 17),
(8, 8, '2019-11-01 00:00:00', 21),
(9, 9, '2019-11-01 00:00:00', 22),
(10, 10, '2019-11-01 00:00:00', 23),
(11, 11, '2019-11-01 00:00:00', 24),
(12, 12, '2019-11-01 00:00:00', 25),
(13, 13, '2019-11-01 00:00:00', 26),
(14, 14, '2019-11-01 00:00:00', 27),
(15, 15, '2019-11-01 00:00:00', 28),
(16, 16, '2019-11-01 00:00:00', 29),
(17, 17, '2019-11-01 00:00:00', 15),
(18, 18, '2019-11-01 00:00:00', 16),
(19, 19, '2019-11-01 00:00:00', 17),
(20, 20, '2019-11-01 00:00:00', 18),
(21, 21, '2019-11-01 00:00:00', 19),
(22, 22, '2019-11-01 00:00:00', 20),
(23, 23, '2019-11-01 00:00:00', 21),
(24, 24, '2019-11-01 00:00:00', 25),
(25, 25, '2019-11-01 00:00:00', 26),
(26, 26, '2019-11-01 00:00:00', 27),
(27, 27, '2019-11-01 00:00:00', 28),
(28, 28, '2019-11-01 00:00:00', 29),
(29, 29, '2019-11-01 00:00:00', 30),
(30, 30, '2019-11-01 00:00:00', 31),
(31, 31, '2019-11-01 00:00:00', 5),
(32, 32, '2019-11-01 00:00:00', 6),
(33, 33, '2019-11-01 00:00:00', 7),
(34, 34, '2019-11-01 00:00:00', 8),
(35, 35, '2019-11-01 00:00:00', 9),
(36, 36, '2019-11-01 00:00:00', 10),
(37, 37, '2019-11-01 00:00:00', 11),
(38, 38, '2019-11-01 00:00:00', 12),
(39, 39, '2019-11-01 00:00:00', 10),
(40, 40, '2019-11-01 00:00:00', 11),
(41, 41, '2019-11-01 00:00:00', 12),
(42, 42, '2019-11-01 00:00:00', 13),
(43, 43, '2019-11-01 00:00:00', 14),
(44, 44, '2019-11-01 00:00:00', 14),
(45, 45, '2019-11-01 00:00:00', 16),
(46, 46, '2019-11-01 00:00:00', 22),
(47, 47, '2019-11-01 00:00:00', 23),
(48, 48, '2019-11-01 00:00:00', 24),
(49, 49, '2019-11-01 00:00:00', 25),
(50, 50, '2019-11-01 00:00:00', 26),
(51, 51, '2019-11-01 00:00:00', 27),
(52, 52, '2019-11-01 00:00:00', 28);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_management`
--

CREATE TABLE `inventory_management` (
  `im_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `in_stock` int(11) NOT NULL,
  `sold_amount` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_management`
--

INSERT INTO `inventory_management` (`im_id`, `inventory_id`, `in_stock`, `sold_amount`, `update_date`, `update_type`) VALUES
(1, 1, 11, 0, '2019-11-01 00:00:00', 'IN'),
(2, 2, 12, 0, '2019-11-01 00:00:00', 'IN'),
(3, 3, 13, 0, '2019-11-01 00:00:00', 'IN'),
(4, 4, 14, 0, '2019-11-01 00:00:00', 'IN'),
(5, 5, 15, 0, '2019-11-01 00:00:00', 'IN'),
(6, 6, 16, 0, '2019-11-01 00:00:00', 'IN'),
(7, 7, 17, 0, '2019-11-01 00:00:00', 'IN'),
(8, 8, 21, 0, '2019-11-01 00:00:00', 'IN'),
(9, 9, 22, 0, '2019-11-01 00:00:00', 'IN'),
(10, 10, 23, 0, '2019-11-01 00:00:00', 'IN'),
(11, 11, 24, 0, '2019-11-01 00:00:00', 'IN'),
(12, 12, 25, 0, '2019-11-01 00:00:00', 'IN'),
(13, 13, 26, 0, '2019-11-01 00:00:00', 'IN'),
(14, 14, 27, 0, '2019-11-01 00:00:00', 'IN'),
(15, 15, 28, 0, '2019-11-01 00:00:00', 'IN'),
(16, 16, 29, 0, '2019-11-01 00:00:00', 'IN'),
(17, 17, 15, 0, '2019-11-01 00:00:00', 'IN'),
(18, 18, 16, 0, '2019-11-01 00:00:00', 'IN'),
(19, 19, 17, 0, '2019-11-01 00:00:00', 'IN'),
(20, 20, 18, 0, '2019-11-01 00:00:00', 'IN'),
(21, 21, 19, 0, '2019-11-01 00:00:00', 'IN'),
(22, 22, 20, 0, '2019-11-01 00:00:00', 'IN'),
(23, 23, 21, 0, '2019-11-01 00:00:00', 'IN'),
(24, 24, 25, 0, '2019-11-01 00:00:00', 'IN'),
(25, 25, 26, 0, '2019-11-01 00:00:00', 'IN'),
(26, 26, 27, 0, '2019-11-01 00:00:00', 'IN'),
(27, 27, 28, 0, '2019-11-01 00:00:00', 'IN'),
(28, 28, 29, 0, '2019-11-01 00:00:00', 'IN'),
(29, 29, 30, 0, '2019-11-01 00:00:00', 'IN'),
(30, 30, 31, 0, '2019-11-01 00:00:00', 'IN'),
(31, 31, 5, 0, '2019-11-01 00:00:00', 'IN'),
(32, 32, 6, 0, '2019-11-01 00:00:00', 'IN'),
(33, 33, 7, 0, '2019-11-01 00:00:00', 'IN'),
(34, 34, 8, 0, '2019-11-01 00:00:00', 'IN'),
(35, 35, 9, 0, '2019-11-01 00:00:00', 'IN'),
(36, 36, 10, 0, '2019-11-01 00:00:00', 'IN'),
(37, 37, 11, 0, '2019-11-01 00:00:00', 'IN'),
(38, 38, 12, 0, '2019-11-01 00:00:00', 'IN'),
(39, 39, 10, 0, '2019-11-01 00:00:00', 'IN'),
(40, 40, 11, 0, '2019-11-01 00:00:00', 'IN'),
(41, 41, 12, 0, '2019-11-01 00:00:00', 'IN'),
(42, 42, 13, 0, '2019-11-01 00:00:00', 'IN'),
(43, 43, 14, 0, '2019-11-01 00:00:00', 'IN'),
(44, 44, 15, 0, '2019-11-01 00:00:00', 'IN'),
(45, 45, 16, 0, '2019-11-01 00:00:00', 'IN'),
(46, 46, 22, 0, '2019-11-01 00:00:00', 'IN'),
(47, 47, 23, 0, '2019-11-01 00:00:00', 'IN'),
(48, 48, 24, 0, '2019-11-01 00:00:00', 'IN'),
(49, 49, 25, 0, '2019-11-01 00:00:00', 'IN'),
(50, 50, 26, 0, '2019-11-01 00:00:00', 'IN'),
(51, 51, 27, 0, '2019-11-01 00:00:00', 'IN'),
(52, 52, 28, 0, '2019-11-01 00:00:00', 'IN'),
(101, 1, 10, 1, '2019-11-04 00:00:00', 'OUT'),
(102, 2, 10, 2, '2019-11-04 00:00:00', 'OUT'),
(103, 3, 12, 1, '2019-11-04 00:00:00', 'OUT'),
(104, 4, 12, 2, '2019-11-04 00:00:00', 'OUT'),
(105, 5, 14, 1, '2019-11-04 00:00:00', 'OUT'),
(106, 6, 14, 2, '2019-11-04 00:00:00', 'OUT'),
(107, 7, 16, 1, '2019-11-04 00:00:00', 'OUT'),
(108, 8, 18, 3, '2019-11-07 00:00:00', 'OUT'),
(109, 9, 20, 2, '2019-11-07 00:00:00', 'OUT'),
(110, 10, 20, 3, '2019-11-07 00:00:00', 'OUT'),
(111, 11, 22, 2, '2019-11-07 00:00:00', 'OUT'),
(112, 12, 22, 3, '2019-11-07 00:00:00', 'OUT'),
(113, 13, 24, 2, '2019-11-07 00:00:00', 'OUT'),
(114, 14, 24, 3, '2019-11-07 00:00:00', 'OUT'),
(115, 15, 26, 2, '2019-11-07 00:00:00', 'OUT'),
(116, 16, 26, 3, '2019-11-07 00:00:00', 'OUT'),
(117, 17, 13, 2, '2019-11-23 00:00:00', 'OUT'),
(118, 18, 14, 2, '2019-11-23 00:00:00', 'OUT'),
(119, 19, 15, 2, '2019-11-23 00:00:00', 'OUT'),
(120, 20, 16, 2, '2019-11-23 00:00:00', 'OUT'),
(121, 21, 17, 2, '2019-11-23 00:00:00', 'OUT'),
(122, 22, 18, 2, '2019-11-23 00:00:00', 'OUT'),
(123, 23, 19, 2, '2019-11-23 00:00:00', 'OUT'),
(124, 24, 21, 4, '2019-11-03 00:00:00', 'OUT'),
(125, 25, 25, 1, '2019-11-03 00:00:00', 'OUT'),
(126, 26, 23, 4, '2019-11-03 00:00:00', 'OUT'),
(127, 27, 27, 1, '2019-11-03 00:00:00', 'OUT'),
(128, 28, 25, 4, '2019-11-03 00:00:00', 'OUT'),
(129, 29, 29, 1, '2019-11-03 00:00:00', 'OUT'),
(130, 30, 27, 4, '2019-11-03 00:00:00', 'OUT'),
(131, 31, 2, 3, '2019-11-13 00:00:00', 'OUT'),
(132, 32, 4, 2, '2019-11-13 00:00:00', 'OUT'),
(133, 33, 4, 3, '2019-11-13 00:00:00', 'OUT'),
(134, 34, 6, 2, '2019-11-13 00:00:00', 'OUT'),
(135, 35, 6, 3, '2019-11-13 00:00:00', 'OUT'),
(136, 36, 8, 2, '2019-11-13 00:00:00', 'OUT'),
(137, 37, 8, 3, '2019-11-13 00:00:00', 'OUT'),
(138, 38, 10, 2, '2019-11-13 00:00:00', 'OUT'),
(139, 39, 7, 3, '2019-12-13 00:00:00', 'OUT'),
(140, 40, 9, 2, '2019-12-13 00:00:00', 'OUT'),
(141, 41, 9, 3, '2019-12-13 00:00:00', 'OUT'),
(142, 42, 11, 2, '2019-12-13 00:00:00', 'OUT'),
(143, 43, 11, 3, '2019-12-13 00:00:00', 'OUT'),
(144, 44, 13, 2, '2019-12-13 00:00:00', 'OUT'),
(145, 45, 13, 3, '2019-12-13 00:00:00', 'OUT'),
(146, 46, 19, 3, '2019-12-03 00:00:00', 'OUT'),
(147, 47, 21, 2, '2019-12-03 00:00:00', 'OUT'),
(148, 48, 21, 3, '2019-12-03 00:00:00', 'OUT'),
(149, 49, 23, 2, '2019-12-03 00:00:00', 'OUT'),
(150, 50, 23, 3, '2019-12-03 00:00:00', 'OUT'),
(151, 51, 25, 2, '2019-12-03 00:00:00', 'OUT'),
(152, 52, 25, 3, '2019-12-03 00:00:00', 'OUT'),
(153, 30, 23, 4, '2019-12-03 00:00:00', 'OUT');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_out`
--

CREATE TABLE `inventory_out` (
  `io_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `export_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_out`
--

INSERT INTO `inventory_out` (`io_id`, `inventory_id`, `export_date`, `quantity`) VALUES
(1, 1, '2019-11-04 00:00:00', 1),
(2, 2, '2019-11-04 00:00:00', 2),
(3, 3, '2019-11-04 00:00:00', 1),
(4, 4, '2019-11-04 00:00:00', 2),
(5, 5, '2019-11-04 00:00:00', 1),
(6, 6, '2019-11-04 00:00:00', 2),
(7, 7, '2019-11-04 00:00:00', 1),
(8, 8, '2019-11-07 00:00:00', 3),
(9, 9, '2019-11-07 00:00:00', 2),
(10, 10, '2019-11-07 00:00:00', 3),
(11, 11, '2019-11-07 00:00:00', 2),
(12, 12, '2019-11-07 00:00:00', 3),
(13, 13, '2019-11-07 00:00:00', 2),
(14, 14, '2019-11-07 00:00:00', 3),
(15, 15, '2019-11-07 00:00:00', 2),
(16, 16, '2019-11-07 00:00:00', 3),
(17, 17, '2019-11-23 00:00:00', 2),
(18, 18, '2019-11-23 00:00:00', 2),
(19, 19, '2019-11-23 00:00:00', 2),
(20, 20, '2019-11-23 00:00:00', 2),
(21, 21, '2019-11-23 00:00:00', 2),
(22, 22, '2019-11-23 00:00:00', 2),
(23, 23, '2019-11-23 00:00:00', 2),
(24, 24, '2019-11-03 00:00:00', 4),
(25, 25, '2019-11-03 00:00:00', 1),
(26, 26, '2019-11-03 00:00:00', 4),
(27, 27, '2019-11-03 00:00:00', 1),
(28, 28, '2019-11-03 00:00:00', 4),
(29, 29, '2019-11-03 00:00:00', 1),
(30, 30, '2019-11-03 00:00:00', 4),
(31, 31, '2019-11-13 00:00:00', 3),
(32, 32, '2019-11-13 00:00:00', 2),
(33, 33, '2019-11-13 00:00:00', 3),
(34, 34, '2019-11-13 00:00:00', 2),
(35, 35, '2019-11-13 00:00:00', 3),
(36, 36, '2019-11-13 00:00:00', 2),
(37, 37, '2019-11-13 00:00:00', 3),
(38, 38, '2019-11-13 00:00:00', 2),
(39, 39, '2019-12-13 00:00:00', 3),
(40, 40, '2019-12-13 00:00:00', 2),
(41, 41, '2019-12-13 00:00:00', 3),
(42, 42, '2019-12-13 00:00:00', 2),
(43, 43, '2019-12-13 00:00:00', 3),
(44, 44, '2019-12-13 00:00:00', 2),
(45, 45, '2019-12-13 00:00:00', 3),
(46, 46, '2019-12-03 00:00:00', 3),
(47, 47, '2019-12-03 00:00:00', 2),
(48, 48, '2019-12-03 00:00:00', 3),
(49, 49, '2019-12-03 00:00:00', 2),
(50, 50, '2019-12-03 00:00:00', 3),
(51, 51, '2019-12-03 00:00:00', 2),
(52, 52, '2019-12-03 00:00:00', 3),
(53, 30, '2019-12-03 00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_performance`
--

CREATE TABLE `inventory_performance` (
  `ip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `performance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_performance`
--

INSERT INTO `inventory_performance` (`ip_id`, `product_id`, `from_date`, `to_date`, `performance`) VALUES
(5, 1, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0911179),
(6, 2, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0911179),
(7, 3, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0771025),
(8, 4, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0771025),
(9, 5, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0668239),
(10, 6, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0668239),
(11, 7, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0589634),
(12, 8, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0527494),
(13, 9, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0477262),
(14, 10, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0477262),
(15, 11, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0435765),
(16, 12, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0435765),
(17, 13, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0400907),
(18, 14, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0400907),
(19, 15, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0371213),
(20, 16, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0371213),
(21, 17, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.071527),
(22, 18, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.066759),
(23, 19, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0625869),
(24, 20, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0589056),
(25, 21, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0556334),
(26, 22, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0527055),
(27, 23, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0500705),
(28, 24, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0455666),
(29, 25, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.038557),
(30, 26, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0417698),
(31, 27, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0358032),
(32, 28, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.038557),
(33, 29, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0334165),
(34, 30, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0358032),
(35, 31, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.333785),
(36, 32, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.200325),
(37, 33, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.200325),
(38, 34, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.143106),
(39, 35, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.143106),
(40, 36, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.111312),
(41, 37, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.111312),
(42, 38, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0910771),
(43, 39, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.125042),
(44, 40, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.100035),
(45, 41, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.100035),
(46, 42, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0833627),
(47, 43, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0833627),
(48, 44, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0714541),
(49, 45, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0714541),
(50, 46, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0500444),
(51, 47, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0454951),
(52, 48, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0454951),
(53, 49, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.041704),
(54, 50, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.041704),
(55, 51, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0384961),
(56, 52, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0384961),
(58, 1, '2019-09-01 00:00:00', '2019-12-20 00:00:00', 0.0911179),
(59, 30, '2019-08-01 00:00:00', '2019-12-21 00:00:00', 0.0801334),
(60, 30, '2019-08-01 00:00:00', '2019-12-21 00:00:00', 0.0801334);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `new_price` float DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  FULLTEXT(`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `new_price`, `cat_id`, `product_image`) VALUES
(1, 'iPhone 11 Pro Max 512GB', 43999000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg'),
(2, 'iPhone 11 Pro 256GB', 34990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-green-600x600.jpg'),
(3, 'iPhone Xs Max 256GB', 33990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg'),
(4, 'iPhone 11 Pro 64GB', 30990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/188705/iphone-11-pro-black-600x600.jpg'),
(5, 'iPhone Xs 256GB', 29990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg'),
(6, 'iPhone 11 128GB', 23990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/210644/iphone-11-128gb-black-600x600.jpg'),
(7, 'iPhone 7 Plus 32GB', 12990000, NULL, 1, 'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600-600x600.jpg'),
(8, 'Samsung Galaxy Note 10+', 26990000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-blue-600x600.jpg'),
(9, 'Samsung Galaxy Note 9', 22990000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/154897/samsung-galaxy-note-9-black-600x600.jpg'),
(10, 'Samsung Galaxy S10+', 22990000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/179530/samsung-galaxy-s10-plus-black-600x600.jpg'),
(11, 'Samsung Galaxy A80', 12490000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/201228/samsung-galaxy-a80-gold-600x600.jpg'),
(12, 'Samsung Galaxy A70', 8790000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/195012/samsung-galaxy-a70-white-600x600.jpg'),
(13, 'Samsung Galaxy A50 128GB', 7990000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/200294/samsung-galaxy-a50-128gb-blue-600x600.jpg'),
(14, 'Samsung Galaxy A50s', 6290000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/207641/samsung-galaxy-a50s-green-600x600.jpg'),
(15, 'Samsung Galaxy A30', 5800000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/198413/samsung-galaxy-a30-blue-600x600.jpg'),
(16, 'Samsung Galaxy A30s', 5600000, NULL, 2, 'https://cdn.tgdd.vn/Products/Images/42/204403/samsung-galaxy-a30s-green-600x600.jpg'),
(17, 'OPPO Reno2', 15000000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/209798/oppo-reno2-600x600.jpg'),
(18, 'OPPO Reno', 9490000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/200438/oppo-reno-pink-600x600.jpg'),
(19, 'OPPO F11 Pro 128GB', 6490000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/202703/oppo-f11-pro-128gb-600x600.jpg'),
(20, 'OPPO F11', 5490000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/199801/oppo-f11-mtp-600x600.jpg'),
(21, 'OPPO K3', 5490000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/202863/oppo-k3-black-600x600.jpg'),
(22, 'OPPO A7', 3990000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/193212/oppo-a7-green-600x600.jpg'),
(23, 'OPPO A5s', 3299000, NULL, 3, 'https://cdn.tgdd.vn/Products/Images/42/200330/oppo-a5s-red-600x600.jpg'),
(24, 'Xiaomi Mi Note 10 Pro', 14990000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/213590/xiaomi-mi-note-10-pro-black-600x600.jpg'),
(25, 'Xiaomi Mi Note 10', 12990000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/213023/xiaomi-mi-note-10-white-600x600.jpg'),
(26, 'Xiaomi Mi 9 SE', 7500000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/198394/xiaomi-mi-9-se-1-600x600.jpg'),
(27, 'Xiaomi Mi 9T', 7990000, 6545500, 4, 'https://cdn.tgdd.vn/Products/Images/42/203053/xiaomi-mi-9t-red-600x600.jpg'),
(28, 'Xiaomi Mi A3', 4500000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/197845/xiaomi-mi-a3-white-600x600.jpg'),
(29, 'Xiaomi Redmi 8A', 2600000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/210089/xiaomi-redmi-8a-1-600x600.jpg'),
(30, 'Xiaomi Redmi Note 8 Pro (6GB/128GB)', 6490000, NULL, 4, 'https://cdn.tgdd.vn/Products/Images/42/214816/xiaomi-redmi-note-8-pro-6gb-128gb-xanh-duong-600x600.jpg'),
(31, 'Vivo V17 Pro', 9500000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/210243/vivo-v17-pro-blue-noo-600x600.jpg'),
(32, 'Vivo S1 Pro', 6699000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/202862/vivo-s1-pro-white-noo-600x600.jpg'),
(33, 'Vivo S1', 5999000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/202861/vivo-s1-blue-600x600.jpg'),
(34, 'Vivo V15 128GB', 5999000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/199041/vivo-v15-quanghai-600x600.jpg'),
(35, 'Vivo Y19', 4699000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/204651/vivo-y19-white-quanghai-600x600.jpg'),
(36, 'Vivo Y17', 4399000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/201404/vivo-y17-purple-600x600.jpg'),
(37, 'Vivo U10', 4000000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/211156/vivo-u10-1-600x600.jpg'),
(38, 'Vivo Y93', 2999000, NULL, 6, 'https://cdn.tgdd.vn/Products/Images/42/202284/vivo-y93-32gb-black-600x600.jpg'),
(39, 'Realme XT', 7999000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/210241/realme-xt-white-1-600x600.jpg'),
(40, 'Realme 5s', 4699000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/213588/realme-5s-red-600x600.jpg'),
(41, 'Realme 5 Pro (4GB/128GB)', 5699000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/209564/realme-5-pro-purple-600x600.jpg'),
(42, 'Realme 5 Pro (8GB/128GB)', 6499000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/211163/realme-5-pro-8gb-green-600x600.jpg'),
(43, 'Realme 3 Pro (4GB/64GB)', 4599000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/194955/realme-3-pro-blue-600x600.jpg'),
(44, 'Realme 3 32GB', 3299000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/194952/realme-3-green-isaac-600x600.jpg'),
(45, 'Realme 5 (4GB/128GB)', 4699000, NULL, 5, 'https://cdn.tgdd.vn/Products/Images/42/211161/realme-5-128gb-purple-600x600.jpg'),
(46, 'Huawei P30 Lite', 6020000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/198985/huawei-p30-lite-1-600x600.jpg'),
(47, 'Huawei Y9s', 6499000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/214648/huawei-y9sb-blue-600x600.jpg'),
(48, 'Huawei Nova 3i', 5399000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/179673/huawei-nova-3i-600-600-600x600.jpg'),
(49, 'Huawei Y9 Prime', 5499000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/202268/huawei-y9-prime-2019-blue-2-600x600.jpg'),
(50, 'Huawei Y7 Pro', 3140000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/197205/huawei-y7-pro-2019-1-600x600.jpg'),
(51, 'Huawei P30 Lite White', 5520000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/215788/huawei-p30-lite-trang-600x600.jpg'),
(52, 'Huawei Y10', 6799000, NULL, 7, 'https://cdn.tgdd.vn/Products/Images/42/214648/huawei-y9sb-blue-600x600.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product analysis`
--

CREATE TABLE `product analysis` (
  `table_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `visited_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product analysis`
--

INSERT INTO `product analysis` (`table_id`, `product_id`, `visited_date`) VALUES
(49, 1, '2019-12-21 04:45:46'),
(50, 1, '2019-12-21 04:46:16'),
(51, 1, '2019-12-21 05:22:48'),
(52, 29, '2019-12-21 15:09:13'),
(53, 2, '2019-12-21 15:09:28'),
(54, 15, '2019-12-22 13:18:50'),
(55, 15, '2019-12-22 13:18:53'),
(56, 15, '2019-12-22 13:18:55'),
(57, 15, '2019-12-22 13:18:56'),
(58, 29, '2019-12-22 14:08:45'),
(59, 29, '2019-12-22 14:09:05'),
(60, 29, '2019-12-22 14:09:23'),
(61, 29, '2019-12-22 14:12:19'),
(62, 29, '2019-12-22 14:12:32'),
(63, 27, '2019-12-22 14:33:18'),
(64, 27, '2019-12-22 14:33:43'),
(65, 27, '2019-12-22 14:35:26'),
(66, 27, '2019-12-22 14:35:39'),
(67, 27, '2019-12-22 14:35:40'),
(68, 27, '2019-12-22 14:36:01'),
(69, 1, '2019-12-22 14:36:08'),
(70, 1, '2019-12-22 14:36:11'),
(71, 1, '2019-12-22 14:36:29'),
(72, 1, '2019-12-22 14:37:50'),
(73, 1, '2019-12-22 14:39:23'),
(74, 8, '2019-12-22 14:39:31'),
(75, 8, '2019-12-22 14:40:12'),
(76, 1, '2019-12-22 14:40:25'),
(77, 1, '2019-12-22 14:41:34'),
(78, 1, '2019-12-22 14:41:58'),
(79, 1, '2019-12-22 14:42:49'),
(80, 1, '2019-12-22 14:43:23'),
(81, 1, '2019-12-22 14:43:25'),
(82, 1, '2019-12-22 14:45:42'),
(83, 1, '2019-12-22 14:46:29'),
(84, 1, '2019-12-22 14:46:53'),
(85, 1, '2019-12-22 14:47:08'),
(86, 1, '2019-12-22 14:48:41'),
(87, 1, '2019-12-22 14:49:34'),
(88, 1, '2019-12-22 14:49:48'),
(89, 1, '2019-12-22 14:50:00'),
(90, 1, '2019-12-22 14:50:11'),
(91, 29, '2019-12-22 14:50:27'),
(92, 27, '2019-12-22 14:50:33'),
(93, 27, '2019-12-22 14:50:46'),
(94, 27, '2019-12-22 14:51:12'),
(95, 1, '2019-12-22 14:51:35'),
(96, 29, '2019-12-23 13:13:48'),
(97, 31, '2019-12-23 13:14:02'),
(98, 32, '2019-12-23 13:14:05'),
(99, 31, '2019-12-23 13:14:10'),
(100, 1, '2019-12-23 13:14:17'),
(101, 3, '2019-12-23 13:16:57'),
(102, 2, '2019-12-23 13:16:59'),
(103, 3, '2019-12-23 13:20:56'),
(104, 2, '2019-12-23 13:20:58'),
(105, 3, '2019-12-23 13:21:01'),
(106, 1, '2019-12-23 15:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `rule_id` int(11) NOT NULL,
  `class_or_ID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `matching_ratio` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`rule_id`, `class_or_ID`, `name`, `matching_ratio`) VALUES
(1, 'class', 'area_price', 0.333333),
(2, 'class', 'fs-dtprice', 0.222222),
(4, 'class or id', 'price', 1),
(5, 'class', 'fs-lpil-price', 0),
(7, 'class', 'numberprice', 0),
(8, 'ID', '_price_new436', 0.111111),
(9, 'class', 'product-price', 0),
(10, 'class', 'ins-product-price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rule_and_dataset`
--

CREATE TABLE `rule_and_dataset` (
  `table_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `is_visited` int(11) NOT NULL,
  `is_indentified_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rule_and_dataset`
--

INSERT INTO `rule_and_dataset` (`table_id`, `rule_id`, `link_id`, `is_visited`, `is_indentified_price`) VALUES
(132, 1, 62, 1, 1),
(133, 1, 63, 1, 1),
(134, 1, 69, 1, 1),
(135, 2, 64, 1, 1),
(136, 2, 65, 1, 1),
(137, 4, 62, 1, 1),
(138, 4, 63, 1, 1),
(139, 4, 64, 1, 1),
(140, 4, 65, 1, 1),
(141, 4, 66, 1, 1),
(142, 4, 67, 1, 1),
(143, 4, 68, 1, 1),
(144, 4, 69, 1, 1),
(145, 4, 70, 1, 1),
(146, 8, 66, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD PRIMARY KEY (`im_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD PRIMARY KEY (`io_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `inventory_performance`
--
ALTER TABLE `inventory_performance`
  ADD PRIMARY KEY (`ip_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `product analysis`
--
ALTER TABLE `product analysis`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indexes for table `rule_and_dataset`
--
ALTER TABLE `rule_and_dataset`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `rule_id` (`rule_id`),
  ADD KEY `link_id` (`link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `inventory_in`
--
ALTER TABLE `inventory_in`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `im_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `inventory_out`
--
ALTER TABLE `inventory_out`
  MODIFY `io_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `inventory_performance`
--
ALTER TABLE `inventory_performance`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product analysis`
--
ALTER TABLE `product analysis`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rule_and_dataset`
--
ALTER TABLE `rule_and_dataset`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD CONSTRAINT `inventory_in_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD CONSTRAINT `inventory_management_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Constraints for table `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD CONSTRAINT `inventory_out_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Constraints for table `inventory_performance`
--
ALTER TABLE `inventory_performance`
  ADD CONSTRAINT `inventory_performance_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `product analysis`
--
ALTER TABLE `product analysis`
  ADD CONSTRAINT `product analysis_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `rule_and_dataset`
--
ALTER TABLE `rule_and_dataset`
  ADD CONSTRAINT `rule_and_dataset_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`rule_id`),
  ADD CONSTRAINT `rule_and_dataset_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `dataset` (`link_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
