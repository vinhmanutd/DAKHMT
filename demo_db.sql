-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 19, 2020 at 03:31 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `image_library`
--

DROP TABLE IF EXISTS `image_library`;
CREATE TABLE IF NOT EXISTS `image_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `link`, `position`, `created_time`, `last_updated`) VALUES
(4, 0, 'Level 1', 'home2.php', 0, 1555232698, 1555232698),
(5, 4, 'Level 2', 'product.php', 1, 1555232976, 1555232976),
(6, 5, 'Level 3', 'product.php', 0, 1555232976, 1555232976),
(7, 6, 'Level 4', 'home.php', 0, 1555232976, 1555232976),
(8, 4, 'Level 2.2', 'product.php', 2, 1555232976, 1555232976),
(9, 8, 'Level 3.2', 'product.php', 1, 1555427808, 1555427808),
(10, 7, 'Level 5', 'home.php', 0, 1555427808, 1555427808),
(16, 0, 'Level 1.2', 'home2.php', 1, 1555232698, 1555232698),
(17, 10, 'Level 6', '#', 1, 1555542591, 1555542591),
(20, 17, 'Level 7', '#', 1, 1555542591, 1555542591),
(21, 16, 'Level 2.2.2', 'home2.php', 1, 1555232698, 1555232698);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `note` text NOT NULL,
  `total` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(1, 'Test', '324324', 'Ha Noi', '', 18100000, 1606271428, 1606271428),
(2, 'Test', '123123', 'Ha Noi', '', 2580000, 1606272137, 1606272137),
(3, 'Test', '132123', 'Ha Noi', '', 3660000, 1606272167, 1606272167);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES
(1, 1, 2, 8, 540000, 1606271428, 1606271428),
(2, 1, 3, 3, 1500000, 1606271428, 1606271428),
(3, 1, 16, 16, 580000, 1606271428, 1606271428),
(4, 2, 2, 2, 540000, 1606272137, 1606272137),
(5, 2, 3, 1, 1500000, 1606272137, 1606272137),
(6, 3, 2, 4, 540000, 1606272167, 1606272167),
(7, 3, 3, 1, 1500000, 1606272167, 1606272167);

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE IF NOT EXISTS `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url_match` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`id`, `group_id`, `name`, `url_match`, `created_time`, `last_updated`) VALUES
(1, 1, 'Danh s????ch s??????n ph??????m', 'product_listing\\.php$', 1553185530, 1553185530),
(2, 1, 'X????a s??????n ph??????m', 'product_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(3, 1, 'S??????a s??????n ph??????m', 'product_editing\\.php\\?id=\\d+$|product_editing\\.php\\?action=edit&id=\\d+$', 1553185530, 1553185530),
(4, 1, 'Th????m s??????n ph??????m', 'product_editing\\.php$|product_editing\\.php\\?action=add$', 1553185530, 1553185530),
(5, 1, 'Copy s??????n ph??????m', 'product_editing\\.php\\?id=\\d+&task=copy', 1553185530, 1553185530),
(6, 4, 'Danh s????ch danh m??????c', 'menu_listing\\.php$', 1553185530, 1553185530),
(7, 4, 'X????a danh m??????c', 'menu_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(8, 4, 'S??????a danh m??????c', 'menu_editing\\.php\\?id=\\d+$', 1553185530, 1553185530),
(9, 4, 'Th????m danh m??????c', 'menu_editing\\.php$', 1553185530, 1553185530),
(10, 4, 'Copy danh m??????c', 'menu_editing\\.php\\?id=\\d+&task=copy', 1553185530, 1553185530),
(11, 3, 'Danh s????ch ?????????n h????ng', 'order_listing\\.php$', 1553185530, 1553185530),
(12, 2, 'Ph????n quy??????n qu??????n tr???????', 'member_privilege\\.php\\?id=\\d+$|member_privilege\\.php\\?action=save$', 1553185530, 1553185530),
(13, 2, 'Danh s????ch th????nh vi????n', 'member_listing\\.php$', 1553185530, 1553185530),
(14, 2, 'X????a th????nh vi????n', 'member_delete\\.php\\?id=\\d+$', 1553185530, 1553185530),
(15, 2, 'S??????a th????nh vi????n', 'member_editing\\.php\\?id=\\d+$|member_editing\\.php\\?action=edit&id=\\d+$', 1553185530, 1553185530),
(16, 2, 'Th????m th????nh vi????n', 'member_editing\\.php$|member_editing\\.php\\?action=add$', 1553185530, 1553185530);

-- --------------------------------------------------------

--
-- Table structure for table `privilege_group`
--

DROP TABLE IF EXISTS `privilege_group`;
CREATE TABLE IF NOT EXISTS `privilege_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege_group`
--

INSERT INTO `privilege_group` (`id`, `name`, `position`, `created_time`, `last_updated`) VALUES
(1, 'S??????n ph??????m', 2, 1553185530, 1553185530),
(2, 'Th????nh vi????n', 4, 1553185530, 1553185530),
(3, '????????n h????ng', 3, 1553185530, 1553185530),
(4, 'Danh m??????c', 1, 1553185530, 1553185530);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `quantity`, `content`, `created_time`, `last_updated`) VALUES
(2, 'Gi????y b????ng ????????? 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 0, 'Gi????y b????ng ????????? 1 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(3, 'Gi????y b????ng ????????? 2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, 0, 'Gi????y b????ng ????????? 2 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(4, 'Gi????y b????ng ????????? 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, 0, 'Gi????y b????ng ????????? 3 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(5, 'Gi????y b????ng ????????? 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, 0, 'Gi????y b????ng ????????? 4 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(6, 'Gi????y b????ng ????????? 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, 0, 'Gi????y b????ng ????????? 5 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(7, 'Gi????y b????ng ????????? 6', 'uploads/06-03-2019/shoes-6.jpg', 580000, 0, 'Gi????y b????ng ????????? 6 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(8, 'Gi????y b????ng ????????? 7', 'uploads/06-03-2019/shoes-7.jpg', 1320000, 0, 'Gi????y b????ng ????????? 7 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(9, 'Gi????y b????ng ????????? 8', 'uploads/06-03-2019/shoes-8.jpg', 1450000, 0, 'Gi????y b????ng ????????? 8 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(10, 'Gi????y th?????? thao', 'uploads/06-03-2019/shoes-9.jpg', 1000000, 0, '<p>Gi&agrave;y b&oacute;ng ?????&aacute; 9 s&acirc;n c?????? nh&acirc;n t??????o</p>\r\n', 1552615987, 1554822153),
(11, 'Gi????y th?????? thao 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 0, 'Gi????y b????ng ????????? 1 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(12, 'Gi????y th?????? thao 2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, 0, 'Gi????y b????ng ????????? 2 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(13, 'Gi????y th?????? thao 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, 0, 'Gi????y b????ng ????????? 3 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(14, 'Gi????y th?????? thao 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, 0, 'Gi????y b????ng ????????? 4 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(15, 'Gi????y b????ng ????????? 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, 0, 'Gi????y b????ng ????????? 5 s????n c?????? nh????n t??????o', 1552615987, 1552615987),
(16, 'Gi????y b????ng ????????? 6', 'uploads/06-03-2019/shoes-6.jpg', 580000, 16, '<p>Gi&agrave;y b&oacute;ng ?????&aacute; 6 s&acirc;n c?????? nh&acirc;n t??????o</p>\r\n', 1552615987, 1606268741);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `status`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'Andn', '25d55ad283aa400af464c76d713c07ad', 1553185530, 0, 1553185530, 1553185530),
(3, 'writer', '??????????ng Ng??????c An', '25d55ad283aa400af464c76d713c07ad', 1553185530, 0, 1553185530, 1553185530),
(4, 'dangngocan', '?????ng Ng???c An', '25d55ad283aa400af464c76d713c07ad', 626918400, 1, 1608341654, 1608341654),
(6, 'Andn', '??????????ng Ng??????c An', '25d55ad283aa400af464c76d713c07ad', 626918400, 1, 1608341728, 1608341728),
(7, 'an.ngocdang@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 626918400, 1, 1608343408, 1608343408),
(10, 'an.ngocdang2@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 626918400, 1, 1608344154, 1608344154),
(11, 'andn@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 626918400, 1, 1608344204, 1608344204);

-- --------------------------------------------------------

--
-- Table structure for table `user_privilege`
--

DROP TABLE IF EXISTS `user_privilege`;
CREATE TABLE IF NOT EXISTS `user_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_privilege_ibfk_1` (`user_id`),
  KEY `privilege_id` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_privilege`
