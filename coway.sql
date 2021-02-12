-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2021 at 11:04 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coway`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_customer`
--

CREATE TABLE `app_customer` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_customer`
--

INSERT INTO `app_customer` (`id`, `firstName`, `lastName`, `email`, `phone`, `address`, `description`, `createdAt`) VALUES
(1, 'Sigit', 'Prasetyo', 'sigitprstyo@gmail.com', '081265177731', 'Jalan A', 'dsv sd', '2021-02-11 07:11:11.819328');

-- --------------------------------------------------------

--
-- Table structure for table `app_orderdetails`
--

CREATE TABLE `app_orderdetails` (
  `id` int(11) NOT NULL,
  `orderId_id` int(11) DEFAULT NULL,
  `productId_id` int(11) DEFAULT NULL,
  `technicianId_id` int(11) DEFAULT NULL,
  `installationDate` datetime(6) DEFAULT NULL,
  `unitSerialNo` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `price` decimal(8,0) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_orders`
--

CREATE TABLE `app_orders` (
  `id` int(11) NOT NULL,
  `orderNo` varchar(255) NOT NULL,
  `custId_id` int(11) DEFAULT NULL,
  `promotionCode` varchar(10) DEFAULT NULL,
  `totalPrice` decimal(8,0) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_productgroup`
--

CREATE TABLE `app_productgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_productgroup`
--

INSERT INTO `app_productgroup` (`id`, `name`) VALUES
(1, 'Water Purifier'),
(2, 'Air Purifier');

-- --------------------------------------------------------

--
-- Table structure for table `app_products`
--

CREATE TABLE `app_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,0) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `groupId_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_products`
--

