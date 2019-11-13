-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 07:13 AM
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
(1, 'cat 1'),
(2, 'cat 2'),
(3, 'cat 3');

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
(33, 'iphone x 64gb', 'https://www.thegioididong.com/dtdd/iphone-x-64gb', 19490000),
(34, 'iphone x 64gb', 'https://fptshop.com.vn/dien-thoai/iphone-x', 19490000),
(35, 'iphone x 64gb', 'https://fptshop.com.vn/may-doi-tra/dien-thoai-cu-gia-re/iphone-x-htm', 0),
(36, 'iphone x 64gb', 'https://fptshop.com.vn/phu-kien/dien-thoai/iphone-x', 0),
(37, 'iphone x 64gb', 'https://fptshop.com.vn/dien-thoai/iphone-x/338058/tra-gop', 0),
(38, 'iphone x 64gb', 'https://viettelstore.vn/dien-thoai/iphone-x-64gb-pid118486.html', 19490000),
(39, 'iphone x 64gb', 'https://www.hnammobile.com/dien-thoai/apple-iphone-x-64gb.12497.html', 18599000),
(41, 'Samsung Galaxy A30s', 'https://www.thegioididong.com/dtdd/samsung-galaxy-a30s', 5790000),
(42, 'Samsung Galaxy A30s', 'https://fptshop.com.vn/dien-thoai/samsung-galaxy-a30s', 5790000),
(43, 'Samsung Galaxy A30s', 'https://www.dienmayxanh.com/dien-thoai/samsung-galaxy-a30s', 0),
(44, 'Samsung Galaxy A30s', 'https://www.gsmarena.com/samsung_galaxy_a30s-9796.php', 0),
(45, 'Samsung Galaxy A50s', 'https://www.thegioididong.com/dtdd/samsung-galaxy-a50s', 6690000),
(46, 'Samsung Galaxy A50s', 'https://www.thegioididong.com/tin-tuc/mua-galaxy-a50s-nhan-voucher-an-uong-1195717', 6990000),
(47, 'Samsung Galaxy A50s', 'https://fptshop.com.vn/dien-thoai/samsung-galaxy-a50s', 6690000),
(48, 'Samsung Galaxy A50s', 'https://m.viettelstore.vn/dien-thoai/samsung-galaxy-a50s-pid139994.html', 6690000),
(49, 'Samsung Galaxy A50s', 'https://didongviet.vn/samsung-galaxy-a50s-64gb', 0),
(50, 'Samsung Galaxy A50s', 'https://www.dienmayxanh.com/dien-thoai/samsung-galaxy-a50s', 0),
(51, 'Samsung Galaxy A50s', 'https://hoanghamobile.com/samsung-galaxy-a50s-4gb64gb-chinh-hang-p15751.html', 0),
(52, 'Samsung Galaxy A50s', 'https://www.hnammobile.com/dien-thoai/samsung-galaxy-a50s-a507.18007.html', 0);

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
(1, 1, '2019-10-03 00:00:00', 2),
(2, 2, '2019-10-03 00:00:00', 8);

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
(1, 1, 2, 0, '2019-10-03 00:00:00', 'IN'),
(2, 2, 8, 0, '2019-10-03 00:00:00', 'IN'),
(3, 1, 1, 1, '2019-10-04 00:00:00', 'OUT'),
(4, 2, 7, 1, '2019-10-03 00:00:00', 'OUT'),
(5, 2, 6, 2, '2019-10-03 00:00:00', 'OUT'),
(6, 2, 5, 3, '2019-10-03 00:00:00', 'OUT'),
(7, 2, 4, 4, '2019-10-03 00:00:00', 'OUT'),
(8, 2, 3, 5, '2019-10-03 00:00:00', 'OUT'),
(9, 1, 0, 2, '2019-10-04 00:00:00', 'OUT');

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
(1, 1, '2019-10-04 00:00:00', 1),
(2, 2, '2019-10-04 00:00:00', 1),
(3, 2, '2019-10-04 00:00:00', 1),
(4, 2, '2019-10-04 00:00:00', 1),
(5, 2, '2019-10-04 00:00:00', 1),
(6, 2, '2019-10-04 00:00:00', 1),
(7, 1, '2019-10-04 00:00:00', 1);

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
(1, 2, '2019-10-01 00:00:00', '2019-10-05 00:00:00', 0.125006),
(2, 1, '2019-10-01 00:00:00', '2019-10-05 00:00:00', 0.500014),
(3, 2, '2019-10-01 00:00:00', '2019-10-05 00:00:00', 0.500014),
(4, 2, '2019-09-01 00:00:00', '2019-10-07 00:00:00', 0.625039),
(5, 1, '2019-09-01 00:00:00', '2019-10-07 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `cat_id`) VALUES
(1, 'product 1', 9.99, 1),
(2, 'product 2.1', 19.99, 2),
(3, 'product 2.2', 5.99, 2),
(4, 'product 3.1', 12.99, 3),
(5, 'product 3.2', 15.99, 3),
(6, 'product 3.3', 11.99, 3);

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
(1, 1, '2019-10-21 15:48:21'),
(2, 1, '2019-10-21 15:49:15'),
(3, 1, '2019-10-21 16:18:59'),
(4, 4, '2019-10-21 16:19:25'),
(5, 6, '2019-10-21 16:19:28'),
(6, 1, '2019-10-21 16:19:36'),
(7, 1, '2019-10-21 16:22:20'),
(8, 1, '2019-10-21 16:29:15'),
(9, 1, '2019-10-21 16:33:13'),
(10, 2, '2019-10-21 16:33:16'),
(11, 2, '2019-10-21 16:33:20'),
(12, 2, '2019-10-21 16:34:22'),
(13, 1, '2019-10-21 16:42:29'),
(14, 1, '2019-10-21 16:42:31'),
(15, 1, '2019-10-21 16:43:13'),
(16, 6, '2019-10-21 16:43:28'),
(17, 1, '2019-10-21 16:44:49'),
(18, 1, '2019-10-21 16:48:11'),
(19, 1, '2019-10-21 16:49:21'),
(20, 2, '2019-10-21 16:49:43'),
(21, 2, '2019-10-21 16:50:42'),
(22, 1, '2019-10-21 16:52:03'),
(23, 2, '2019-10-21 16:52:05'),
(24, 2, '2019-10-21 16:53:14'),
(25, 2, '2019-10-21 16:54:08'),
(26, 1, '2019-10-21 16:54:18'),
(27, 1, '2019-10-21 16:59:54'),
(28, 1, '2019-10-21 16:59:55'),
(29, 2, '2019-10-21 16:59:56'),
(30, 1, '2019-10-21 17:00:30'),
(31, 2, '2019-10-21 17:00:31'),
(32, 1, '2019-10-21 17:02:09'),
(33, 5, '2019-10-21 17:02:21'),
(34, 1, '2019-10-21 17:03:05'),
(35, 2, '2019-10-21 17:03:40'),
(36, 2, '2019-10-21 17:03:42'),
(37, 2, '2019-10-21 17:03:42'),
(38, 2, '2019-10-21 17:03:43'),
(39, 2, '2019-10-21 17:03:43'),
(40, 2, '2019-10-21 17:03:44'),
(41, 1, '2019-10-21 17:03:44'),
(42, 1, '2019-10-21 17:03:45'),
(43, 1, '2019-10-21 17:06:43'),
(44, 2, '2019-10-21 17:06:44'),
(45, 1, '2019-10-21 17:06:45'),
(46, 1, '2019-10-21 17:07:12'),
(47, 2, '2019-10-21 17:07:15');

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
(1, 'class', 'area_price', 0.142857),
(2, 'class', 'fs-dtprice', 0),
(4, 'class or id', 'price', 0.857143),
(5, 'class', 'mc-lpri', 0.142857),
(6, 'class', 'fs-gsocit', 0.142857),
(7, 'class', 'numberprice', 0.142857),
(8, 'ID', '_price_new436', 0.142857);

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
(83, 1, 33, 1, 1),
(84, 1, 34, 1, 0),
(85, 1, 35, 1, 0),
(86, 1, 36, 1, 0),
(87, 1, 37, 1, 0),
(88, 1, 38, 1, 0),
(89, 1, 39, 1, 0),
(90, 2, 33, 1, 0),
(91, 2, 34, 1, 0),
(92, 2, 35, 1, 0),
(93, 2, 36, 1, 0),
(94, 2, 37, 1, 0),
(95, 2, 38, 1, 0),
(96, 2, 39, 1, 0),
(97, 4, 33, 1, 1),
(98, 4, 34, 1, 1),
(99, 4, 35, 1, 0),
(100, 4, 36, 1, 1),
(101, 4, 37, 1, 1),
(102, 4, 38, 1, 1),
(103, 4, 39, 1, 1),
(104, 5, 33, 1, 0),
(105, 5, 34, 1, 0),
(106, 5, 35, 1, 1),
(107, 5, 36, 1, 0),
(108, 5, 37, 1, 0),
(109, 5, 38, 1, 0),
(110, 5, 39, 1, 0),
(111, 6, 33, 1, 0),
(112, 6, 34, 1, 1),
(113, 6, 35, 1, 0),
(114, 6, 36, 1, 0),
(115, 6, 37, 1, 0),
(116, 6, 38, 1, 0),
(117, 6, 39, 1, 0),
(118, 7, 33, 1, 0),
(119, 7, 34, 1, 0),
(120, 7, 35, 1, 0),
(121, 7, 36, 1, 0),
(122, 7, 37, 1, 0),
(123, 7, 38, 1, 0),
(124, 7, 39, 1, 1),
(125, 8, 33, 1, 0),
(126, 8, 34, 1, 0),
(127, 8, 35, 1, 0),
(128, 8, 36, 1, 0),
(129, 8, 37, 1, 0),
(130, 8, 38, 1, 1),
(131, 8, 39, 1, 0);

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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `inventory_in`
--
ALTER TABLE `inventory_in`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `im_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `inventory_out`
--
ALTER TABLE `inventory_out`
  MODIFY `io_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory_performance`
--
ALTER TABLE `inventory_performance`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product analysis`
--
ALTER TABLE `product analysis`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rule_and_dataset`
--
ALTER TABLE `rule_and_dataset`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

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
