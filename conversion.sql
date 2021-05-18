-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 07:37 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `conversion`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Dashawn Schaefer V', 'angie.beatty@example.com', '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(2, 'Rafael Osinski', 'aaufderhar@example.org', '2021-05-16 06:39:34', '2021-05-16 06:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `start_date`, `end_date`, `amount`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '2021-03-01 18:59:59', '2021-05-01 18:59:59', '7.49', 1, '2021-05-17 06:07:16', '2021-05-17 06:07:16'),
(2, '2021-03-01 18:59:59', '2021-05-01 18:59:59', '7.49', 1, '2021-05-17 07:58:11', '2021-05-17 07:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_events`
--

CREATE TABLE `invoice_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` enum('registered','activated','appointment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_amount` decimal(8,2) NOT NULL,
  `occurence` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_events`
--

INSERT INTO `invoice_events` (`id`, `event_name`, `event_amount`, `occurence`, `user_id`, `invoice_id`, `created_at`, `updated_at`) VALUES
(1, 'appointment', '3.50', 1, 3, 1, '2021-05-17 06:07:16', '2021-05-17 06:07:16'),
(2, 'appointment', '3.50', 1, 4, 1, '2021-05-17 06:07:16', '2021-05-17 06:07:16'),
(3, 'registered', '0.49', 1, 5, 1, '2021-05-17 06:07:16', '2021-05-17 06:07:16'),
(4, 'appointment', '3.50', 1, 3, 2, '2021-05-17 07:58:11', '2021-05-17 07:58:11'),
(5, 'appointment', '3.50', 1, 4, 2, '2021-05-17 07:58:11', '2021-05-17 07:58:11'),
(6, 'registered', '0.49', 1, 5, 2, '2021-05-17 07:58:11', '2021-05-17 07:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_12_125105_create_customers_table', 1),
(5, '2021_05_12_125129_create_sessions_table', 1),
(6, '2021_05_12_125203_create_invoices_table', 1),
(7, '2021_05_12_125219_create_invoice_events_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `appointment_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `activated_at`, `appointment_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2021-04-26 12:09:27', 2, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(2, '2021-04-18 14:52:50', '2021-05-07 16:25:07', 2, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(3, '2021-05-01 02:00:03', '2021-05-01 18:30:49', 3, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(4, '2021-05-05 11:03:44', NULL, 1, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(5, '2021-04-10 01:47:07', NULL, 2, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(6, NULL, '2021-05-07 00:20:43', 1, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(7, '2021-05-06 12:11:13', '2021-05-08 04:03:27', 1, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(8, NULL, '2021-04-20 19:53:10', 1, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(9, '2021-03-23 11:08:15', NULL, 1, '2021-05-16 06:39:34', '2021-05-16 06:39:34'),
(10, '2021-04-10 08:03:09', '2021-05-08 06:01:06', 4, '2021-05-16 06:39:34', '2021-05-16 06:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Alison Schinner', 'droob@example.org', '2021-05-16 06:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gpjwZtRWjp', 2, '2021-04-08 20:06:33', '2021-05-16 06:39:34'),
(2, 'Cindy Towne', 'dulce65@example.org', '2021-05-16 06:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TSoiPYoAG2', 2, '2021-04-14 12:15:15', '2021-05-16 06:39:34'),
(3, 'Dr. Rahsaan Bode', 'elisha.wehner@example.org', '2021-05-16 06:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mMzZM98EJq', 1, '2021-04-04 14:37:50', '2021-05-16 06:39:34'),
(4, 'Susana Prohaska', 'maude19@example.org', '2021-05-16 06:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N5hqXennfC', 1, '2021-03-31 08:51:58', '2021-05-16 06:39:34'),
(5, 'Brennon Hills', 'drohan@example.net', '2021-05-16 06:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HjwxFReN9M', 1, '2021-04-19 01:46:28', '2021-05-16 06:39:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_events`
--
ALTER TABLE `invoice_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_events_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_events`
--
ALTER TABLE `invoice_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_events`
--
ALTER TABLE `invoice_events`
  ADD CONSTRAINT `invoice_events_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
