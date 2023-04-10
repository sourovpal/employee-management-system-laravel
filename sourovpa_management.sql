-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2023 at 09:12 AM
-- Server version: 8.0.32
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sourovpa_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `clock_in` time DEFAULT NULL,
  `clock_out` time DEFAULT NULL,
  `in_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `out_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `work_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `clock_in`, `clock_out`, `in_status`, `out_status`, `work_date`, `created_at`, `updated_at`) VALUES
(2, 2, '12:41:00', '12:48:00', '1', '1', '2022-12-29', '2022-12-29 20:41:24', '2022-12-29 20:48:40'),
(4, 3, '22:01:00', '12:56:00', '1', '2', '2022-12-29', '2022-12-29 20:57:36', '2022-12-29 20:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Main Branch', '2022-12-29 18:47:19', '2022-12-29 18:47:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_12_10_010859_create_permission_tables', 1),
(26, '2022_12_11_120121_create_branches_table', 1),
(27, '2022_12_14_180839_create_attendances_table', 1),
(28, '2022_12_17_193533_create_schedules_table', 1),
(29, '2022_12_29_080703_create_work_times_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `name_slug`, `group_name`, `group_name_slug`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'All Access', 'all-access', 'Super Access', 'super-access', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01'),
(2, 'Branch Access', 'branch-access', 'Super Access', 'super-access', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01'),
(3, 'Dashboard View', 'dashboard-view', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01'),
(4, 'Total Employee', 'total-employee', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01'),
(5, 'Today Attends', 'today-attends', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01'),
(6, 'Today Absent', 'today-absent', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(7, 'Today Clock In Clock Out', 'today-clock-in-clock-out', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(8, 'Employee Work Day', 'employee-work-day', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(9, 'Employee Total Present', 'employee-total-present', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(10, 'Employee Total Absent', 'employee-total-absent', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(11, 'Employee Total Rest Day', 'employee-total-rest-day', 'Dashboard', 'dashboard', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(12, 'Employee Create', 'employee-create', 'Employee', 'employee', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(13, 'Employee View', 'employee-view', 'Employee', 'employee', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(14, 'Employee Edit', 'employee-edit', 'Employee', 'employee', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(15, 'Employee Delete', 'employee-delete', 'Employee', 'employee', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(16, 'Employee Profile', 'employee-profile', 'Employee', 'employee', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(17, 'Branch Create', 'branch-create', 'Branch', 'branch', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(18, 'Branch View', 'branch-view', 'Branch', 'branch', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(19, 'Branch Edit', 'branch-edit', 'Branch', 'branch', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(20, 'Branch Delete', 'branch-delete', 'Branch', 'branch', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(21, 'Role Create', 'role-create', 'Role', 'role', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(22, 'Role View', 'role-view', 'Role', 'role', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(23, 'Role Edit', 'role-edit', 'Role', 'role', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(24, 'Role Delete', 'role-delete', 'Role', 'role', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(25, 'Attendance Create', 'attendance-create', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(26, 'Attendance View', 'attendance-view', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(27, 'Attendance Edit', 'attendance-edit', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(28, 'Attendance Delete', 'attendance-delete', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(29, 'Attendance Leave', 'attendance-leave', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(30, 'Attendance Web Clock', 'attendance-web-clock', 'Attendance', 'attendance', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(31, 'Schedule Create', 'schedule-create', 'Schedule', 'schedule', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(32, 'Schedule View', 'schedule-view', 'Schedule', 'schedule', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(33, 'Schedule Edit', 'schedule-edit', 'Schedule', 'schedule', 'web', '2022-12-29 18:35:02', '2022-12-29 18:35:02'),
(34, 'Schedule Delete', 'schedule-delete', 'Schedule', 'schedule', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(35, 'Add Attendance', 'add-attendance', 'Schedule', 'schedule', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(36, 'Profile View', 'profile-view', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(37, 'Profile Edit', 'profile-edit', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(38, 'Change Password', 'change-password', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(39, 'Profile Schedule View', 'profile-schedule-view', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(40, 'Profile Attendance View', 'profile-attendance-view', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03'),
(41, 'Work Time', 'work-time', 'Profile', 'profile', 'web', '2022-12-29 18:35:03', '2022-12-29 18:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'web', '2022-12-29 18:35:01', '2022-12-29 18:35:01', NULL),
(2, 'Employee', 'web', '2022-12-29 18:49:25', '2022-12-29 18:49:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(41, 1),
(3, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(30, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `rest_days` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` date NOT NULL,
  `until_date` date NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `start_time`, `end_time`, `rest_days`, `from_date`, `until_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '08:00:00', '16:00:00', 'Friday', '2022-12-01', '2022-12-31', '1', '2022-12-29 20:01:23', '2022-12-29 20:01:23'),
(2, 3, '10:00:00', '16:00:00', 'Saturday', '2022-12-29', '2022-12-31', '1', '2022-12-29 20:57:05', '2022-12-29 20:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `branch_id`, `name`, `email`, `phone`, `gender`, `civil`, `birth_date`, `age`, `national_id`, `department`, `position`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1001, 1, 'Super Admin', 'admin@admin.com', '+1 123 456 7890', 'male', 'single', '01/01/1999', '20', '123456789987', 'Software', 'Project Manager', NULL, NULL, '$2y$10$j.9t2LZulkaXpIJQvHZTnOjB36JfH9PQzqJATIQt/I9YWsqc1JZVG', 'FIjeRP7G1KlNGOKmWmha7gbMtiYkjspG9i6YVK2rXcpIURkpHhGG0PuiJnsx', '2022-12-29 18:35:03', '2022-12-29 18:35:03', NULL),
(2, 1002, 1, 'Sourov Pal', 'sourovpal35@gmail.com', '01745454545', 'male', 'H-2A', '2022-12-29', '25', '444444444444', 'IT', 'Software Developer', NULL, NULL, '$2y$10$GnYs9Z8wlbH1wrUZMa/fOOV.CfVTTXqCjz1OzlMsA.QJ0tYwxGpn6', NULL, '2022-12-29 18:47:43', '2022-12-29 18:54:24', NULL),
(3, 11003, 1, 'Pritom Bhowmik', 'pritombhowmik163@gmail.com', '9052415521', 'male', 'H-2A', '2022-12-29', '21', '946416516481444', 'Graphics Design', 'Developer', NULL, NULL, '$2y$10$11/2KDL1gmueZLZriXxa.eEbAfl1biIqkf.zjn0F5UwCbQFG8pJMK', NULL, '2022-12-29 20:55:54', '2022-12-31 11:06:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_times`
--

