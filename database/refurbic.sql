-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 05:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `refurbic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'sorena', '0657889602', 1, '2024-02-06-65c203d4d2ebb.png', 'sanjay.techvoi@gmail.com', NULL, '$2a$12$3keTvE94UNOEHbMuwxvg3OM2z1vYqnSvoPNrW.YkmaNWZBtK4uF.i', 'tOD5eH2bQmzbMev5PMnZHn5j2H7mgr859aJbT5FFOQVhSOiN2NCfObAsp5z9', '2022-09-28 10:49:04', '2024-02-06 10:03:00', 1),
(2, 'Md Al Imrun', '9180236120', 7, '2022-10-02-6339723659ece.png', 'imrun.al.23@gmail.com', NULL, '$2y$10$stB2lGWlcD45M2vMNutpBuDYDzwdt/es1SvUwa.FSFZmugMIzX4jW', NULL, '2022-10-02 05:42:54', '2022-10-02 05:42:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Store Manager', '[\"order_management\"]', 1, '2022-10-02 05:40:34', '2022-10-02 05:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 235.2, 0, NULL, '2022-10-01 06:40:20', 0.00, 5.00, 0.00, 0.00),
(2, 1, 0, 0, '2022-09-28 10:49:04', '2022-09-28 10:49:04', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'MI', '2022-10-02 05:14:52', '2022-10-02 05:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(3, '2023-07-08-64a8da9f33c0e.png', 'Main Banner', 1, '2022-09-30 21:07:56', '2023-07-07 22:17:43', 'http://192.168.1.16/refurbic', 'product', 1),
(4, '2023-07-08-64a8da83b9564.png', 'Main Banner', 1, '2022-09-30 21:08:58', '2024-02-06 10:00:05', 'http://192.168.1.16/refurbic', 'product', 2),
(5, '2023-07-08-64a8dabc3fa2f.png', 'Main Banner', 1, '2022-09-30 21:09:29', '2023-07-07 22:17:07', 'http://192.168.1.16/refurbic', 'product', 1),
(6, '2023-07-08-64a8dcced8705.png', 'Footer Banner', 1, '2022-09-30 21:10:00', '2023-07-07 22:19:34', 'http://192.168.1.16/refurbic', 'product', 1),
(7, '2023-07-08-64a8dcb055095.png', 'Main Section Banner', 1, '2022-09-30 21:10:34', '2023-07-07 22:19:04', 'http://192.168.1.16/refurbic', 'product', 1),
(8, '2023-07-08-64a8dca002238.png', 'Main Banner', 1, '2022-09-30 21:12:01', '2023-07-07 22:18:48', 'http://192.168.1.16/refurbic', 'product', 1),
(10, '2023-07-08-64a8dc905b40e.png', 'Main Banner', 1, '2022-09-30 21:13:37', '2023-07-07 22:18:32', 'http://192.168.1.16/refurbic', 'product', 1),
(11, '2023-07-08-64a8dc7e8332e.png', 'Main Banner', 1, '2022-09-30 21:14:14', '2023-07-07 22:18:14', 'http://192.168.1.16/refurbic', 'product', 1),
(12, '2022-10-01-6337abcba1031.png', 'Popup Banner', 0, '2022-09-30 21:24:03', '2022-09-30 21:33:42', 'https://app.refurbic.com/', 'product', 1),
(13, '2023-07-08-64a8dc6e9346c.png', 'Footer Banner', 1, '2022-09-30 21:25:18', '2023-07-07 22:17:58', 'http://192.168.1.16/refurbic', 'product', 1),
(14, '2023-07-08-64a8dc0c62a42.png', 'Footer Banner', 1, '2022-09-30 21:26:04', '2023-07-07 22:16:20', 'http://192.168.1.16/refurbic', 'product', 1),
(15, '2022-10-01-6337ad27eb18a.png', 'Footer Banner', 0, '2022-09-30 21:29:51', '2022-09-30 21:31:56', 'https://app.refurbic.com/', 'product', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MI', '2022-09-29-6335cf2a99ee3.png', 1, '2022-09-28 15:12:35', '2022-09-29 11:30:26'),
(2, 'SAMSUNG', '2022-09-29-6335cf8ac26b2.png', 1, '2022-09-28 15:42:59', '2022-09-29 11:32:02'),
(3, 'APPLE', '2022-09-29-6335cfc811e27.png', 1, '2022-09-28 15:44:15', '2022-09-29 11:33:04'),
(4, 'ADIDAS', '2022-09-29-6335d07f32381.png', 1, '2022-09-29 11:34:44', '2022-09-29 11:36:07'),
(5, 'PUMA', '2022-09-29-6335d0c1eb99a.png', 1, '2022-09-29 11:37:13', '2022-09-29 11:37:13'),
(6, 'NIKE', '2022-09-29-6335d1023112f.png', 1, '2022-09-29 11:38:18', '2022-09-29 11:38:18'),
(7, 'LEVI\'S', '2022-09-29-6335d1592b8f9.png', 1, '2022-09-29 11:39:45', '2022-09-29 11:39:45'),
(8, 'POCO', '2022-09-29-6335d1bde2125.png', 1, '2022-09-29 11:41:25', '2022-09-29 11:41:25'),
(9, 'Realme', '2022-09-29-6335d21b729c1.png', 1, '2022-09-29 11:42:59', '2022-09-29 11:42:59'),
(10, 'PHILIPS', '2022-09-29-6335d27f69d7f.png', 1, '2022-09-29 11:44:39', '2022-09-29 11:44:39'),
(11, 'Tector', '2022-09-29-6335d30ae36d4.png', 1, '2022-09-29 11:46:58', '2022-09-29 11:46:58'),
(12, 'BIBA', '2022-09-29-6335d355786f2.png', 1, '2022-09-29 11:48:13', '2022-09-29 11:48:13'),
(13, 'Aks', '2022-09-29-6335d3a98ecd9.png', 1, '2022-09-29 11:49:37', '2022-09-29 11:49:37'),
(14, 'Sony', '2022-10-01-633823e08122c.png', 1, '2022-10-01 05:56:24', '2022-10-01 05:56:24'),
(15, 'HP', '2022-10-01-633825cab4e59.png', 1, '2022-10-01 06:04:34', '2022-10-01 20:43:01'),
(16, 'Fortune', '2022-10-02-6338f2544878c.png', 1, '2022-10-01 20:37:16', '2022-10-01 20:42:18'),
(17, 'LUX', '2022-10-02-6338f4fd5096c.png', 1, '2022-10-01 20:48:37', '2022-10-01 20:48:37'),
(18, 'Dhara', '2022-10-02-633912aa27649.png', 1, '2022-10-01 22:55:14', '2022-10-01 22:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 02:13:44', '2023-07-07 01:08:19'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"name\":\"Dutch\",\"direction\":\"ltr\",\"code\":\"nl\",\"status\":1,\"default\":false},{\"id\":3,\"name\":\"AU\",\"direction\":\"ltr\",\"code\":\"au\",\"status\":1,\"default\":false},{\"id\":4,\"name\":\"INR\",\"direction\":\"ltr\",\"code\":\"in\",\"status\":1,\"default\":true}]', '2020-10-11 02:23:02', '2023-07-07 00:52:59'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 04:59:18', '2021-07-06 07:02:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 15:51:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 03:06:51', '2022-08-03 00:44:35'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 03:21:39', '2022-08-03 00:44:35'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 03:31:47', '2021-07-06 07:00:05'),
(10, 'company_phone', '121212121212', NULL, '2020-12-08 08:45:01'),
(11, 'company_name', 'Eshop', NULL, '2021-02-27 12:41:53'),
(12, 'company_web_logo', '2023-07-08-64a8dda34181d.png', NULL, '2023-07-07 22:23:07'),
(13, 'company_mobile_logo', '2023-07-08-64a8dda34bcbc.png', NULL, '2023-07-07 22:23:07'),
(14, 'terms_condition', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h2>Where can I get some?</h2>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, '2022-09-29 11:55:00'),
(15, 'about_us', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h2>Where can I get some?</h2>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, '2022-09-30 11:34:45'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'info@eshop.com', NULL, '2021-03-15 06:59:51'),
(18, 'colors', '{\"primary\":\"#002e28\",\"secondary\":\"#002e28\"}', '2020-10-11 08:23:02', '2023-07-07 22:23:07'),
(19, 'company_footer_logo', '2023-07-08-64a8dda34ef18.png', NULL, '2023-07-07 22:23:07'),
(20, 'company_copyright_text', 'Copyright @ 2022 Eshop All rights reserved', NULL, '2021-03-15 07:00:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 07:24:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 07:24:48'),
(23, 'company_fav_icon', '2023-07-08-64a8dda35a1d5.png', '2020-10-11 08:23:02', '2023-07-07 22:23:07'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 07:00:14'),
(33, 'sales_commission', '10', NULL, '2023-01-02 06:35:36'),
(34, 'seller_registration', '1', NULL, '2021-06-04 15:32:48'),
(35, 'pnc_language', '[\"en\",\"nl\",\"au\",\"in\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h2>Where can I get some?</h2>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2022-09-29 11:55:14'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 07:00:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 07:00:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', '2022-10-01 07:07:14', '2022-10-01 07:07:14'),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-08-03 00:44:35'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-20 21:31:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"1\",\"color\":\"#f2073e\",\"text_color\":\"#ffffff\",\"announcement\":\"Beste kwaliteit op een plek.      Bij ons \\u00e9cht de laagste prijs!     Gratis retourneren.   0Bezorging dezelfde dag, \'s avonds of in het weekend *\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 04:16:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 04:16:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-08-03 00:44:35'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, '2023-01-02 06:35:10'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'Ritterdan', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'maintenance_mode', '0', '2022-09-28 15:46:58', '2022-09-29 12:02:47'),
(84, 'currency_symbol_position', 'left', '2022-09-28 15:47:03', '2024-02-06 10:03:34'),
(85, 'timezone', 'Asia/Calcutta', NULL, NULL),
(86, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(87, 'loader_gif', '2022-10-01-633839d947035.png', NULL, NULL),
(88, 'shop_banner', '2023-07-08-64a8dda304b9a.png', NULL, NULL),
(89, 'new_product_approval', '1', NULL, NULL),
(90, 'product_wise_shipping_cost_approval', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(17, 3, '3-F0OyY-1672067497', 3, NULL, '[]', '[]', '', 1, 13499, 3374.75, 3374.75, 'samsung-80-cm-32-inch-hd-ready-led-smart-tizen-tv-with-2022-model-ua32t4380akxxl-GFzF6x', 'SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380A', '2022-09-30-6336476bac6cf.png', 1, 'admin', '2022-12-26 09:41:49', '2022-12-26 09:41:49', 'Refurbic', 0.00, 'product_wise'),
(19, 5, '5-WyHzH-1672312848', 9, '#000000', '[]', '{\"color\":\"Black\"}', 'Black', 1, 234000, 4680, 4680, 'apple-macbook-pro-2020-m1-162-inch-32gb-1tb-macos-monterey-space-grey-5q8Xup', 'Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)', '2022-10-01-63382bee84391.png', 1, 'admin', '2022-12-29 05:50:48', '2022-12-29 05:50:48', 'Refurbic', 0.00, 'product_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'Electronics', 'electronics', '2022-09-30-6337226f89927.png', 0, 0, '2022-09-28 15:33:57', '2022-09-30 11:37:59', 0, 1),
(2, 'Men', 'men', '2022-09-30-633722accc2a3.png', 0, 0, '2022-09-28 15:34:58', '2022-09-30 11:39:00', 0, 2),
(3, 'Women', 'women', '2022-10-01-6337a4161c88c.png', 0, 0, '2022-09-28 15:35:19', '2022-09-30 20:51:10', 0, 3),
(4, 'Baby & Kids', 'baby-kids', '2022-09-30-6337233cc1408.png', 0, 0, '2022-09-28 15:35:45', '2022-09-30 11:41:24', 0, 4),
(5, 'Mobiles', 'mobiles', NULL, 1, 1, '2022-09-28 15:36:27', '2022-09-28 15:36:27', 0, 1),
(6, 'Mobile Accesories', 'mobile-accesories', NULL, 1, 1, '2022-09-28 15:37:14', '2022-09-28 15:37:14', 0, 2),
(7, 'Laptop', 'laptop', NULL, 1, 1, '2022-09-28 15:37:46', '2022-09-28 15:37:46', 0, 3),
(8, 'MI', 'mi', NULL, 5, 2, '2022-09-28 15:38:13', '2022-09-28 15:38:13', 0, 1),
(9, 'Realme', 'realme', NULL, 5, 2, '2022-09-28 15:38:48', '2022-09-28 15:38:48', 0, 2),
(10, 'Samsung', 'samsung', NULL, 5, 2, '2022-09-28 15:39:48', '2022-09-28 15:39:48', 0, 3),
(11, 'Clothing and Accessories', 'clothing-and-accessories', NULL, 3, 1, '2022-09-29 12:47:44', '2022-09-29 12:47:44', 0, 0),
(12, 'Kurtas, Ethnic Sets and Bottoms', 'kurtas-ethnic-sets-and-bottoms', NULL, 11, 2, '2022-09-29 12:48:40', '2022-09-29 12:48:40', 0, 0),
(13, 'Fashion', 'fashion', '2022-10-01-6337a575c16de.png', 0, 0, '2022-09-30 20:41:01', '2022-09-30 20:57:01', 0, 5),
(14, 'Beauty', 'beauty', '2022-10-01-6337a1fd4fc9b.png', 0, 0, '2022-09-30 20:42:13', '2022-09-30 20:42:13', 0, 6),
(15, 'Home & Furniture', 'home-furniture', '2022-10-01-6337a2590a19a.png', 0, 0, '2022-09-30 20:43:45', '2022-09-30 20:43:45', 0, 7),
(16, 'Travel', 'travel', '2022-10-01-6337a2bc7c26a.png', 0, 0, '2022-09-30 20:45:24', '2022-09-30 20:45:24', 0, 8),
(17, 'Grocery', 'grocery', '2022-10-01-6337a333e4cdc.png', 0, 0, '2022-09-30 20:47:23', '2022-09-30 20:47:23', 0, 9),
(19, 'Sony', 'sony', NULL, 7, 2, '2022-10-01 05:52:16', '2022-10-01 05:52:16', 0, 1),
(20, 'HP', 'hp', NULL, 7, 2, '2022-10-01 06:08:03', '2022-10-01 06:08:03', 0, 1),
(21, 'Apple', 'apple', NULL, 7, 2, '2022-10-01 06:27:06', '2022-10-01 06:27:06', 0, 0),
(22, 'Oil', 'oil', NULL, 17, 1, '2022-10-01 20:33:26', '2022-10-01 20:33:26', 0, 0),
(23, 'Fortune', 'fortune', NULL, 22, 2, '2022-10-01 20:33:56', '2022-10-01 20:33:56', 0, 0),
(25, 'SOAP', 'soap', NULL, 17, 1, '2022-10-01 20:51:50', '2022-10-01 20:51:50', 0, 0),
(26, 'Lux', 'lux', NULL, 25, 2, '2022-10-01 20:52:08', '2022-10-01 20:52:08', 0, 0),
(27, 'Dhara', 'dhara', NULL, 22, 2, '2022-10-01 22:53:11', '2022-10-01 22:53:11', 0, 0),
(28, 'Phone', 'phone', '2022-10-10-6344460e98b38.png', 0, 0, '2022-10-10 10:49:26', '2022-10-10 10:49:26', 0, 0),
(29, 'Sumsung', 'sumsung', NULL, 28, 1, '2022-10-10 10:50:25', '2022-10-10 10:50:25', 0, 0),
(30, 'Apple', 'apple', NULL, 28, 1, '2022-10-10 10:51:06', '2022-10-10 10:51:06', 0, 1),
(31, 'Xiaomi', 'xiaomi', NULL, 28, 1, '2022-10-10 10:51:43', '2022-10-10 10:51:43', 0, 0),
(32, 'Google Phone', 'google-phone', NULL, 28, 1, '2022-10-10 10:52:00', '2022-10-10 10:52:00', 0, 0),
(33, 'Tablets', 'tablets', '2022-10-13-634856c282192.png', 0, 0, '2022-10-13 12:49:46', '2022-10-13 12:49:46', 0, 0),
(34, 'Tablets', 'tablets', NULL, 33, 1, '2022-10-13 12:50:14', '2022-10-13 12:50:14', 0, 0),
(35, 'Laptops/PC', 'laptopspc', '2022-10-13-6348588ccf308.png', 0, 0, '2022-10-13 12:57:24', '2022-10-13 12:57:24', 0, 0),
(36, 'Laptops/PC', 'laptopspc', NULL, 35, 1, '2022-10-13 12:57:42', '2022-10-13 12:57:42', 0, 0),
(37, 'Accessories', 'accessories', '2022-10-13-63485a93d8c52.png', 0, 0, '2022-10-13 13:06:03', '2022-10-13 13:06:03', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(2, 0, 2, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(3, 0, 3, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(4, 0, 4, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(5, 0, 13, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(6, 0, 14, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(7, 0, 15, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(8, 0, 16, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(9, 0, 17, 0.00, NULL, '2022-10-02 05:26:42', '2022-10-02 05:26:42'),
(10, 0, 28, 0.00, NULL, '2023-07-07 00:48:38', '2023-07-07 00:48:38'),
(11, 0, 33, 0.00, NULL, '2023-07-07 00:48:38', '2023-07-07 00:48:38'),
(12, 0, 35, 0.00, NULL, '2023-07-07 00:48:38', '2023-07-07 00:48:38'),
(13, 0, 37, 0.00, NULL, '2023-07-07 00:48:38', '2023-07-07 00:48:38');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(2, 'LightCoral', '#F08080', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(3, 'Salmon', '#FA8072', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(6, 'Crimson', '#DC143C', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(7, 'Red', '#FF0000', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(8, 'FireBrick', '#B22222', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(9, 'DarkRed', '#8B0000', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(10, 'Pink', '#FFC0CB', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(12, 'HotPink', '#FF69B4', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(13, 'DeepPink', '#FF1493', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(17, 'Coral', '#FF7F50', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(18, 'Tomato', '#FF6347', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(21, 'Orange', '#FFA500', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(22, 'Gold', '#FFD700', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(23, 'Yellow', '#FFFF00', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-04 20:42:26', '2018-11-04 20:42:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(31, 'Khaki', '#F0E68C', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(35, 'Plum', '#DDA0DD', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(36, 'Violet', '#EE82EE', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(37, 'Orchid', '#DA70D6', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(39, 'Magenta', '#FF00FF', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(42, 'Amethyst', '#9966CC', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(47, 'Purple', '#800080', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(48, 'Indigo', '#4B0082', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(55, 'Lime', '#00FF00', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(58, 'LightGreen', '#90EE90', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-04 20:42:27', '2018-11-04 20:42:27'),
(63, 'ForestGreen', '#228B22', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(64, 'Green', '#008000', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(65, 'DarkGreen', '#006400', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(68, 'Olive', '#808000', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(74, 'Teal', '#008080', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(75, 'Aqua', '#00FFFF', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(95, 'Blue', '#0000FF', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(97, 'DarkBlue', '#00008B', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(98, 'Navy', '#000080', '2018-11-04 20:42:28', '2018-11-04 20:42:28'),
(99, 'MidnightBlue', '#191970', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(106, 'Tan', '#D2B48C', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(111, 'Peru', '#CD853F', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(112, 'Chocolate', '#D2691E', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(114, 'Sienna', '#A0522D', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(115, 'Brown', '#A52A2A', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(116, 'Maroon', '#800000', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(117, 'White', '#FFFFFF', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(118, 'Snow', '#FFFAFA', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(121, 'Azure', '#F0FFFF', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(126, 'Beige', '#F5F5DC', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-04 20:42:29', '2018-11-04 20:42:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(131, 'Linen', '#FAF0E6', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(136, 'Silver', '#C0C0C0', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(138, 'Gray', '#808080', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(139, 'DimGray', '#696969', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(140, 'LightSlateGray', '#778899', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(141, 'SlateGray', '#708090', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-04 20:42:30', '2018-11-04 20:42:30'),
(143, 'Black', '#000000', '2018-11-04 20:42:30', '2018-11-04 20:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 08:09:37'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2023-07-08 03:55:17'),
(3, 'Indian Rupi', '₹', 'INR', '60', 1, '2020-10-15 11:53:04', '2023-07-07 00:54:36'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-25 15:30:23', '2021-06-04 12:55:29'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 16:38:31', '2023-07-08 03:55:30'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 05:38:33', '2023-07-08 03:55:32'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 05:42:38', '2023-07-08 03:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Today Special offer the apple laptop', 9, 2.00, 'percent', 0, '2022-10-01 06:33:15', '2022-10-01 07:00:05'),
(2, 'Today Special offer the apple laptop', 9, 2.00, 'percent', 0, '2022-10-01 06:59:50', '2022-10-01 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `is_active`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'Shankar', 'Lal', '9170112345', 'shankar@gmail.com', 'EMP00001', 'company_id', '[]', '2022-10-02-633972e036b1a.png', '$2y$10$VIHxqoP7ixhl2H8CQA44vuvGRscYiFIAt1EEPjnmuIm5hqWPEd6s2', 1, '2022-10-02 05:45:44', '2022-10-02 05:45:44', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_time`
--

