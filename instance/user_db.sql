-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 30, 2024 at 12:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `name`, `image`, `created_at`) VALUES
(1, 'freefire', 'url_to_image', NULL),
(2, 'Mobile Legends', 'url_to_image', NULL),
(3, 'pubgmobile', 'url_to_image', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game_item`
--

CREATE TABLE `game_item` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game_package`
--

CREATE TABLE `game_package` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `diamond_amount` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_game_id` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `game_id`, `user_game_id`, `item_name`, `amount`, `payment_method`, `status`, `created_at`) VALUES
(5, 4, 2, '177265276 (2924)', '50 Diamonds', 6800, 'ShopeePay', 'confirmed', '2024-12-30 09:57:32'),
(8, 4, 1, '1255232323', '210 Diamonds', 27900, 'GoPay', 'confirmed', '2024-12-30 10:02:22'),
(9, 3, 3, '177265276 (2924)', '355 Diamonds', 46500, 'ShopeePay', 'confirmed', '2024-12-30 10:03:14'),
(10, 5, 1, '177265276 (2924)', '2720 Diamonds', 346900, 'ShopeePay', 'confirmed', '2024-12-30 10:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(128) DEFAULT NULL,
  `is_banned` tinyint(1) DEFAULT NULL,
  `banned_at` datetime DEFAULT NULL,
  `ban_reason` varchar(200) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `is_banned`, `banned_at`, `ban_reason`, `role`, `created_at`) VALUES
(1, 'userRio', 'rio@gmail.com', 'scrypt:32768:8:1$Druwj2Y64hQLDnAa$dde42001951a8cc8fb12d7dd91c1e2b7bda3c122f83cd3c2eba11b61b6a2def50b7b51a359aa544452b830a50790d4', 1, NULL, NULL, 'user', '2024-12-30 09:20:21'),
(2, 'pegaxus', 'pegaxus@gmail.com', 'scrypt:32768:8:1$bn03l9XODBkLZgBV$30dece0ee2cbf1fdc010512ab5543137e328e9bf6b03fa6e0c7c82566c9daae6c9e3c70089cf99b1286c3c2507e4f9', 1, NULL, NULL, 'user', '2024-12-30 09:21:03'),
(3, 'userAmirul', 'amirul@gmail.com', '$scrypt$ln=16,r=8,p=1$+N+7N2bMuVeqlXLOOeeckw$w5HWpp1xVyqx+7lAJ9qVv4zu2ioR9YcJfmskpmGbNG0', 0, NULL, NULL, 'user', '2024-12-30 09:33:21'),
(4, 'userElisa', 'elisa@gmail.com', '$scrypt$ln=16,r=8,p=1$YYwxhhBiTKnVGiMkxPi/Nw$9s/jI32tYOGJikNOdAVBeih43N6Nq7BBidB19UQXZMs', 0, NULL, NULL, 'user', '2024-12-30 09:51:17'),
(5, 'rio.4332301027', 'donutyo7@gmail.com', '$scrypt$ln=16,r=8,p=1$SSnlPOd8j5HynhMCgBBCCA$0rCWYSiE81iYm4sbimKRpXk4QHxVrg+UuvPfElEN5tQ', 0, NULL, NULL, 'user', '2024-12-30 10:50:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_item`
--
ALTER TABLE `game_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indexes for table `game_package`
--
ALTER TABLE `game_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_item`
--
ALTER TABLE `game_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_package`
--
ALTER TABLE `game_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game_item`
--
ALTER TABLE `game_item`
  ADD CONSTRAINT `game_item_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `game_package`
--
ALTER TABLE `game_package`
  ADD CONSTRAINT `game_package_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