CREATE TABLE `work_times` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attendance_id` bigint UNSIGNED NOT NULL,
  `work_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_times`
--

INSERT INTO `work_times` (`id`, `user_id`, `attendance_id`, `work_date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(5, 2, 2, '2022-12-29', '12:41:00', '12:41:00', '2022-12-29 20:41:24', '2022-12-29 20:41:37'),
(6, 2, 2, '2022-12-29', '12:48:00', '12:48:00', '2022-12-29 20:48:33', '2022-12-29 20:48:40'),
(8, 3, 4, '2022-12-29', '22:01:00', '12:56:00', '2022-12-29 20:57:36', '2022-12-29 20:58:49'),
(9, 3, 4, '2022-12-29', '12:56:00', '12:56:00', '2022-12-29 20:58:55', '2022-12-29 20:59:00'),
(10, 3, 4, '2022-12-29', '12:56:00', NULL, '2022-12-29 20:59:10', '2022-12-29 20:59:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_national_id_unique` (`national_id`);

--
-- Indexes for table `work_times`
--
ALTER TABLE `work_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_times_user_id_foreign` (`user_id`),
  ADD KEY `work_times_attendance_id_foreign` (`attendance_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `work_times`
--
ALTER TABLE `work_times`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_times`
--
ALTER TABLE `work_times`
  ADD CONSTRAINT `work_times_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_times_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
