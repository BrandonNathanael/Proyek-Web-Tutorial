-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2025 at 05:27 AM
-- Server version: 10.11.5-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `price`, `image_path`) VALUES
(1, 'asdw', 'asdwd', 1321235.00, 'assets/default-course.jpg'),
(2, 'AI', 'TESTES', 1000000.00, 'https://sbscyber.com/hs-fs/hubfs/Images/BlogImages/AdobeStock_604631734.jpeg?width=4000&height=2032&name=AdobeStock_604631734.jpeg'),
(3, 'Kursus ling dijamin imortal', 'air tenang', 69000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmwqjVY4DxLPu5zPSNKewT5JXGYFVGFSzCbw&s'),
(4, 'Tutorial Bonk', 'Jadi disini kita akan melihat tutorial gaming dewa', 0.00, 'https://www.youtube.com/watch?v=3MU9ACRt78c');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` enum('video','document','image','link') NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `course_id`, `title`, `description`, `file_path`, `file_type`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Akulah ai', 'Deskripsi Singkat\r\nKursus ini memperkenalkan konsep dasar Kecerdasan Buatan (AI) dan penerapannya dalam kehidupan sehari-hari. Peserta akan mempelajari fundamental AI, machine learning, dan contoh kasus nyata tanpa perlu latar belakang pemrograman yang mendalam.\r\n\r\nTujuan Pembelajaran\r\nSetelah menyelesaikan kursus ini, peserta akan mampu:\r\n\r\nMemahami definisi, sejarah, dan jenis-jenis AI.\r\n\r\nMenjelaskan perbedaan antara AI, Machine Learning (ML), dan Deep Learning (DL).\r\n\r\nMengenal alat dan platform AI sederhana (contoh: Google Teachable Machine).\r\n\r\nMenerapkan konsep AI dalam proyek mini (contoh: klasifikasi gambar atau teks).\r\n\r\nStruktur Materi\r\nMinggu 1: Pengenalan AI\r\nApa itu AI?\r\n\r\nDefinisi dan contoh aplikasi (ChatGPT, rekomendasi Netflix).\r\n\r\nSejarah Perkembangan AI.\r\n\r\nJenis-jenis AI:\r\n\r\nAI sempit (Narrow AI) vs. AI umum (General AI).\r\n\r\nTugas: Diskusi kasus AI di kehidupan sehari-hari.\r\n\r\nMinggu 2: Dasar Machine Learning\r\nPerbedaan AI, ML, dan DL.\r\n\r\nSupervised vs. Unsupervised Learning.\r\n\r\nContoh algoritma sederhana:\r\n\r\nDecision Tree untuk prediksi.\r\n\r\nPraktik: Menggunakan Google Teachable Machine untuk klasifikasi gambar.\r\n\r\nMinggu 3: Neural Network Sederhana\r\nKonsep dasar neural network (tanpa matematika kompleks).\r\n\r\nContoh penerapan:\r\n\r\nPengenalan tulisan tangan (MNIST dataset).\r\n\r\nDemo: Membuat model AI sederhana dengan platform online.\r\n\r\nMinggu 4: Etika & Proyek Akhir\r\nTantangan dan etika AI (bias data, privasi).\r\n\r\nProyek akhir:\r\n\r\nMembuat model AI sederhana (contoh: deteksi emosi teks atau objek gambar).\r\n\r\nPresentasi: Peserta memamerkan proyek mereka.\r\n\r\nMetode Pembelajaran\r\nTeori: Video, bacaan, dan infografis.\r\n\r\nPraktik:\r\n\r\nTools: Google Teachable Machine, IBM Watson Studio (gratis).\r\n\r\nBahasa pemrograman: Python dasar (opsional).\r\n\r\nEvaluasi: Kuis mingguan dan proyek akhir.', 'https://www.youtube.com/watch?v=nVyD6THcvDQ', 'link', 0, 'draft', '2025-05-18 06:09:54', '2025-05-18 08:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `material_progress`
--

CREATE TABLE `material_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `completed_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_proof` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','completed','failed','refunded') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `course_id`, `amount`, `payment_proof`, `payment_status`, `payment_method`, `transaction_date`, `updated_at`) VALUES
(1, 1, 2, 1000000.00, 'assets/payment_proofs/payment_1747547534_1_2.png', 'completed', NULL, '2025-05-18 05:52:14', '2025-05-18 06:05:13'),
(2, 4, 3, 69000.00, 'assets/payment_proofs/payment_1747557530_4_3.png', 'pending', NULL, '2025-05-18 08:38:50', '2025-05-18 08:38:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_photo` varchar(255) DEFAULT 'assets/default-avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `status`, `created_at`, `updated_at`, `profile_photo`) VALUES
(1, 'Brandon Montong', 'brandonmontong02@gmail.com', '$2y$10$FiN0J.W0wn0CFvdcL8Nmnu3XWudKOMxea/zv0dmtrQ5HcSva6fpm2', 'admin', 'active', '2025-05-18 03:13:02', '2025-05-18 08:28:58', 'assets/profile_photos/admin_1_1747556938.png'),
(2, 'test_user', 'test@example.com', '$2y$10$j.AqIAWLJFcsfJPjj3dJH.BPUDi7kSyj8iG5KGpop186I6UDzYCbm', 'user', 'active', '2025-05-18 03:16:28', '2025-05-18 04:12:10', 'assets/default-avatar.jpg'),
(3, 'admin', 'admin@example.com', '$2y$10$0phtKdN4cm7lXswf6nf3FuPxhtEz7W5AFlotA/1OJfuQafT.m6uym', 'admin', 'active', '2025-05-18 03:16:28', '2025-05-18 04:12:11', 'assets/default-avatar.jpg'),
(4, 'Brandon user', 'brandonuser@gmail.com', '$2y$10$rj.5RUotOPGzCshrNPaMR.O0erMOgw6Yud7kPPue0m7sUba2JQuUq', 'user', 'active', '2025-05-18 03:42:51', '2025-05-18 04:59:39', 'assets/profile_photos/profile_4_1747544379.png'),
(5, 'Bian', 'bianos@gmail.com', 'bianos', 'admin', 'active', '2025-05-18 03:56:30', '2025-10-06 10:39:40', 'assets/default-avatar.jpg'),
(6, 'anthony', 'todygaming1@outlook.com', '$2y$10$e7Znd63H3ydXr49wf7by.ek.pvgXO.cAZFrbY8dqmcidzmDi0pfV2', 'user', 'active', '2025-09-08 03:09:15', '2025-09-08 03:09:26', 'assets/profile_photos/profile_6_1757300966.jpg'),
(7, 'guest', 'guest@gmail.com', '$2y$10$midLKOM8Zvh/1ZoARuauU.DwJsASrVheVlWvwthiJOXpzeMwJgfOK', 'user', 'active', '2025-10-06 10:19:28', '2025-10-06 10:19:28', 'assets/default-avatar.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `material_progress`
--
ALTER TABLE `material_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_progress` (`user_id`,`material_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material_progress`
--
ALTER TABLE `material_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_progress`
--
ALTER TABLE `material_progress`
  ADD CONSTRAINT `material_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_progress_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