CREATE TABLE `delivery_time` (
  `id` int(11) NOT NULL,
  `delivery_code` varchar(20) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `monday_status` int(11) NOT NULL DEFAULT 0,
  `mon_from` varchar(20) DEFAULT NULL,
  `mon_to` varchar(20) DEFAULT NULL,
  `tuesday_status` int(11) NOT NULL DEFAULT 0,
  `tue_from` varchar(20) DEFAULT NULL,
  `tue_to` varchar(20) DEFAULT NULL,
  `wednesday_status` int(11) NOT NULL DEFAULT 0,
  `wed_from` varchar(20) DEFAULT NULL,
  `wed_to` varchar(20) DEFAULT NULL,
  `thursday_status` int(11) NOT NULL DEFAULT 0,
  `thu_from` varchar(20) DEFAULT NULL,
  `thu_to` varchar(20) DEFAULT NULL,
  `friday_status` int(11) NOT NULL DEFAULT 0,
  `fri_from` varchar(20) DEFAULT NULL,
  `fri_to` varchar(20) DEFAULT NULL,
  `saturday_status` int(11) NOT NULL DEFAULT 0,
  `sat_from` varchar(20) DEFAULT NULL,
  `sat_to` varchar(20) DEFAULT NULL,
  `sunday_status` int(11) NOT NULL DEFAULT 0,
  `sun_from` varchar(20) DEFAULT NULL,
  `sun_to` varchar(20) DEFAULT NULL,
  `is_active` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivery_time`
--

INSERT INTO `delivery_time` (`id`, `delivery_code`, `delivery_time`, `monday_status`, `mon_from`, `mon_to`, `tuesday_status`, `tue_from`, `tue_to`, `wednesday_status`, `wed_from`, `wed_to`, `thursday_status`, `thu_from`, `thu_to`, `friday_status`, `fri_from`, `fri_to`, `saturday_status`, `sat_from`, `sat_to`, `sunday_status`, `sun_from`, `sun_to`, `is_active`, `created_at`, `updated_at`) VALUES
(9, '1-2', 'asdasd', 0, '0', '0', 0, '0', '0', 0, '0', '0', 0, '0', '0', 0, '0', '0', 0, '0', '0', 0, '0', '0', 1, '2023-01-05 10:30:33', '2023-01-05 10:30:33'),
(10, '2-3', 'fhfgh1', 1, '07:00', '20:00', 1, '09:00', '21:00', 1, '02:30', '17:00', 1, '05:00', '17:00', 1, '08:00', '17:00', 0, '', '', 0, '', '', 1, '2023-01-05 10:33:12', '2023-01-07 22:10:25'),
(11, 'test', 'test1', 1, '07:30', '18:30', 1, '07:00', '17:30', 1, '09:00', '22:00', 1, '03:30', '23:30', 0, '', '', 0, '', '', 0, '', '', 1, '2023-01-08 08:53:21', '2023-01-08 08:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'Today Special offer the apple laptop', '2022-10-01', '2022-10-30', 0, 0, NULL, NULL, '2022-10-01-633830e43c3ea.png', 'today-special-offer-the-apple-laptop', '2022-10-01 06:51:56', '2022-10-01 07:00:06', NULL, 'flash_deal'),
(2, 'Best Deal', '2022-10-01', '2022-10-31', 1, 0, NULL, NULL, 'def.png', 'best-deal', '2022-10-01 07:01:47', '2022-10-01 07:01:53', NULL, 'feature_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 0.00, NULL, '2022-10-01 06:52:17', '2022-10-01 06:52:17'),
(2, 1, 8, 0.00, NULL, '2022-10-01 06:52:23', '2022-10-01 06:52:23'),
(3, 1, 4, 0.00, NULL, '2022-10-01 06:52:30', '2022-10-01 06:52:30'),
(4, 1, 6, 0.00, NULL, '2022-10-01 06:53:13', '2022-10-01 06:53:13'),
(5, 1, 3, 0.00, NULL, '2022-10-01 06:54:31', '2022-10-01 06:54:31'),
(6, 2, 9, 0.00, NULL, '2022-10-01 07:02:08', '2022-10-01 07:02:08'),
(7, 2, 8, 0.00, NULL, '2022-10-01 07:02:56', '2022-10-01 07:02:56'),
(8, 2, 3, 0.00, NULL, '2022-10-01 07:03:05', '2022-10-01 07:03:05'),
(9, 2, 4, 0.00, NULL, '2022-10-01 07:03:11', '2022-10-01 07:03:11'),
(10, 2, 6, 0.00, NULL, '2022-10-01 07:03:18', '2022-10-01 07:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What does LOREM mean?', '‘Lorem ipsum dolor sit amet, consectetur adipisici elit…’ (complete text) is dummy text that is not meant to mean anything. It is used as a placeholder in magazine layouts, for example, in order to give an impression of the finished document. The text is intentionally unintelligible so that the viewer is not distracted by the content. The language is not real Latin and even the first word ‘Lorem’ does not exist. It is said that the lorem ipsum text has been common among typesetters since the 16th century.', 1, 1, '2022-09-28 19:49:04', '2022-09-28 19:49:04'),
(2, 'Where can I subscribe to your newsletter?', 'We often send out our newsletter with news and great offers. We will never disclose your data to third parties and you can unsubscribe from the newsletter at any time. Subscribe here to our newsletter.', 2, 1, '2022-09-28 19:50:24', '2022-09-28 19:52:05'),
(3, 'Where can in edit my address?', 'If you created a new account after or while ordering you can edit both addresses (for billing and shipping) in your customer account.', 3, 1, '2022-09-28 19:51:35', '2022-09-28 19:51:52'),
(4, 'Can I order a free copy of a magazine to sample?', 'Unfortunately, we’re unable to offer free samples. As a retailer, we buy all magazines from their publishers at the regular trade price. However, you could contact the magazine’s publisher directly to ask if they can send you a free copy.', 4, 1, '2022-09-28 19:53:09', '2022-09-28 19:53:20'),
(5, 'Do you accept orders via Phone or E-mail?', 'No, we are an online shop and we do not take orders via Phone, E-mail or Social Media.', 5, 1, '2022-09-28 19:54:28', '2022-09-28 19:54:37'),
(6, 'Can I reserve a magazine via Phone or E-mail?', 'No, this isn’t possible. We want all of our magazines to be available for all customers. So you have to order the magazine.', 6, 1, '2022-09-28 19:55:33', '2022-09-28 19:55:42');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `notification_count`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Deal for You', 'New Deal for You', 1, '2022-10-02-63396c40a7270.png', 1, '2022-10-02 05:17:28', '2022-10-02 05:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 03:55:41', '2021-07-05 03:55:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 03:54:36', '2021-07-05 03:54:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 12:57:22', '2020-10-21 12:57:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 12:57:23', '2020-10-21 12:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 240.2, '1', '2022-09-28 11:02:09', '2022-10-01 06:40:20', 0, NULL, '0', 2, 5.00, '1076-mWlDl-1664382729', '955693', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"Sanja\",\"address_type\":\"permanent\",\"address\":\"New Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"0123456789\",\"created_at\":\"2022-09-28T16:31:48.000000Z\",\"updated_at\":\"2022-09-28T16:31:48.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 3831, '1', '2022-10-16 08:52:33', '2022-10-16 08:54:04', 0, NULL, '0', 0, 0.00, '8034-GfWhF-1665930153', '191713', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"New Delhi\",\"additional_address\":null,\"city\":\"New Delhi\",\"zip\":\"110019\",\"phone\":\"0123456789\",\"created_at\":\"2022-10-01T12:15:51.000000Z\",\"updated_at\":\"2022-10-01T12:15:51.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"New Delhi\",\"additional_address\":null,\"city\":\"New Delhi\",\"zip\":\"110019\",\"phone\":\"0123456789\",\"created_at\":\"2022-10-01T12:15:51.000000Z\",\"updated_at\":\"2022-10-01T12:15:51.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100003, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 47329.11, '6', '2022-11-01 09:35:56', '2022-12-17 08:53:58', 0, NULL, '0', 0, 0.00, '6781-z4teQ-1667315156', '852134', 1, 'admin', '{\"id\":6,\"customer_id\":3,\"contact_person_name\":\"eee\",\"address_type\":\"home\",\"address\":\"rturtur\",\"additional_address\":null,\"city\":\"New Delhi \",\"zip\":\"110011\",\"phone\":\"7777777777\",\"created_at\":\"2022-11-01T15:05:47.000000Z\",\"updated_at\":\"2022-11-01T15:05:47.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0,\"vat\":null}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100004, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:24:01', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '1250-8aDvg-1670759641', '926917', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100005, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:25:09', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '5052-jkPWC-1670759709', '128717', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100006, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:26:29', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '5607-534xB-1670759789', '327258', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100007, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:27:53', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '8283-j1xnW-1670759873', '408269', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100008, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:27:57', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '4308-eCgJZ-1670759877', '114621', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100009, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:28:49', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '5208-kOaFJ-1670759929', '350527', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100010, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:29:42', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '5285-T4q0X-1670759982', '902216', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100011, '3', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 40990, NULL, '2022-12-11 06:29:46', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '1434-mAep5-1670759986', '658159', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100012, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 40990, '9', '2022-12-11 06:30:34', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '1206-mLshq-1670760034', '437529', 1, 'admin', '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 9, '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100013, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 12000, '9', '2022-12-11 07:26:57', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '7678-LW0yM-1670763417', '506747', 1, 'admin', '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 9, '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100014, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 12000, '9', '2022-12-11 07:41:16', '2022-12-12 09:03:11', 0, NULL, '0', 0, 0.00, '8639-hkUgl-1670764276', '980842', 1, 'admin', '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 9, '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100015, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 198.5, '9', '2022-12-11 08:02:13', '2022-12-12 09:03:11', 0, NULL, '0', 0, 50.00, '6700-O19mL-1670765533', '940980', 1, 'admin', '{\"id\":9,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T17:59:56.000000Z\",\"updated_at\":\"2022-12-01T17:59:56.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, NULL, 'null', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100016, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 235.2, '11', '2022-12-12 09:11:19', '2022-12-12 09:12:44', 0, NULL, '0', 0, 0.00, '1802-5RFXH-1670856079', '615455', 1, 'admin', '{\"id\":11,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T18:07:15.000000Z\",\"updated_at\":\"2022-12-01T18:07:15.000000Z\",\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 11, '{\"id\":11,\"customer_id\":3,\"contact_person_name\":\"Mr. Sanjay Adhek\",\"address_type\":\"permanent\",\"address\":\"hhhh\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7011615618\",\"created_at\":\"2022-12-01T18:07:15.000000Z\",\"updated_at\":\"2022-12-01T18:07:15.000000Z\",\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100017, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 46900, '12', '2022-12-12 09:32:20', '2022-12-12 09:34:47', 0, NULL, '0', 0, 0.00, '8300-0ZYCC-1670857340', '305051', 1, 'admin', '{\"id\":12,\"customer_id\":3,\"contact_person_name\":\"Mr. Umesh Ahmad\",\"address_type\":\"permanent\",\"address\":\"dddd\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7777777777\",\"created_at\":\"2022-12-12T15:02:13.000000Z\",\"updated_at\":\"2022-12-12T15:02:13.000000Z\",\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, 12, '{\"id\":12,\"customer_id\":3,\"contact_person_name\":\"Mr. Umesh Ahmad\",\"address_type\":\"permanent\",\"address\":\"dddd\",\"additional_address\":\"Delhi\",\"city\":\"New Delhi \",\"zip\":\"110019\",\"phone\":\"7777777777\",\"created_at\":\"2022-12-12T15:02:13.000000Z\",\"updated_at\":\"2022-12-12T15:02:13.000000Z\",\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100018, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 38399.04, '13', '2022-12-17 00:32:44', '2022-12-17 00:39:52', 0, NULL, '0', 0, 0.00, '3394-jZI60-1671256964', '626473', 1, 'admin', '{\"id\":13,\"customer_id\":3,\"contact_person_name\":\"Mr. Tarun Prasad\",\"address_type\":\"permanent\",\"address\":\"RZ-17H, Haryana\",\"additional_address\":\"Near Uco Bank\",\"city\":\"Haryana\",\"zip\":\"100020\",\"phone\":\"0123456789\",\"created_at\":\"2022-12-17T06:02:01.000000Z\",\"updated_at\":\"2022-12-17T06:02:01.000000Z\",\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":0,\"vat\":null}', NULL, NULL, NULL, 'null', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100019, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 13499, '14', '2022-12-17 00:54:58', '2022-12-17 00:55:58', 0, NULL, '0', 0, 0.00, '1637-E20OQ-1671258297', '440282', 1, 'admin', '{\"id\":14,\"customer_id\":3,\"contact_person_name\":\"New Address\",\"address_type\":\"permanent\",\"address\":\"Delhi\",\"additional_address\":null,\"city\":\"New Delhi \",\"zip\":\"100020\",\"phone\":\"2020220202\",\"created_at\":\"2022-12-17T06:24:11.000000Z\",\"updated_at\":\"2022-12-17T06:24:11.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0,\"vat\":null}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL),
(100020, '5', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 31670.1, '5', '2022-12-29 05:49:47', '2022-12-29 08:37:41', 0, NULL, '0', 0, 0.00, '1523-okntT-1672312787', '584531', 1, 'admin', '{\"id\":5,\"customer_id\":5,\"contact_person_name\":\"Mr. Sorena test\",\"address_type\":\"permanent\",\"address\":\"Innsbruckweg 60\",\"additional_address\":null,\"city\":\"Rotterdam\",\"zip\":\"3047\",\"phone\":\"0687062626\",\"created_at\":null,\"updated_at\":null,\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":null,\"vat\":null}', NULL, NULL, 5, '{\"id\":5,\"customer_id\":5,\"contact_person_name\":\"Mr. Sorena test\",\"address_type\":\"permanent\",\"address\":\"Innsbruckweg 60\",\"additional_address\":null,\"city\":\"Rotterdam\",\"zip\":\"3047\",\"phone\":\"0687062626\",\"created_at\":null,\"updated_at\":null,\"state\":null,\"country\":\"Netherlands\",\"latitude\":null,\"longitude\":null,\"is_billing\":null,\"vat\":null}', 'default_type', 0.00, NULL, 1, 'product_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"slug\":\"xiaomi-11i-hypercharge-5g-pacific-pearl-128-gb-6-gb-ram-AxIzOg\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"5\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-28-633468b030531.png\\\"]\",\"thumbnail\":\"2022-09-28-633468b031cc0.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":240,\\\"sku\\\":\\\"X1H5(P1G(GR-Aqua\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":240,\\\"sku\\\":\\\"X1H5(P1G(GR-Aquamarine\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":240,\"purchase_price\":239,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":2,\"minimum_order_qty\":1,\"details\":\"<p>Monstrous 4500 mAh Battery<\\/p>\\r\\n\\r\\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-28T15:30:56.000000Z\",\"updated_at\":\"2022-09-28T15:30:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"meta_description\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107099\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 240, 0, 4.8, 'delivered', 'unpaid', '2022-09-28 11:02:09', '2022-10-01 06:40:20', NULL, 'Aquamarine', '{\"color\":\"Aquamarine\"}', 'discount_on_product', 1, 0),
(2, 100002, 10, 1, '{\"id\":10,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Sunflower, rice bran oil\",\"slug\":\"sunflower-rice-bran-oil-RvqwOh\",\"category_ids\":\"[{\\\"id\\\":\\\"17\\\",\\\"position\\\":1},{\\\"id\\\":\\\"22\\\",\\\"position\\\":2},{\\\"id\\\":\\\"23\\\",\\\"position\\\":3}]\",\"brand_id\":16,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-02-6338f303cb2f7.png\\\"]\",\"thumbnail\":\"2022-10-02-6338f303cc7b0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":900,\"purchase_price\":890,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<p>&nbsp;Sunflower, rice bran oil<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-02T02:10:11.000000Z\",\"updated_at\":\"2022-10-02T02:16:03.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Sunflower, rice bran oil\",\"meta_description\":\"Sunflower, rice bran oil\",\"meta_image\":\"2022-10-02-6338f303ccb28.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"127835\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 900, 36, 36, 'pending', 'unpaid', '2022-10-16 08:52:33', '2022-10-16 08:52:33', NULL, '', '[]', 'discount_on_product', 1, 0),
(3, 100002, 2, 1, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Women Printed Viscose Rayon Straight Kurta  (Light Green)\",\"slug\":\"women-printed-viscose-rayon-straight-kurta-light-green-F1jqn6\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1},{\\\"id\\\":\\\"11\\\",\\\"position\\\":2},{\\\"id\\\":\\\"12\\\",\\\"position\\\":3}]\",\"brand_id\":13,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-29-6335e28f433be.png\\\"]\",\"thumbnail\":\"2022-09-29-6335e28f4490c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFD700\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Gold\\\",\\\"price\\\":231,\\\"sku\\\":\\\"WPVRSK(G-Gold\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":231,\"purchase_price\":230,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"minimum_order_qty\":1,\"details\":\"<p>Ideal For<\\/p>\\r\\n\\r\\n<p>Women<\\/p>\\r\\n\\r\\n<p>Length Type<\\/p>\\r\\n\\r\\n<p>Calf Length<\\/p>\\r\\n\\r\\n<p>Brand Color<\\/p>\\r\\n\\r\\n<p>Light Green<\\/p>\\r\\n\\r\\n<p>Occasion<\\/p>\\r\\n\\r\\n<p>Casual<\\/p>\\r\\n\\r\\n<p>Pattern<\\/p>\\r\\n\\r\\n<p>Printed<\\/p>\\r\\n\\r\\n<p>Type<\\/p>\\r\\n\\r\\n<p>Straight<\\/p>\\r\\n\\r\\n<p>Fabric<\\/p>\\r\\n\\r\\n<p>Viscose Rayon<\\/p>\\r\\n\\r\\n<p>Neck<\\/p>\\r\\n\\r\\n<p>Mandarin\\/Chinese Neck<\\/p>\\r\\n\\r\\n<p>Sleeve<\\/p>\\r\\n\\r\\n<p>3\\/4 Sleeve<\\/p>\\r\\n\\r\\n<p>Color<\\/p>\\r\\n\\r\\n<p>Light Green<\\/p>\\r\\n\\r\\n<p>Number of Contents in Sales Package<\\/p>\\r\\n\\r\\n<p>Pack of 1<\\/p>\\r\\n\\r\\n<p>Fabric Care<\\/p>\\r\\n\\r\\n<p>First wash dry clean thereafter handwash<\\/p>\\r\\n\\r\\n<p>Style Code<\\/p>\\r\\n\\r\\n<p>KU632LGN<\\/p>\\r\\n\\r\\n<p>Package contains<\\/p>\\r\\n\\r\\n<p>1 Kurta<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-29T18:23:11.000000Z\",\"updated_at\":\"2022-10-02T07:09:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-09-29-6335e28f44dbb.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"158623\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 231, 23.1, 23.1, 'pending', 'unpaid', '2022-10-16 08:52:33', '2022-10-16 08:52:33', NULL, 'Gold', '{\"color\":\"Gold\"}', 'discount_on_product', 1, 0),
(4, 100003, 14, 1, '{\"id\":14,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Galaxy F23\",\"slug\":\"galaxy-f23-oNeSzD\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"29\\\",\\\"position\\\":2}]\",\"brand_id\":2,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-10-63444851e045d.png\\\"]\",\"thumbnail\":\"2022-10-10-63444851e1932.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFFAF0\\\",\\\"#228B22\\\",\\\"#FF00FF\\\",\\\"#FFD700\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"FloralWhite\\\",\\\"price\\\":13999,\\\"sku\\\":\\\"GF-FloralWhite\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"ForestGreen\\\",\\\"price\\\":13999,\\\"sku\\\":\\\"GF-ForestGreen\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Fuchsia\\\",\\\"price\\\":13999,\\\"sku\\\":\\\"GF-Fuchsia\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Gold\\\",\\\"price\\\":13999,\\\"sku\\\":\\\"GF-Gold\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":13999,\"purchase_price\":13900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":4,\"minimum_order_qty\":1,\"details\":\"<p>* Estimated against the usage profile of an average\\/typical user. Independently assessed by Strategy Analytics between 2021.12.08&ndash;12.20 in USA and UK with pre-release versions of SM-S901, SM-S906, SM-S908 under default setting using 5G Sub6 networks (NOT tested under 5G mmWave network). Actual battery life varies by network environment, features and apps used, frequency of calls and messages, number of times charged, and many other factors.<\\/p>\\r\\n\\r\\n<p>Images shown here are for representational purpose only, actual may vary. All features, specifications and prices are subject to change without prior notice. Model availability may vary from location to location.<\\/p>\\r\\n\\r\\n<p>User Available Memory : User memory is less than the total memory due to storage of the operating system and software used to operate the device features. Actual user memory will vary depending on the operator and may change after software upgrades are performed<\\/p>\\r\\n\\r\\n<p>Network : The bandwidths supported by the device may vary depending on the region or service provider<\\/p>\\r\\n\\r\\n<p>All specifications and descriptions provided herein may be different from the actual specifications and descriptions for the product. Samsung reserves the right to make changes to this web page and the product described herein, at anytime, without obligation on Samsung to provide notification of such change. All functionality, features, specifications, GUI and other product information provided in this web page including, but not limited to, the benefits, design, pricing, components, performance, availability, and capabilities of the product are subject to change without notice or obligation. The contents within the screen are simulated images and are for demonstration purposes only.<\\/p>\\r\\n\\r\\n<p>Creative visualization. Images shown here are for representational purpose only, actual may vary.<\\/p>\\r\\n\\r\\n<p>*S Pen Pro and S Pen Fold Edition sold separately. Only use the Samsung S Pen Pro or the S Pen Fold Edition designed exclusively for Galaxy Z Fold3 5G. All other S Pens or stylus pens not designed for Galaxy Z Fold3 5G (including those by other manufacturers) may damage the screen.<\\/p>\\r\\n\\r\\n<p>*Galaxy Z Fold3 5G and Z Filp3 5G is rated as IPX8. IPX8 is based on test conditions for submersion in up to 1.5 meters of freshwater for up to 30 minutes. Not advised for beach or pool use. Not dust resistant.<\\/p>\\r\\n\\r\\n<p>Measured diagonally, the screen size is 16.72cm (6.6&quot;) in the full rectangle and 16.30cm (6.4&quot;) with accounting for the rounded corners.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>5,000 mAh (typical)*<\\/p>\\r\\n\\r\\n<p>*Typical value tested under third-party laboratory condition. Typical value is the estimated average value considering the deviation in battery capacity among the battery samples tested under IEC 61960 standard. Rated (minimum) capacity is 4,860 mAh. Actual battery life may vary depending on network environment, usage patterns and other factors.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>*First ever features in Galaxy F series<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-10T16:29:05.000000Z\",\"updated_at\":\"2022-10-12T17:43:37.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Galaxy F23\",\"meta_description\":\"Galaxy F23\",\"meta_image\":\"2022-10-10-63444851e1ca8.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"119060\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 13999, 139.99, 279.98, 'pending', 'unpaid', '2022-11-01 09:35:56', '2022-12-17 08:53:58', NULL, 'FloralWhite', '{\"color\":\"FloralWhite\"}', 'discount_on_product', 0, 0),
(5, 100003, 7, 1, '{\"id\":7,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Sony Laptop\",\"slug\":\"sony-laptop-75sQ6y\",\"category_ids\":\"[{\\\"id\\\":\\\"35\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":14,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-01-633824dbbb943.png\\\"]\",\"thumbnail\":\"2022-10-01-633824dbbceda.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Black\\\",\\\"price\\\":31990,\\\"sku\\\":\\\"SL-Black\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":31990,\"purchase_price\":31900,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":1,\"minimum_order_qty\":1,\"details\":\"<p>Sony Laptop<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-01T11:30:35.000000Z\",\"updated_at\":\"2022-10-13T18:31:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Sony\",\"meta_description\":\"Sony\",\"meta_image\":\"2022-10-01-633824dbbd2da.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"150979\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 31990, 2879.1, 3199, 'pending', 'unpaid', '2022-11-01 09:35:56', '2022-12-17 08:53:58', NULL, 'Black', '{\"color\":\"Black\"}', 'discount_on_product', 0, 0),
(6, 100003, 10, 1, '{\"id\":10,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Sunflower, rice bran oil\",\"slug\":\"sunflower-rice-bran-oil-RvqwOh\",\"category_ids\":\"[{\\\"id\\\":\\\"17\\\",\\\"position\\\":1},{\\\"id\\\":\\\"22\\\",\\\"position\\\":2},{\\\"id\\\":\\\"23\\\",\\\"position\\\":3}]\",\"brand_id\":16,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-02-6338f303cb2f7.png\\\"]\",\"thumbnail\":\"2022-10-02-6338f303cc7b0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":900,\"purchase_price\":890,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":6,\"minimum_order_qty\":1,\"details\":\"<p>&nbsp;Sunflower, rice bran oil<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-02T02:10:11.000000Z\",\"updated_at\":\"2022-10-16T14:22:33.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Sunflower, rice bran oil\",\"meta_description\":\"Sunflower, rice bran oil\",\"meta_image\":\"2022-10-02-6338f303ccb28.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"127835\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 900, 18, 18, 'pending', 'unpaid', '2022-11-01 09:35:56', '2022-12-17 08:53:58', NULL, '', '[]', 'discount_on_product', 0, 0),
(7, 100004, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-2},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":0,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-10T18:00:03.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:24:01', '2022-12-11 06:34:03', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 0, 0),
(8, 100005, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-3},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-1,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:54:01.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:25:09', '2022-12-11 06:25:09', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 1, 0),
(9, 100006, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-2,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:55:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:26:29', '2022-12-11 06:26:29', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 1, 0),
(10, 100007, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-5},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-3,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:56:29.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:27:53', '2022-12-11 06:27:53', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 1, 0),
(11, 100008, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-6},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-4,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:57:53.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:27:57', '2022-12-11 06:34:30', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 0, 0),
(12, 100009, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-7},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-5,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:57:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:28:49', '2022-12-11 06:34:26', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 0, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(13, 100010, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-8},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-6,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:58:49.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:29:42', '2022-12-11 06:34:21', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 0, 0),
(14, 100011, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-9},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-7,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:59:42.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\"}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:29:46', '2022-12-11 06:34:10', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 0, 0),
(15, 100012, 16, 1, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (64GB, White)\",\"slug\":\"apple-iphone-11-64gb-white-drPXcl\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470f24b17a5.png\\\",\\\"2022-10-12-63470f24b2c8f.png\\\",\\\"2022-10-12-63470f24b2f99.png\\\"]\",\"thumbnail\":\"2022-10-12-63470f24b32a7.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAFAD2\\\",\\\"#FFB6C1\\\",\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"LightGoldenrodYellow\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightGoldenrodYellow\\\",\\\"qty\\\":-10},{\\\"type\\\":\\\"LightPink\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-LightPink\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White\\\",\\\"price\\\":40990,\\\"sku\\\":\\\"Ai1(W-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40990,\"purchase_price\":40900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":-8,\"minimum_order_qty\":10,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T19:01:56.000000Z\",\"updated_at\":\"2022-12-11T11:59:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (64GB, White)\",\"meta_description\":\"Apple iPhone 11 (64GB, White)\",\"meta_image\":\"2022-10-12-63470f24b3611.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"186115\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 40990, 409.9, 409.9, 'pending', 'unpaid', '2022-12-11 06:30:34', '2022-12-11 06:30:34', NULL, 'LightGoldenrodYellow', '{\"color\":\"LightGoldenrodYellow\"}', 'discount_on_product', 1, 0),
(16, 100013, 17, 1, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Demo Tablet\",\"slug\":\"demo-tablet-Jnohm9\",\"category_ids\":\"[{\\\"id\\\":\\\"33\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-13-634857a736eda.png\\\"]\",\"thumbnail\":\"2022-10-13-634857a73842c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\",\\\"#00FFFF\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-AliceBlue\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-AntiqueWhite\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-Aqua\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-Aquamarine\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":12000,\"purchase_price\":11900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":4,\"minimum_order_qty\":10,\"details\":\"<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-13T18:23:35.000000Z\",\"updated_at\":\"2022-10-13T18:23:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Demo\",\"meta_description\":\"Demo\",\"meta_image\":\"2022-10-13-634857a7387cf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"172810\"}', 1, 12000, 120, 120, 'pending', 'unpaid', '2022-12-11 07:26:57', '2022-12-11 07:26:57', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(17, 100014, 17, 1, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Demo Tablet\",\"slug\":\"demo-tablet-Jnohm9\",\"category_ids\":\"[{\\\"id\\\":\\\"33\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-13-634857a736eda.png\\\"]\",\"thumbnail\":\"2022-10-13-634857a73842c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\",\\\"#00FFFF\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-AliceBlue\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-AntiqueWhite\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-Aqua\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":12000,\\\"sku\\\":\\\"DT-Aquamarine\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":12000,\"purchase_price\":11900,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":3,\"minimum_order_qty\":10,\"details\":\"<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-13T18:23:35.000000Z\",\"updated_at\":\"2022-12-11T12:56:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Demo\",\"meta_description\":\"Demo\",\"meta_image\":\"2022-10-13-634857a7387cf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"172810\"}', 1, 12000, 120, 120, 'pending', 'unpaid', '2022-12-11 07:41:16', '2022-12-11 07:41:16', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(18, 100015, 13, 1, '{\"id\":13,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)\",\"slug\":\"dhara-kachi-ghani-mustard-oil-mustard-oil-plastic-bottle-1-l-oZUwSZ\",\"category_ids\":\"[{\\\"id\\\":\\\"17\\\",\\\"position\\\":1},{\\\"id\\\":\\\"22\\\",\\\"position\\\":2},{\\\"id\\\":\\\"27\\\",\\\"position\\\":3}]\",\"brand_id\":18,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-02-633914674072a.png\\\",\\\"2022-10-02-6339146741c15.png\\\"]\",\"thumbnail\":\"2022-10-02-6339146741f32.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":149,\"tax\":0,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":20,\"minimum_order_qty\":1,\"details\":\"<p>DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle&nbsp;&nbsp;(1 L)<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-02T04:32:39.000000Z\",\"updated_at\":\"2022-10-02T04:32:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)\",\"meta_description\":\"DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)\",\"meta_image\":\"2022-10-02-633914674229a.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":50,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"154651\"}', 1, 150, 0, 1.5, 'pending', 'unpaid', '2022-12-11 08:02:13', '2022-12-11 08:02:13', NULL, '', '[]', 'discount_on_product', 1, 0),
(19, 100016, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"slug\":\"xiaomi-11i-hypercharge-5g-pacific-pearl-128-gb-6-gb-ram-AxIzOg\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-29-6335e34623dc7.png\\\"]\",\"thumbnail\":\"2022-09-28-633468b031cc0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":240,\\\"sku\\\":\\\"X1H5(P1G(GR-Aqua\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":240,\\\"sku\\\":\\\"X1H5(P1G(GR-Aquamarine\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":240,\"purchase_price\":239,\"tax\":0,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":200,\"minimum_order_qty\":1,\"details\":\"<p>Monstrous 4500 mAh Battery<\\/p>\\r\\n\\r\\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-28T15:30:56.000000Z\",\"updated_at\":\"2022-10-13T18:33:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"meta_description\":\"Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107099\"}', 1, 240, 0, 4.8, 'pending', 'unpaid', '2022-12-12 09:11:19', '2022-12-12 09:11:19', NULL, 'Aqua', '{\"color\":\"Aqua\"}', 'discount_on_product', 1, 0),
(20, 100017, 15, 1, '{\"id\":15,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Apple iPhone 11 (128GB, Black)\",\"slug\":\"apple-iphone-11-128gb-black-8xZHX4\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"position\\\":1},{\\\"id\\\":\\\"30\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-12-63470d3848c46.png\\\",\\\"2022-10-12-63470d384a177.png\\\",\\\"2022-10-12-63470d384a480.png\\\"]\",\"thumbnail\":\"2022-10-12-63470d384a799.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Black\\\",\\\"price\\\":46900,\\\"sku\\\":\\\"Ai1(B-Black\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":46900,\"purchase_price\":46500,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":200,\"minimum_order_qty\":5,\"details\":\"<p><strong>Why buy Apple iPhone 11<\\/strong><\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras<\\/strong>&nbsp;along with 12 MP front camera enables the device to take better photos<\\/li>\\r\\n\\t<li><strong>A13 Bionic Chip Processor<\\/strong>&nbsp;lets you install and run as many apps as you like<\\/li>\\r\\n\\t<li><strong>Liquid Retina HD Display<\\/strong>&nbsp;is more immersive giving awesome clarity defining every details<\\/li>\\r\\n\\t<li><strong>iOS 14<\\/strong>&nbsp;operating system offers with smooth usage<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>Buy the&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;\\/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.<\\/p>\\r\\n\\r\\n<p>Use&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;which has a storage of 128GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529. When you get&nbsp;<strong>Apple iPhone 11<\\/strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-12T18:53:44.000000Z\",\"updated_at\":\"2022-10-12T18:53:44.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Apple iPhone 11 (128GB, Black)\",\"meta_description\":\"Apple iPhone 11 (128GB, Black)\",\"meta_image\":\"2022-10-12-63470d384ab12.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123909\"}', 1, 46900, 469, 469, 'pending', 'unpaid', '2022-12-12 09:32:20', '2022-12-12 09:32:20', NULL, 'Black', '{\"color\":\"Black\"}', 'discount_on_product', 1, 0),
(21, 100018, 8, 1, '{\"id\":8,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Hp Laptop I3 8gb Ram | Discounted | Shoponline\",\"slug\":\"hp-laptop-i3-8gb-ram-discounted-shoponline-Xt8bJM\",\"category_ids\":\"[{\\\"id\\\":\\\"35\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":15,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-01-633826fde14cb.png\\\"]\",\"thumbnail\":\"2022-10-01-633826fde2c17.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFFFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"White\\\",\\\"price\\\":39999,\\\"sku\\\":\\\"HLI8R|D|S-White\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":39999,\"purchase_price\":39000,\"tax\":1,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":200,\"minimum_order_qty\":1,\"details\":\"<p>Hp Laptop I3 8gb Ram Discounted Shoponline<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-01T11:39:41.000000Z\",\"updated_at\":\"2022-10-13T18:28:32.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Hp Laptop I3 8gb Ram Discounted Shoponline\",\"meta_description\":\"Hp Laptop I3 8gb Ram Discounted Shoponline\",\"meta_image\":\"2022-10-01-633826fde3183.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"106583\"}', 1, 39999, 399.99, 1999.95, 'pending', 'unpaid', '2022-12-17 00:32:44', '2022-12-17 00:32:44', NULL, 'White', '{\"color\":\"White\"}', 'discount_on_product', 1, 0),
(22, 100019, 3, 1, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380A\",\"slug\":\"samsung-80-cm-32-inch-hd-ready-led-smart-tizen-tv-with-2022-model-ua32t4380akxxl-GFzF6x\",\"category_ids\":\"[{\\\"id\\\":\\\"37\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-30-6336476bab1aa.png\\\"]\",\"thumbnail\":\"2022-09-30-6336476bac6cf.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":13499,\"purchase_price\":10499,\"tax\":25,\"tax_type\":\"percent\",\"discount\":25,\"discount_type\":\"percent\",\"current_stock\":200,\"minimum_order_qty\":5,\"details\":\"<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>With this Samsung TV, every image on the screen comes to life, giving you a home theatre experience. With the HD visual quality of this TV, you can enjoy vibrant movie scenes. Additionally, HDR increases the screen&#39;s brightness and brings out the subtleties of the material. Moreover, the Contrast Enhancer on this TV improves contrast and offers superb image quality with increased depth.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-30T01:33:31.000000Z\",\"updated_at\":\"2022-10-13T18:37:32.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380AKXXL)\",\"meta_description\":\"SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380AKXXL)\",\"meta_image\":\"2022-09-30-6336476baca38.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"163637\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 13499, 3374.75, 3374.75, 'pending', 'unpaid', '2022-12-17 00:54:58', '2022-12-17 00:54:58', NULL, '', '[]', 'discount_on_product', 1, 0),
(23, 100020, 7, 1, '{\"id\":7,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Sony Laptop\",\"slug\":\"sony-laptop-75sQ6y\",\"category_ids\":\"[{\\\"id\\\":\\\"35\\\",\\\"position\\\":1},{\\\"id\\\":\\\"36\\\",\\\"position\\\":2}]\",\"brand_id\":14,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-01-633824dbbb943.png\\\"]\",\"thumbnail\":\"2022-10-01-633824dbbceda.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Black\\\",\\\"price\\\":31990,\\\"sku\\\":\\\"SL-Black\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":31990,\"purchase_price\":31900,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":201,\"minimum_order_qty\":1,\"details\":\"<p>Sony Laptop<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-01T11:30:35.000000Z\",\"updated_at\":\"2022-12-17T14:23:58.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Sony\",\"meta_description\":\"Sony\",\"meta_image\":\"2022-10-01-633824dbbd2da.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"150979\"}', 1, 31990, 2879.1, 3199, 'pending', 'unpaid', '2022-12-29 05:49:47', '2022-12-29 05:49:47', NULL, 'Black', '{\"color\":\"Black\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100001, 235.20, 235.20, 0.00, 'admin', 'disburse', 5.00, 0.00, '2022-10-01 06:40:20', '2022-10-01 06:40:20', 2, 'admin', 'admin', 'cash_on_delivery', '8658-0Ywbe-1664626220', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', 'xiaomi-11i-hypercharge-5g-pacific-pearl-128-gb-6-gb-ram-AxIzOg', '[{\"id\":\"28\",\"position\":1},{\"id\":\"31\",\"position\":2}]', 1, 'pc', 1, 1, '[\"2023-07-08-64a8db56d362e.png\",\"2023-07-08-64a8db56d4c2c.png\",\"2023-07-08-64a8db56d526d.png\"]', '2023-07-08-64a8db56d5a57.png', '1', NULL, 'youtube', NULL, '[\"#00FFFF\",\"#7FFFD4\"]', 0, 'null', '[]', '[{\"type\":\"Aqua\",\"price\":240,\"sku\":\"X1H5(P1G(GR-Aqua\",\"qty\":0},{\"type\":\"Aquamarine\",\"price\":240,\"sku\":\"X1H5(P1G(GR-Aquamarine\",\"qty\":1}]', 0, 240, 239, '0', 'percent', '2', 'percent', 1, 1, '<p>Monstrous 4500 mAh Battery</p>\r\n\r\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.</p>', 0, NULL, '2022-09-28 10:00:56', '2023-07-07 22:14:08', 1, 1, 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', '2023-07-08-64a8db56d6142.png', 1, NULL, 0.00, 1, NULL, NULL, '107099'),
(2, 'admin', 1, 'Women Printed Viscose Rayon Straight Kurta  (Light Green)', 'women-printed-viscose-rayon-straight-kurta-light-green-F1jqn6', '[{\"id\":\"3\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 13, 'pc', 1, 1, '[\"2022-09-29-6335e28f433be.png\"]', '2022-09-29-6335e28f4490c.png', '1', NULL, 'youtube', NULL, '[\"#FFD700\"]', 0, 'null', '[]', '[{\"type\":\"Gold\",\"price\":231,\"sku\":\"WPVRSK(G-Gold\",\"qty\":0}]', 0, 231, 230, '10', 'percent', '10', 'percent', 200, 1, '<p>Ideal For</p>\r\n\r\n<p>Women</p>\r\n\r\n<p>Length Type</p>\r\n\r\n<p>Calf Length</p>\r\n\r\n<p>Brand Color</p>\r\n\r\n<p>Light Green</p>\r\n\r\n<p>Occasion</p>\r\n\r\n<p>Casual</p>\r\n\r\n<p>Pattern</p>\r\n\r\n<p>Printed</p>\r\n\r\n<p>Type</p>\r\n\r\n<p>Straight</p>\r\n\r\n<p>Fabric</p>\r\n\r\n<p>Viscose Rayon</p>\r\n\r\n<p>Neck</p>\r\n\r\n<p>Mandarin/Chinese Neck</p>\r\n\r\n<p>Sleeve</p>\r\n\r\n<p>3/4 Sleeve</p>\r\n\r\n<p>Color</p>\r\n\r\n<p>Light Green</p>\r\n\r\n<p>Number of Contents in Sales Package</p>\r\n\r\n<p>Pack of 1</p>\r\n\r\n<p>Fabric Care</p>\r\n\r\n<p>First wash dry clean thereafter handwash</p>\r\n\r\n<p>Style Code</p>\r\n\r\n<p>KU632LGN</p>\r\n\r\n<p>Package contains</p>\r\n\r\n<p>1 Kurta</p>', 0, NULL, '2022-09-29 12:53:11', '2022-10-16 08:52:33', 1, 1, NULL, NULL, '2022-09-29-6335e28f44dbb.png', 1, NULL, 0.00, 1, NULL, NULL, '158623'),
(3, 'admin', 1, 'SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380A', 'samsung-80-cm-32-inch-hd-ready-led-smart-tizen-tv-with-2022-model-ua32t4380akxxl-GFzF6x', '[{\"id\":\"37\",\"position\":1},{\"id\":\"10\",\"position\":3}]', 2, 'pc', 1, 1, '[\"2022-09-30-6336476bab1aa.png\"]', '2022-09-30-6336476bac6cf.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 13499, 10499, '25', 'percent', '25', 'percent', 199, 5, '<p>&nbsp;</p>\r\n\r\n<p>With this Samsung TV, every image on the screen comes to life, giving you a home theatre experience. With the HD visual quality of this TV, you can enjoy vibrant movie scenes. Additionally, HDR increases the screen&#39;s brightness and brings out the subtleties of the material. Moreover, the Contrast Enhancer on this TV improves contrast and offers superb image quality with increased depth.</p>', 0, NULL, '2022-09-29 20:03:31', '2022-12-17 00:54:58', 1, 1, 'SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380AKXXL)', 'SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380AKXXL)', '2022-09-30-6336476baca38.png', 1, NULL, 0.00, 1, NULL, NULL, '163637'),
(4, 'seller', 2, 'realme C31 (Light Silver, 32 GB)  (3 GB RAM)', 'realme-c31-light-silver-32-gb-3-gb-ram-QHbpAJ', '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2},{\"id\":\"9\",\"position\":3}]', 9, 'pc', 1, 1, '[\"2022-10-01-6337c36441fc3.png\",\"2022-10-01-6337c3644349c.png\",\"2022-10-01-6337c3644379c.png\",\"2022-10-01-6337c36443a94.png\",\"2022-10-01-6337c36443d87.png\",\"2022-10-01-6337c3644407b.png\"]', '2022-10-01-6337c36444382.png', '1', NULL, 'youtube', NULL, '[\"#F0FFFF\"]', 0, 'null', '[]', '[{\"type\":\"Azure\",\"price\":9349,\"sku\":\"rC(S3G(GR-Azure\",\"qty\":1}]', 0, 9349, 9349, '10', 'percent', '0', 'percent', 200, 1, '<p>Craving for an entertainment buddy? Wait no more and enjoy the best company that is designed specially for tech-geeks. With a brilliant camera set-up this phone enables you to capture stunning images with incredible clarity. Driven by an Octa-core processor, the unmatched performance executed by this phone is sure to mesmerise you. With two SIM card slots and a microSD card slot you can seamlessly enjoy uninterrupted connection and unrivalled storage. Furthermore, this smartphone comes with a 5 MP selfie camera that enables you to capture breathtaking selfies.</p>', 0, NULL, '2022-09-30 23:04:44', '2022-09-30 23:21:25', 1, 1, 'realme C31 (Light Silver, 32 GB)  (3 GB RAM)', 'realme C31 (Light Silver, 32 GB)  (3 GB RAM)', '2022-10-01-6337c364446e6.png', 1, NULL, 0.00, 1, NULL, NULL, '181476'),
(5, 'seller', 2, 'Women Beige Ethnic Print Straight Kurta Set With Side Pockets', 'women-beige-ethnic-print-straight-kurta-set-with-side-pockets-7A4gph', '[{\"id\":\"3\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 13, 'pc', 1, 1, '[\"2022-10-01-6337c5ea4fc37.png\"]', '2022-10-01-6337c5ea5124b.png', '1', NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, 'null', '[]', '[{\"type\":\"AntiqueWhite\",\"price\":1000,\"sku\":\"WBEPSKSWSP-AntiqueWhite\",\"qty\":1}]', 0, 1000, 999, '2', 'percent', '0', 'percent', 200, 1, '<p>Women Beige Ethnic Print Straight Kurta Set With Side Pockets</p>', 0, NULL, '2022-09-30 23:15:30', '2022-09-30 23:21:23', 1, 1, 'Women Beige Ethnic Print Straight Kurta Set With Side Pockets', 'Women Beige Ethnic Print Straight Kurta Set With Side Pockets', '2022-10-01-6337c5ea51714.png', 1, NULL, 0.00, 0, NULL, NULL, '127882'),
(6, 'seller', 2, 'Janasya Women\'s Maroon Pure Cotton Straight Kurta', 'janasya-womens-maroon-pure-cotton-straight-kurta-McJLoX', '[{\"id\":\"3\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"12\",\"position\":3}]', 13, 'pc', 1, 1, '[\"2022-10-01-6337c6b24b9f9.png\"]', '2022-10-01-6337c6b24cf16.png', '1', NULL, 'youtube', NULL, '[\"#F5F5DC\",\"#FFE4C4\",\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Beige\",\"price\":562,\"sku\":\"JWMPCSK-Beige\",\"qty\":1},{\"type\":\"Bisque\",\"price\":562,\"sku\":\"JWMPCSK-Bisque\",\"qty\":1},{\"type\":\"Black\",\"price\":562,\"sku\":\"JWMPCSK-Black\",\"qty\":1}]', 0, 562, 560, '1', 'percent', '0', 'percent', 3, 1, '<p>Janasya Women&#39;s Maroon Pure Cotton Straight Kurta</p>', 0, NULL, '2022-09-30 23:18:50', '2023-03-14 22:40:40', 1, 1, 'Janasya Women\'s Maroon Pure Cotton Straight Kurta', 'Janasya Women\'s Maroon Pure Cotton Straight Kurta', '2022-10-01-6337c6b24d295.png', 1, NULL, 0.00, 0, NULL, NULL, '113418'),
(7, 'admin', 1, 'Sony Laptop', 'sony-laptop-75sQ6y', '[{\"id\":\"35\",\"position\":1},{\"id\":\"36\",\"position\":2}]', 14, 'kg', 1, 1, '[\"2022-10-01-633824dbbb943.png\"]', '2022-10-01-633824dbbceda.png', '1', NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":31990,\"sku\":\"SL-Black\",\"qty\":0}]', 0, 31990, 31900, '9', 'percent', '10', 'percent', 200, 1, '<p>Sony Laptop</p>', 0, NULL, '2022-10-01 06:00:35', '2022-12-29 05:49:47', 1, 1, 'Sony', 'Sony', '2022-10-01-633824dbbd2da.png', 1, NULL, 0.00, 1, NULL, NULL, '150979'),
(8, 'admin', 1, 'Hp Laptop I3 8gb Ram | Discounted | Shoponline', 'hp-laptop-i3-8gb-ram-discounted-shoponline-Xt8bJM', '[{\"id\":\"35\",\"position\":1},{\"id\":\"36\",\"position\":2}]', 15, 'kg', 1, 1, '[\"2022-10-01-633826fde14cb.png\"]', '2022-10-01-633826fde2c17.png', '1', NULL, 'youtube', NULL, '[\"#FFFFFF\"]', 0, 'null', '[]', '[{\"type\":\"White\",\"price\":39999,\"sku\":\"HLI8R|D|S-White\",\"qty\":0}]', 0, 39999, 39000, '1', 'percent', '5', 'percent', 199, 1, '<p>Hp Laptop I3 8gb Ram Discounted Shoponline</p>', 0, NULL, '2022-10-01 06:09:41', '2022-12-17 00:32:44', 1, 1, 'Hp Laptop I3 8gb Ram Discounted Shoponline', 'Hp Laptop I3 8gb Ram Discounted Shoponline', '2022-10-01-633826fde3183.png', 1, NULL, 0.00, 1, NULL, NULL, '106583'),
(9, 'admin', 1, 'Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)', 'apple-macbook-pro-2020-m1-162-inch-32gb-1tb-macos-monterey-space-grey-5q8Xup', '[{\"id\":\"35\",\"position\":1},{\"id\":\"36\",\"position\":2}]', 3, 'kg', 1, 1, '[\"2022-10-01-63382bee82eb2.png\"]', '2022-10-01-63382bee84391.png', '1', NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":234000,\"sku\":\"AMP2(1i31mMSG-Black\",\"qty\":1}]', 0, 234000, 230000, '2', 'percent', '2', 'percent', 200, 1, '<h1>Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)</h1>', 0, NULL, '2022-10-01 06:30:46', '2022-10-13 13:00:43', 1, 1, 'Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)', 'Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)', '2022-10-01-63382bee84703.png', 1, NULL, 0.00, 1, NULL, NULL, '150654'),
(10, 'admin', 1, 'Sunflower, rice bran oil', 'sunflower-rice-bran-oil-RvqwOh', '[{\"id\":\"17\",\"position\":1},{\"id\":\"22\",\"position\":2},{\"id\":\"23\",\"position\":3}]', 16, 'kg', 1, 1, '[\"2022-10-02-6338f303cb2f7.png\"]', '2022-10-02-6338f303cc7b0.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 900, 890, '1', 'percent', '1', 'percent', 202, 1, '<p>&nbsp;Sunflower, rice bran oil</p>', 0, NULL, '2022-10-01 20:40:11', '2022-12-17 08:53:58', 1, 1, 'Sunflower, rice bran oil', 'Sunflower, rice bran oil', '2022-10-02-6338f303ccb28.png', 1, NULL, 0.00, 1, NULL, NULL, '127835'),
(11, 'admin', 1, 'Lux Soft Glow Soap, 300 gm (3x100 gm)', 'lux-soft-glow-soap-300-gm-3x100-gm-tB6RvT', '[{\"id\":\"17\",\"position\":1},{\"id\":\"25\",\"position\":2},{\"id\":\"26\",\"position\":3}]', 17, 'pc', 1, 1, '[\"2022-10-02-6338f6677edda.png\",\"2022-10-02-6338f667802d2.png\",\"2022-10-02-6338f66780667.png\",\"2022-10-02-6338f66780995.png\"]', '2022-10-02-6338f66780cd5.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 155, 154, '1', 'percent', '1', 'percent', 200, 1, '<h1>Lux Soft Glow Soap, 300 gm (3x100 gm)</h1>', 0, NULL, '2022-10-01 20:54:39', '2022-10-01 20:54:43', 1, 1, 'Lux Soft Glow Soap, 300 gm (3x100 gm)', 'Lux Soft Glow Soap, 300 gm (3x100 gm)', '2022-10-02-6338f66781061.png', 1, NULL, 0.00, 1, NULL, NULL, '128219'),
(12, 'admin', 1, 'Bathing bars & soaps', 'bathing-bars-soaps-SPLBeg', '[{\"id\":\"17\",\"position\":1},{\"id\":\"25\",\"position\":2},{\"id\":\"26\",\"position\":3}]', 17, 'pc', 1, 1, '[\"2022-10-02-6338f8412afca.png\",\"2022-10-02-6338f8412c527.png\",\"2022-10-02-6338f8412c842.png\",\"2022-10-02-6338f8412cb71.png\",\"2022-10-02-6338f8412ce91.png\"]', '2022-10-02-6338f8412d1e9.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 40, 35, '1', 'percent', '2', 'percent', 200, 5, '<p>Bathing bars &amp; soaps</p>', 0, NULL, '2022-10-01 21:02:33', '2022-10-01 21:02:37', 1, 1, 'Bathing bars & soaps', 'Bathing bars & soaps', '2022-10-02-6338f8412d56b.png', 1, NULL, 0.00, 1, NULL, NULL, '184920'),
(13, 'admin', 1, 'DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)', 'dhara-kachi-ghani-mustard-oil-mustard-oil-plastic-bottle-1-l-oZUwSZ', '[{\"id\":\"17\",\"position\":1},{\"id\":\"22\",\"position\":2},{\"id\":\"27\",\"position\":3}]', 18, 'ltrs', 1, 1, '[\"2022-10-02-633914674072a.png\",\"2022-10-02-6339146741c15.png\"]', '2022-10-02-6339146741f32.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 149, '0', 'percent', '1', 'percent', 200, 1, '<p>DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle&nbsp;&nbsp;(1 L)</p>', 0, NULL, '2022-10-01 23:02:39', '2022-12-11 08:02:13', 1, 1, 'DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)', 'DHARA Kachi Ghani Mustard Oil Mustard Oil Plastic Bottle  (1 L)', '2022-10-02-633914674229a.png', 1, NULL, 50.00, 1, NULL, NULL, '154651'),
(14, 'admin', 1, 'Galaxy F23', 'galaxy-f23-oNeSzD', '[{\"id\":\"28\",\"position\":1},{\"id\":\"29\",\"position\":2}]', 2, 'gms', 1, 1, '[\"2022-10-10-63444851e045d.png\"]', '2022-10-10-63444851e1932.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\",\"#228B22\",\"#FF00FF\",\"#FFD700\"]', 0, 'null', '[]', '[{\"type\":\"FloralWhite\",\"price\":13999,\"sku\":\"GF-FloralWhite\",\"qty\":1},{\"type\":\"ForestGreen\",\"price\":13999,\"sku\":\"GF-ForestGreen\",\"qty\":1},{\"type\":\"Fuchsia\",\"price\":13999,\"sku\":\"GF-Fuchsia\",\"qty\":1},{\"type\":\"Gold\",\"price\":13999,\"sku\":\"GF-Gold\",\"qty\":1}]', 0, 13999, 13900, '1', 'percent', '2', 'percent', 201, 1, '<p>* Estimated against the usage profile of an average/typical user. Independently assessed by Strategy Analytics between 2021.12.08&ndash;12.20 in USA and UK with pre-release versions of SM-S901, SM-S906, SM-S908 under default setting using 5G Sub6 networks (NOT tested under 5G mmWave network). Actual battery life varies by network environment, features and apps used, frequency of calls and messages, number of times charged, and many other factors.</p>\r\n\r\n<p>Images shown here are for representational purpose only, actual may vary. All features, specifications and prices are subject to change without prior notice. Model availability may vary from location to location.</p>\r\n\r\n<p>User Available Memory : User memory is less than the total memory due to storage of the operating system and software used to operate the device features. Actual user memory will vary depending on the operator and may change after software upgrades are performed</p>\r\n\r\n<p>Network : The bandwidths supported by the device may vary depending on the region or service provider</p>\r\n\r\n<p>All specifications and descriptions provided herein may be different from the actual specifications and descriptions for the product. Samsung reserves the right to make changes to this web page and the product described herein, at anytime, without obligation on Samsung to provide notification of such change. All functionality, features, specifications, GUI and other product information provided in this web page including, but not limited to, the benefits, design, pricing, components, performance, availability, and capabilities of the product are subject to change without notice or obligation. The contents within the screen are simulated images and are for demonstration purposes only.</p>\r\n\r\n<p>Creative visualization. Images shown here are for representational purpose only, actual may vary.</p>\r\n\r\n<p>*S Pen Pro and S Pen Fold Edition sold separately. Only use the Samsung S Pen Pro or the S Pen Fold Edition designed exclusively for Galaxy Z Fold3 5G. All other S Pens or stylus pens not designed for Galaxy Z Fold3 5G (including those by other manufacturers) may damage the screen.</p>\r\n\r\n<p>*Galaxy Z Fold3 5G and Z Filp3 5G is rated as IPX8. IPX8 is based on test conditions for submersion in up to 1.5 meters of freshwater for up to 30 minutes. Not advised for beach or pool use. Not dust resistant.</p>\r\n\r\n<p>Measured diagonally, the screen size is 16.72cm (6.6&quot;) in the full rectangle and 16.30cm (6.4&quot;) with accounting for the rounded corners.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>5,000 mAh (typical)*</p>\r\n\r\n<p>*Typical value tested under third-party laboratory condition. Typical value is the estimated average value considering the deviation in battery capacity among the battery samples tested under IEC 61960 standard. Rated (minimum) capacity is 4,860 mAh. Actual battery life may vary depending on network environment, usage patterns and other factors.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>*First ever features in Galaxy F series</p>', 0, NULL, '2022-10-10 10:59:05', '2022-12-17 08:53:58', 1, 1, 'Galaxy F23', 'Galaxy F23', '2022-10-10-63444851e1ca8.png', 1, NULL, 0.00, 1, NULL, NULL, '119060'),
(15, 'admin', 1, 'Apple iPhone 11 (128GB, Black)', 'apple-iphone-11-128gb-black-8xZHX4', '[{\"id\":\"28\",\"position\":1},{\"id\":\"30\",\"position\":2}]', 3, 'gms', 1, 1, '[\"2022-10-12-63470d3848c46.png\",\"2022-10-12-63470d384a177.png\",\"2022-10-12-63470d384a480.png\"]', '2022-10-12-63470d384a799.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":46900,\"sku\":\"Ai1(B-Black\",\"qty\":0}]', 0, 46900, 46500, '1', 'percent', '1', 'percent', 199, 5, '<p><strong>Why buy Apple iPhone 11</strong></p>\r\n\r\n<ul>\r\n	<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras</strong>&nbsp;along with 12 MP front camera enables the device to take better photos</li>\r\n	<li><strong>A13 Bionic Chip Processor</strong>&nbsp;lets you install and run as many apps as you like</li>\r\n	<li><strong>Liquid Retina HD Display</strong>&nbsp;is more immersive giving awesome clarity defining every details</li>\r\n	<li><strong>iOS 14</strong>&nbsp;operating system offers with smooth usage</li>\r\n</ul>\r\n\r\n<p>Buy the&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.</p>\r\n\r\n<p>Use&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which has a storage of 128GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529. When you get&nbsp;<strong>Apple iPhone 11</strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone.</p>', 0, NULL, '2022-10-12 13:23:44', '2022-12-12 09:32:20', 1, 1, 'Apple iPhone 11 (128GB, Black)', 'Apple iPhone 11 (128GB, Black)', '2022-10-12-63470d384ab12.png', 1, NULL, 0.00, 1, NULL, NULL, '123909'),
(16, 'admin', 1, 'Apple iPhone 11 (64GB, White)', 'apple-iphone-11-64gb-white-drPXcl', '[{\"id\":\"28\",\"position\":1},{\"id\":\"30\",\"position\":2}]', 3, 'pc', 1, 1, '[\"2022-10-12-63470f24b17a5.png\",\"2022-10-12-63470f24b2c8f.png\",\"2022-10-12-63470f24b2f99.png\"]', '2022-10-12-63470f24b32a7.png', NULL, NULL, 'youtube', NULL, '[\"#FAFAD2\",\"#FFB6C1\",\"#FFFFFF\"]', 0, 'null', '[]', '[{\"type\":\"LightGoldenrodYellow\",\"price\":40990,\"sku\":\"Ai1(W-LightGoldenrodYellow\",\"qty\":-6},{\"type\":\"LightPink\",\"price\":40990,\"sku\":\"Ai1(W-LightPink\",\"qty\":1},{\"type\":\"White\",\"price\":40990,\"sku\":\"Ai1(W-White\",\"qty\":1}]', 0, 40990, 40900, '1', 'percent', '1', 'percent', 200, 10, '<p><strong>Why buy Apple iPhone 11</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Liquid Retina HD Display</strong>&nbsp;is more immersive giving awesome clarity defining every details</li>\r\n	<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras</strong>&nbsp;along with 12 MP front camera enables the device to take better photos</li>\r\n	<li><strong>A13 Bionic Chip Processor</strong>&nbsp;lets you install and run as many apps as you like</li>\r\n	<li><strong>iOS 14</strong>&nbsp;operating system offers with smooth usage</li>\r\n</ul>\r\n\r\n<p>When you get&nbsp;<strong>Apple iPhone 11</strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.</p>\r\n\r\n<p>Buy the&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.</p>', 0, NULL, '2022-10-12 13:31:56', '2022-12-11 06:34:30', 1, 1, 'Apple iPhone 11 (64GB, White)', 'Apple iPhone 11 (64GB, White)', '2022-10-12-63470f24b3611.png', 1, NULL, 0.00, 1, NULL, NULL, '186115'),
(17, 'admin', 1, 'Demo Tablet', 'demo-tablet-Jnohm9', '[{\"id\":\"17\",\"position\":1},{\"id\":\"25\",\"position\":2},{\"id\":\"26\",\"position\":3}]', 3, 'kg', 1, 1, '[\"2022-10-13-634857a736eda.png\",\"2023-07-08-64a90c33368af.png\",\"2023-07-08-64a90c334b3bd.png\"]', '2022-10-13-634857a73842c.png', NULL, NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#00FFFF\",\"#7FFFD4\",\"#F08080\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"MI\",\"options\":[\"XL\",\"      XXL\",\"      S\",\"      M\"]}]', '[{\"type\":\"AliceBlue-XL\",\"price\":12000,\"sku\":\"DT-AliceBlue-XL\",\"qty\":1},{\"type\":\"AliceBlue-XXL\",\"price\":12000,\"sku\":\"DT-AliceBlue-XXL\",\"qty\":1},{\"type\":\"AliceBlue-S\",\"price\":12000,\"sku\":\"DT-AliceBlue-S\",\"qty\":1},{\"type\":\"AliceBlue-M\",\"price\":12000,\"sku\":\"DT-AliceBlue-M\",\"qty\":1},{\"type\":\"Aqua-XL\",\"price\":12000,\"sku\":\"DT-Aqua-XL\",\"qty\":1},{\"type\":\"Aqua-XXL\",\"price\":12000,\"sku\":\"DT-Aqua-XXL\",\"qty\":1},{\"type\":\"Aqua-S\",\"price\":12000,\"sku\":\"DT-Aqua-S\",\"qty\":1},{\"type\":\"Aqua-M\",\"price\":12000,\"sku\":\"DT-Aqua-M\",\"qty\":1},{\"type\":\"Aquamarine-XL\",\"price\":12000,\"sku\":\"DT-Aquamarine-XL\",\"qty\":1},{\"type\":\"Aquamarine-XXL\",\"price\":12000,\"sku\":\"DT-Aquamarine-XXL\",\"qty\":1},{\"type\":\"Aquamarine-S\",\"price\":12000,\"sku\":\"DT-Aquamarine-S\",\"qty\":1},{\"type\":\"Aquamarine-M\",\"price\":12000,\"sku\":\"DT-Aquamarine-M\",\"qty\":1},{\"type\":\"LightCoral-XL\",\"price\":12000,\"sku\":\"DT-LightCoral-XL\",\"qty\":1},{\"type\":\"LightCoral-XXL\",\"price\":12000,\"sku\":\"DT-LightCoral-XXL\",\"qty\":1},{\"type\":\"LightCoral-S\",\"price\":12000,\"sku\":\"DT-LightCoral-S\",\"qty\":1},{\"type\":\"LightCoral-M\",\"price\":12000,\"sku\":\"DT-LightCoral-M\",\"qty\":1}]', 0, 12000, 11900, '1', 'percent', '1', 'percent', 16, 10, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 0, NULL, '2022-10-13 12:53:35', '2023-07-08 07:11:47', 1, 1, 'Demo', 'Demo', '2022-10-13-634857a7387cf.png', 1, NULL, 0.00, 1, NULL, NULL, '172810');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Excellent Product !!!', '[]', 5, 1, '2022-10-01 06:41:38', '2022-10-01 06:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'Rohet', 'Soni', '316587062626', 'def.png', 'rohet@digi-lux.nl', '$2y$10$hSbpkUYwRn2CFwPFbORhVu2eZUFgNE9txIjJzcmZyLxWuaBt8t1ca', 'approved', NULL, '2022-09-28 15:04:39', '2022-09-30 01:19:31', NULL, NULL, NULL, NULL, 'Qqb1elRE2QPnUoIJZP8GdSyjBXP0RQrNAG1u9z7sb7OrL7GizziqiTM5Z7VZ5aWYzhtHKVnZK62RQFBo', 10.00, NULL, NULL, 0),
(2, 'Sanjay', 'Adhek', '7011615618', '2022-10-01-6337b46a56f52.png', 'sanjay.adhek@gmail.com', '$2y$10$5XJYrTbsVgzToaHmSht1QOOnOa4SJpopqtR/q1LIk4qwRAucmtK6C', 'approved', 'X8bJPSnl1qxInsGBCztRGbCXjZVvD6C4H6n8rgWImidD9RonXz2MJXnqA2mW', '2022-09-30 21:48:53', '2022-09-30 22:05:16', 'JANA LAXMI BANK', 'NEW DELHI', '3037196320', 'Sanjay Ku Adhek', NULL, NULL, NULL, NULL, 0),
(3, 'Anis', 'Ahmad', '9968216296', '2022-10-01-6337b3846b672.png', 'anis@gmail.com', '$2y$10$MVAQIXJbV.BJQp8nZxub9.IYFHfVGA/HMy3Xo4sWAdniuCaR9JiI6', 'approved', NULL, '2022-09-30 21:57:00', '2022-09-30 21:57:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'John', 'Dee', '0123456789', '2022-10-01-6337b7874082b.png', 'john.dee@gmail.com', '$2y$10$euFn0cM..NCMyZnO3jpvre6wiDico3MHLzk5b7TYYafSIW9kWzg6.', 'approved', NULL, '2022-09-30 22:14:07', '2022-09-30 22:16:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Mukesh', 'Roy', '0123456789', '2022-10-01-6337b8c3b01d4.png', 'muksh@gmail.com', '$2y$10$Gm8fKY5KtVcANow5KskbF.Vauy4bdbQTUYJjwLaG6LM0Couj5/ybq', 'approved', NULL, '2022-09-30 22:19:23', '2022-09-30 22:19:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Sachin', 'Khade', '0123456789', '2022-10-01-6337b9b0dd259.png', 'sachin@gmail.com', '$2y$10$TnC1Fd0V4viu2RB.5ueYUe/2rgQ8O7rUMrCWqLFhgNCDoKZfl/zVy', 'approved', NULL, '2022-09-30 22:23:20', '2022-09-30 22:23:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Umesh', 'Tagore', '0123456789', '2022-10-01-6337bac470883.png', 'umesh@gmail.com', '$2y$10$MtfhrcJtn/RH6.gbAnOsse0OS.gqJdBsTFq5seMqJNcHIQgLvqjwm', 'approved', NULL, '2022-09-30 22:27:56', '2022-09-30 22:28:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Devika', 'Prasad', '0123456789', '2022-10-01-6337bbfa162ee.png', 'devika@gmail.com', '$2y$10$zuaF/FVtXAZLtWSG8j/zbuzbdA5mND2ynm1MiiUkEPTsn9TlOwoC.', 'approved', NULL, '2022-09-30 22:33:06', '2022-09-30 22:33:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Tarun', 'Saha', '123456789', '2022-10-01-6337bcc92adc0.png', 'tarun@gmail.com', '$2y$10$/ZwwQeFVJURzJTgkxMYJsuI8IC.A83m/.XuRJYdpteuyXr9hlSori', 'approved', NULL, '2022-09-30 22:36:33', '2022-09-30 22:36:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Hammer', 'Huai', '0123456789', '2022-10-01-6337bd91eb117.png', 'hammer@gmail.com', '$2y$10$zUlTedgtw6Y2c0m4l986puJWvoDdq7ZH.4tzMS3Dv47fo/CdkjQ5O', 'approved', NULL, '2022-09-30 22:39:54', '2022-09-30 22:40:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Dev', 'Kumar', '0123456789', '2022-10-01-6337be5468120.png', 'dev@gmail.com', '$2y$10$4JJCzv4MxxohuMZx0cXRxOkG46W1jm6ZTqVk7HoWq5smCIeJMdgQy', 'approved', NULL, '2022-09-30 22:43:08', '2022-09-30 22:43:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'Anis', 'Ahmad', '31657889602', 'def.png', 'soren0299@gmail.com', '$2y$10$BQNUa/9scJQGZYWE9/his.uNFXSSfYTiVZ0DfXqri6mjxoS5eReza', 'approved', NULL, '2022-12-29 08:48:24', '2022-12-29 08:48:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2022-09-28 15:04:39', '2022-09-28 15:04:39', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2022-09-30 21:48:53', '2022-09-30 21:48:53', 0.00, 0.00, 0.00, 0.00, 0.00),
(3, 3, 0, 0, '2022-09-30 21:57:00', '2022-09-30 21:57:00', 0.00, 0.00, 0.00, 0.00, 0.00),
(4, 4, 0, 0, '2022-09-30 22:14:07', '2022-09-30 22:14:07', 0.00, 0.00, 0.00, 0.00, 0.00),
(5, 5, 0, 0, '2022-09-30 22:19:23', '2022-09-30 22:19:23', 0.00, 0.00, 0.00, 0.00, 0.00),
(6, 6, 0, 0, '2022-09-30 22:23:20', '2022-09-30 22:23:20', 0.00, 0.00, 0.00, 0.00, 0.00),
(7, 7, 0, 0, '2022-09-30 22:27:56', '2022-09-30 22:27:56', 0.00, 0.00, 0.00, 0.00, 0.00),
(8, 8, 0, 0, '2022-09-30 22:33:06', '2022-09-30 22:33:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 9, 0, 0, '2022-09-30 22:36:33', '2022-09-30 22:36:33', 0.00, 0.00, 0.00, 0.00, 0.00),
(10, 10, 0, 0, '2022-09-30 22:39:54', '2022-09-30 22:39:54', 0.00, 0.00, 0.00, 0.00, 0.00),
(11, 11, 0, 0, '2022-09-30 22:43:08', '2022-09-30 22:43:08', 0.00, 0.00, 0.00, 0.00, 0.00),
(12, 12, 0, 0, '2022-12-29 08:48:24', '2022-12-29 08:48:24', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `additional_address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `additional_address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`, `vat`) VALUES
(1, '2', 'Sanjay Adhek', 'permanent', 'New Delhi', NULL, 'New Delhi', '110019', '0123456789', '2022-10-01 06:45:51', '2022-10-01 06:45:51', NULL, NULL, NULL, NULL, 0, NULL),
(2, '2', 'SANJAY ADHEK', 'permanent', 'delhi', NULL, 'New Delhi', '110019', '9170112345', '2022-10-07 21:15:06', '2022-10-07 21:15:06', NULL, NULL, '0', '0', NULL, NULL),
(5, '5', 'Mr. Sorena test', 'permanent', 'Innsbruckweg 60', NULL, 'Rotterdam', '3047', '0687062626', NULL, NULL, NULL, 'Netherlands', NULL, NULL, NULL, NULL),
(9, '3', 'Mr. Sanjay Adhek', 'permanent', 'hhhh', 'Delhi', 'New Delhi ', '110019', '7011615618', '2022-12-01 12:29:56', '2022-12-01 12:29:56', NULL, NULL, NULL, NULL, 0, NULL),
(10, '3', 'Mr. Sanjay Adhek', 'permanent', 'hhhh', 'Delhi', 'New Delhi ', '110019', '7011615618', '2022-12-01 12:34:06', '2022-12-01 12:34:06', NULL, NULL, NULL, NULL, 0, NULL),
(11, '3', 'Mr. Sanjay Adhek', 'permanent', 'hhhh', 'Delhi', 'New Delhi ', '110019', '7011615618', '2022-12-01 12:37:15', '2022-12-01 12:37:15', NULL, 'Netherlands', NULL, NULL, 0, NULL),
(12, '3', 'Mr. Umesh Ahmad', 'permanent', 'dddd', 'Delhi', 'New Delhi ', '110019', '7777777777', '2022-12-12 09:32:13', '2022-12-12 09:32:13', NULL, 'Netherlands', NULL, NULL, 0, NULL),
(13, '3', 'Mr. Tarun Prasad', 'permanent', 'RZ-17H, Haryana', 'Near Uco Bank', 'Haryana', '100020', '0123456789', '2022-12-17 00:32:01', '2022-12-17 00:32:01', NULL, 'Netherlands', NULL, NULL, 0, NULL),
(14, '3', 'New Address', 'permanent', 'Delhi', NULL, 'New Delhi ', '100020', '2020220202', '2022-12-17 00:54:11', '2022-12-17 00:54:11', NULL, NULL, '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', 5.00, '2 Week', 1, '2021-05-25 15:27:04', '2021-05-25 15:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'product_wise', '2022-10-02 05:26:56', '2022-10-02 05:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'Digi Lux', 'Rotterdam airportplein 22 1', '316587062626', 'def.png', '2022-09-28 15:04:39', '2022-09-28 15:04:39', 'def.png'),
(2, 2, 'New Delhi', 'Kalkaji New Delhi', '7011615618', '2022-10-01-6337b4fb3ad56.png', '2022-09-30 21:48:53', '2022-09-30 22:03:15', '2022-10-01-6337b4fb3b1d1.png'),
(3, 3, 'Best Seller India', 'Noida', '9968216296', '2022-10-01-6337b3847ae89.png', '2022-09-30 21:57:00', '2022-09-30 21:57:00', '2022-10-01-6337b3847b276.png'),
(4, 4, 'Haridwar', 'Haridwar, Uttarakhand', '0123456789', '2022-10-01-6337b78750250.png', '2022-09-30 22:14:07', '2022-09-30 22:14:07', '2022-10-01-6337b787505ea.png'),
(5, 5, 'Shop Corner', 'Uttarpraesh', '0123456789', '2022-10-01-6337b8c3bfbce.png', '2022-09-30 22:19:23', '2022-09-30 22:19:23', '2022-10-01-6337b8c3bff89.png'),
(6, 6, 'Khade Store', 'New Delhi', '0123456789', '2022-10-01-6337b9b0ecd07.png', '2022-09-30 22:23:20', '2022-09-30 22:23:20', '2022-10-01-6337b9b0ed065.png'),
(7, 7, 'Best Departmental Store', 'New Delhi', '0123456789', '2022-10-01-6337bac4801f5.png', '2022-09-30 22:27:56', '2022-09-30 22:27:56', '2022-10-01-6337bac4805ed.png'),
(8, 8, 'Great Store', 'New Delhi', '0123456789', '2022-10-01-6337bbfa25bb4.png', '2022-09-30 22:33:06', '2022-09-30 22:33:06', '2022-10-01-6337bbfa25ef4.png'),
(9, 9, 'Mahadev Store', 'New Delhi', '123456789', '2022-10-01-6337bcc93acb9.png', '2022-09-30 22:36:33', '2022-09-30 22:36:33', '2022-10-01-6337bcc93b0a7.png'),
(10, 10, 'General Store', 'New Delhi', '0123456789', '2022-10-01-6337bd9206732.png', '2022-09-30 22:39:54', '2022-09-30 22:39:54', '2022-10-01-6337bd9206a7c.png'),
(11, 11, 'No.1 Store', 'New Delhi', '0123456789', '2022-10-01-6337be5477d88.png', '2022-09-30 22:43:08', '2022-09-30 22:43:08', '2022-10-01-6337be54780ea.png'),
(12, 12, 'Deenweb', 'Innsbruckweg 1', '31657889602', 'def.png', '2022-12-29 08:48:24', '2022-12-29 08:48:24', 'def.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 15:48:03', '2020-12-31 15:48:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 10:53:01', '2021-02-27 10:53:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 0, 1, '2021-02-27 10:53:30', '2022-10-02 05:32:50'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 10:54:14', '2021-02-27 10:54:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 10:54:36', '2021-02-27 10:54:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 13:49:42', '2021-06-11 12:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_condition`
--

CREATE TABLE `stock_condition` (
  `id` int(11) NOT NULL,
  `stock_condition_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `stock_condition`
--

INSERT INTO `stock_condition` (`id`, `stock_condition_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'New', 1, '2022-12-30 22:27:25', '2023-01-01 09:00:09'),
(2, 'Like New', 1, '2022-12-31 23:26:26', '2023-01-01 09:00:08'),
(3, 'Good', 1, '2022-12-31 23:26:58', '2023-01-04 10:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test.one@gmail.com', '2022-10-02 05:23:10', '2022-10-02 05:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 10, 'nl', 'name', 'Sunflower, rice bran oil', 1),
('App\\Model\\Product', 10, 'nl', 'description', '<p>&nbsp;Sunflower, rice bran oil</p>', 2),
('App\\Model\\Product', 14, 'nl', 'name', 'Galaxy F23', 3),
('App\\Model\\Product', 14, 'nl', 'description', '<p>* Estimated against the usage profile of an average/typical user. Independently assessed by Strategy Analytics between 2021.12.08&ndash;12.20 in USA and UK with pre-release versions of SM-S901, SM-S906, SM-S908 under default setting using 5G Sub6 networks (NOT tested under 5G mmWave network). Actual battery life varies by network environment, features and apps used, frequency of calls and messages, number of times charged, and many other factors.</p>\r\n\r\n<p>Images shown here are for representational purpose only, actual may vary. All features, specifications and prices are subject to change without prior notice. Model availability may vary from location to location.</p>\r\n\r\n<p>User Available Memory : User memory is less than the total memory due to storage of the operating system and software used to operate the device features. Actual user memory will vary depending on the operator and may change after software upgrades are performed</p>\r\n\r\n<p>Network : The bandwidths supported by the device may vary depending on the region or service provider</p>\r\n\r\n<p>All specifications and descriptions provided herein may be different from the actual specifications and descriptions for the product. Samsung reserves the right to make changes to this web page and the product described herein, at anytime, without obligation on Samsung to provide notification of such change. All functionality, features, specifications, GUI and other product information provided in this web page including, but not limited to, the benefits, design, pricing, components, performance, availability, and capabilities of the product are subject to change without notice or obligation. The contents within the screen are simulated images and are for demonstration purposes only.</p>\r\n\r\n<p>Creative visualization. Images shown here are for representational purpose only, actual may vary.</p>\r\n\r\n<p>*S Pen Pro and S Pen Fold Edition sold separately. Only use the Samsung S Pen Pro or the S Pen Fold Edition designed exclusively for Galaxy Z Fold3 5G. All other S Pens or stylus pens not designed for Galaxy Z Fold3 5G (including those by other manufacturers) may damage the screen.</p>\r\n\r\n<p>*Galaxy Z Fold3 5G and Z Filp3 5G is rated as IPX8. IPX8 is based on test conditions for submersion in up to 1.5 meters of freshwater for up to 30 minutes. Not advised for beach or pool use. Not dust resistant.</p>\r\n\r\n<p>Measured diagonally, the screen size is 16.72cm (6.6&quot;) in the full rectangle and 16.30cm (6.4&quot;) with accounting for the rounded corners.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>5,000 mAh (typical)*</p>\r\n\r\n<p>*Typical value tested under third-party laboratory condition. Typical value is the estimated average value considering the deviation in battery capacity among the battery samples tested under IEC 61960 standard. Rated (minimum) capacity is 4,860 mAh. Actual battery life may vary depending on network environment, usage patterns and other factors.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>*First ever features in Galaxy F series</p>', 4),
('App\\Model\\Product', 16, 'nl', 'name', 'Apple iPhone 11 (64GB, White)', 5),
('App\\Model\\Product', 16, 'nl', 'description', '<p><strong>Why buy Apple iPhone 11</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Liquid Retina HD Display</strong>&nbsp;is more immersive giving awesome clarity defining every details</li>\r\n	<li><strong>12 MP Ultra Wide and 12 MP Wide Cameras</strong>&nbsp;along with 12 MP front camera enables the device to take better photos</li>\r\n	<li><strong>A13 Bionic Chip Processor</strong>&nbsp;lets you install and run as many apps as you like</li>\r\n	<li><strong>iOS 14</strong>&nbsp;operating system offers with smooth usage</li>\r\n</ul>\r\n\r\n<p>When you get&nbsp;<strong>Apple iPhone 11</strong>&nbsp;online, you get an awesome companion. It features Hexa-Core A13 Bionic chip processor with Third-generation Neural Engine, so you can play hi-end games or run heavy files and carry out tasks without worrying about the performance. The upgraded CPU ensures a seamless response time, allowing you to multitask, play games or run any heavy task without worrying about the operation speed. With 4GB RAM you can install multiple applications and run them all together without disturbing the speed of the phone. It flaunts a brilliant combination of 12 MP Ultra Wide and 12 MP Wide cameras. It takes awesome shots. It offers with 2x optical zoom out, Digital zoom up to 5x, Portrait mode with advanced bokeh and Depth Control, Night mode (Wide), Auto image stabilisation, 4K video recording at 24 fps, 30 fps or 60 fps, etc. The 12 MP front camera offers more natural and personalized options, delivering the stunning selfies. Selfies have never been so clear, or so stunning before. It also offers with &fnof;/2.2 aperture, Portrait mode with advanced bokeh and Depth Control, 4K video recording at 24 fps, 30 fps or 60 fps, etc.</p>\r\n\r\n<p>Buy the&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which flaunts an amazing display, brilliant camera and powerful processor. Available in awesome colours, it flaunts a stylish design which is easy to hold and is crafted for perfect grip. Its 3110 mAh Lithium-ion battery is perfect for continuous working as long as you don&rsquo;t give up, because it certainly won&rsquo;t. It supports up to 50 percent charge in 30 minutes with 20 Watt adapter or higher (sold separately), wireless charging (works with Qi chargers), charging via USB to computer system or power adapter. Use&nbsp;<strong>Apple iPhone 11</strong>&nbsp;which has a storage of 64GB that let you store files in ease. This smartphone runs on iOS 14 operating system. It is equipped with Face ID, Barometer, Three-axis gyro, Accelerometer, Proximity sensor, Ambient light sensor. Comes with Siri support as well. It comes with Dual SIM (nano-SIM and eSIM) support. The smartphone features a striking screen which gives you a 15.49 cm all-screen LCD Display. This Liquid Retina HD display offers awesome clarity. Now you can see and do more of what you love, without interruption. The resolution is of 1792 x 828 pixels at 326 ppi. Comes with fingerprint-resistant oleophobic coating. Rated IP68 (maximum depth of up to 200 cm up to 30 minutes) under IEC standard 60529.</p>', 6),
('App\\Model\\Product', 8, 'nl', 'name', 'Hp Laptop I3 8gb Ram | Discounted | Shoponline', 7),
('App\\Model\\Product', 8, 'nl', 'description', '<p>Hp Laptop I3 8gb Ram Discounted Shoponline</p>', 8),
('App\\Model\\Product', 9, 'nl', 'name', 'Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)', 9),
('App\\Model\\Product', 9, 'nl', 'description', '<h1>Apple MacBook Pro 2020 (M1, 16.2 inch, 32GB, 1TB, macOS Monterey, Space Grey)</h1>', 10),
('App\\Model\\Product', 7, 'nl', 'name', 'Sony Laptop', 11),
('App\\Model\\Product', 7, 'nl', 'description', '<p>Sony Laptop</p>', 12),
('App\\Model\\Product', 1, 'nl', 'name', 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', 13),
('App\\Model\\Product', 1, 'nl', 'description', '<p>Monstrous 4500 mAh Battery</p>\r\n\r\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.</p>', 14),
('App\\Model\\Product', 3, 'nl', 'name', 'SAMSUNG 80 cm (32 Inch) HD Ready LED Smart Tizen TV with 2022 Model  (UA32T4380A', 15),
('App\\Model\\Product', 3, 'nl', 'description', '<p>&nbsp;</p>\r\n\r\n<p>With this Samsung TV, every image on the screen comes to life, giving you a home theatre experience. With the HD visual quality of this TV, you can enjoy vibrant movie scenes. Additionally, HDR increases the screen&#39;s brightness and brings out the subtleties of the material. Moreover, the Contrast Enhancer on this TV improves contrast and offers superb image quality with increased depth.</p>', 16),
('App\\Model\\Product', 6, 'nl', 'name', 'Janasya Women\'s Maroon Pure Cotton Straight Kurta', 17),
('App\\Model\\Product', 6, 'nl', 'description', '<p>Janasya Women&#39;s Maroon Pure Cotton Straight Kurta</p>', 18),
('App\\Model\\Product', 17, 'nl', 'name', 'Demo Tablet', 19),
('App\\Model\\Product', 17, 'nl', 'description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 20),
('App\\Model\\Product', 17, 'au', 'name', 'Demo Tablet', 21),
('App\\Model\\Product', 17, 'au', 'description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 22),
('App\\Model\\Product', 17, 'in', 'name', 'Demo Tablet', 23),
('App\\Model\\Product', 17, 'in', 'description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 24),
('App\\Model\\Product', 1, 'au', 'name', 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', 25),
('App\\Model\\Product', 1, 'au', 'description', '<p>Monstrous 4500 mAh Battery</p>\r\n\r\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.</p>', 26),
('App\\Model\\Product', 1, 'in', 'name', 'Xiaomi 11i Hypercharge 5G (Pacific Pearl, 128 GB)  (6 GB RAM)', 27),
('App\\Model\\Product', 1, 'in', 'description', '<p>Monstrous 4500 mAh Battery</p>\r\n\r\n<p>The Xiaomi 11i Hypercharge 5G smartphone charges up to 50% in about 13 minutes, courtesy of a 4500 mAh gigantic battery that boasts a 67 W Turbo Charging capability. This way, you can simply relax and enjoy a stress-free user experience without clinging to the charging cord.</p>', 28);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(2, NULL, 'Sanjay', 'Adhek', '0123456789', '2022-10-01-63382ef8c95c2.png', 'sanjay.adhek@gmail.com', NULL, '$2y$10$UF7rc2966ypPaJE.SZaAnuhxkP3PwrOkefSZYeQOdJl.ypMXYKydu', '6cSVqpFFlHvdUUckfmUywatS9KAr5VPJac53p7LPL0dJeLRbeGXPwBzzP2Gl', '2022-09-28 10:33:03', '2022-10-16 07:32:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(3, 'Haris Rauf', 'Haris', 'Rauf', '1234567890', 'def.png', 'harish@gmail.com', NULL, '$2y$10$ECJYIDvaLy7g8C1eRec5cOoMOjdCA9CqV2ljthF8XEu1gg1d2ISBy', NULL, '2022-10-05 11:56:35', '2022-10-09 02:30:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(4, 'Vivek Dash', 'Vivek', 'Dash', NULL, 'def.png', 'vivek@gmail.com', NULL, '$2y$10$VnYIklTHmGhzMRjHLEx0L.VLNTT5mRllPF/q7FgW9.esLUGr10DqW', NULL, '2022-10-05 12:39:09', '2022-10-05 12:39:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(5, 'sorena salehi', 'sorena', 'salehi', '0657889602', 'def.png', 'sorena@sunteltelecom.nl', NULL, '$2y$10$L/X65VDx9OQs25suYNKgteoLjWK534NCRnf3VOSLB3H2mYn2CKu12', NULL, '2022-10-06 02:05:58', '2022-10-07 11:05:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(6, 'Anis Ahmad', 'Anis', 'Ahmad', NULL, 'def.png', 'anisahmad2005@gmail.com', NULL, '$2y$10$5UXzBmDhXm8.JjsS3i.wt.fEUbyhMIaLKDR4.Gy9yIWGB.k59OI6W', NULL, '2022-10-06 03:21:28', '2022-10-06 03:21:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(7, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-02 22:16:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2022-10-01 06:44:42', '2022-10-01 06:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `delivery_time`
--
ALTER TABLE `delivery_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_condition`
--
ALTER TABLE `stock_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_time`
--
ALTER TABLE `delivery_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100021;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_condition`
--
ALTER TABLE `stock_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