INSERT INTO `app_products` (`id`, `name`, `sku`, `price`, `createdAt`, `groupId_id`) VALUES
(1, 'Ombak', 'COW001', '10000000', '2021-02-11 09:25:51.417875', 1),
(2, 'Villaem II', 'COW002', '12500000', '2021-02-12 07:26:00.702022', 1),
(3, 'Core', 'COW003', '15000000', '2021-02-12 07:26:41.070922', 1),
(4, 'Storm', 'COW004', '7000000', '2021-02-12 07:27:18.421297', 2),
(5, 'Breeze', 'COW005', '8000000', '2021-02-12 07:27:39.506925', 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_promotioncode`
--

CREATE TABLE `app_promotioncode` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `promoType` varchar(8) NOT NULL,
  `minValue` int(11) NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_promotioncode`
--

INSERT INTO `app_promotioncode` (`id`, `code`, `promoType`, `minValue`, `amount`, `status`, `createdAt`, `product_id`) VALUES
(1, 'UNIT10', 'Unit', 0, '10', 1, '2021-02-12 08:28:06.924097', 2),
(2, 'QTY10', 'Quantity', 2, '30', 1, '2021-02-12 09:42:24.448483', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_tecnician`
--

CREATE TABLE `app_tecnician` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_tecnician`
--

INSERT INTO `app_tecnician` (`id`, `firstName`, `lastName`, `email`, `phone`, `address`, `createdAt`) VALUES
(1, 'Teknisi A', 'A', 'teknisi@teknisi.com', '081265177731', 'Jalan Teknisi A', '2021-02-12 06:01:54.292659');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Sales Admin'),
(1, 'Sales Staff'),
(3, 'Technician');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(4, 1, 25),
(5, 1, 26),
(6, 1, 27),
(7, 1, 28),
(8, 1, 29),
(9, 1, 30),
(10, 1, 31),
(1, 1, 32),
(2, 1, 33),
(3, 1, 36),
(11, 2, 5),
(12, 2, 6),
(13, 2, 7),
(14, 2, 8),
(15, 2, 9),
(16, 2, 10),
(17, 2, 11),
(18, 2, 12),
(19, 2, 13),
(20, 2, 14),
(21, 2, 15),
(22, 2, 16),
(23, 2, 30),
(24, 2, 32),
(25, 2, 34),
(26, 2, 36),
(27, 2, 37),
(28, 2, 38),
(29, 2, 39),
(30, 2, 40),
(31, 2, 41),
(32, 2, 42),
(33, 2, 43),
(34, 2, 44),
(35, 2, 45),
(36, 2, 46),
(37, 2, 47),
(38, 2, 48);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add customer', 7, 'add_customer'),
(26, 'Can change customer', 7, 'change_customer'),
(27, 'Can delete customer', 7, 'delete_customer'),
(28, 'Can view customer', 7, 'view_customer'),
(29, 'Can add order details', 8, 'add_orderdetails'),
(30, 'Can change order details', 8, 'change_orderdetails'),
(31, 'Can delete order details', 8, 'delete_orderdetails'),
(32, 'Can view order details', 8, 'view_orderdetails'),
(33, 'Can add orders', 9, 'add_orders'),
(34, 'Can change orders', 9, 'change_orders'),
(35, 'Can delete orders', 9, 'delete_orders'),
(36, 'Can view orders', 9, 'view_orders'),
(37, 'Can add product group', 10, 'add_productgroup'),
(38, 'Can change product group', 10, 'change_productgroup'),
(39, 'Can delete product group', 10, 'delete_productgroup'),
(40, 'Can view product group', 10, 'view_productgroup'),
(41, 'Can add products', 11, 'add_products'),
(42, 'Can change products', 11, 'change_products'),
(43, 'Can delete products', 11, 'delete_products'),
(44, 'Can view products', 11, 'view_products'),
(45, 'Can add tecnician', 12, 'add_tecnician'),
(46, 'Can change tecnician', 12, 'change_tecnician'),
(47, 'Can delete tecnician', 12, 'delete_tecnician'),
(48, 'Can view tecnician', 12, 'view_tecnician'),
(49, 'Can add promotion code', 13, 'add_promotioncode'),
(50, 'Can change promotion code', 13, 'change_promotioncode'),
(51, 'Can delete promotion code', 13, 'delete_promotioncode'),
(52, 'Can view promotion code', 13, 'view_promotioncode');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$NIUgMwwvSlC5$UYP5zLlB6uSP+kXBe9Vl16TdHRYBg+7W1Zd2f/4Mx9w=', '2021-02-12 09:57:27.227790', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-02-11 04:32:59.857910'),
(2, 'pbkdf2_sha256$216000$oOMhvZ7t27ot$10PkqwrzkpyyU2HrBVBROL+5BybmI8b67TPgRcxbqFQ=', '2021-02-12 09:53:15.541889', 0, 'salesadmin', '', '', '', 0, 1, '2021-02-12 03:09:40.000000'),
(3, 'pbkdf2_sha256$216000$FeTkwDlKd0Ti$D7664EqwJ+7bgCb4yX5woFEWJL25INiCUubVbQnW6TU=', '2021-02-12 08:35:08.196746', 0, 'salesstaff', '', '', '', 0, 1, '2021-02-12 03:10:01.000000'),
(4, 'pbkdf2_sha256$216000$UpDZFrKMZKhn$33eEngdNNjTR7pZokaUsC5oGZenUUC9ekrvFuA4NvvI=', '2021-02-12 09:53:59.116730', 0, 'technician', '', '', '', 0, 1, '2021-02-12 06:32:15.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 2, 2),
(1, 3, 1),
(3, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-12 03:05:14.333717', '1', 'Sales Staff', 1, '[{\"added\": {}}]', 3, 1),
(2, '2021-02-12 03:06:54.402735', '1', 'Sales Staff', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(3, '2021-02-12 03:08:06.213115', '2', 'Sales Admin', 1, '[{\"added\": {}}]', 3, 1),
(4, '2021-02-12 03:09:40.637082', '2', 'salesadmin', 1, '[{\"added\": {}}]', 4, 1),
(5, '2021-02-12 03:10:01.783799', '3', 'salesstaff', 1, '[{\"added\": {}}]', 4, 1),
(6, '2021-02-12 03:29:21.489491', '3', 'salesstaff', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(7, '2021-02-12 03:29:31.112717', '2', 'salesadmin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(8, '2021-02-12 06:31:58.019013', '3', 'Technician', 1, '[{\"added\": {}}]', 3, 1),
(9, '2021-02-12 06:32:16.026137', '4', 'technician', 1, '[{\"added\": {}}]', 4, 1),
(10, '2021-02-12 06:33:14.595032', '4', 'technician', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'customer'),
(8, 'app', 'orderdetails'),
(9, 'app', 'orders'),
(10, 'app', 'productgroup'),
(11, 'app', 'products'),
(13, 'app', 'promotioncode'),
(12, 'app', 'tecnician'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-11 04:23:17.521770'),
(2, 'auth', '0001_initial', '2021-02-11 04:23:19.852195'),
(3, 'admin', '0001_initial', '2021-02-11 04:23:30.577306'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-11 04:23:32.613317'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-11 04:23:32.677317'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-11 04:23:34.197015'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-11 04:23:35.396139'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-11 04:23:35.630065'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-11 04:23:35.735936'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-11 04:23:36.885655'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-11 04:23:36.919792'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-11 04:23:37.034000'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-11 04:23:37.204517'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-11 04:23:37.363063'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-11 04:23:37.577206'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-11 04:23:37.667487'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-11 04:23:37.864313'),
(18, 'sessions', '0001_initial', '2021-02-11 04:23:38.469496'),
(19, 'app', '0001_initial', '2021-02-11 05:21:17.860325'),
(20, 'app', '0002_products_groupid', '2021-02-11 08:40:06.444359'),
(21, 'app', '0003_auto_20210211_1621', '2021-02-11 09:21:44.155733'),
(22, 'app', '0004_auto_20210211_1900', '2021-02-11 12:00:32.799157'),
(23, 'app', '0005_auto_20210212_1443', '2021-02-12 07:43:46.236224'),
(24, 'app', '0006_auto_20210212_1526', '2021-02-12 08:27:02.043638'),
(25, 'app', '0007_auto_20210212_1554', '2021-02-12 08:54:33.164551');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('x4ux89yijk7ubpau25leux4ma4b7yoou', 'e30:1lAV73:3EeC9d-98qPAWUWBTSTyI85vKtwyPiP94Wk21Cur66I', '2021-02-26 09:51:45.539205');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_orderdetails`
--
ALTER TABLE `app_orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_orderdetails_orderId_id_b7da9c32` (`orderId_id`),
  ADD KEY `app_orderdetails_technicianId_id_6c4110fe` (`technicianId_id`),
  ADD KEY `app_orderdetails_productId_id_54538bf3` (`productId_id`);

--
-- Indexes for table `app_orders`
--
ALTER TABLE `app_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_orders_custId_id_52066f68` (`custId_id`);

--
-- Indexes for table `app_productgroup`
--
ALTER TABLE `app_productgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_products`
--
ALTER TABLE `app_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_products_groupId_id_eafd82e1` (`groupId_id`);

--
-- Indexes for table `app_promotioncode`
--
ALTER TABLE `app_promotioncode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_promotioncode_product_id_133470a2_fk_app_products_id` (`product_id`);

--
-- Indexes for table `app_tecnician`
--
ALTER TABLE `app_tecnician`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_customer`
--
ALTER TABLE `app_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_orderdetails`
--
ALTER TABLE `app_orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_orders`
--
ALTER TABLE `app_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_productgroup`
--
ALTER TABLE `app_productgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_products`
--
ALTER TABLE `app_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_promotioncode`
--
ALTER TABLE `app_promotioncode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_tecnician`
--
ALTER TABLE `app_tecnician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_orderdetails`
--
ALTER TABLE `app_orderdetails`
  ADD CONSTRAINT `app_orderdetails_orderId_id_b7da9c32_fk_app_orders_id` FOREIGN KEY (`orderId_id`) REFERENCES `app_orders` (`id`),
  ADD CONSTRAINT `app_orderdetails_productId_id_54538bf3_fk_app_products_id` FOREIGN KEY (`productId_id`) REFERENCES `app_products` (`id`),
  ADD CONSTRAINT `app_orderdetails_technicianId_id_6c4110fe_fk_app_tecnician_id` FOREIGN KEY (`technicianId_id`) REFERENCES `app_tecnician` (`id`);

--
-- Constraints for table `app_orders`
--
ALTER TABLE `app_orders`
  ADD CONSTRAINT `app_orders_custId_id_52066f68_fk_app_customer_id` FOREIGN KEY (`custId_id`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_products`
--
ALTER TABLE `app_products`
  ADD CONSTRAINT `app_products_groupId_id_eafd82e1_fk_app_productgroup_id` FOREIGN KEY (`groupId_id`) REFERENCES `app_productgroup` (`id`);

--
-- Constraints for table `app_promotioncode`
--
ALTER TABLE `app_promotioncode`
  ADD CONSTRAINT `app_promotioncode_product_id_133470a2_fk_app_products_id` FOREIGN KEY (`product_id`) REFERENCES `app_products` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
