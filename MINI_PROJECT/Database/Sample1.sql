-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2024 at 11:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Sample1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` bigint(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `quantity` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `order_id`, `quantity`) VALUES
(82, 18, 10, 1),
(83, 18, 54, 1);

-- --------------------------------------------------------

--
-- Table structure for table `LOGIN`
--

CREATE TABLE `LOGIN` (
  `SLNO` int(20) NOT NULL,
  `user_id` int(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `status` varchar(5) NOT NULL,
  `time_out` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LOGIN`
--

INSERT INTO `LOGIN` (`SLNO`, `user_id`, `user_name`, `status`, `time_out`) VALUES
(1, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 00:42:52.00000'),
(2, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 00:44:06.00000'),
(3, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 13:15:44.00000'),
(4, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 13:38:15.00000'),
(5, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 13:45:30.00000'),
(6, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 13:47:40.00000'),
(7, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-15 13:49:19.00000'),
(8, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:04:55.00000'),
(9, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:20:23.00000'),
(10, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:22:05.00000'),
(11, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:25:08.00000'),
(12, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:26:00.00000'),
(13, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:35:46.00000'),
(14, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:36:43.00000'),
(15, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:39:26.00000'),
(16, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:39:50.00000'),
(17, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:40:27.00000'),
(18, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:42:14.00000'),
(19, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:44:52.00000'),
(20, 11, 'Sandesh', 'LOGIN', '2024-02-16 14:45:31.00000'),
(21, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:46:19.00000'),
(22, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:48:39.00000'),
(23, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:54:04.00000'),
(24, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 14:55:45.00000'),
(25, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:05:46.00000'),
(26, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:07:34.00000'),
(27, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:08:48.00000'),
(28, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:14:00.00000'),
(29, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:15:24.00000'),
(30, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:17:35.00000'),
(31, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:27:00.00000'),
(32, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:28:32.00000'),
(33, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:31:02.00000'),
(34, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:32:36.00000'),
(35, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:38:45.00000'),
(36, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:40:29.00000'),
(37, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:44:08.00000'),
(38, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 15:49:29.00000'),
(39, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 16:05:08.00000'),
(40, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 21:02:53.00000'),
(41, 11, 'Sandesh', 'LOGIN', '2024-02-16 21:27:47.00000'),
(42, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 21:41:59.00000'),
(43, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 22:07:13.00000'),
(44, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 22:19:38.00000'),
(45, 16, 'Sandeep Gowda K H', 'LOGIN', '2024-02-16 22:24:23.00000'),
(46, 11, 'Sandesh', 'LOGIN', '2024-02-16 22:25:05.00000'),
(47, 18, 'sandeep', 'LOGIN', '2024-02-17 14:15:59.00000'),
(48, 18, 'sandeep', 'LOGIN', '2024-02-17 14:31:15.00000'),
(49, 18, 'sandeep', 'LOGIN', '2024-02-17 14:58:05.00000'),
(50, 18, 'sandeep', 'LOGIN', '2024-02-17 14:59:12.00000'),
(51, 18, 'sandeep', 'LOGIN', '2024-02-17 15:01:01.00000'),
(52, 18, 'sandeep', 'LOGIN', '2024-02-17 15:02:38.00000'),
(53, 18, 'sandeep', 'LOGIN', '2024-02-17 15:02:59.00000'),
(54, 18, 'sandeep', 'LOGIN', '2024-02-17 15:06:04.00000'),
(55, 18, 'sandeep', 'LOGIN', '2024-02-17 15:10:36.00000'),
(56, 18, 'sandeep', 'LOGIN', '2024-02-17 15:14:42.00000'),
(57, 18, 'sandeep', 'LOGIN', '2024-02-17 15:16:23.00000'),
(58, 18, 'sandeep', 'LOGIN', '2024-02-17 15:18:52.00000'),
(59, 18, 'sandeep', 'LOGIN', '2024-02-17 15:20:57.00000'),
(60, 18, 'sandeep', 'LOGIN', '2024-02-17 15:23:30.00000'),
(61, 18, 'sandeep', 'LOGIN', '2024-02-17 15:24:32.00000'),
(62, 18, 'sandeep', 'LOGIN', '2024-02-17 15:27:03.00000'),
(63, 18, 'sandeep', 'LOGIN', '2024-02-17 15:30:46.00000'),
(64, 18, 'sandeep', 'LOGIN', '2024-02-17 15:49:49.00000'),
(65, 18, 'sandeep', 'LOGIN', '2024-02-17 15:50:48.00000'),
(66, 18, 'undefined', 'LOGIN', '2024-02-17 15:52:18.00000'),
(67, 18, 'Sandeep Gowda', 'LOGIN', '2024-02-17 15:54:51.00000');

-- --------------------------------------------------------

--
-- Table structure for table `LOGOUT`
--

CREATE TABLE `LOGOUT` (
  `SLNO` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `time_out` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LOGOUT`
--

INSERT INTO `LOGOUT` (`SLNO`, `user_id`, `user_name`, `status`, `time_out`) VALUES
(1, 16, 'Sandeep Gowda K H', 'LOGOUT', '2024-02-15 00:44:09.00000'),
(2, 16, 'Sandeep Gowda K H', 'LOGOUT', '2024-02-16 21:27:25.00000');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `order_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_name`, `order_id`, `address`, `price`) VALUES
(14, 16, 'Sandeep Gowda K H', 62, 'BANGALORE', 3500),
(15, 16, 'Sandeep Gowda K H', 9, 'BANGALORE', 27990);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) NOT NULL,
  `sale_price` float(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `rating` int(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `collection` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `sale_price`, `quantity`, `image`, `rating`, `category`, `sub_category`, `collection`) VALUES
(1, 'BIRDE', 'Customers (registered and KYC completed for Flipkart Pay Later) who are approved between 1st March 2024 00:00 to 31st March 2024 23:59 (both days inclusive) and completed their first EMI transaction using Flipkart Pay Later between 1st March 2024 00:00 to 31st March 2024 23:59 (both days inclusive) can avail the offer subject to the applicable terms and conditions of Flipkart Pay Later. Transactions that are canceled will not be eligible for this offer.', 1499.00, 498.00, 1, 'Shoes/s4.png', 5, 'Shoes', NULL, 'home_best_trending'),
(2, 'LIBERTY', 'Warrior Original Jungle Boot For Men - Light Weight Trekking Shoes Boots For Men  (Olive)', 2099.00, 1400.00, 1, 'Shoes/s2.png', 4, 'Shoes', NULL, 'home_best_trending'),
(3, 'Bacca Bucci', 'Bacca Bucci SNOWBALL 6 inches Moto Inspired Mountaineering Backpacking Hiking/Trekking outdoor boots for men for Beginners', 2999.00, 1589.00, 1, 'Shoes/s3.png', 5, 'Shoes', NULL, 'home_best_trending'),
(4, 'Red Tape', 'Red Tape Casual Lifestyle Shoes for Men | Soft Cushioned Insole, Slip-Resistance, Dynamic Feet Support, Arch Support & Shock Absorption', 5699.00, 1139.00, 1, 'Shoes/s5.png', 5, 'Shoes', NULL, 'home_best_trending'),
(6, 'Nordic Chair', 'It is a simple and practical seat , which adapts perfectly to your body. The backrest is made of polypropylene plastic. Available in a wide variety of colours, you can bring a touch of freshness and originality to your room.', 6250.00, 4000.00, 50, 'furniture/h9.png', 4, 'Furniture', NULL, 'best_deals_2'),
(7, 'Kruzo Aero Chair', 'A Classic Piece of Lightweight mid-century furniture. crafted from the best quality material. The Classic Side Chair is made of molded plastic in white color, with Wood Dowel Base, and its shape is reminiscent of mid-century design.', 2000.00, 1000.00, 100, 'furniture/h10.png', 5, 'Furniture', NULL, 'best_deals_2'),
(8, 'Ergonomic Chair', 'Ergonomic. An ergonomic chair is one that is built to support the human body – it takes a holistic approach to helping the body maintain good posture, sit comfortably, and work optimally from that chair. To enable this, these chairs offer adjustable height, lumbar support and armrests.', 14000.00, 8000.00, 100, 'furniture/h11.png', 5, 'Furniture', NULL, 'best_deals_2'),
(9, 'MarQ', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 47999.00, 27990.00, 100, 'appliances/ac/ac1.png', 5, 'Appliances', 'ac', 'best_deals'),
(10, 'Carrier', 'CARRIER 2024 Model AI Flexicool Convertible 6-in-1 Cooling 1.5 Ton 3 Star Split Inverter Dual Filtration with HD & Auto Cleanser AC with PM 2.5 Filter - White  (18K ESTER NEO EXi+ INVERTER R32 SPLIT AC (CAI18ER3R34F0), Copper Condenser)', 67790.00, 34990.00, 100, 'appliances/ac/ac2.png', 5, 'Appliances', 'ac', ''),
(11, 'Voltas', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 64990.00, 31900.00, 100, 'appliances/ac/ac3.png', 4, 'Appliances', 'ac', ''),
(12, 'Dalkin', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 58400.00, 36990.00, 100, 'appliances/ac/ac4.png', 3, 'Appliances', 'ac', ''),
(13, 'Lloyd', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 62990.00, 34999.00, 100, 'appliances/ac/a5.png', 4, 'Appliances', 'ac', ''),
(14, 'Godrej', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 49990.00, 32990.00, 100, 'appliances/ac/a6.png', 5, 'Appliances', 'ac', ''),
(15, 'IFB AI Convertible', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 71990.00, 39990.00, 100, 'appliances/ac/a7.png', 5, 'Appliances', 'ac', ''),
(16, 'LG AI Convertible', ' You can ensure effective and efficient cooling in your space with the MarQ by Flipkart 1-ton 3-star Split Inverter Air Conditioner. It features up to four cooling modes for optimal and energy-efficient performance. With the 4-in-1 cooling convertible mode, you can customize your experience based on your desired temperature and weather. Additionally, this air conditioner\'s efficient performance helps you save on electricity bills.', 75990.00, 39990.00, 100, 'appliances/ac/a8.png', 5, 'Appliances', 'ac', ''),
(17, 'LG 185L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 19899.00, 15490.00, 100, 'appliances/fridge/f1.png', 3, 'Appliances', 'fridge', ''),
(18, 'Whirlpool 235L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 34300.00, 24990.00, 100, 'appliances/fridge/f2.png', 3, 'Appliances', 'fridge', ''),
(19, 'Haier 190L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 26990.00, 20990.00, 100, 'appliances/fridge/f3.png', 5, 'Appliances', 'fridge', ''),
(20, 'Whirlpool 184L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 17650.00, 13290.00, 100, 'appliances/fridge/f4.png', 2, 'Appliances', 'fridge', ''),
(21, 'Samsung 1236L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 41990.00, 28290.00, 100, 'appliances/fridge/f5.png', 3, 'Appliances', 'fridge', ''),
(22, 'Kelvinator 95L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 15499.00, 10699.00, 100, 'appliances/fridge/f6.png', 2, 'Appliances', 'fridge', ''),
(23, 'Samsung 215L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 27990.00, 23600.00, 100, 'appliances/fridge/f7.png', 4, 'Appliances', 'fridge', ''),
(24, 'Godrej 180L', ' You can keep your fresh veggies, fruits, and frozen food items safe and hygienic for an extended period of time with the LG Single-door Refrigerator. It ensures that your electricity bills remain manageably low even after extended use because of its energy-saving performance. In addition, this refrigerator has Moist N Fresh, a lattice-styled box cover that effectively maintains moisture. Moreover, this refrigerator helps you make ice in as little as 108 minutes with its rapid ice-making capabilities.', 21090.00, 15990.00, 100, 'appliances/fridge/f8.png', 3, 'Appliances', 'fridge', ''),
(25, 'XElectron 80cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 17999.00, 6999.00, 100, 'appliances/tv/t1.png', 5, 'Appliances', 'tv', ''),
(26, 'Dayanora 60cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 12499.00, 6999.00, 100, 'appliances/tv/t2.png', 4, 'Appliances', 'tv', ''),
(27, 'Samsung 80cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 18900.00, 14990.00, 100, 'appliances/tv/t3.png', 3, 'Appliances', 'tv', ''),
(28, 'Infinix Y1 109cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 24999.00, 15499.00, 100, 'appliances/tv/t4.png', 4, 'Appliances', 'tv', ''),
(29, 'Thomson Phoenix 108cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 31999.00, 20999.00, 100, 'appliances/tv/t5.png', 3, 'Appliances', 'tv', ''),
(30, 'Thomson Alpha 80cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 14999.00, 8299.00, 100, 'appliances/tv/t6.png', 5, 'Appliances', 'tv', ''),
(31, 'Dyanora Sigma 80cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 18999.00, 8599.00, 100, 'appliances/tv/t7.png', 5, 'Appliances', 'tv', 'best_deals'),
(32, 'Thomson FA Series 108cm', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 29999.00, 16999.00, 100, 'appliances/tv/t8.png', 4, 'Appliances', 'tv', ''),
(33, 'Voltas Beko 9kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 22090.00, 11990.00, 100, 'appliances/washingmachine/w1.png', 5, 'Appliances', 'wm', ''),
(34, 'Voltas Beko 7kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 15290.00, 8990.00, 100, 'appliances/washingmachine/w2.png', 3, 'Appliances', 'wm', ''),
(35, 'Realme Tech 7kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 12490.00, 7690.00, 100, 'appliances/washingmachine/w3.png', 5, 'Appliances', 'wm', ''),
(36, 'Whirlpool 7kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 19350.00, 14990.00, 100, 'appliances/washingmachine/w4.png', 4, 'Appliances', 'wm', ''),
(37, 'LG 7kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 14190.00, 11490.00, 100, 'appliances/washingmachine/w5.png', 2, 'Appliances', 'wm', ''),
(38, 'MarQ 6kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 10010.00, 6690.00, 100, 'appliances/washingmachine/w6.png', 4, 'Appliances', 'wm', ''),
(39, 'Voltas Beko 6.5kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 24490.00, 13990.00, 100, 'appliances/washingmachine/w7.png', 4, 'Appliances', 'wm', ''),
(40, 'Samsung 7kg', ' The Television has seamless connetivity and packed with multiple ports like Headphone jack, AV, USB, Audio In, VGA, Coax & HDMI. These host of ports enable us to connect any external device quick & hassle-Free. Additionally we can connect it with Fire TV Stick to make the enjoyment more better.', 19800.00, 15990.00, 100, 'appliances/washingmachine/w8.png', 5, 'Appliances', 'wm', ''),
(41, 'Lenovo Tab', 'The Lenovo Tab series offers versatile tablets with vibrant displays, various processors, and ample storage. Running on Android, they provide access to apps via Google Play. With Wi-Fi and optional cellular connectivity, sleek designs, and additional features like cameras and expandable storage, they\'re suitable for diverse user needs.', 1000.00, 7999.00, 100, 'mobiles/m1.png', 3, 'Mobile', '', ''),
(46, 'Apple 12', 'The Apple mobile device is an innovative blend of sleek design and cutting-edge technology. With its intuitive interface and powerful performance, it offers seamless access to a myriad of apps, games, and services. Its high-resolution display and advanced camera capabilities redefine mobile experiences, making it a coveted choice for users worldwide.', 65999.00, 62999.00, 100, 'mobiles/m2.png', 4, 'Mobile', '', ''),
(47, 'Vivo y20', 'The Vivo Y20 boasts a stylish design and impressive features at an accessible price point. Equipped with a large display, powerful battery, and AI triple camera setup, it delivers a premium user experience. Its smooth performance and sleek design make it an ideal choice for those seeking affordability without compromising on quality.', 15000.00, 12999.00, 1000, 'mobiles/m3.png', 4, 'Mobile', '', ''),
(48, 'Nokia', 'Nokia keypad phones, they boast durable build quality and long battery life. Featuring tactile keypads for easy typing, they offer essential communication features like calling and texting. With sturdy designs and reliability, Nokia keypad phones provide a dependable option for users seeking simplicity and functionality.', 2500.00, 2000.00, 100, 'mobiles/m4.png', 5, 'Mobile', '', ''),
(49, 'Mi Note 5 ', 'The Mi Note 5 by Xiaomi features a stunning display, powerful processor, and ample storage options. Running on MIUI, it offers access to a wide range of apps. With reliable connectivity options like Wi-Fi and 4G/LTE, along with impressive camera capabilities and a sleek design, the Mi Note 5 is a top choice for smartphone users.', 20500.00, 18999.00, 100, 'mobiles/m5.png', 3, 'Mobile', '', ''),
(50, 'Toucan LifeStyle', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1299.00, 629.00, 100, 'fashion/kids_collection/k1.png', 4, 'Kids', '', ''),
(51, 'Huawei Matr pro 4g', 'The Mi Note 5 by Xiaomi features a stunning display, powerful processor, and ample storage options. Running on MIUI, it offers access to a wide range of apps. With reliable connectivity options like Wi-Fi and 4G/LTE, along with impressive camera capabilities and a sleek design, the Mi Note 5 is a top choice for smartphone users.', 10000.00, 9000.00, 100, 'mobiles/m6.png', 5, 'Mobile', '', ''),
(52, 'Hopscotch', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 809.00, 531.00, 100, 'fashion/kids_collection/k2.png', 5, 'Kids', '', ''),
(53, 'Samsung S20', 'The Samsung Galaxy S20 boasts cutting-edge features including a high-resolution display, powerful processor, and versatile camera system. Running on Samsung\'s One UI, it offers access to a plethora of apps. With 5G connectivity, advanced camera capabilities, and sleek design, the Samsung S20 sets a new standard for flagship smartphones.', 60000.00, 55000.00, 100, 'mobiles/m7.png', 5, 'Mobile', '', ''),
(54, 'Cupidvibe', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 999.00, 721.00, 100, 'fashion/kids_collection/k3.png', 3, 'Kids', '', ''),
(55, 'Oppo A5', 'The Oppo A5 combines sleek design with reliable performance. Featuring a vibrant display, efficient processor, and ample storage, it runs on ColorOS for access to various apps. With 4G connectivity, dual rear cameras for photography, and a long-lasting battery, the Oppo A5 offers great value for budget-conscious users.', 13000.00, 12000.00, 1000, 'mobiles/m8.png', 3, 'Mobile', '', ''),
(56, 'White Button', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1999.00, 929.00, 100, 'fashion/kids_collection/k4.png', 4, 'Kids', '', ''),
(57, 'Nire Enterprise', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1599.00, 435.00, 100, 'fashion/kids_collection/k5.png', 4, 'Kids', '', ''),
(58, 'Tagas', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1499.00, 539.00, 100, 'fashion/kids_collection/k6.png', 5, 'Kids', '', ''),
(59, 'Googo Gaaga', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1400.00, 899.00, 100, 'fashion/kids_collection/k7.png', 3, 'Kids', '', ''),
(60, 'T2F', 'These one piece Frocks are made of blended cotton fabric. It has beautiful printed design in front , making it more attractive and can be used to adorn your princess in all occassions you can think for. Your princess will outshine everyone. This design comes in many beautiful colors and sizes for you to choose. This dress is sleeveless. A perfect outfit to gift & choose .', 1000.00, 539.00, 100, 'fashion/kids_collection/k8.png', 4, 'Kids', '', ''),
(61, 'Maybelline', 'Maybelline foundations offer a seamless blend with lightweight formulas, providing natural-looking coverage. Available in a variety of shades to match every skin tone, they offer long-lasting wear and a matte or dewy finish. With options for all skin types, Maybelline foundations deliver a flawless complexion for any occasion.', 499.00, 300.00, 100, 'beauty/b1.png', 4, 'Beauty', '', ''),
(62, 'Chanel', 'Chanel is a luxury fashion and beauty brand renowned for its timeless elegance and sophistication. From iconic fragrances like Chanel No. 5 to haute couture fashion collections, Chanel epitomizes luxury and refinement. With a commitment to craftsmanship and innovation, Chanel continues to set trends in fashion, beauty, and style worldwide.', 3999.00, 3500.00, 100, 'beauty/b2.png', 5, 'Beauty', '', ''),
(63, 'Sauvage', '\"Sauvage\" is a popular men\'s fragrance by Dior, renowned for its bold and captivating scent. With notes of bergamot, pepper, and ambroxan, Sauvage exudes a rugged yet sophisticated charm. Its long-lasting fragrance and versatile appeal make it a timeless choice for the modern man, evoking a sense of adventure and allure.', 1499.00, 1200.00, 100, 'beauty/b3.png', 5, 'Beauty', '', ''),
(64, 'Dove', 'Dove moisturizers offer nourishing hydration for soft and smooth skin. Infused with gentle formulas and enriched with essential nutrients, Dove moisturizers deeply hydrate without feeling greasy. Suitable for all skin types, they provide long-lasting moisture and a healthy, radiant glow. Dove moisturizers are a daily essential for maintaining hydrated and nourished skin.', 400.00, 300.00, 100, 'beauty/b4.png', 3, 'Beauty', '', ''),
(65, 'Sugar ', 'Sugar lipsticks are renowned for their rich, creamy formulas and vibrant color payoff. Infused with moisturizing ingredients like shea butter and oils, they provide long-lasting hydration while delivering intense pigment. From bold reds to subtle nudes, sugar lipsticks offer a diverse range of shades to complement any skin tone. Perfect for adding a pop of color and moisture to your lips, sugar lipsticks are a must-have in any makeup collection.', 700.00, 500.00, 100, 'beauty/b5.png', 3, 'Beauty', '', ''),
(66, 'Lykaa', 'ColourPop lipsticks offer a diverse range of trendy shades and innovative formulas at an affordable price. With options ranging from matte to glossy finishes, they provide long-lasting wear and comfortable application. Whether you\'re looking for bold statement colors or everyday neutrals, ColourPop lipsticks have something for everyone.', 899.00, 699.00, 100, 'beauty/b6.png', 4, 'Beauty', '', ''),
(67, 'Fit Me Foundation', 'Fit Me Foundation by Maybelline is celebrated for its lightweight formula and extensive shade range. Designed to blend seamlessly with the skin, it offers a natural, matte finish that lasts all day. With options for different skin types and undertones, Fit Me Foundation delivers customizable coverage for a flawless complexion.', 999.00, 799.00, 100, 'beauty/b7.png', 5, 'Beauty', '', ''),
(68, 'Gold Moisture Combo', '\"Gold Moisture Combo\" could refer to a skincare product or kit designed to provide hydration and nourishment to the skin, possibly containing ingredients such as gold extracts or gold-infused formulations. However, without more specific information, it\'s challenging to provide a detailed description. If you have a particular product or brand in mind, please provide additional details so I can assist you better.', 3999.00, 3499.00, 100, 'beauty/b8.png', 5, 'Beauty', '', ''),
(69, 'Himalaya Hari Care Products', '\"Himalaya Hair Care Products\" are a range of hair care solutions offered by Himalaya Herbals, a well-known brand specializing in herbal and natural personal care products. Himalaya\'s hair care range includes shampoos, conditioners, hair oils, and hair masks, formulated with natural ingredients like neem, amla, henna, and aloe vera. These products aim to address various hair concerns such as dandruff, hair fall, dryness, and damage, providing gentle and effective solutions for healthy and nourished hair.', 5500.00, 4500.00, 100, 'beauty/b9.png', 5, 'Beauty', '', ''),
(70, 'Dyson Supersonic Hair Dryer & Straightner', 'The Dyson Supersonic Hair Dryer & Straightener combines cutting-edge technology with sleek design. Its intelligent heat control prevents extreme temperatures, protecting hair from damage. With fast drying and styling capabilities, it offers smooth, shiny results. Lightweight and balanced, it ensures comfortable use, making every styling session effortless and efficient.', 2500.00, 2000.00, 100, 'beauty/b10.png', 5, 'Beauty', '', ''),
(71, 'Sebastian Combo', 'The Sebastian combo includes a range of professional hair care products designed to nourish, style, and revitalize hair. From shampoos and conditioners to styling gels and sprays, Sebastian offers a comprehensive solution for all hair types. With innovative formulas and salon-quality results, the Sebastian combo is a must-have for those seeking luxurious hair care.', 2500.00, 1999.00, 1000, 'beauty/b11.png', 3, 'Beauty', '', ''),
(72, 'Shock Men Wax', 'The Sebastian combo includes a range of professional hair care products designed to nourish, style, and revitalize hair. From shampoos and conditioners to styling gels and sprays, Sebastian offers a comprehensive solution for all hair types. With innovative formulas and salon-quality results, the Sebastian combo is a must-have for those seeking luxurious hair care.', 499.00, 299.00, 100, 'beauty/b12.png', 2, 'Beauty', '', ''),
(73, 'Redken Combo', 'The Redken combo comprises a curated selection of high-performance hair care products renowned for their professional quality and innovative formulas. From shampoos and conditioners tailored to specific hair needs to styling products that deliver lasting results, Redken offers a comprehensive solution for achieving healthy, vibrant hair. Trusted by stylists worldwide, the Redken combo ensures salon-worthy results at home.', 999.00, 899.00, 100, 'beauty/b13.png', 4, 'Beauty', '', ''),
(74, 'Nivea Lotion ', 'Nivea lotion is a beloved skincare staple known for its rich, hydrating formula. Infused with nourishing ingredients like shea butter and vitamin E, it deeply moisturizes the skin, leaving it soft and smooth. Available in various formulations for different skin types, Nivea lotion provides long-lasting hydration and helps maintain healthy, radiant skin.', 1200.00, 999.00, 100, 'beauty/b14.png', 3, 'Beauty', '', ''),
(75, 'Seda Shampoo', 'Seda shampoo offers a refreshing and nourishing cleansing experience for your hair. Formulated with carefully selected ingredients, it effectively removes dirt and impurities while leaving your hair feeling soft and manageable. With a range of options tailored to different hair types and concerns, Seda shampoo helps you achieve healthy, beautiful hair with every wash.', 450.00, 339.00, 100, 'beauty/b15.png', 2, 'Beauty', '', ''),
(76, 'Axe Dark ', 'Axe Dark Temptation is a captivating men\'s fragrance known for its alluring blend of sweet and spicy notes. With hints of chocolate, amber, and red peppercorn, it exudes a seductive aroma that leaves a lasting impression. Perfect for any occasion, Axe Dark Temptation adds a touch of mystery and sophistication to your personal style.', 350.00, 299.00, 100, 'beauty/b16.png', 2, 'Beauty', '', ''),
(77, 'White Embellished Gown', 'An embellished gown is the epitome of elegance and glamour, adorned with intricate details such as sequins, beads, lace, or embroidery. This exquisite attire is perfect for special occasions like galas, weddings, or red carpet events, showcasing timeless beauty and sophistication. The shimmering embellishments capture the light, creating a dazzling effect that ensures you stand out in any crowd, making it a stunning choice for those seeking to make a memorable statement.', 1500.00, 1200.00, 100, 'fashion/womens_collection/g19.png', 3, 'Women', '', ''),
(78, 'Girl Maxi Dress', 'A girl\'s maxi dress gown is a charming and versatile garment designed for special occasions or everyday wear. It features a long, flowing silhouette that exudes grace and femininity, with various styles available, including floral prints, solid colors, or delicate patterns. Whether for a formal event, a casual outing, or a beach vacation, a maxi dress gown offers comfort, style, and effortless elegance for girls of all ages.', 2500.00, 2200.00, 100, 'fashion/womens_collection/g16.png', 4, 'Women', '', ''),
(79, 'White Bridal Boutique', 'A girl\'s maxi dress gown is a charming and versatile garment designed for special occasions or everyday wear. It features a long, flowing silhouette that exudes grace and femininity, with various styles available, including floral prints, solid colors, or delicate patterns. Whether for a formal event, a casual outing, or a beach vacation, a maxi dress gown offers comfort, style, and effortless elegance for girls of all ages.', 3500.00, 3000.00, 100, 'fashion/womens_collection/g17.png', 4, 'Women', '', ''),
(80, 'Bridal Lehenga', 'A bridal lehenga is a traditional and opulent ensemble worn by brides in South Asian cultures, especially in India. It typically consists of a heavily embellished blouse, a full-length skirt, and a dupatta (scarf). These garments are intricately adorned with embroidery, beads, sequins, and other decorative elements, creating a stunning and regal look for the bride. Bridal lehengas come in a variety of colors, but red is the most popular choice symbolizing joy and prosperity. They are often worn during wedding ceremonies and celebrations, making the bride the center of attention with their exquisite beauty and elegance.', 13500.00, 11999.00, 100, 'fashion/womens_collection/g20.png', 5, 'Women', '', ''),
(81, 'One Piece Frock ', 'A one-piece frock is a stylish and versatile garment that features a single piece design, typically consisting of a fitted bodice and a flared or gathered skirt. It\'s a popular choice for various occasions, ranging from casual outings to semi-formal events, depending on the fabric and embellishments. One-piece frocks come in a wide range of styles, lengths, and colors, making them suitable for girls and women of all ages. Whether adorned with playful prints, elegant lace, or intricate embroidery, a one-piece frock offers comfort, ease of wear, and effortless chic style.', 1500.00, 999.00, 100, 'fashion/womens_collection/g21.png', 4, 'Women', '', ''),
(82, 'Trendmalls Floral Printet Lehenga ', 'Trendmalls\' Floral Printed Lehenga is a captivating blend of tradition and modernity. Crafted with exquisite floral patterns, it exudes elegance and grace. The vibrant colors and intricate designs make it a perfect choice for special occasions. With its luxurious fabric and impeccable tailoring, it promises to make every woman feel like royalty.', 3000.00, 2750.00, 100, 'fashion/womens_collection/g23.png', 3, 'Women', '', ''),
(83, 'Ellie Wilde by mon cheri ', 'Ellie Wilde by Mon Cheri dresses are the epitome of party glamour. Featuring eye-catching designs, vibrant colors, and playful silhouettes, these dresses are perfect for making a statement on the dance floor. From sequined mini dresses to flowing chiffon gowns, Ellie Wilde dresses ensure you\'ll be the life of the party, exuding confidence and style all night long.', 3500.00, 3250.00, 100, 'fashion/womens_collection/g24.png', 4, 'Women', '', ''),
(84, 'Mermaid gown formal dress ', 'A mermaid gown is a glamorous formal dress characterized by its fitted silhouette through the bodice and hips, and then flaring out dramatically from the knees or lower thighs, resembling the shape of a mermaid\'s tail. This style accentuates curves and offers a sophisticated and elegant look for formal events such as galas, proms, or black-tie affairs. Typically made from luxurious fabrics like satin, silk, or lace, mermaid gowns often feature intricate beadwork, embroidery, or embellishments to add to their allure.', 3150.00, 2950.00, 100, 'fashion/womens_collection/g25.png', 3, 'Women', '', ''),
(85, 'Mens Tradtional Kurtha ', 'Traditional Kurta for men is a staple South Asian garment, featuring loose tunic-style design, often crafted from fabrics like cotton or silk. With intricate embroidery and embellishments, it pairs with Churidar or jeans, reflecting cultural heritage. Accessorized with a dupatta or Nehru jacket, it\'s perfect for weddings or festivals.', 2500.00, 1999.00, 100, 'fashion/mens_collection/d1.png', 5, 'Men', '', ''),
(86, 'Puma Hoodie', 'The Puma hoodie is a stylish and comfortable garment, featuring the iconic Puma logo. Made from soft, high-quality materials, it offers warmth and durability. Available in various colors and designs, it\'s perfect for casual wear, workouts, or athleisure looks, embodying Puma\'s blend of fashion and functionality.', 2500.00, 1999.00, 100, 'fashion/mens_collection/d2.png', 5, 'Men', '', ''),
(87, 'Raymond Viscose Solid Suit', 'The Raymond Viscose Solid Suit offers sophistication with a modern touch. Crafted from high-quality viscose fabric, it boasts a luxurious feel and subtle sheen. Its solid color exudes elegance, perfect for formal occasions or professional settings. Tailored for a sleek fit, it ensures both style and comfort, making it a timeless wardrobe staple.', 7500.00, 5999.00, 100, 'fashion/mens_collection/d3.png', 5, 'Men', '', ''),
(88, 'Casual Brown Half Pant', 'The casual brown half pant is a versatile wardrobe essential, ideal for relaxed outings or casual events. Made from comfortable and breathable fabric, it provides ease of movement and comfort. Its brown color adds a touch of warmth and earthiness to outfits, pairing well with various tops for a laid-back yet stylish look.', 750.00, 600.00, 100, 'fashion/mens_collection/d4.png', 3, 'Men', '', ''),
(89, 'Sennheiser headphones', 'Sennheiser headphones offer exceptional sound quality, comfort, and durability. With advanced audio technology and sleek design, they provide immersive listening experiences for music enthusiasts and professionals alike. Renowned for their clarity and fidelity, Sennheiser headphones are the pinnacle of audio excellence, delivering premium performance with every use.', 19990.00, 15990.00, 100, 'electronics/headphones/h1.png', 4, 'Electronics', 'headphones', ''),
(90, 'Allen Solley Jeans Combo', 'The Allen Solly Jeans Combo offers versatility and style. Featuring a selection of well-crafted denim jeans in various washes and cuts, it caters to different preferences. From classic straight-leg to trendy slim-fit designs, each pair ensures comfort and durability. Perfect for everyday wear, these jeans effortlessly elevate your casual wardrobe with Allen Solly\'s signature quality and sophistication.', 4000.00, 3500.00, 100, 'fashion/mens_collection/d5.png', 4, 'Men', '', ''),
(91, ' Petter England Trousers', 'Peter England trousers combine style and comfort for a polished look. Crafted from high-quality materials, they offer durability and a tailored fit. Available in various colors and patterns, from classic solids to contemporary prints, they suit both formal and casual occasions. These trousers epitomize Peter England\'s commitment to quality and timeless elegance.', 750.00, 700.00, 100, 'fashion/mens_collection/d6.png', 4, 'Men', '', ''),
(92, 'Adidas Red Jacket', 'The Adidas Red Jacket blends sporty style with functionality. Made from high-performance materials, it provides warmth and protection against the elements. The vibrant red color adds a bold statement to your wardrobe, while the iconic Adidas logo reflects a commitment to quality and style. Perfect for workouts or casual outings, this jacket combines fashion and function seamlessly.', 2100.00, 1950.00, 100, 'fashion/mens_collection/d7.png', 5, 'Men', '', ''),
(93, 'Brooks Brothers Shirts', 'Brooks Brothers Shirts Combo offers sophistication and versatility. With a selection of high-quality dress shirts crafted from premium fabrics, it ensures comfort and style. The combo may include classic Oxford shirts, refined pinpoint or broadcloth designs, and contemporary patterns. Ideal for both professional settings and casual occasions, this combo embodies Brooks Brothers\' timeless elegance and commitment to quality.', 3500.00, 3150.00, 100, 'fashion/mens_collection/d8.png', 3, 'Men', '', ''),
(94, 'boat Rockerz 255 pro+', 'Boat Rockerz 255 Pro+ headphones combine style, comfort, and performance. With advanced Bluetooth technology, they offer seamless connectivity and impressive sound quality. These headphones boast a sleek design, ergonomic fit, and long battery life, making them perfect for workouts, commutes, or everyday listening, delivering an immersive audio experience.', 3990.00, 999.00, 100, 'electronics/headphones/h2.png', 4, 'Electronics', 'headphones', ''),
(95, 'Canon 500C', 'The Canon 500C is a digital single-lens reflex camera with a 15.1-megapixel sensor and DIGIC 4 image processor. It offers ISO 100-3200 (expandable to 12800), Live View, Full HD video recording, and a 3-inch LCD screen. With a 9-point autofocus system, it provides sharp and detailed images, ideal for photography enthusiasts.', 35000.00, 33000.00, 100, 'electronics/camera/c3.png', 4, 'Electronics', 'camera', ''),
(96, 'Omega 3C400', 'The Omega 3C400 camera is a versatile imaging device, combining advanced features with user-friendly design. With a high-resolution sensor, precise autofocus system, and intuitive controls, it delivers exceptional image quality and performance. Its compact form factor makes it ideal for both professional photographers and enthusiasts seeking creative flexibility.', 24999.00, 19999.00, 100, 'electronics/camera/c1.png', 4, 'Electronics', 'camera', ''),
(97, 'Nikon D850', 'The Nikon D850 is a professional-grade DSLR camera known for its exceptional image quality and versatility. With a 45.7-megapixel full-frame sensor, it delivers stunningly detailed photos and 4K UHD video. Its advanced autofocus system, fast continuous shooting speed, and robust build make it ideal for a wide range of photography genres, from landscapes to sports. The tilting touchscreen and extensive connectivity options further enhance its usability and appeal to photographers seeking uncompromising performance.', 45000.00, 43999.00, 100, 'electronics/camera/c2.png', 5, 'Electronics', 'camera', ''),
(98, 'Nikon c800', 'The Nikon C800 is a high-resolution DSLR camera beloved by professionals and enthusiasts alike. Boasting a 36.3-megapixel full-frame sensor, it delivers outstanding image quality with rich detail and dynamic range. Its advanced autofocus system ensures precise focusing, while its sturdy build and ergonomic design make it suitable for demanding shooting conditions. With Full HD video recording capabilities and versatile connectivity options, the Nikon D800 excels in various photography genres, from portraits to landscapes.', 50000.00, 43999.00, 100, 'electronics/camera/c7.png', 4, 'Electronics', 'camera', ''),
(99, 'OPPO Enco Air 2 pro', 'OPPO Enco Air 2 Pro earbuds merge cutting-edge technology with sleek design. Featuring active noise cancellation, they deliver immersive sound quality in any environment. With a comfortable fit and long battery life, they\'re perfect for music lovers and professionals seeking premium audio performance and convenience on the go.', 4999.00, 3495.00, 100, 'electronics/headphones/h3.png', 5, 'Electronics', 'headphones', ''),
(100, 'JBL C100SI Wired', 'JBL C100SI Wired earphones offer impressive audio performance with powerful bass and clear sound quality. Their lightweight and comfortable design make them ideal for extended wear. With a built-in microphone and remote control, they provide convenient hands-free calling and music playback control. Perfect for everyday use and on-the-go listening.', 1299.00, 599.00, 100, 'electronics/headphones/h4.png', 4, 'Electronics', 'headphones', ''),
(101, 'boat Bassheads 105', 'The Boat Bassheads 105 earphones are crafted for immersive audio experiences. With dynamic drivers, they deliver powerful bass and clear sound quality. The lightweight design ensures comfort during extended use. Featuring an in-line microphone and multifunction button, they offer seamless control over calls and music playback. Perfect for on-the-go listening.', 999.00, 399.00, 100, 'electronics/headphones/h5.png', 4, 'Electronics', 'headphones', ''),
(102, 'OnePlus Bullets Z2 Bluetooth', 'The OnePlus Bullets Z2 Bluetooth earphones offer high-quality audio performance and convenience. With Bluetooth connectivity, they provide seamless pairing and freedom from wires. Their lightweight and ergonomic design ensure comfort during extended wear. Featuring fast charging and long battery life, they\'re perfect for on-the-go lifestyles.', 2299.00, 1499.00, 100, 'electronics/headphones/h6.png', 5, 'Electronics', 'headphones', 'best_deals'),
(103, 'boAt Airdopes141', 'The boAt Airdopes 141 earbuds offer a blend of style, comfort, and performance. With Bluetooth connectivity, they provide seamless pairing and freedom from wires. Featuring touch controls and voice assistant support, they offer convenient operation. Their sleek design, secure fit, and immersive sound quality make them perfect for active lifestyles.', 4490.00, 1299.00, 100, 'electronics/headphones/h7.png', 3, 'Electronics', 'headphones', ''),
(104, 'Zebronics Thunder', 'Zebronics Thunder headphones offer powerful sound with deep bass and clear audio quality. Featuring a comfortable over-ear design, they provide extended wear comfort. With a built-in microphone and remote control, they offer convenient hands-free calling and music playback control. Perfect for immersive listening experiences at home or on the go.', 1399.00, 799.00, 100, 'electronics/headphones/h8.png', 4, 'Electronics', 'headphones', ''),
(105, 'Canon E500', 'The Canon E500 is a reliable all-in-one printer designed for home and small office use. It offers high-quality printing, scanning, and copying capabilities with efficient performance. Featuring easy-to-use controls and a compact design, it fits seamlessly into any workspace. With affordable ink options, it\'s a cost-effective solution for everyday printing needs.', 100000.00, 95000.00, 100, 'electronics/camera/c4.png', 5, 'Electronics', 'camera', 'best_deals');

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `feedback` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile_no` bigint(11) NOT NULL,
  `address` text NOT NULL,
  `account_no` int(11) NOT NULL,
  `pan_no` varchar(50) NOT NULL,
  `aadhar_no` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `name`, `email`, `password`, `mobile_no`, `address`, `account_no`, `pan_no`, `aadhar_no`) VALUES
(1, 'Sandeep Gowda K H', 'sandeeppp0001@gmail.com', '12345', 8861873205, 'maagadi road', 1234567, 'BXPH4927B', 814777366217);

-- --------------------------------------------------------

--
-- Table structure for table `seller_log`
--

CREATE TABLE `seller_log` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(30) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_price` bigint(11) NOT NULL,
  `sale_price` bigint(20) DEFAULT NULL,
  `time_stamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(20) NOT NULL,
  `email` varchar(59) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`) VALUES
(1, 'sandeeppp0001@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `mobile_no`, `address`) VALUES
(18, 'Sandeep Gowda K H', 'sandeeppp0001@gmail.com', '123', 8861873205, 'Bangalore');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_order_relation` (`order_id`),
  ADD KEY `cart_user_relation` (`user_id`);

--
-- Indexes for table `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `LOGOUT`
--
ALTER TABLE `LOGOUT`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `seller_log`
--
ALTER TABLE `seller_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mob_unique` (`mobile_no`),
  ADD UNIQUE KEY `email_unique` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `LOGIN`
--
ALTER TABLE `LOGIN`
  MODIFY `SLNO` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `LOGOUT`
--
ALTER TABLE `LOGOUT`
  MODIFY `SLNO` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `Review`
--
ALTER TABLE `Review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_log`
--
ALTER TABLE `seller_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_order_relation` FOREIGN KEY (`order_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_user_relation` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
