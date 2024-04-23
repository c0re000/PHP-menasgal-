-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 11:10 PM
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
-- Database: `menas`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `image_path`, `created_at`, `title`) VALUES
(12, NULL, 'uploads/66252ba06d71c_jellyfish-1459351.jpg', '2024-04-21 15:07:12', 'jellyfish'),
(21, NULL, 'uploads/662814fd42391_fbbb277863e327361475ed374eb533e8 (1).jpg', '2024-04-23 20:07:25', 'porche 911'),
(22, NULL, 'uploads/6628155e47d3e_ca1aa0abc7ed31f1acf4e0f69ba937b6.jpg', '2024-04-23 20:09:02', 'bicycle'),
(23, NULL, 'uploads/662815845d0a5_11dce0a616e83789bc7c5f988f03d41e.jpg', '2024-04-23 20:09:40', 'anime'),
(24, NULL, 'uploads/662815b3e5687_4313520bdc9050e95dfe5359c1fcb857.jpg', '2024-04-23 20:10:27', 'shoe'),
(25, NULL, 'uploads/662815ed39f40_75ef07910177db50548a4c279a66b787.jpg', '2024-04-23 20:11:25', 'jacket 21'),
(26, NULL, 'uploads/6628163097376_9a5e578c1c513b4078e1f7a42349253e.jpg', '2024-04-23 20:12:32', 'old man'),
(27, NULL, 'uploads/662816553b0dc_6af6861baa1e9ae0e21278f39c324225.jpg', '2024-04-23 20:13:09', 'patric'),
(28, NULL, 'uploads/6628167588f6e_515172d48016c9c0f40d9dc7c354e0b4.jpg', '2024-04-23 20:13:41', 'face'),
(29, NULL, 'uploads/662816c3a265a_248f48a0eab8cfc34458a1b7139e6208.jpg', '2024-04-23 20:14:59', 'bow 2#'),
(30, NULL, 'uploads/662816f30955a_5cc52b700036ed278a97002cbdd118dc.jpg', '2024-04-23 20:15:47', 'registering'),
(31, NULL, 'uploads/6628170898be4_c14204b4c37da498f325e098c41b5942.jpg', '2024-04-23 20:16:08', 'cartoon');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'ubnt', '$2y$10$2IE44.CQkj06gqzzAowpreS8f.doGWThFbBDjAJOhZb8ka28DIhE2', 1),
(2, 'nigger', '$2y$10$XaEpr5vJCn04G.M8/OwiouHaxqe47bIET9jIRE5UuxYJm8nTLmYxa', 0),
(3, 'balls', '$2y$10$kSw4swCGD3vErRpk1lJEbOoQVk3IQ6yy0rITbgk6.UBxbI/56Fzpy', 1),
(4, 'admin', '$2y$10$ZIqJ04i/gDfK7CX4Y4Cd/uRPB/wDHXJ9ziuH/Y.dRhVCjqQP1jnXm', 0),
(8, 'nega', '$2y$10$DJ7HgNliDscrDFkzVdVOLOECau4FAeuh9yqK8oeel.GQ4Lg/8IMv6', 0),
(9, 'Zygis07', '$2y$10$S3EjOya2CVmWIZWg8IkPYOv9b5WQfx7TRdOrEaYWX404wUOGzFOB2', 0),
(10, 'baller', '$2y$10$OLksinJ5dh9A0hk7BHsBSu6wXSngxUasWfFbtpAOqcRrwztGLMGUS', 0),
(11, 'bigdawg', '$2y$10$1S.N31LF2vWVEAkeU33ls.ybNDaS3QAGrqiOzazZ50XpdnGnYHhJG', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