--

INSERT INTO `user_privilege` (`id`, `user_id`, `privilege_id`, `created_time`, `last_updated`) VALUES
(28, 1, 6, 1595430953, 1595430953),
(29, 1, 7, 1595430953, 1595430953),
(30, 1, 8, 1595430953, 1595430953),
(31, 1, 9, 1595430953, 1595430953),
(32, 1, 10, 1595430953, 1595430953),
(33, 1, 1, 1595430953, 1595430953),
(34, 1, 2, 1595430953, 1595430953),
(35, 1, 3, 1595430953, 1595430953),
(36, 1, 4, 1595430953, 1595430953),
(37, 1, 5, 1595430953, 1595430953),
(38, 1, 11, 1595430953, 1595430953),
(39, 1, 12, 1595430953, 1595430953),
(40, 1, 13, 1595430953, 1595430953),
(41, 1, 14, 1595430953, 1595430953),
(42, 1, 15, 1595430953, 1595430953),
(43, 1, 16, 1595430953, 1595430953),
(253, 3, 6, 1595430953, 1595430953),
(254, 3, 7, 1595430953, 1595430953),
(255, 3, 8, 1595430953, 1595430953),
(256, 3, 9, 1595430953, 1595430953),
(257, 3, 10, 1595430953, 1595430953),
(258, 3, 1, 1595430953, 1595430953),
(259, 3, 2, 1595430953, 1595430953),
(260, 3, 3, 1595430953, 1595430953),
(261, 3, 4, 1595430953, 1595430953),
(262, 3, 5, 1595430953, 1595430953);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `privilege`
--
ALTER TABLE `privilege`
  ADD CONSTRAINT `privilege_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `privilege_group` (`id`);

--
-- Constraints for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD CONSTRAINT `user_privilege_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
