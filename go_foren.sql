-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 10:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go_foren`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add tbl_user', 7, 'add_tbl_user'),
(26, 'Can change tbl_user', 7, 'change_tbl_user'),
(27, 'Can delete tbl_user', 7, 'delete_tbl_user'),
(28, 'Can view tbl_user', 7, 'view_tbl_user'),
(29, 'Can add visa_inquiry', 8, 'add_visa_inquiry'),
(30, 'Can change visa_inquiry', 8, 'change_visa_inquiry'),
(31, 'Can delete visa_inquiry', 8, 'delete_visa_inquiry'),
(32, 'Can view visa_inquiry', 8, 'view_visa_inquiry'),
(33, 'Can add tbl_country', 9, 'add_tbl_country'),
(34, 'Can change tbl_country', 9, 'change_tbl_country'),
(35, 'Can delete tbl_country', 9, 'delete_tbl_country'),
(36, 'Can view tbl_country', 9, 'view_tbl_country'),
(37, 'Can add tbl_courses', 10, 'add_tbl_courses'),
(38, 'Can change tbl_courses', 10, 'change_tbl_courses'),
(39, 'Can delete tbl_courses', 10, 'delete_tbl_courses'),
(40, 'Can view tbl_courses', 10, 'view_tbl_courses'),
(41, 'Can add tbl_visa_service', 11, 'add_tbl_visa_service'),
(42, 'Can change tbl_visa_service', 11, 'change_tbl_visa_service'),
(43, 'Can delete tbl_visa_service', 11, 'delete_tbl_visa_service'),
(44, 'Can view tbl_visa_service', 11, 'view_tbl_visa_service'),
(45, 'Can add tbl_video', 12, 'add_tbl_video'),
(46, 'Can change tbl_video', 12, 'change_tbl_video'),
(47, 'Can delete tbl_video', 12, 'delete_tbl_video'),
(48, 'Can view tbl_video', 12, 'view_tbl_video'),
(49, 'Can add tbl_success_stories', 13, 'add_tbl_success_stories'),
(50, 'Can change tbl_success_stories', 13, 'change_tbl_success_stories'),
(51, 'Can delete tbl_success_stories', 13, 'delete_tbl_success_stories'),
(52, 'Can view tbl_success_stories', 13, 'view_tbl_success_stories'),
(53, 'Can add tbl_blog', 14, 'add_tbl_blog'),
(54, 'Can change tbl_blog', 14, 'change_tbl_blog'),
(55, 'Can delete tbl_blog', 14, 'delete_tbl_blog'),
(56, 'Can view tbl_blog', 14, 'view_tbl_blog'),
(57, 'Can add tbl_cv', 15, 'add_tbl_cv'),
(58, 'Can change tbl_cv', 15, 'change_tbl_cv'),
(59, 'Can delete tbl_cv', 15, 'delete_tbl_cv'),
(60, 'Can view tbl_cv', 15, 'view_tbl_cv'),
(61, 'Can add tbl_inquiry_association', 16, 'add_tbl_inquiry_association'),
(62, 'Can change tbl_inquiry_association', 16, 'change_tbl_inquiry_association'),
(63, 'Can delete tbl_inquiry_association', 16, 'delete_tbl_inquiry_association'),
(64, 'Can view tbl_inquiry_association', 16, 'view_tbl_inquiry_association'),
(65, 'Can add tbl_home', 17, 'add_tbl_home'),
(66, 'Can change tbl_home', 17, 'change_tbl_home'),
(67, 'Can delete tbl_home', 17, 'delete_tbl_home'),
(68, 'Can view tbl_home', 17, 'view_tbl_home'),
(69, 'Can add tbl_news', 18, 'add_tbl_news'),
(70, 'Can change tbl_news', 18, 'change_tbl_news'),
(71, 'Can delete tbl_news', 18, 'delete_tbl_news'),
(72, 'Can view tbl_news', 18, 'view_tbl_news'),
(73, 'Can add tbl_team', 19, 'add_tbl_team'),
(74, 'Can change tbl_team', 19, 'change_tbl_team'),
(75, 'Can delete tbl_team', 19, 'delete_tbl_team'),
(76, 'Can view tbl_team', 19, 'view_tbl_team'),
(77, 'Can add tbl_gallery', 20, 'add_tbl_gallery'),
(78, 'Can change tbl_gallery', 20, 'change_tbl_gallery'),
(79, 'Can delete tbl_gallery', 20, 'delete_tbl_gallery'),
(80, 'Can view tbl_gallery', 20, 'view_tbl_gallery'),
(81, 'Can add tbl_blog_comment', 21, 'add_tbl_blog_comment'),
(82, 'Can change tbl_blog_comment', 21, 'change_tbl_blog_comment'),
(83, 'Can delete tbl_blog_comment', 21, 'delete_tbl_blog_comment'),
(84, 'Can view tbl_blog_comment', 21, 'view_tbl_blog_comment'),
(85, 'Can add tbl_occupation', 22, 'add_tbl_occupation'),
(86, 'Can change tbl_occupation', 22, 'change_tbl_occupation'),
(87, 'Can delete tbl_occupation', 22, 'delete_tbl_occupation'),
(88, 'Can view tbl_occupation', 22, 'view_tbl_occupation'),
(89, 'Can add tbl_about_us', 23, 'add_tbl_about_us'),
(90, 'Can change tbl_about_us', 23, 'change_tbl_about_us'),
(91, 'Can delete tbl_about_us', 23, 'delete_tbl_about_us'),
(92, 'Can view tbl_about_us', 23, 'view_tbl_about_us'),
(93, 'Can add tbl_role', 24, 'add_tbl_role'),
(94, 'Can change tbl_role', 24, 'change_tbl_role'),
(95, 'Can delete tbl_role', 24, 'delete_tbl_role'),
(96, 'Can view tbl_role', 24, 'view_tbl_role'),
(97, 'Can add tbl_education_qualification', 25, 'add_tbl_education_qualification'),
(98, 'Can change tbl_education_qualification', 25, 'change_tbl_education_qualification'),
(99, 'Can delete tbl_education_qualification', 25, 'delete_tbl_education_qualification'),
(100, 'Can view tbl_education_qualification', 25, 'view_tbl_education_qualification'),
(101, 'Can add tbl_employeement_detail', 26, 'add_tbl_employeement_detail'),
(102, 'Can change tbl_employeement_detail', 26, 'change_tbl_employeement_detail'),
(103, 'Can delete tbl_employeement_detail', 26, 'delete_tbl_employeement_detail'),
(104, 'Can view tbl_employeement_detail', 26, 'view_tbl_employeement_detail'),
(105, 'Can add tbl_exam_detail', 27, 'add_tbl_exam_detail'),
(106, 'Can change tbl_exam_detail', 27, 'change_tbl_exam_detail'),
(107, 'Can delete tbl_exam_detail', 27, 'delete_tbl_exam_detail'),
(108, 'Can view tbl_exam_detail', 27, 'view_tbl_exam_detail'),
(109, 'Can add tbl_pr_visa_inquiry', 28, 'add_tbl_pr_visa_inquiry'),
(110, 'Can change tbl_pr_visa_inquiry', 28, 'change_tbl_pr_visa_inquiry'),
(111, 'Can delete tbl_pr_visa_inquiry', 28, 'delete_tbl_pr_visa_inquiry'),
(112, 'Can view tbl_pr_visa_inquiry', 28, 'view_tbl_pr_visa_inquiry'),
(113, 'Can add tbl_student_visa_inquiry', 29, 'add_tbl_student_visa_inquiry'),
(114, 'Can change tbl_student_visa_inquiry', 29, 'change_tbl_student_visa_inquiry'),
(115, 'Can delete tbl_student_visa_inquiry', 29, 'delete_tbl_student_visa_inquiry'),
(116, 'Can view tbl_student_visa_inquiry', 29, 'view_tbl_student_visa_inquiry'),
(117, 'Can add tbl_test_detail', 30, 'add_tbl_test_detail'),
(118, 'Can change tbl_test_detail', 30, 'change_tbl_test_detail'),
(119, 'Can delete tbl_test_detail', 30, 'delete_tbl_test_detail'),
(120, 'Can view tbl_test_detail', 30, 'view_tbl_test_detail'),
(121, 'Can add tbl_faq', 31, 'add_tbl_faq'),
(122, 'Can change tbl_faq', 31, 'change_tbl_faq'),
(123, 'Can delete tbl_faq', 31, 'delete_tbl_faq'),
(124, 'Can view tbl_faq', 31, 'view_tbl_faq'),
(125, 'Can add tbl_intended_study', 32, 'add_tbl_intended_study'),
(126, 'Can change tbl_intended_study', 32, 'change_tbl_intended_study'),
(127, 'Can delete tbl_intended_study', 32, 'delete_tbl_intended_study'),
(128, 'Can view tbl_intended_study', 32, 'view_tbl_intended_study'),
(129, 'Can add tbl_newsletter', 33, 'add_tbl_newsletter'),
(130, 'Can change tbl_newsletter', 33, 'change_tbl_newsletter'),
(131, 'Can delete tbl_newsletter', 33, 'delete_tbl_newsletter'),
(132, 'Can view tbl_newsletter', 33, 'view_tbl_newsletter'),
(133, 'Can add personalized guidance', 34, 'add_personalizedguidance'),
(134, 'Can change personalized guidance', 34, 'change_personalizedguidance'),
(135, 'Can delete personalized guidance', 34, 'delete_personalizedguidance'),
(136, 'Can view personalized guidance', 34, 'view_personalizedguidance'),
(137, 'Can add tbl_study_course', 35, 'add_tbl_study_course'),
(138, 'Can change tbl_study_course', 35, 'change_tbl_study_course'),
(139, 'Can delete tbl_study_course', 35, 'delete_tbl_study_course'),
(140, 'Can view tbl_study_course', 35, 'view_tbl_study_course'),
(141, 'Can add tbl_vacancy', 36, 'add_tbl_vacancy'),
(142, 'Can change tbl_vacancy', 36, 'change_tbl_vacancy'),
(143, 'Can delete tbl_vacancy', 36, 'delete_tbl_vacancy'),
(144, 'Can view tbl_vacancy', 36, 'view_tbl_vacancy'),
(145, 'Can add tbl_course_name', 37, 'add_tbl_course_name'),
(146, 'Can change tbl_course_name', 37, 'change_tbl_course_name'),
(147, 'Can delete tbl_course_name', 37, 'delete_tbl_course_name'),
(148, 'Can view tbl_course_name', 37, 'view_tbl_course_name'),
(149, 'Can add tbl_industry_type', 38, 'add_tbl_industry_type'),
(150, 'Can change tbl_industry_type', 38, 'change_tbl_industry_type'),
(151, 'Can delete tbl_industry_type', 38, 'delete_tbl_industry_type'),
(152, 'Can view tbl_industry_type', 38, 'view_tbl_industry_type'),
(153, 'Can add tbl_study_level', 39, 'add_tbl_study_level'),
(154, 'Can change tbl_study_level', 39, 'change_tbl_study_level'),
(155, 'Can delete tbl_study_level', 39, 'delete_tbl_study_level'),
(156, 'Can view tbl_study_level', 39, 'view_tbl_study_level');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(34, 'myapp', 'personalizedguidance'),
(23, 'myapp', 'tbl_about_us'),
(14, 'myapp', 'tbl_blog'),
(21, 'myapp', 'tbl_blog_comment'),
(9, 'myapp', 'tbl_country'),
(10, 'myapp', 'tbl_courses'),
(37, 'myapp', 'tbl_course_name'),
(15, 'myapp', 'tbl_cv'),
(25, 'myapp', 'tbl_education_qualification'),
(26, 'myapp', 'tbl_employeement_detail'),
(27, 'myapp', 'tbl_exam_detail'),
(31, 'myapp', 'tbl_faq'),
(20, 'myapp', 'tbl_gallery'),
(17, 'myapp', 'tbl_home'),
(38, 'myapp', 'tbl_industry_type'),
(16, 'myapp', 'tbl_inquiry_association'),
(32, 'myapp', 'tbl_intended_study'),
(18, 'myapp', 'tbl_news'),
(33, 'myapp', 'tbl_newsletter'),
(22, 'myapp', 'tbl_occupation'),
(28, 'myapp', 'tbl_pr_visa_inquiry'),
(24, 'myapp', 'tbl_role'),
(29, 'myapp', 'tbl_student_visa_inquiry'),
(35, 'myapp', 'tbl_study_course'),
(39, 'myapp', 'tbl_study_level'),
(13, 'myapp', 'tbl_success_stories'),
(19, 'myapp', 'tbl_team'),
(30, 'myapp', 'tbl_test_detail'),
(7, 'myapp', 'tbl_user'),
(36, 'myapp', 'tbl_vacancy'),
(12, 'myapp', 'tbl_video'),
(11, 'myapp', 'tbl_visa_service'),
(8, 'myapp', 'visa_inquiry'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-09 09:30:29.781916'),
(2, 'auth', '0001_initial', '2025-07-09 09:30:30.274798'),
(3, 'admin', '0001_initial', '2025-07-09 09:30:30.392987'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-07-09 09:30:30.403335'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-09 09:30:30.412221'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-07-09 09:30:30.484837'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-07-09 09:30:30.538621'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-07-09 09:30:30.553953'),
(9, 'auth', '0004_alter_user_username_opts', '2025-07-09 09:30:30.569025'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-07-09 09:30:30.630799'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-07-09 09:30:30.634996'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-07-09 09:30:30.643577'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-07-09 09:30:30.658644'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-07-09 09:30:30.679343'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-07-09 09:30:30.698010'),
(16, 'auth', '0011_update_proxy_permissions', '2025-07-09 09:30:30.713012'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-07-09 09:30:30.731357'),
(18, 'myapp', '0001_initial', '2025-07-09 09:30:30.765189'),
(19, 'myapp', '0002_rename_tbluser_tbl_user', '2025-07-09 09:30:30.781149'),
(20, 'myapp', '0003_visa_inquiry', '2025-07-09 09:30:30.797351'),
(21, 'myapp', '0004_tbl_country_tbl_courses_tbl_visa_service', '2025-07-09 09:30:30.846723'),
(22, 'myapp', '0005_auto_20250507_1504', '2025-07-09 09:30:30.993699'),
(23, 'myapp', '0006_auto_20250507_1513', '2025-07-09 09:30:31.025600'),
(24, 'myapp', '0007_auto_20250508_1132', '2025-07-09 09:30:31.051415'),
(25, 'myapp', '0008_tbl_courses_description2', '2025-07-09 09:30:31.065026'),
(26, 'myapp', '0009_tbl_courses_image', '2025-07-09 09:30:31.082852'),
(27, 'myapp', '0010_tbl_success_stories', '2025-07-09 09:30:31.098149'),
(28, 'myapp', '0011_tbl_blog_tbl_cv', '2025-07-09 09:30:31.133211'),
(29, 'myapp', '0012_tbl_inquiry_association', '2025-07-09 09:30:31.172238'),
(30, 'myapp', '0013_tbl_home_tbl_news_tbl_team', '2025-07-09 09:30:31.211372'),
(31, 'myapp', '0014_delete_tbl_gallary', '2025-07-09 09:30:31.221466'),
(32, 'myapp', '0015_tbl_gallery', '2025-07-09 09:30:31.237982'),
(33, 'myapp', '0016_tbl_home_serial', '2025-07-09 09:30:31.254093'),
(34, 'myapp', '0017_auto_20250508_1453', '2025-07-09 09:30:31.283062'),
(35, 'myapp', '0018_auto_20250508_1537', '2025-07-09 09:30:31.376389'),
(36, 'myapp', '0019_tbl_user_role', '2025-07-09 09:30:31.386555'),
(37, 'myapp', '0020_tbl_occupation', '2025-07-09 09:30:31.399657'),
(38, 'myapp', '0021_tbl_about_us', '2025-07-09 09:30:31.421762'),
(39, 'myapp', '0022_tbl_about_founder_tbl_about_race', '2025-07-09 09:30:31.451690'),
(40, 'myapp', '0023_tbl_role', '2025-07-09 09:30:31.468014'),
(41, 'myapp', '0024_auto_20250509_1347', '2025-07-09 09:30:31.574640'),
(42, 'myapp', '0025_auto_20250509_1716', '2025-07-09 09:30:31.600434'),
(43, 'myapp', '0026_alter_tbl_visa_service_image_url', '2025-07-09 09:30:31.652993'),
(44, 'myapp', '0027_auto_20250510_0942', '2025-07-09 09:30:31.911532'),
(45, 'myapp', '0028_tbl_home_category', '2025-07-09 09:30:31.920462'),
(46, 'myapp', '0029_tbl_success_stories_post', '2025-07-09 09:30:31.932009'),
(47, 'myapp', '0030_auto_20250510_1207', '2025-07-09 09:30:31.963008'),
(48, 'myapp', '0031_remove_tbl_video_video_drive_url_and_more', '2025-07-09 09:30:31.995398'),
(49, 'myapp', '0032_tbl_education_qualification_tbl_employeement_detail_and_more', '2025-07-09 09:30:32.070112'),
(50, 'myapp', '0033_tbl_faq', '2025-07-09 09:30:32.084838'),
(51, 'myapp', '0034_alter_tbl_education_qualification_inquiry_id_and_more', '2025-07-09 09:30:33.054666'),
(52, 'myapp', '0035_tbl_intended_study_and_more', '2025-07-09 09:30:33.410838'),
(53, 'myapp', '0036_tbl_newsletter', '2025-07-09 09:30:33.425167'),
(54, 'myapp', '0037_personalizedguidance', '2025-07-09 09:30:33.442960'),
(55, 'myapp', '0038_tbl_study_course_tbl_vacancy', '2025-07-09 09:30:33.476756'),
(56, 'myapp', '0039_tbl_course_name_tbl_industry_type_tbl_study_level', '2025-07-09 09:30:33.518792'),
(57, 'myapp', '0040_tbl_inquiry_association_form_name', '2025-07-09 09:30:33.537031'),
(58, 'sessions', '0001_initial', '2025-07-09 09:30:33.574243');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('r93lx8iqga6xxgxr89lbcjeesv44u63w', '.eJyrViotTi2Kz0xRsjLUUSpOLS7OzM-LB4nlJeamKlkpBVcWl6TmKjim5GbmKSFU5OYnZeaA5A2NjE1MzcwtLA2QZFNzEzNzgJKJIF0O6SCeXnJ-rlItAFolJcE:1uZmgJ:4uhQdFkXgNmcqXzkJ1faHa8nqHa5fPFt2gqM2pQweAk', '2025-07-24 08:31:03.408374');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_personalizedguidance`
--

CREATE TABLE `myapp_personalizedguidance` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `desired_country` varchar(100) NOT NULL,
  `desired_visa_service` varchar(100) NOT NULL,
  `submitted_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about_us`
--

CREATE TABLE `tbl_about_us` (
  `id` bigint(20) NOT NULL,
  `serial` int(11) NOT NULL,
  `heading` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_about_us`
--

INSERT INTO `tbl_about_us` (`id`, `serial`, `heading`, `description`, `created_at`, `updated_at`, `image_id`, `image_url`, `category`) VALUES
(1, 1, 'Inception of GO FOREN', '<h2>Immigration Mission</h2>\r\n\r\n<p>The birth of GO FOREN, the immigration consultation and overseas education advising division, holds a captivating tale. Situated in South Gujarat, India, GO FOREN is widely regarded as one of the top establishments in its field. Its origins trace back to our parent company, RACHNA ACADEMY OF CAREER EDUCATION (RACE), which has been actively engaged in providing career guidance and facilitating government and private sector job placements in India since 2006. Mr. Rajesh Bhavsar, our esteemed founder, has been instrumental in assisting and guiding numerous individuals in their pursuit of settling abroad, whether as students or permanent residents.</p>\r\n', '2025-07-09 11:45:16.810381', '2025-07-09 11:47:27.987785', '1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs', 'https://drive.google.com/file/d/1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs/view?usp=sharing', 'About Us'),
(2, 1, 'About scope of GO FOREN', '<h2>Visa Guidance</h2>\r\n\r\n<p>GO FOREN specializes in immigration/PR visa, student visa, visitor visa, entrepreneur/business visa and work permit visa services. Our core expertise lies in the immigration field, where we offer comprehensive assistance to clients who wish to work and settle in a new country. Our support extends beyond initial counselling, evaluation, application, and immigration processes. We also provide additional services such as air ticketing, foreign exchange, accommodation arrangements, travel insurance, and airport transfers upon successful relocation to the new country.</p>\r\n', '2025-07-09 11:48:30.138611', '2025-07-09 11:49:25.505498', '1trr_gNxJXqepf2dBHyz886B4bUOFJDJV', 'https://drive.google.com/file/d/1trr_gNxJXqepf2dBHyz886B4bUOFJDJV/view?usp=sharing', 'About Us'),
(3, 1, 'CAREER OF FOUNDER SIR', '<h2>Inspiring Journey</h2>\r\n\r\n<p>His remarkable journey began in the 1980s as a civil engineer, where he accumulated a reservoir of profound experiences. Beyond engineering and construction, he ventured into realms like immigration, academia, teaching, and even banking. RJ Sir&#39;s journey of accomplishments didn&#39;t stop there; he extended his expertise to career counselling, consulting, textiles, and water supply domains. His contributions and experiences over the years have truly shaped him into a remarkable figure with a myriad of talents and expertise.</p>\r\n', '2025-07-09 11:53:59.612200', '2025-07-09 11:55:00.880833', '1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs', 'https://drive.google.com/file/d/1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs/view?usp=sharing', 'About Founder'),
(4, 1, 'BUSINESS / PROFESSIONAL JOURNEY', '<h2>Journey of Success</h2>\r\n\r\n<p>In the summer of May 2006, he initiated his foray into the human resource sector aimed at empowering youth between 18 and 35 by founding RACHNA Academy of Career Education (RACE) in South Gujarat. RACE quickly gained recognition as a premier institute specializing in career enhancement training. It catered to competitive exams like UPSC, GPSC, SSC, BANKS, and LIC, contributing significantly to the education landscape.</p>\r\n\r\n<p>As time progressed, Mr. Bhavsar&#39;s focus shifted towards not just training but also placement. This led to the establishment of iROJGAR, a premium placement agency, in which he held the role of Chief Mentor. Through iROJGAR, he honed recruiters&#39; requirements and prepared deserving candidates with necessary job skills, bridging the gap between employers and job seekers.</p>\r\n', '2025-07-09 11:54:36.892892', '2025-07-09 11:54:36.892923', '1trr_gNxJXqepf2dBHyz886B4bUOFJDJV', 'https://drive.google.com/file/d/1trr_gNxJXqepf2dBHyz886B4bUOFJDJV/view?usp=sharing', 'About Founder'),
(5, 1, 'PATH ON SOCIAL RESPONSIBILITY', '<h2>Service Commitment</h2>\r\n\r\n<p>His NGO offers career-focused coaching and educational resources to the youth, irrespective of their financial backgrounds.Additionally, he has established libraries and reading rooms, creating spaces that foster learning and growth. Rajesh&#39;s commitment to providing affordable skill development solutions and access to education demonstrates his dedication to uplifting communities and nurturing a brighter future for all.</p>\r\n', '2025-07-09 11:57:01.197844', '2025-07-09 11:57:01.197873', '1Nl72298lP575j2s2lwe0mhTdpD19ydPX', 'https://drive.google.com/file/d/1Nl72298lP575j2s2lwe0mhTdpD19ydPX/view?usp=sharing', 'About Founder'),
(6, 1, 'Introduction of RACE group', '<h2>Prosperous Beginning</h2>\r\n\r\n<p>Step into the world of opportunities with the RACE Group (Rachna Academy of Career Education), an esteemed institution nestled in the vibrant heart of South Gujarat, India. Led by the visionary founder, Mr. Rajesh Bhavsar, affectionately known as RJ SIR, the group has become a beacon of hope for countless individuals aspiring to carve a successful career. Our team of seasoned experts, teachers, and care takers create an environment that fosters growth and provides unwavering support, driving individuals towards their dreams. So, take the plunge and let RACE propel you towards an extraordinary future.</p>\r\n', '2025-07-09 12:02:49.833555', '2025-07-09 12:02:49.833583', '1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs', 'https://drive.google.com/file/d/1tcYFkiAy8u7rLBYi-DXZ1mq9aNnLkWOs/view?usp=drive_link', 'About Race Groups'),
(7, 1, 'Your Pathway to Success', '<h2>The Best Opportunities for Youth</h2>\r\n\r\n<p>At RACE, we don&#39;t just provide education; we craft destinies. With a diverse range of services, including competitive exam preparation for government jobs, English language exams preparation for foreign admissions, computer training, private sector job placements, assistance with foreign settlement for study or permanent residency, and even offering a co-working space for innovative start-ups, RACE caters to the holistic growth of its students and clients.</p>\r\n', '2025-07-09 12:03:34.820960', '2025-07-09 12:03:34.820990', '1trr_gNxJXqepf2dBHyz886B4bUOFJDJV', 'https://drive.google.com/file/d/1trr_gNxJXqepf2dBHyz886B4bUOFJDJV/view?usp=drive_link', 'About Race Groups');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `id` bigint(20) NOT NULL,
  `heading` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description2` longtext DEFAULT NULL,
  `description3` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title2` varchar(100) DEFAULT NULL,
  `title3` varchar(100) DEFAULT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_id_2` varchar(50) DEFAULT NULL,
  `image_id_3` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `image_url_2` varchar(500) DEFAULT NULL,
  `image_url_3` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_blog`
--

INSERT INTO `tbl_blog` (`id`, `heading`, `description`, `description2`, `description3`, `created_at`, `updated_at`, `title`, `title2`, `title3`, `image_id`, `image_id_2`, `image_id_3`, `image_url`, `image_url_2`, `image_url_3`) VALUES
(1, 'Elevating your visa application navigating complexity with confidence', '<p>This phrase suggests that the act of seeking professional help, such as from a visa consultant or agency, can take your visa application to a higher level. It implies that the assistance provided will enhance the overall quality of your application. The term acknowledges that the visa application process can be intricate</p>\r\n\r\n<p>This phrase underscores the idea that seeking professional help instills a sense of assurance in the applicant. It implies that having experts guide you through the process can boost your confidence in the success of your application.</p>\r\n', '<p>The phrase &quot;with confidence&quot; signifies that seeking expert guidance can provide you with a sense of assurance and self-assuredness throughout the application journey. It highlights that you&#39;re not alone in facing the challenges of the application process.It positions expert guidance as a powerful tool that can significantly impact.</p>\r\n\r\n<p>Visa consultants provide continuous support, helping you navigate any additional requests from immigration authorities and addressing any concerns that may arise during the processing period.</p>\r\n', '<h3>The Visa Consulting Process Unveiled Initial Consultation</h3>\r\n\r\n<p>Visa consulting is an invaluable resource for anyone navigating the complexities of international travel, work, or family reunification. By enlisting the expertise of a visa consultant, you can save time, reduce stress, and increase your chances of a successful visa application. Make sure to do your due diligence when choosing a consultant, and you&#39;ll be well on your way to realizing your global aspirations.</p>\r\n', '2025-07-09 12:26:13.654470', '2025-07-09 12:26:13.654538', 'Elevating your visa application navigating complexity with confidence', '', '', '1aoD85eeyAhixqcyqJq6rKWxJ5OnmngGQ', NULL, NULL, 'https://drive.google.com/file/d/1aoD85eeyAhixqcyqJq6rKWxJ5OnmngGQ/view?usp=drive_link', '', ''),
(2, 'Expert Consulting for Smooth Approval and Confident Navigation', '<p>This phrase suggests that the act of seeking professional help, such as from a visa consultant or agency, can take your visa application to a higher level. It implies that the assistance provided will enhance the overall quality of your application. The term acknowledges that the visa application process can be intricate</p>\r\n\r\n<p>This phrase underscores the idea that seeking professional help instills a sense of assurance in the applicant. It implies that having experts guide you through the process can boost your confidence in the success of your application.</p>\r\n', '<p>The phrase &quot;with confidence&quot; signifies that seeking expert guidance can provide you with a sense of assurance and self-assuredness throughout the application journey. It highlights that you&#39;re not alone in facing the challenges of the application process.It positions expert guidance as a powerful tool that can significantly impact.</p>\r\n\r\n<p>Visa consultants provide continuous support, helping you navigate any additional requests from immigration authorities and addressing any concerns that may arise during the processing period.</p>\r\n', '<h3>The Visa Consulting Process Unveiled Initial Consultation</h3>\r\n\r\n<p>Visa consulting is an invaluable resource for anyone navigating the complexities of international travel, work, or family reunification. By enlisting the expertise of a visa consultant, you can save time, reduce stress, and increase your chances of a successful visa application. Make sure to do your due diligence when choosing a consultant, and you&#39;ll be well on your way to realizing your global aspirations.</p>\r\n', '2025-07-09 12:26:13.654470', '2025-07-09 12:30:29.065514', 'Expert Consulting for Smooth Approval and Confident Navigation', '', '', '1hQQIq8kCMHTvA4Uchp2pSydKvLit_8qQ', NULL, NULL, 'https://drive.google.com/file/d/1hQQIq8kCMHTvA4Uchp2pSydKvLit_8qQ/view?usp=drive_link', '', ''),
(3, 'Your Comprehensive Guide to Successfully Pursuing Education Abroad', '<p>This phrase suggests that the act of seeking professional help, such as from a visa consultant or agency, can take your visa application to a higher level. It implies that the assistance provided will enhance the overall quality of your application. The term acknowledges that the visa application process can be intricate</p>\r\n\r\n<p>This phrase underscores the idea that seeking professional help instills a sense of assurance in the applicant. It implies that having experts guide you through the process can boost your confidence in the success of your application.</p>\r\n', '<p>The phrase &quot;with confidence&quot; signifies that seeking expert guidance can provide you with a sense of assurance and self-assuredness throughout the application journey. It highlights that you&#39;re not alone in facing the challenges of the application process.It positions expert guidance as a powerful tool that can significantly impact.</p>\r\n\r\n<p>Visa consultants provide continuous support, helping you navigate any additional requests from immigration authorities and addressing any concerns that may arise during the processing period.</p>\r\n', '<h3>The Visa Consulting Process Unveiled Initial Consultation</h3>\r\n\r\n<p>Visa consulting is an invaluable resource for anyone navigating the complexities of international travel, work, or family reunification. By enlisting the expertise of a visa consultant, you can save time, reduce stress, and increase your chances of a successful visa application. Make sure to do your due diligence when choosing a consultant, and you&#39;ll be well on your way to realizing your global aspirations.</p>\r\n', '2025-07-09 12:26:13.654470', '2025-07-09 12:31:41.296002', 'Your Comprehensive Guide to Successfully Pursuing Education Abroad', '', '', '1Jn1fgq_PwlolO-aypVNwRrd6dLudiXVe', NULL, NULL, 'https://drive.google.com/file/d/1Jn1fgq_PwlolO-aypVNwRrd6dLudiXVe/view?usp=drive_link', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_comment`
--

CREATE TABLE `tbl_blog_comment` (
  `id` bigint(20) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `id` bigint(20) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `about` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`id`, `country`, `created_at`, `updated_at`, `about`) VALUES
(1, 'Aruba', '2025-07-09 09:43:28.096278', '2025-07-09 09:43:28.096327', 'N/A'),
(2, 'Afghanistan', '2025-07-09 09:43:28.100614', '2025-07-09 09:43:28.100682', 'N/A'),
(3, 'Angola', '2025-07-09 09:43:28.108701', '2025-07-09 09:43:28.108733', 'N/A'),
(4, 'Anguilla', '2025-07-09 09:43:28.111438', '2025-07-09 09:43:28.111459', 'N/A'),
(5, 'Åland Islands', '2025-07-09 09:43:28.114167', '2025-07-09 09:43:28.114188', 'N/A'),
(6, 'Albania', '2025-07-09 09:43:28.116830', '2025-07-09 09:43:28.116856', 'N/A'),
(7, 'Andorra', '2025-07-09 09:43:28.120118', '2025-07-09 09:43:28.120160', 'N/A'),
(8, 'United Arab Emirates', '2025-07-09 09:43:28.124137', '2025-07-09 09:43:28.124170', 'N/A'),
(9, 'Argentina', '2025-07-09 09:43:28.127734', '2025-07-09 09:43:28.127767', 'N/A'),
(10, 'Armenia', '2025-07-09 09:43:28.133298', '2025-07-09 09:43:28.133385', 'N/A'),
(11, 'American Samoa', '2025-07-09 09:43:28.138848', '2025-07-09 09:43:28.138888', 'N/A'),
(12, 'Antarctica', '2025-07-09 09:43:28.142596', '2025-07-09 09:43:28.142623', 'N/A'),
(13, 'French Southern Territories', '2025-07-09 09:43:28.145417', '2025-07-09 09:43:28.145440', 'N/A'),
(14, 'Antigua and Barbuda', '2025-07-09 09:43:28.148250', '2025-07-09 09:43:28.148275', 'N/A'),
(15, 'Australia', '2025-07-09 09:43:28.151009', '2025-07-09 09:43:28.151030', 'N/A'),
(16, 'Austria', '2025-07-09 09:43:28.154019', '2025-07-09 09:43:28.154058', 'N/A'),
(17, 'Azerbaijan', '2025-07-09 09:43:28.157701', '2025-07-09 09:43:28.157732', 'N/A'),
(18, 'Burundi', '2025-07-09 09:43:28.160921', '2025-07-09 09:43:28.160958', 'N/A'),
(19, 'Belgium', '2025-07-09 09:43:28.164854', '2025-07-09 09:43:28.164886', 'N/A'),
(20, 'Benin', '2025-07-09 09:43:28.167812', '2025-07-09 09:43:28.167835', 'N/A'),
(21, 'Bonaire, Sint Eustatius and Saba', '2025-07-09 09:43:28.171780', '2025-07-09 09:43:28.171812', 'N/A'),
(22, 'Burkina Faso', '2025-07-09 09:43:28.174920', '2025-07-09 09:43:28.174946', 'N/A'),
(23, 'Bangladesh', '2025-07-09 09:43:28.178633', '2025-07-09 09:43:28.178664', 'N/A'),
(24, 'Bulgaria', '2025-07-09 09:43:28.182652', '2025-07-09 09:43:28.182689', 'N/A'),
(25, 'Bahrain', '2025-07-09 09:43:28.186156', '2025-07-09 09:43:28.186183', 'N/A'),
(26, 'Bahamas', '2025-07-09 09:43:28.189675', '2025-07-09 09:43:28.189704', 'N/A'),
(27, 'Bosnia and Herzegovina', '2025-07-09 09:43:28.193613', '2025-07-09 09:43:28.193673', 'N/A'),
(28, 'Saint Barthélemy', '2025-07-09 09:43:28.198392', '2025-07-09 09:43:28.198421', 'N/A'),
(29, 'Belarus', '2025-07-09 09:43:28.202764', '2025-07-09 09:43:28.202795', 'N/A'),
(30, 'Belize', '2025-07-09 09:43:28.206216', '2025-07-09 09:43:28.206247', 'N/A'),
(31, 'Bermuda', '2025-07-09 09:43:28.209589', '2025-07-09 09:43:28.209621', 'N/A'),
(32, 'Bolivia, Plurinational State of', '2025-07-09 09:43:28.214417', '2025-07-09 09:43:28.214504', 'N/A'),
(33, 'Brazil', '2025-07-09 09:43:28.218185', '2025-07-09 09:43:28.218212', 'N/A'),
(34, 'Barbados', '2025-07-09 09:43:28.221543', '2025-07-09 09:43:28.221573', 'N/A'),
(35, 'Brunei Darussalam', '2025-07-09 09:43:28.224569', '2025-07-09 09:43:28.224601', 'N/A'),
(36, 'Bhutan', '2025-07-09 09:43:28.228465', '2025-07-09 09:43:28.228531', 'N/A'),
(37, 'Bouvet Island', '2025-07-09 09:43:28.232477', '2025-07-09 09:43:28.232513', 'N/A'),
(38, 'Botswana', '2025-07-09 09:43:28.238514', '2025-07-09 09:43:28.238547', 'N/A'),
(39, 'Central African Republic', '2025-07-09 09:43:28.247988', '2025-07-09 09:43:28.248016', 'N/A'),
(40, 'Canada', '2025-07-09 09:43:28.251046', '2025-07-09 09:43:28.251076', 'N/A'),
(41, 'Cocos (Keeling) Islands', '2025-07-09 09:43:28.254636', '2025-07-09 09:43:28.254671', 'N/A'),
(42, 'Switzerland', '2025-07-09 09:43:28.257851', '2025-07-09 09:43:28.257879', 'N/A'),
(43, 'Chile', '2025-07-09 09:43:28.261309', '2025-07-09 09:43:28.261356', 'N/A'),
(44, 'China', '2025-07-09 09:43:28.266732', '2025-07-09 09:43:28.266763', 'N/A'),
(45, 'Côte d\'Ivoire', '2025-07-09 09:43:28.271661', '2025-07-09 09:43:28.271696', 'N/A'),
(46, 'Cameroon', '2025-07-09 09:43:28.277370', '2025-07-09 09:43:28.277404', 'N/A'),
(47, 'Congo, The Democratic Republic of the', '2025-07-09 09:43:28.281249', '2025-07-09 09:43:28.281280', 'N/A'),
(48, 'Congo', '2025-07-09 09:43:28.284519', '2025-07-09 09:43:28.284546', 'N/A'),
(49, 'Cook Islands', '2025-07-09 09:43:28.287991', '2025-07-09 09:43:28.288025', 'N/A'),
(50, 'Colombia', '2025-07-09 09:43:28.292122', '2025-07-09 09:43:28.292151', 'N/A'),
(51, 'Comoros', '2025-07-09 09:43:28.296584', '2025-07-09 09:43:28.296622', 'N/A'),
(52, 'Cabo Verde', '2025-07-09 09:43:28.301849', '2025-07-09 09:43:28.301882', 'N/A'),
(53, 'Costa Rica', '2025-07-09 09:43:28.305920', '2025-07-09 09:43:28.305957', 'N/A'),
(54, 'Cuba', '2025-07-09 09:43:28.311239', '2025-07-09 09:43:28.311272', 'N/A'),
(55, 'Curaçao', '2025-07-09 09:43:28.314723', '2025-07-09 09:43:28.314753', 'N/A'),
(56, 'Christmas Island', '2025-07-09 09:43:28.317996', '2025-07-09 09:43:28.318024', 'N/A'),
(57, 'Cayman Islands', '2025-07-09 09:43:28.322015', '2025-07-09 09:43:28.322050', 'N/A'),
(58, 'Cyprus', '2025-07-09 09:43:28.325143', '2025-07-09 09:43:28.325171', 'N/A'),
(59, 'Czechia', '2025-07-09 09:43:28.329744', '2025-07-09 09:43:28.329790', 'N/A'),
(60, 'Germany', '2025-07-09 09:43:28.335045', '2025-07-09 09:43:28.335078', 'N/A'),
(61, 'Djibouti', '2025-07-09 09:43:28.339239', '2025-07-09 09:43:28.339275', 'N/A'),
(62, 'Dominica', '2025-07-09 09:43:28.342370', '2025-07-09 09:43:28.342407', 'N/A'),
(63, 'Denmark', '2025-07-09 09:43:28.347062', '2025-07-09 09:43:28.347094', 'N/A'),
(64, 'Dominican Republic', '2025-07-09 09:43:28.350231', '2025-07-09 09:43:28.350262', 'N/A'),
(65, 'Algeria', '2025-07-09 09:43:28.353143', '2025-07-09 09:43:28.353173', 'N/A'),
(66, 'Ecuador', '2025-07-09 09:43:28.356287', '2025-07-09 09:43:28.356318', 'N/A'),
(67, 'Egypt', '2025-07-09 09:43:28.359142', '2025-07-09 09:43:28.359174', 'N/A'),
(68, 'Eritrea', '2025-07-09 09:43:28.363900', '2025-07-09 09:43:28.363930', 'N/A'),
(69, 'Western Sahara', '2025-07-09 09:43:28.366737', '2025-07-09 09:43:28.366765', 'N/A'),
(70, 'Spain', '2025-07-09 09:43:28.369466', '2025-07-09 09:43:28.369494', 'N/A'),
(71, 'Estonia', '2025-07-09 09:43:28.373091', '2025-07-09 09:43:28.373145', 'N/A'),
(72, 'Ethiopia', '2025-07-09 09:43:28.377794', '2025-07-09 09:43:28.377822', 'N/A'),
(73, 'Finland', '2025-07-09 09:43:28.380687', '2025-07-09 09:43:28.380708', 'N/A'),
(74, 'Fiji', '2025-07-09 09:43:28.383534', '2025-07-09 09:43:28.383560', 'N/A'),
(75, 'Falkland Islands (Malvinas)', '2025-07-09 09:43:28.387423', '2025-07-09 09:43:28.387456', 'N/A'),
(76, 'France', '2025-07-09 09:43:28.390829', '2025-07-09 09:43:28.390857', 'N/A'),
(77, 'Faroe Islands', '2025-07-09 09:43:28.395098', '2025-07-09 09:43:28.395150', 'N/A'),
(78, 'Micronesia, Federated States of', '2025-07-09 09:43:28.398386', '2025-07-09 09:43:28.398412', 'N/A'),
(79, 'Gabon', '2025-07-09 09:43:28.401370', '2025-07-09 09:43:28.401396', 'N/A'),
(80, 'United Kingdom', '2025-07-09 09:43:28.404463', '2025-07-09 09:43:28.404493', 'N/A'),
(81, 'Georgia', '2025-07-09 09:43:28.407359', '2025-07-09 09:43:28.407384', 'N/A'),
(82, 'Guernsey', '2025-07-09 09:43:28.412294', '2025-07-09 09:43:28.412335', 'N/A'),
(83, 'Ghana', '2025-07-09 09:43:28.415977', '2025-07-09 09:43:28.416010', 'N/A'),
(84, 'Gibraltar', '2025-07-09 09:43:28.418803', '2025-07-09 09:43:28.418827', 'N/A'),
(85, 'Guinea', '2025-07-09 09:43:28.422453', '2025-07-09 09:43:28.422491', 'N/A'),
(86, 'Guadeloupe', '2025-07-09 09:43:28.426660', '2025-07-09 09:43:28.426689', 'N/A'),
(87, 'Gambia', '2025-07-09 09:43:28.430178', '2025-07-09 09:43:28.430200', 'N/A'),
(88, 'Guinea-Bissau', '2025-07-09 09:43:28.433041', '2025-07-09 09:43:28.433065', 'N/A'),
(89, 'Equatorial Guinea', '2025-07-09 09:43:28.435937', '2025-07-09 09:43:28.435962', 'N/A'),
(90, 'Greece', '2025-07-09 09:43:28.439284', '2025-07-09 09:43:28.439313', 'N/A'),
(91, 'Grenada', '2025-07-09 09:43:28.442507', '2025-07-09 09:43:28.442539', 'N/A'),
(92, 'Greenland', '2025-07-09 09:43:28.446930', '2025-07-09 09:43:28.446961', 'N/A'),
(93, 'Guatemala', '2025-07-09 09:43:28.449575', '2025-07-09 09:43:28.449600', 'N/A'),
(94, 'French Guiana', '2025-07-09 09:43:28.452027', '2025-07-09 09:43:28.452051', 'N/A'),
(95, 'Guam', '2025-07-09 09:43:28.455145', '2025-07-09 09:43:28.455175', 'N/A'),
(96, 'Guyana', '2025-07-09 09:43:28.457697', '2025-07-09 09:43:28.457721', 'N/A'),
(97, 'Hong Kong', '2025-07-09 09:43:28.462923', '2025-07-09 09:43:28.462954', 'N/A'),
(98, 'Heard Island and McDonald Islands', '2025-07-09 09:43:28.465582', '2025-07-09 09:43:28.465606', 'N/A'),
(99, 'Honduras', '2025-07-09 09:43:28.468454', '2025-07-09 09:43:28.468479', 'N/A'),
(100, 'Croatia', '2025-07-09 09:43:28.471650', '2025-07-09 09:43:28.471687', 'N/A'),
(101, 'Haiti', '2025-07-09 09:43:28.476192', '2025-07-09 09:43:28.476222', 'N/A'),
(102, 'Hungary', '2025-07-09 09:43:28.479126', '2025-07-09 09:43:28.479151', 'N/A'),
(103, 'Indonesia', '2025-07-09 09:43:28.481796', '2025-07-09 09:43:28.481819', 'N/A'),
(104, 'Isle of Man', '2025-07-09 09:43:28.484230', '2025-07-09 09:43:28.484250', 'N/A'),
(105, 'India', '2025-07-09 09:43:28.488310', '2025-07-09 09:43:28.488345', 'N/A'),
(106, 'British Indian Ocean Territory', '2025-07-09 09:43:28.491826', '2025-07-09 09:43:28.491855', 'N/A'),
(107, 'Ireland', '2025-07-09 09:43:28.497449', '2025-07-09 09:43:28.497480', 'N/A'),
(108, 'Iran, Islamic Republic of', '2025-07-09 09:43:28.500580', '2025-07-09 09:43:28.500603', 'N/A'),
(109, 'Iraq', '2025-07-09 09:43:28.504608', '2025-07-09 09:43:28.504640', 'N/A'),
(110, 'Iceland', '2025-07-09 09:43:28.509085', '2025-07-09 09:43:28.509114', 'N/A'),
(111, 'Israel', '2025-07-09 09:43:28.512634', '2025-07-09 09:43:28.512663', 'N/A'),
(112, 'Italy', '2025-07-09 09:43:28.515524', '2025-07-09 09:43:28.515549', 'N/A'),
(113, 'Jamaica', '2025-07-09 09:43:28.518085', '2025-07-09 09:43:28.518107', 'N/A'),
(114, 'Jersey', '2025-07-09 09:43:28.521766', '2025-07-09 09:43:28.521798', 'N/A'),
(115, 'Jordan', '2025-07-09 09:43:28.524690', '2025-07-09 09:43:28.524715', 'N/A'),
(116, 'Japan', '2025-07-09 09:43:28.529722', '2025-07-09 09:43:28.529753', 'N/A'),
(117, 'Kazakhstan', '2025-07-09 09:43:28.533076', '2025-07-09 09:43:28.533105', 'N/A'),
(118, 'Kenya', '2025-07-09 09:43:28.536202', '2025-07-09 09:43:28.536233', 'N/A'),
(119, 'Kyrgyzstan', '2025-07-09 09:43:28.543165', '2025-07-09 09:43:28.543195', 'N/A'),
(120, 'Cambodia', '2025-07-09 09:43:28.546197', '2025-07-09 09:43:28.546221', 'N/A'),
(121, 'Kiribati', '2025-07-09 09:43:28.548806', '2025-07-09 09:43:28.548830', 'N/A'),
(122, 'Saint Kitts and Nevis', '2025-07-09 09:43:28.551859', '2025-07-09 09:43:28.551887', 'N/A'),
(123, 'Korea, Republic of', '2025-07-09 09:43:28.555276', '2025-07-09 09:43:28.555308', 'N/A'),
(124, 'Kuwait', '2025-07-09 09:43:28.557877', '2025-07-09 09:43:28.557904', 'N/A'),
(125, 'Lao People\'s Democratic Republic', '2025-07-09 09:43:28.562861', '2025-07-09 09:43:28.562892', 'N/A'),
(126, 'Lebanon', '2025-07-09 09:43:28.565513', '2025-07-09 09:43:28.565535', 'N/A'),
(127, 'Liberia', '2025-07-09 09:43:28.568129', '2025-07-09 09:43:28.568155', 'N/A'),
(128, 'Libya', '2025-07-09 09:43:28.571401', '2025-07-09 09:43:28.571431', 'N/A'),
(129, 'Saint Lucia', '2025-07-09 09:43:28.575480', '2025-07-09 09:43:28.575556', 'N/A'),
(130, 'Liechtenstein', '2025-07-09 09:43:28.578409', '2025-07-09 09:43:28.578436', 'N/A'),
(131, 'Sri Lanka', '2025-07-09 09:43:28.580827', '2025-07-09 09:43:28.580850', 'N/A'),
(132, 'Lesotho', '2025-07-09 09:43:28.583280', '2025-07-09 09:43:28.583300', 'N/A'),
(133, 'Lithuania', '2025-07-09 09:43:28.586070', '2025-07-09 09:43:28.586099', 'N/A'),
(134, 'Luxembourg', '2025-07-09 09:43:28.589309', '2025-07-09 09:43:28.589339', 'N/A'),
(135, 'Latvia', '2025-07-09 09:43:28.592223', '2025-07-09 09:43:28.592255', 'N/A'),
(136, 'Macao', '2025-07-09 09:43:28.596934', '2025-07-09 09:43:28.596965', 'N/A'),
(137, 'Saint Martin (French part)', '2025-07-09 09:43:28.599488', '2025-07-09 09:43:28.599511', 'N/A'),
(138, 'Morocco', '2025-07-09 09:43:28.601751', '2025-07-09 09:43:28.601771', 'N/A'),
(139, 'Monaco', '2025-07-09 09:43:28.605253', '2025-07-09 09:43:28.605292', 'N/A'),
(140, 'Moldova, Republic of', '2025-07-09 09:43:28.609648', '2025-07-09 09:43:28.609678', 'N/A'),
(141, 'Madagascar', '2025-07-09 09:43:28.612556', '2025-07-09 09:43:28.612582', 'N/A'),
(142, 'Maldives', '2025-07-09 09:43:28.615005', '2025-07-09 09:43:28.615029', 'N/A'),
(143, 'Mexico', '2025-07-09 09:43:28.619078', '2025-07-09 09:43:28.619105', 'N/A'),
(144, 'Marshall Islands', '2025-07-09 09:43:28.622483', '2025-07-09 09:43:28.622514', 'N/A'),
(145, 'North Macedonia', '2025-07-09 09:43:28.625261', '2025-07-09 09:43:28.625291', 'N/A'),
(146, 'Mali', '2025-07-09 09:43:28.630094', '2025-07-09 09:43:28.630123', 'N/A'),
(147, 'Malta', '2025-07-09 09:43:28.632823', '2025-07-09 09:43:28.632846', 'N/A'),
(148, 'Myanmar', '2025-07-09 09:43:28.635548', '2025-07-09 09:43:28.635573', 'N/A'),
(149, 'Montenegro', '2025-07-09 09:43:28.639437', '2025-07-09 09:43:28.639473', 'N/A'),
(150, 'Mongolia', '2025-07-09 09:43:28.643387', '2025-07-09 09:43:28.643414', 'N/A'),
(151, 'Northern Mariana Islands', '2025-07-09 09:43:28.646170', '2025-07-09 09:43:28.646196', 'N/A'),
(152, 'Mozambique', '2025-07-09 09:43:28.648626', '2025-07-09 09:43:28.648650', 'N/A'),
(153, 'Mauritania', '2025-07-09 09:43:28.651072', '2025-07-09 09:43:28.651094', 'N/A'),
(154, 'Montserrat', '2025-07-09 09:43:28.655612', '2025-07-09 09:43:28.655647', 'N/A'),
(155, 'Martinique', '2025-07-09 09:43:28.658419', '2025-07-09 09:43:28.658447', 'N/A'),
(156, 'Mauritius', '2025-07-09 09:43:28.663314', '2025-07-09 09:43:28.663390', 'N/A'),
(157, 'Malawi', '2025-07-09 09:43:28.666576', '2025-07-09 09:43:28.666603', 'N/A'),
(158, 'Malaysia', '2025-07-09 09:43:28.669338', '2025-07-09 09:43:28.669365', 'N/A'),
(159, 'Mayotte', '2025-07-09 09:43:28.673345', '2025-07-09 09:43:28.673400', 'N/A'),
(160, 'Namibia', '2025-07-09 09:43:28.677103', '2025-07-09 09:43:28.677132', 'N/A'),
(161, 'New Caledonia', '2025-07-09 09:43:28.679752', '2025-07-09 09:43:28.679779', 'N/A'),
(162, 'Niger', '2025-07-09 09:43:28.682326', '2025-07-09 09:43:28.682350', 'N/A'),
(163, 'Norfolk Island', '2025-07-09 09:43:28.684898', '2025-07-09 09:43:28.684918', 'N/A'),
(164, 'Nigeria', '2025-07-09 09:43:28.688578', '2025-07-09 09:43:28.688609', 'N/A'),
(165, 'Nicaragua', '2025-07-09 09:43:28.691553', '2025-07-09 09:43:28.691579', 'N/A'),
(166, 'Niue', '2025-07-09 09:43:28.697359', '2025-07-09 09:43:28.697389', 'N/A'),
(167, 'Netherlands', '2025-07-09 09:43:28.700206', '2025-07-09 09:43:28.700229', 'N/A'),
(168, 'Norway', '2025-07-09 09:43:28.703431', '2025-07-09 09:43:28.703462', 'N/A'),
(169, 'Nepal', '2025-07-09 09:43:28.707793', '2025-07-09 09:43:28.707851', 'N/A'),
(170, 'Nauru', '2025-07-09 09:43:28.711183', '2025-07-09 09:43:28.711212', 'N/A'),
(171, 'New Zealand', '2025-07-09 09:43:28.713771', '2025-07-09 09:43:28.713798', 'N/A'),
(172, 'Oman', '2025-07-09 09:43:28.716189', '2025-07-09 09:43:28.716213', 'N/A'),
(173, 'Pakistan', '2025-07-09 09:43:28.718802', '2025-07-09 09:43:28.718829', 'N/A'),
(174, 'Panama', '2025-07-09 09:43:28.722489', '2025-07-09 09:43:28.722523', 'N/A'),
(175, 'Pitcairn', '2025-07-09 09:43:28.727611', '2025-07-09 09:43:28.727651', 'N/A'),
(176, 'Peru', '2025-07-09 09:43:28.730505', '2025-07-09 09:43:28.730529', 'N/A'),
(177, 'Philippines', '2025-07-09 09:43:28.733216', '2025-07-09 09:43:28.733243', 'N/A'),
(178, 'Palau', '2025-07-09 09:43:28.736067', '2025-07-09 09:43:28.736098', 'N/A'),
(179, 'Papua New Guinea', '2025-07-09 09:43:28.739553', '2025-07-09 09:43:28.739584', 'N/A'),
(180, 'Poland', '2025-07-09 09:43:28.743003', '2025-07-09 09:43:28.743034', 'N/A'),
(181, 'Puerto Rico', '2025-07-09 09:43:28.750352', '2025-07-09 09:43:28.750385', 'N/A'),
(182, 'Korea, Democratic People\'s Republic of', '2025-07-09 09:43:28.755751', '2025-07-09 09:43:28.755788', 'N/A'),
(183, 'Portugal', '2025-07-09 09:43:28.761518', '2025-07-09 09:43:28.761548', 'N/A'),
(184, 'Paraguay', '2025-07-09 09:43:28.764161', '2025-07-09 09:43:28.764183', 'N/A'),
(185, 'Palestine, State of', '2025-07-09 09:43:28.767072', '2025-07-09 09:43:28.767099', 'N/A'),
(186, 'French Polynesia', '2025-07-09 09:43:28.769840', '2025-07-09 09:43:28.769873', 'N/A'),
(187, 'Qatar', '2025-07-09 09:43:28.773519', '2025-07-09 09:43:28.773557', 'N/A'),
(188, 'Réunion', '2025-07-09 09:43:28.779256', '2025-07-09 09:43:28.779285', 'N/A'),
(189, 'Romania', '2025-07-09 09:43:28.782190', '2025-07-09 09:43:28.782221', 'N/A'),
(190, 'Russian Federation', '2025-07-09 09:43:28.784867', '2025-07-09 09:43:28.784891', 'N/A'),
(191, 'Rwanda', '2025-07-09 09:43:28.787898', '2025-07-09 09:43:28.787929', 'N/A'),
(192, 'Saudi Arabia', '2025-07-09 09:43:28.791229', '2025-07-09 09:43:28.791256', 'N/A'),
(193, 'Sudan', '2025-07-09 09:43:28.794306', '2025-07-09 09:43:28.794341', 'N/A'),
(194, 'Senegal', '2025-07-09 09:43:28.834482', '2025-07-09 09:43:28.834517', 'N/A'),
(195, 'Singapore', '2025-07-09 09:43:28.857707', '2025-07-09 09:43:28.857739', 'N/A'),
(196, 'South Georgia and the South Sandwich Islands', '2025-07-09 09:43:28.861198', '2025-07-09 09:43:28.861230', 'N/A'),
(197, 'Saint Helena, Ascension and Tristan da Cunha', '2025-07-09 09:43:28.876194', '2025-07-09 09:43:28.876235', 'N/A'),
(198, 'Svalbard and Jan Mayen', '2025-07-09 09:43:28.880296', '2025-07-09 09:43:28.880326', 'N/A'),
(199, 'Solomon Islands', '2025-07-09 09:43:28.882863', '2025-07-09 09:43:28.882887', 'N/A'),
(200, 'Sierra Leone', '2025-07-09 09:43:28.885348', '2025-07-09 09:43:28.885373', 'N/A'),
(201, 'El Salvador', '2025-07-09 09:43:28.889815', '2025-07-09 09:43:28.889852', 'N/A'),
(202, 'San Marino', '2025-07-09 09:43:28.894557', '2025-07-09 09:43:28.894584', 'N/A'),
(203, 'Somalia', '2025-07-09 09:43:28.897234', '2025-07-09 09:43:28.897256', 'N/A'),
(204, 'Saint Pierre and Miquelon', '2025-07-09 09:43:28.899637', '2025-07-09 09:43:28.899657', 'N/A'),
(205, 'Serbia', '2025-07-09 09:43:28.902957', '2025-07-09 09:43:28.902991', 'N/A'),
(206, 'South Sudan', '2025-07-09 09:43:28.906350', '2025-07-09 09:43:28.906381', 'N/A'),
(207, 'Sao Tome and Principe', '2025-07-09 09:43:28.911228', '2025-07-09 09:43:28.911282', 'N/A'),
(208, 'Suriname', '2025-07-09 09:43:28.915101', '2025-07-09 09:43:28.915129', 'N/A'),
(209, 'Slovakia', '2025-07-09 09:43:28.917894', '2025-07-09 09:43:28.917916', 'N/A'),
(210, 'Slovenia', '2025-07-09 09:43:28.921504', '2025-07-09 09:43:28.921541', 'N/A'),
(211, 'Sweden', '2025-07-09 09:43:28.925909', '2025-07-09 09:43:28.925937', 'N/A'),
(212, 'Eswatini', '2025-07-09 09:43:28.929380', '2025-07-09 09:43:28.929406', 'N/A'),
(213, 'Sint Maarten (Dutch part)', '2025-07-09 09:43:28.932050', '2025-07-09 09:43:28.932072', 'N/A'),
(214, 'Seychelles', '2025-07-09 09:43:28.934516', '2025-07-09 09:43:28.934537', 'N/A'),
(215, 'Syrian Arab Republic', '2025-07-09 09:43:28.937778', '2025-07-09 09:43:28.937813', 'N/A'),
(216, 'Turks and Caicos Islands', '2025-07-09 09:43:28.943171', '2025-07-09 09:43:28.943201', 'N/A'),
(217, 'Chad', '2025-07-09 09:43:28.946104', '2025-07-09 09:43:28.946129', 'N/A'),
(218, 'Togo', '2025-07-09 09:43:28.948532', '2025-07-09 09:43:28.948554', 'N/A'),
(219, 'Thailand', '2025-07-09 09:43:28.950863', '2025-07-09 09:43:28.950886', 'N/A'),
(220, 'Tajikistan', '2025-07-09 09:43:28.954025', '2025-07-09 09:43:28.954060', 'N/A'),
(221, 'Tokelau', '2025-07-09 09:43:28.957126', '2025-07-09 09:43:28.957154', 'N/A'),
(222, 'Turkmenistan', '2025-07-09 09:43:28.960422', '2025-07-09 09:43:28.960462', 'N/A'),
(223, 'Timor-Leste', '2025-07-09 09:43:28.964147', '2025-07-09 09:43:28.964174', 'N/A'),
(224, 'Tonga', '2025-07-09 09:43:28.967145', '2025-07-09 09:43:28.967171', 'N/A'),
(225, 'Trinidad and Tobago', '2025-07-09 09:43:28.970978', '2025-07-09 09:43:28.971017', 'N/A'),
(226, 'Tunisia', '2025-07-09 09:43:28.975832', '2025-07-09 09:43:28.975863', 'N/A'),
(227, 'Türkiye', '2025-07-09 09:43:28.978975', '2025-07-09 09:43:28.979001', 'N/A'),
(228, 'Tuvalu', '2025-07-09 09:43:28.981698', '2025-07-09 09:43:28.981720', 'N/A'),
(229, 'Taiwan, Province of China', '2025-07-09 09:43:28.984008', '2025-07-09 09:43:28.984028', 'N/A'),
(230, 'Tanzania, United Republic of', '2025-07-09 09:43:28.987049', '2025-07-09 09:43:28.987092', 'N/A'),
(231, 'Uganda', '2025-07-09 09:43:28.990600', '2025-07-09 09:43:28.990667', 'N/A'),
(232, 'Ukraine', '2025-07-09 09:43:28.994150', '2025-07-09 09:43:28.994178', 'N/A'),
(233, 'United States Minor Outlying Islands', '2025-07-09 09:43:28.996741', '2025-07-09 09:43:28.996762', 'N/A'),
(234, 'Uruguay', '2025-07-09 09:43:28.999040', '2025-07-09 09:43:28.999060', 'N/A'),
(235, 'United States', '2025-07-09 09:43:29.001401', '2025-07-09 09:43:29.001425', 'N/A'),
(236, 'Uzbekistan', '2025-07-09 09:43:29.004714', '2025-07-09 09:43:29.004742', 'N/A'),
(237, 'Holy See (Vatican City State)', '2025-07-09 09:43:29.007413', '2025-07-09 09:43:29.007441', 'N/A'),
(238, 'Saint Vincent and the Grenadines', '2025-07-09 09:43:29.011290', '2025-07-09 09:43:29.011324', 'N/A'),
(239, 'Venezuela, Bolivarian Republic of', '2025-07-09 09:43:29.015156', '2025-07-09 09:43:29.015212', 'N/A'),
(240, 'Virgin Islands, British', '2025-07-09 09:43:29.018564', '2025-07-09 09:43:29.018591', 'N/A'),
(241, 'Virgin Islands, U.S.', '2025-07-09 09:43:29.022415', '2025-07-09 09:43:29.022451', 'N/A'),
(242, 'Viet Nam', '2025-07-09 09:43:29.026336', '2025-07-09 09:43:29.026365', 'N/A'),
(243, 'Vanuatu', '2025-07-09 09:43:29.029229', '2025-07-09 09:43:29.029254', 'N/A'),
(244, 'Wallis and Futuna', '2025-07-09 09:43:29.031860', '2025-07-09 09:43:29.031882', 'N/A'),
(245, 'Samoa', '2025-07-09 09:43:29.034158', '2025-07-09 09:43:29.034179', 'N/A'),
(246, 'Yemen', '2025-07-09 09:43:29.036796', '2025-07-09 09:43:29.036831', 'N/A'),
(247, 'South Africa', '2025-07-09 09:43:29.041619', '2025-07-09 09:43:29.041673', 'N/A'),
(248, 'Zambia', '2025-07-09 09:43:29.046228', '2025-07-09 09:43:29.046254', 'N/A'),
(249, 'Zimbabwe', '2025-07-09 09:43:29.048994', '2025-07-09 09:43:29.049015', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description2` longtext DEFAULT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`id`, `created_at`, `updated_at`, `course_name`, `description`, `description2`, `image_id`, `image_url`) VALUES
(1, '2025-07-09 11:09:47.918604', '2025-07-09 11:20:28.700648', 'IELTS', '<h1>IELTS</h1>\r\n\r\n<h3>Preparing You for Success in Every Module</h3>\r\n\r\n<p>IELTS, the international English Language Testing system, provides an assessment of language ability of candidates who need to study or train in the medium of English.</p>\r\n\r\n<p>IELTS is regarded as an entrance requirement by most universities in the United Kingdom, Australia, New Zealand and Canada. It is also gaining recognition among universities and other educational institutes in the United States of America.</p>\r\n', '<h3>Our benefits</h3>\r\n\r\n<p>Choosing the right visa agency can make a world of difference in your journey toward international exploration, growth, and success. At goforen we take Here are the distinctive benefits of partnering with us:zzzzz</p>\r\n', '1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw', 'https://drive.google.com/file/d/1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw/view?usp=sharing'),
(2, '2025-07-09 11:19:03.625232', '2025-07-09 11:19:03.625257', 'TOEFL IBT', '<h1>TOEFL IBT</h1>\r\n\r\n<h3>Preparing You for Success in Every Module</h3>\r\n\r\n<p>IELTS, the international English Language Testing system, provides an assessment of language ability of candidates who need to study or train in the medium of English.</p>\r\n\r\n<p>IELTS is regarded as an entrance requirement by most universities in the United Kingdom, Australia, New Zealand and Canada. It is also gaining recognition among universities and other educational institutes in the United States of America.</p>\r\n', '<h3>Our benefits</h3>\r\n\r\n<p>Choosing the right visa agency can make a world of difference in your journey toward international exploration, growth, and success. At goforen we take Here are the distinctive benefits of partnering with us:</p>\r\n', '1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw', 'https://drive.google.com/file/d/1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw/view?usp=sharing'),
(3, '2025-07-09 11:29:35.341157', '2025-07-09 11:29:35.341186', 'GRE', '<h1>GRE</h1>\r\n\r\n<h3>Preparing You for Success in Every Module</h3>\r\n\r\n<p>IELTS, the international English Language Testing system, provides an assessment of language ability of candidates who need to study or train in the medium of English.</p>\r\n\r\n<p>IELTS is regarded as an entrance requirement by most universities in the United Kingdom, Australia, New Zealand and Canada. It is also gaining recognition among universities and other educational institutes in the United States of America.</p>\r\n', '<h3 style=\"box-sizing: border-box; margin: 0px 0px 25px; font-weight: 700; line-height: 1.3; color: rgb(15, 23, 42); font-size: 32px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -1px;\">Our benefits</h3>\r\n\r\n<p style=\"box-sizing: border-box; font-size: 20px; text-align: justify; margin-top: 0px; margin-bottom: 30px; line-height: 32px; color: rgb(120, 123, 132); font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -0.2px;\">Choosing the right visa agency can make a world of difference in your journey toward international exploration, growth, and success. At goforen we take Here are the distinctive benefits of partnering with us:</p>\r\n', '1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw', 'https://drive.google.com/file/d/1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw/view?usp=sharing'),
(4, '2025-07-09 11:31:08.227587', '2025-07-09 11:31:08.227642', 'PTE', '<h1 style=\"box-sizing: border-box; margin: 0px 0px 25px; font-weight: 700; line-height: 1.3; color: rgb(15, 23, 42); font-size: 32px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -1px;\">PTE</h1>\r\n\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 30px; font-weight: 600; line-height: 1.3; color: rgb(15, 23, 42); font-size: 24px; font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -0.72px;\">Preparing You for Success in Every Module</h3>\r\n\r\n<p style=\"box-sizing: border-box; font-size: 20px; text-align: justify; margin-top: 0px; margin-bottom: 30px; line-height: 32px; color: rgb(120, 123, 132); font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -0.2px;\">IELTS, the international English Language Testing system, provides an assessment of language ability of candidates who need to study or train in the medium of English.</p>\r\n\r\n<p style=\"box-sizing: border-box; font-size: 20px; text-align: justify; margin-top: 0px; margin-bottom: 30px; line-height: 32px; color: rgb(120, 123, 132); font-family: &quot;Plus Jakarta Sans&quot;, sans-serif; letter-spacing: -0.2px;\">IELTS is regarded as an entrance requirement by most universities in the United Kingdom, Australia, New Zealand and Canada. It is also gaining recognition among universities and other educational institutes in the United States of America.</p>\r\n', '<h3>Our benefits</h3>\r\n\r\n<p>Choosing the right visa agency can make a world of difference in your journey toward international exploration, growth, and success. At goforen we take Here are the distinctive benefits of partnering with us:</p>\r\n', '1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw', 'https://drive.google.com/file/d/1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw/view?usp=sharing'),
(5, '2025-07-09 11:33:38.118258', '2025-07-09 11:34:55.895886', 'SAT', '<h1>SAT</h1>\r\n\r\n<h3>Preparing You for Success in Every Module</h3>\r\n\r\n<p>IELTS, the international English Language Testing system, provides an assessment of language ability of candidates who need to study or train in the medium of English.</p>\r\n\r\n<p>IELTS is regarded as an entrance requirement by most universities in the United Kingdom, Australia, New Zealand and Canada. It is also gaining recognition among universities and other educational institutes in the United States of America.</p>\r\n', '<h3>Our benefits</h3>\r\n\r\n<p>Choosing the right visa agency can make a world of difference in your journey toward international exploration, growth, and success. At goforen we take Here are the distinctive benefits of partnering with us:</p>\r\n', '1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw', 'https://drive.google.com/file/d/1xYAaks1rnzOLXsHUnTguGVCZtc4OjlAw/view?usp=sharing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course_name`
--

CREATE TABLE `tbl_course_name` (
  `id` bigint(20) NOT NULL,
  `course_name` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course_name`
--

INSERT INTO `tbl_course_name` (`id`, `course_name`, `created_at`, `updated_at`) VALUES
(1, 'Engineering & Technology', '2025-07-10 07:18:32.710150', '2025-07-10 07:18:32.710200'),
(2, 'Business & Management', '2025-07-10 07:18:32.710218', '2025-07-10 07:18:32.710231'),
(3, 'Computer Science & IT', '2025-07-10 07:18:32.710245', '2025-07-10 07:18:32.710257'),
(4, 'Health & Medical Sciences', '2025-07-10 07:18:32.710271', '2025-07-10 07:18:32.710282'),
(5, 'Arts & Humanities', '2025-07-10 07:18:32.710296', '2025-07-10 07:18:32.710307'),
(6, 'Law', '2025-07-10 07:18:32.710321', '2025-07-10 07:18:32.710333'),
(7, 'Social Sciences', '2025-07-10 07:18:32.710347', '2025-07-10 07:18:32.710358'),
(8, 'Education & Teaching', '2025-07-10 07:18:32.710372', '2025-07-10 07:18:32.710384'),
(9, 'Sciences', '2025-07-10 07:18:32.710398', '2025-07-10 07:18:32.710411'),
(10, 'Pharmacy', '2025-07-10 07:18:32.710425', '2025-07-10 07:18:32.710436'),
(11, 'Nursing', '2025-07-10 07:18:32.710449', '2025-07-10 07:18:32.710461'),
(12, 'Architecture & Design', '2025-07-10 07:18:32.710474', '2025-07-10 07:18:32.710485'),
(13, 'Agriculture & Veterinary Sciences', '2025-07-10 07:18:32.710498', '2025-07-10 07:18:32.710509'),
(14, 'Tourism & Hospitality', '2025-07-10 07:18:32.710522', '2025-07-10 07:18:32.710534'),
(15, 'Media & Communication', '2025-07-10 07:18:32.710547', '2025-07-10 07:18:32.710558'),
(16, 'Environmental Studies', '2025-07-10 07:18:32.710572', '2025-07-10 07:18:32.710583'),
(17, 'Performing Arts', '2025-07-10 07:18:32.710597', '2025-07-10 07:18:32.710608'),
(18, 'Fashion & Interior Design', '2025-07-10 07:18:32.710621', '2025-07-10 07:18:32.710633'),
(19, 'Engineering & Technology', '2025-07-10 07:22:13.317694', '2025-07-10 07:22:13.317746'),
(20, 'Business & Management', '2025-07-10 07:22:13.317770', '2025-07-10 07:22:13.317783'),
(21, 'Computer Science & IT', '2025-07-10 07:22:13.317797', '2025-07-10 07:22:13.317809'),
(22, 'Health & Medical Sciences', '2025-07-10 07:22:13.317823', '2025-07-10 07:22:13.317834'),
(23, 'Arts & Humanities', '2025-07-10 07:22:13.317847', '2025-07-10 07:22:13.317858'),
(24, 'Law', '2025-07-10 07:22:13.317871', '2025-07-10 07:22:13.317882'),
(25, 'Social Sciences', '2025-07-10 07:22:13.317896', '2025-07-10 07:22:13.317907'),
(26, 'Education & Teaching', '2025-07-10 07:22:13.317920', '2025-07-10 07:22:13.317931'),
(27, 'Sciences', '2025-07-10 07:22:13.317944', '2025-07-10 07:22:13.317955'),
(28, 'Pharmacy', '2025-07-10 07:22:13.317968', '2025-07-10 07:22:13.317979'),
(29, 'Nursing', '2025-07-10 07:22:13.317992', '2025-07-10 07:22:13.318003'),
(30, 'Architecture & Design', '2025-07-10 07:22:13.318016', '2025-07-10 07:22:13.318026'),
(31, 'Agriculture & Veterinary Sciences', '2025-07-10 07:22:13.318039', '2025-07-10 07:22:13.318049'),
(32, 'Tourism & Hospitality', '2025-07-10 07:22:13.318062', '2025-07-10 07:22:13.318074'),
(33, 'Media & Communication', '2025-07-10 07:22:13.318087', '2025-07-10 07:22:13.318097'),
(34, 'Environmental Studies', '2025-07-10 07:22:13.318110', '2025-07-10 07:22:13.318121'),
(35, 'Performing Arts', '2025-07-10 07:22:13.318134', '2025-07-10 07:22:13.318145'),
(36, 'Fashion & Interior Design', '2025-07-10 07:22:13.318158', '2025-07-10 07:22:13.318169');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cv`
--

CREATE TABLE `tbl_cv` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(15) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `desired_visa_service` varchar(50) DEFAULT NULL,
  `resume` varchar(100) NOT NULL,
  `captcha_entered` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_education_qualification`
--

CREATE TABLE `tbl_education_qualification` (
  `id` bigint(20) NOT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `stream_of_degree` varchar(100) DEFAULT NULL,
  `major_degree` varchar(100) DEFAULT NULL,
  `year_of_completion` varchar(100) DEFAULT NULL,
  `percentage` varchar(100) DEFAULT NULL,
  `total_backlog` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employeement_detail`
--

CREATE TABLE `tbl_employeement_detail` (
  `id` bigint(20) NOT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `from_date` varchar(100) DEFAULT NULL,
  `to_date` varchar(100) DEFAULT NULL,
  `no_of_years` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exam_detail`
--

CREATE TABLE `tbl_exam_detail` (
  `id` bigint(20) NOT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `exam` varchar(100) DEFAULT NULL,
  `listening` varchar(100) DEFAULT NULL,
  `reading` varchar(100) DEFAULT NULL,
  `writing` varchar(100) DEFAULT NULL,
  `speaking` varchar(100) DEFAULT NULL,
  `final_score` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` bigint(20) NOT NULL,
  `question` varchar(50) DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'What services do you offer?', '<p>We offer comprehensive immigration and visa consulting services,<br />\r\nincluding visa application assistance, document preparation,</p>\r\n\r\n<ul>\r\n	<li>Comprehensive Visa Assistance</li>\r\n	<li>Visa Category Expertise</li>\r\n	<li>Transparency and Communication</li>\r\n</ul>\r\n', '2025-07-10 08:20:32.556456', '2025-07-10 08:20:32.556487'),
(2, 'What is the consultation process like?', '<p>We offer comprehensive immigration and visa consulting services,<br />\r\nincluding visa application assistance, document preparation,</p>\r\n\r\n<ul>\r\n	<li>Comprehensive Visa Assistance</li>\r\n	<li>Visa Category Expertise</li>\r\n	<li>Transparency and Communication</li>\r\n</ul>\r\n', '2025-07-10 08:20:50.303047', '2025-07-10 08:20:50.303079'),
(3, 'How much do your services cost?', '<p>We offer comprehensive immigration and visa consulting services,<br />\r\nincluding visa application assistance, document preparation,</p>\r\n\r\n<ul>\r\n	<li>Comprehensive Visa Assistance</li>\r\n	<li>Visa Category Expertise</li>\r\n	<li>Transparency and Communication</li>\r\n</ul>\r\n', '2025-07-10 08:21:06.014123', '2025-07-10 08:21:06.014149'),
(4, 'How do I get started with your services?', '<p>We offer comprehensive immigration and visa consulting services,<br />\r\nincluding visa application assistance, document preparation,</p>\r\n\r\n<ul>\r\n	<li>Comprehensive Visa Assistance</li>\r\n	<li>Visa Category Expertise</li>\r\n	<li>Transparency and Communication</li>\r\n</ul>\r\n', '2025-07-10 08:21:20.011906', '2025-07-10 08:21:20.011936'),
(5, 'What is your success rate with visa applications?', '<p>We offer comprehensive immigration and visa consulting services,<br />\r\nincluding visa application assistance, document preparation,</p>\r\n\r\n<ul>\r\n	<li>Comprehensive Visa Assistance</li>\r\n	<li>Visa Category Expertise</li>\r\n	<li>Transparency and Communication</li>\r\n</ul>\r\n', '2025-07-10 08:21:54.639439', '2025-07-10 08:21:54.639472');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery`
--

CREATE TABLE `tbl_gallery` (
  `id` bigint(20) NOT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_gallery`
--

INSERT INTO `tbl_gallery` (`id`, `image_name`, `image_id`, `created_at`, `updated_at`, `category`, `image_url`) VALUES
(1, 'advt image', '1qV-9PeKvU3DxqVnIa0OG6PWd9HLIr3qy', '2025-07-10 04:17:44.861640', '2025-07-10 04:17:44.861669', 'advertisment', 'https://drive.google.com/file/d/1qV-9PeKvU3DxqVnIa0OG6PWd9HLIr3qy/view?usp=sharing'),
(2, 'advt 2', '1tSefR6UAL2lLztlFQaDP9FhkFKPv5ZSW', '2025-07-10 04:20:26.593240', '2025-07-10 04:20:26.593271', 'advertisment', 'https://drive.google.com/file/d/1tSefR6UAL2lLztlFQaDP9FhkFKPv5ZSW/view?usp=drive_link'),
(3, '', '1xXFUPmWY89MQmS-_Wp4zny8QrF-hari_', '2025-07-10 04:23:49.753933', '2025-07-10 04:23:49.754089', 'advertisment', 'https://drive.google.com/file/d/1xXFUPmWY89MQmS-_Wp4zny8QrF-hari_/view?usp=drive_link'),
(4, '', '1ni9SGT1nxtLrZygj0rQumVKfjYEXQEUI', '2025-07-10 04:24:46.839513', '2025-07-10 04:24:46.839545', 'advertisment', 'https://drive.google.com/file/d/1ni9SGT1nxtLrZygj0rQumVKfjYEXQEUI/view?usp=drive_link'),
(5, '', '1ID8egrSogsSVCJEW4gKFZZ_efPPLtQJE', '2025-07-10 04:25:07.516289', '2025-07-10 04:25:07.516320', 'advertisment', 'https://drive.google.com/file/d/1ID8egrSogsSVCJEW4gKFZZ_efPPLtQJE/view?usp=drive_link'),
(6, '', '1ViN3hwFcDk9AhpSz1C4WhyjPYi5fPH14', '2025-07-10 04:25:24.711584', '2025-07-10 04:25:24.711633', 'advertisment', 'https://drive.google.com/file/d/1ViN3hwFcDk9AhpSz1C4WhyjPYi5fPH14/view?usp=drive_link'),
(7, '', '1Dd_tSs9--gidM1HSmZY5s_iQ0LfD04Ml', '2025-07-10 04:26:41.124068', '2025-07-10 04:26:41.124098', 'advertisment', 'https://drive.google.com/file/d/1Dd_tSs9--gidM1HSmZY5s_iQ0LfD04Ml/view?usp=drive_link'),
(8, '', '1DV9eRNvfn6QOxExvzdGo1ml80NkcyFds', '2025-07-10 04:26:57.919140', '2025-07-10 04:26:57.919167', 'advertisment', 'https://drive.google.com/file/d/1DV9eRNvfn6QOxExvzdGo1ml80NkcyFds/view?usp=drive_link'),
(9, '', '1OuY2S9u-Ysjx7YYeBQ4pI44uAgkKOYo-', '2025-07-10 04:27:12.548899', '2025-07-10 04:27:12.548934', 'advertisment', 'https://drive.google.com/file/d/1OuY2S9u-Ysjx7YYeBQ4pI44uAgkKOYo-/view?usp=drive_link'),
(10, '', '1RBBoZCj4cka0IEgWm-XImZkePF7BuBs3', '2025-07-10 04:27:25.615804', '2025-07-10 04:27:25.615830', 'advertisment', 'https://drive.google.com/file/d/1RBBoZCj4cka0IEgWm-XImZkePF7BuBs3/view?usp=drive_link'),
(11, '', '1Uy_VfVRjJeclhm6UekszXmxr8suEIjQg', '2025-07-10 04:27:43.473392', '2025-07-10 04:27:43.473419', 'advertisment', 'https://drive.google.com/file/d/1Uy_VfVRjJeclhm6UekszXmxr8suEIjQg/view?usp=drive_link'),
(12, '', '1s_50JOyHDxX2G3PcUUBUTz4vvOwHhy59', '2025-07-10 04:28:17.598986', '2025-07-10 04:28:17.599025', 'advertisment', 'https://drive.google.com/file/d/1s_50JOyHDxX2G3PcUUBUTz4vvOwHhy59/view?usp=drive_link'),
(13, '', '13owUkn9A4XSXv0FXb4gmlt_bMdItEURk', '2025-07-10 04:29:07.034631', '2025-07-10 04:29:07.034833', 'coaching', 'https://drive.google.com/file/d/13owUkn9A4XSXv0FXb4gmlt_bMdItEURk/view?usp=drive_link'),
(14, '', '1EiBBI0FhZz7TwGbPvalE78-s_TjorbkV', '2025-07-10 04:29:19.481192', '2025-07-10 04:29:19.481229', 'coaching', 'https://drive.google.com/file/d/1EiBBI0FhZz7TwGbPvalE78-s_TjorbkV/view?usp=drive_link'),
(15, '', '1gOuEsuY6-r12nNlrwHmvjD6PvGyZduzk', '2025-07-10 04:29:32.396826', '2025-07-10 04:29:32.396858', 'coaching', 'https://drive.google.com/file/d/1gOuEsuY6-r12nNlrwHmvjD6PvGyZduzk/view?usp=drive_link'),
(16, '', '1pn_wPRyUzh4xcWqrpMBvKsYEol2AkZKY', '2025-07-10 04:29:57.486899', '2025-07-10 04:29:57.486928', 'coaching', 'https://drive.google.com/file/d/1pn_wPRyUzh4xcWqrpMBvKsYEol2AkZKY/view?usp=drive_link'),
(17, '', '1-m0hw5_OxgAf_vzFVn7-lXi-n3uRq44u', '2025-07-10 04:30:21.630823', '2025-07-10 04:30:21.630855', 'coaching', 'https://drive.google.com/file/d/1-m0hw5_OxgAf_vzFVn7-lXi-n3uRq44u/view?usp=drive_link'),
(18, '', '1aVYhR-k4BN7-Zc83_6AOMPAg_NAaLR2b', '2025-07-10 04:30:40.925089', '2025-07-10 04:30:40.925122', 'coaching', 'https://drive.google.com/file/d/1aVYhR-k4BN7-Zc83_6AOMPAg_NAaLR2b/view?usp=drive_link'),
(19, '', '1dGIjZ6heCsRbHuwWIDyzkt8YCSoT5gSl', '2025-07-10 04:30:53.439382', '2025-07-10 04:30:53.439413', 'coaching', 'https://drive.google.com/file/d/1dGIjZ6heCsRbHuwWIDyzkt8YCSoT5gSl/view?usp=drive_link'),
(20, '', '1sZHupuhFqfKclhg_F7A5_Pxo8Xa1Pddx', '2025-07-10 04:31:08.985075', '2025-07-10 04:31:08.985104', 'coaching', 'https://drive.google.com/file/d/1sZHupuhFqfKclhg_F7A5_Pxo8Xa1Pddx/view?usp=drive_link'),
(21, '', '1j4Rb0NTpSrJcsaDs5IwvB60AoIOUf0fw', '2025-07-10 04:31:41.128111', '2025-07-10 04:31:41.128160', 'successfull', 'https://drive.google.com/file/d/1j4Rb0NTpSrJcsaDs5IwvB60AoIOUf0fw/view?usp=drive_link'),
(22, '', '1yyqPOgebf87T-CK74ol18jdnfKsD9Kl8', '2025-07-10 04:31:57.144252', '2025-07-10 04:31:57.144281', 'successfull', 'https://drive.google.com/file/d/1yyqPOgebf87T-CK74ol18jdnfKsD9Kl8/view?usp=drive_link'),
(23, '', '1NP_io3dB8S8KyMHEQLjcrelHQpl6P8iT', '2025-07-10 04:32:10.992846', '2025-07-10 04:32:10.992874', 'successfull', 'https://drive.google.com/file/d/1NP_io3dB8S8KyMHEQLjcrelHQpl6P8iT/view?usp=drive_link'),
(24, '', '1Ns8G0BhWcGlqHXD9FskyNDSg62zZuVby', '2025-07-10 04:32:25.224549', '2025-07-10 04:32:25.224577', 'successfull', 'https://drive.google.com/file/d/1Ns8G0BhWcGlqHXD9FskyNDSg62zZuVby/view?usp=drive_link'),
(25, '', '1Cdg7LXuE2m9gbcTvIedWtSy-ppQkNQbL', '2025-07-10 04:33:33.853439', '2025-07-10 04:33:33.853472', 'offer', 'https://drive.google.com/file/d/1Cdg7LXuE2m9gbcTvIedWtSy-ppQkNQbL/view?usp=drive_link'),
(26, '', '1QkiRW-qdM2y1TNlqqafFhOGBKB4bFJa-', '2025-07-10 04:33:47.669450', '2025-07-10 04:33:47.669477', 'offer', 'https://drive.google.com/file/d/1QkiRW-qdM2y1TNlqqafFhOGBKB4bFJa-/view?usp=drive_link'),
(27, '', '1QmUM-XIhaPFjn6lx6srQ--Pbmt9sEgzG', '2025-07-10 04:34:00.900512', '2025-07-10 04:34:00.900544', 'offer', 'https://drive.google.com/file/d/1QmUM-XIhaPFjn6lx6srQ--Pbmt9sEgzG/view?usp=drive_link'),
(28, '', '1eGemd4IxcsVaBmBUMI1RIftUtY-McdnK', '2025-07-10 04:35:14.143953', '2025-07-10 04:35:14.143985', 'offer', 'https://drive.google.com/file/d/1eGemd4IxcsVaBmBUMI1RIftUtY-McdnK/view?usp=drive_link'),
(29, '', '1gbcL_S7X4WZKN3waO9tSsGrYNxT48Ndd', '2025-07-10 04:35:27.843087', '2025-07-10 04:35:27.843120', 'offer', 'https://drive.google.com/file/d/1gbcL_S7X4WZKN3waO9tSsGrYNxT48Ndd/view?usp=drive_link'),
(30, '', '12rgK6i3S8h9kVUtNAqHKkmh87zoAW86T', '2025-07-10 04:35:44.441936', '2025-07-10 04:35:44.441966', 'offer', 'https://drive.google.com/file/d/12rgK6i3S8h9kVUtNAqHKkmh87zoAW86T/view?usp=drive_link'),
(31, '', '1p0Tp-e0yxXHsOm6dHnsiycS91y8EfhjI', '2025-07-10 04:36:03.157370', '2025-07-10 04:36:03.157467', 'offer', 'https://drive.google.com/file/d/1p0Tp-e0yxXHsOm6dHnsiycS91y8EfhjI/view?usp=drive_link'),
(32, '', '1StuidP9nXxIv42f2yAwyX8uMEPMLbBVJ', '2025-07-10 04:36:15.756985', '2025-07-10 04:36:15.757015', 'offer', 'https://drive.google.com/file/d/1StuidP9nXxIv42f2yAwyX8uMEPMLbBVJ/view?usp=drive_link');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home`
--

CREATE TABLE `tbl_home` (
  `id` bigint(20) NOT NULL,
  `heading` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `serial` int(11) NOT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_industry_type`
--

CREATE TABLE `tbl_industry_type` (
  `id` bigint(20) NOT NULL,
  `industry_name` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_industry_type`
--

INSERT INTO `tbl_industry_type` (`id`, `industry_name`, `created_at`, `updated_at`) VALUES
(1, 'IT', '2025-07-10 07:12:07.064226', '2025-07-10 07:12:07.064255'),
(2, 'Health Care', '2025-07-10 07:12:17.869051', '2025-07-10 07:12:17.869075'),
(3, 'Construction', '2025-07-10 07:12:27.765095', '2025-07-10 07:12:27.765120');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inquiry_association`
--

CREATE TABLE `tbl_inquiry_association` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `number` varchar(15) NOT NULL,
  `present_occupation` varchar(50) DEFAULT NULL,
  `additional_query` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `form_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_intended_study`
--

CREATE TABLE `tbl_intended_study` (
  `id` bigint(20) NOT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` bigint(20) NOT NULL,
  `heading` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `heading`, `description`, `created_at`, `updated_at`, `image_id`, `image_url`) VALUES
(1, 'Netherlands Sees Rise in Undocumented Workers, Rai', '<p>The Netherlands is witnessing a surge in unauthorised employment of third-country nationals, with tens of thousands, including 35,000 Brazilians in Amsterdam alone, working without proper permits. These undocumented workers are mostly found in construction, agriculture, hospitality, and domestic services, raising concerns about exploitation and lack of access to health care...</p>\r\n\r\n<p>For better understanding, contact&nbsp;GOFOREN&nbsp;at 7600909090.</p>\r\n', '2025-07-10 08:24:35.262806', '2025-07-10 08:28:32.088231', '1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ', 'https://drive.google.com/file/d/1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ/view?usp=sharing'),
(2, 'Stay and Work in Canada: Apply for a TFWP Work Per', '<p>The Netherlands is witnessing a surge in unauthorised employment of third-country nationals, with tens of thousands, including 35,000 Brazilians in Amsterdam alone, working without proper permits. These undocumented workers are mostly found in construction, agriculture, hospitality, and domestic services, raising concerns about exploitation and lack of access to health care...</p>\r\n\r\n<p>For better understanding, contact&nbsp;GOFOREN&nbsp;at 7600909090.</p>\r\n', '2025-07-10 08:30:01.865846', '2025-07-10 08:30:01.865909', '1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ', 'https://drive.google.com/file/d/1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ/view?usp=sharing'),
(3, 'UAE Expands Visa on Arrival for Indian Nationals.', '<p>The Netherlands is witnessing a surge in unauthorised employment of third-country nationals, with tens of thousands, including 35,000 Brazilians in Amsterdam alone, working without proper permits. These undocumented workers are mostly found in construction, agriculture, hospitality, and domestic services, raising concerns about exploitation and lack of access to health care...</p>\r\n\r\n<p>For better understanding, contact&nbsp;GOFOREN&nbsp;at 7600909090.</p>\r\n', '2025-07-10 08:30:39.205879', '2025-07-10 08:30:39.205908', '1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ', 'https://drive.google.com/file/d/1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ/view?usp=sharing'),
(4, 'Latvia to Enforce Stricter Entry Rules for Third-C', '<p>The Netherlands is witnessing a surge in unauthorised employment of third-country nationals, with tens of thousands, including 35,000 Brazilians in Amsterdam alone, working without proper permits. These undocumented workers are mostly found in construction, agriculture, hospitality, and domestic services, raising concerns about exploitation and lack of access to health care...</p>\r\n\r\n<p>For better understanding, contact&nbsp;GOFOREN&nbsp;at 7600909090.</p>\r\n', '2025-07-10 08:31:03.385634', '2025-07-10 08:31:03.385668', '1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ', 'https://drive.google.com/file/d/1OkZr0RRQafdYx3HIJ9tWzOQ27zl6UpTJ/view?usp=sharing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

CREATE TABLE `tbl_newsletter` (
  `id` bigint(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_newsletter`
--

INSERT INTO `tbl_newsletter` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'sasa@gmail.com', '2025-07-10 08:39:21.898742', '2025-07-10 08:39:21.898809');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_occupation`
--

CREATE TABLE `tbl_occupation` (
  `id` bigint(20) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_occupation`
--

INSERT INTO `tbl_occupation` (`id`, `occupation`, `created_at`, `updated_at`) VALUES
(1, 'Doctor', '2025-07-10 07:10:09.911655', '2025-07-10 07:10:09.912494'),
(2, 'Engineer', '2025-07-10 07:10:09.912558', '2025-07-10 07:10:09.912574'),
(3, 'Teacher', '2025-07-10 07:10:09.912590', '2025-07-10 07:10:09.912603'),
(4, 'Lawyer', '2025-07-10 07:10:09.912616', '2025-07-10 07:10:09.912627'),
(5, 'Nurse', '2025-07-10 07:10:09.912640', '2025-07-10 07:10:09.912651'),
(6, 'Accountant', '2025-07-10 07:10:09.912665', '2025-07-10 07:10:09.912676'),
(7, 'Architect', '2025-07-10 07:10:09.912690', '2025-07-10 07:10:09.912701'),
(8, 'Pharmacist', '2025-07-10 07:10:09.912716', '2025-07-10 07:10:09.912727'),
(9, 'Software Developer', '2025-07-10 07:10:09.912740', '2025-07-10 07:10:09.912751'),
(10, 'Electrician', '2025-07-10 07:10:09.912764', '2025-07-10 07:10:09.912775'),
(11, 'Mechanic', '2025-07-10 07:10:09.912788', '2025-07-10 07:10:09.912800'),
(12, 'Chef', '2025-07-10 07:10:09.912813', '2025-07-10 07:10:09.912824'),
(13, 'Pilot', '2025-07-10 07:10:09.912837', '2025-07-10 07:10:09.912847'),
(14, 'Police Officer', '2025-07-10 07:10:09.912861', '2025-07-10 07:10:09.912872'),
(15, 'Scientist', '2025-07-10 07:10:09.912885', '2025-07-10 07:10:09.912896'),
(16, 'Dentist', '2025-07-10 07:10:09.912910', '2025-07-10 07:10:09.912920'),
(17, 'Plumber', '2025-07-10 07:10:09.912937', '2025-07-10 07:10:09.912950'),
(18, 'Artist', '2025-07-10 07:10:09.912963', '2025-07-10 07:10:09.912974'),
(19, 'Journalist', '2025-07-10 07:10:09.912988', '2025-07-10 07:10:09.912999'),
(20, 'Civil Servant', '2025-07-10 07:10:09.913011', '2025-07-10 07:10:09.913023');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pr_visa_inquiry`
--

CREATE TABLE `tbl_pr_visa_inquiry` (
  `id` bigint(20) NOT NULL,
  `desired_country` varchar(50) DEFAULT NULL,
  `desired_visa_route` varchar(50) DEFAULT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `landline` varchar(50) DEFAULT NULL,
  `alt_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `no_of_child` varchar(50) DEFAULT NULL,
  `flat_no` varchar(100) DEFAULT NULL,
  `building_name` varchar(100) DEFAULT NULL,
  `road_street` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_visa_inquiry`
--

CREATE TABLE `tbl_student_visa_inquiry` (
  `id` bigint(20) NOT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `landline_number` varchar(15) DEFAULT NULL,
  `alternate_number` varchar(15) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `desired_country` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `additional_query` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `blood_relative_foreign` varchar(100) DEFAULT NULL,
  `building_name` varchar(50) DEFAULT NULL,
  `citizenship` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `countries_names` varchar(100) DEFAULT NULL,
  `family_income` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `field_of_study` varchar(100) DEFAULT NULL,
  `flat_no` varchar(50) DEFAULT NULL,
  `how_about_us` varchar(100) DEFAULT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `is_valid_passport` varchar(100) DEFAULT NULL,
  `level_of_study` varchar(100) DEFAULT NULL,
  `passport_no` varchar(100) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `road_street` varchar(50) DEFAULT NULL,
  `spouse_dependent_visa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_study_course`
--

CREATE TABLE `tbl_study_course` (
  `id` bigint(20) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `study_faculty` varchar(100) DEFAULT NULL,
  `college_nature` varchar(100) DEFAULT NULL,
  `study_level` varchar(100) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `add_date` varchar(100) DEFAULT NULL,
  `seat_count` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_study_course`
--

INSERT INTO `tbl_study_course` (`id`, `location`, `study_faculty`, `college_nature`, `study_level`, `course_name`, `college`, `add_date`, `seat_count`, `created_at`, `updated_at`) VALUES
(1, 'India', 'Engineering & Technology', 'RTU', 'Certificate Course', 'Business & Management', 'RTU', '2025-07-16', '150', '2025-07-10 07:25:20.551008', '2025-07-10 07:27:50.410305'),
(2, 'Anywhere', 'Business & Management', 'MLSU', 'Advanced Diploma', 'Pharmacy', 'MLSU', '2025-07-10', '250', '2025-07-10 07:25:58.346182', '2025-07-10 07:25:58.346271'),
(3, 'Anywhere', 'Health & Medical Sciences', 'GTU', 'Advanced Diploma', 'Environmental Studies', 'GTU', '2025-07-25', '456', '2025-07-10 07:26:46.284915', '2025-07-10 07:26:46.284948');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_study_level`
--

CREATE TABLE `tbl_study_level` (
  `id` bigint(20) NOT NULL,
  `level_name` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_study_level`
--

INSERT INTO `tbl_study_level` (`id`, `level_name`, `created_at`, `updated_at`) VALUES
(1, 'Certificate Course', '2025-07-10 07:24:07.462830', '2025-07-10 07:24:07.462888'),
(2, 'Diploma', '2025-07-10 07:24:07.462907', '2025-07-10 07:24:07.462920'),
(3, 'Advanced Diploma', '2025-07-10 07:24:07.462936', '2025-07-10 07:24:07.462948'),
(4, 'Bachelor\'s Degree', '2025-07-10 07:24:07.462962', '2025-07-10 07:24:07.462974'),
(5, 'Postgraduate Diploma', '2025-07-10 07:24:07.462988', '2025-07-10 07:24:07.463003'),
(6, 'Master\'s Degree', '2025-07-10 07:24:07.463018', '2025-07-10 07:24:07.463030'),
(7, 'Doctorate / PhD', '2025-07-10 07:24:07.463044', '2025-07-10 07:24:07.463057'),
(8, 'Foundation Program', '2025-07-10 07:24:07.463071', '2025-07-10 07:24:07.463082'),
(9, 'Language Course', '2025-07-10 07:24:07.463097', '2025-07-10 07:24:07.463110'),
(10, 'Short-Term Course', '2025-07-10 07:24:07.463125', '2025-07-10 07:24:07.463136'),
(11, 'Exchange Program', '2025-07-10 07:24:07.463151', '2025-07-10 07:24:07.463163'),
(12, 'Online / Distance Learning', '2025-07-10 07:24:07.463178', '2025-07-10 07:24:07.463189');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_success_stories`
--

CREATE TABLE `tbl_success_stories` (
  `id` bigint(20) NOT NULL,
  `heading` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_success_stories`
--

INSERT INTO `tbl_success_stories` (`id`, `heading`, `description`, `created_at`, `updated_at`, `image_id`, `image_url`, `post`) VALUES
(1, 'RISHI MODI', '<p>I would like to thank Go Foren for your assistance during the student visa process for Canada.</p>\r\n', '2025-07-10 06:38:28.665933', '2025-07-10 06:57:53.644246', '1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I', 'https://drive.google.com/file/d/1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I/view?usp=drive_link', 'STV CANADA'),
(2, 'KAIS PATEL', '<p>For a long time I had a dream of studying abroad and finally it came true with the help of GOFOREN. the staff of GOFOREN have guided me through every stage of process.</p>\r\n', '2025-07-10 06:39:13.777939', '2025-07-10 06:39:13.777968', '1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I', 'https://drive.google.com/file/d/1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I/view?usp=drive_link', 'STV CANADA'),
(3, 'meet patel', '<p>GOFOREN has been my pillar of support through all the steps required to achieve my dreams of studying abroad. I especially thank Rajesh Sir and Vijay Sir for guiding me throughout my process from selection of courses, application of student visa.</p>\r\n', '2025-07-10 06:39:49.307464', '2025-07-10 06:58:40.098972', '1G42zofQLkxVz3KKxbRuwybnmraQGO3z6', 'https://drive.google.com/file/d/1G42zofQLkxVz3KKxbRuwybnmraQGO3z6/view?usp=drive_link', 'STV CANADA'),
(5, 'Tushar Javeri', '<p>I had a great experience at Go Foren. I thank the team for helping me in the passport as well as in my visa process.</p>\r\n', '2025-07-10 07:00:03.007042', '2025-07-10 07:00:03.007072', '1G42zofQLkxVz3KKxbRuwybnmraQGO3z6', 'https://drive.google.com/file/d/1G42zofQLkxVz3KKxbRuwybnmraQGO3z6/view?usp=drive_link', 'TRV Europe'),
(6, 'Laksh tank', '<p>I really thankful to you guys for guiding me properly on visa and its process. Thanks for your support and help to get it done.</p>\r\n', '2025-07-10 07:00:37.937981', '2025-07-10 07:00:37.938031', '1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I', 'https://drive.google.com/file/d/1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I/view?usp=drive_link', 'New Zealand'),
(7, ' Ketan D. Parekh', '<p>Go Foren has great coaching classes for IELTS, the faculties of which imparts detailed information necessary for getting a good score. It also has helped me get my visa.</p>\r\n', '2025-07-10 07:01:02.722802', '2025-07-10 07:01:02.722839', '1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I', 'https://drive.google.com/file/d/1WAxRXRkvzYEi4nss8VqiWHx9srt5Fl0I/view?usp=drive_link', 'STV UK'),
(8, 'Patel P', '<p>I want to thank the entire team of Go Foren for sharing vital details about visa and explaining them properly. The team has helped me with great support for getting the USA Green Card done.</p>\r\n', '2025-07-10 07:01:51.377781', '2025-07-10 07:01:51.377811', '1G42zofQLkxVz3KKxbRuwybnmraQGO3z6', 'https://drive.google.com/file/d/1G42zofQLkxVz3KKxbRuwybnmraQGO3z6/view?usp=drive_link', 'HB Visa USA'),
(9, 'Manav Bhavsar', '<p>Very helpful and supportive staff. Had a great support from these guys during visa process.</p>\r\n', '2025-07-10 07:02:19.135644', '2025-07-10 07:02:19.135677', '1G42zofQLkxVz3KKxbRuwybnmraQGO3z6', 'https://drive.google.com/file/d/1G42zofQLkxVz3KKxbRuwybnmraQGO3z6/view?usp=drive_link', 'PRV  Canada');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team`
--

CREATE TABLE `tbl_team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `linkedin` varchar(50) DEFAULT NULL,
  `tweeter` varchar(50) DEFAULT NULL,
  `image_id` varchar(50) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_team`
--

INSERT INTO `tbl_team` (`id`, `name`, `designation`, `description`, `created_at`, `updated_at`, `facebook`, `linkedin`, `tweeter`, `image_id`, `image_url`) VALUES
(1, 'Janvi Patel', 'Legal Advisor', '', '2025-07-09 12:13:40.821128', '2025-07-09 12:13:40.821156', '', '', '', '1609tNhswfUurDteX1BtVGNVQGCZPDb72', 'https://drive.google.com/file/d/1609tNhswfUurDteX1BtVGNVQGCZPDb72/view?usp=drive_link'),
(2, 'Vivek Sharma', 'Education Counsellor', '', '2025-07-09 12:15:12.680169', '2025-07-09 12:15:12.680234', '', '', '', '1fhkwgY7SS5Ifw4tyodKGS-3Z-GfUtxha', 'https://drive.google.com/file/d/1fhkwgY7SS5Ifw4tyodKGS-3Z-GfUtxha/view?usp=drive_link'),
(3, 'Kunal Mehta', 'Visa Specialist', '', '2025-07-09 12:15:39.689792', '2025-07-09 12:15:39.689820', '', '', '', '1ouF_tDfq6p1yN-bkWxH9q8-6bjgaf2If', 'https://drive.google.com/file/d/1ouF_tDfq6p1yN-bkWxH9q8-6bjgaf2If/view?usp=drive_link'),
(4, 'Krishna Varma', 'Visa Coordinator', '', '2025-07-09 12:16:03.115393', '2025-07-09 12:16:03.115420', '', '', '', '11gyX2eEnlcwp_8aXaVv7GSSVitVZFFsO', 'https://drive.google.com/file/d/11gyX2eEnlcwp_8aXaVv7GSSVitVZFFsO/view?usp=drive_link'),
(5, 'Jay Patel', 'General Manager', '', '2025-07-09 12:16:32.340730', '2025-07-09 12:16:32.340776', '', '', '', '1pPXJNwekWNiELVLIiKKuNV4La5xMJgAM', 'https://drive.google.com/file/d/1pPXJNwekWNiELVLIiKKuNV4La5xMJgAM/view?usp=drive_link'),
(6, 'Drashti Vora', 'Case Manager', '', '2025-07-09 12:16:59.401210', '2025-07-09 12:16:59.401240', '', '', '', '1bHd6Yn1DN1ss-NepgqiMidUGZVcW0fXj', 'https://drive.google.com/file/d/1bHd6Yn1DN1ss-NepgqiMidUGZVcW0fXj/view?usp=drive_link'),
(7, 'ketan kakdiya', 'Visa Coordinator', '', '2025-07-09 12:17:32.774588', '2025-07-09 12:17:32.774751', '', '', '', '1iw33Fv53ChnYuTky2KaaSDzRLJrKtxrh', 'https://drive.google.com/file/d/1iw33Fv53ChnYuTky2KaaSDzRLJrKtxrh/view?usp=drive_link'),
(8, 'Shivani Dabhi', 'Case Manager', '', '2025-07-09 12:18:05.650557', '2025-07-09 12:18:05.650587', '', '', '', '1RYMGu7U7DIOt7fWoS27PK4WhPTdCWtSY', 'https://drive.google.com/file/d/1RYMGu7U7DIOt7fWoS27PK4WhPTdCWtSY/view?usp=drive_link');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_test_detail`
--

CREATE TABLE `tbl_test_detail` (
  `id` bigint(20) NOT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `exam` varchar(100) DEFAULT NULL,
  `verbal_reasoning` varchar(100) DEFAULT NULL,
  `quantitative_reasoning` varchar(100) DEFAULT NULL,
  `analytical_writing` varchar(100) DEFAULT NULL,
  `final_score` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `created_at`, `updated_at`, `username`, `email`, `mobile`, `password`, `role`) VALUES
(1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 'System Admin', 'admin@gmail.com', '1234567890', '1234', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vacancy`
--

CREATE TABLE `tbl_vacancy` (
  `id` bigint(20) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `industry_type` varchar(100) DEFAULT NULL,
  `position_name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `vacancy_date` varchar(100) DEFAULT NULL,
  `vacancy_count` varchar(100) DEFAULT NULL,
  `master_agent_code` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vacancy`
--

INSERT INTO `tbl_vacancy` (`id`, `location`, `industry_type`, `position_name`, `company`, `vacancy_date`, `vacancy_count`, `master_agent_code`, `created_at`, `updated_at`) VALUES
(1, 'Anywhere', 'IT', 'Business & Management', 'company', '2025-07-11', '2', '7', '2025-07-10 07:13:28.704797', '2025-07-10 07:13:28.704826'),
(2, 'Anywhere', 'Health Care', 'Tourism & Hospitality', 'company', '2025-07-31', '2', '54', '2025-07-10 07:13:55.949226', '2025-07-10 07:13:55.949300'),
(3, 'Anywhere', 'Health Care', 'Nursing', 'company', '2025-07-22', '6', '789', '2025-07-10 07:14:15.595454', '2025-07-10 07:14:15.595489');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `id` bigint(20) NOT NULL,
  `video_name` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `row_video_url` varchar(100) DEFAULT NULL,
  `video_embed_url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`id`, `video_name`, `created_at`, `updated_at`, `row_video_url`, `video_embed_url`) VALUES
(1, 'Jayanti bhai Experience on Visitor visa ', '2025-07-10 07:28:54.666643', '2025-07-10 07:28:54.666675', 'https://www.youtube.com/watch?v=vCQalqvEexs', 'https://www.youtube.com/embed/vCQalqvEexs'),
(2, 'Rashmiben get visitors visa successfully for CANAD', '2025-07-10 07:29:34.924203', '2025-07-10 07:29:34.924233', 'https://www.youtube.com/watch?v=ohTdbKXaysE', 'https://www.youtube.com/embed/ohTdbKXaysE'),
(3, 'Goforen Visa consultancy get successfully student ', '2025-07-10 07:30:03.985977', '2025-07-10 07:30:03.986008', 'https://www.youtube.com/watch?v=suaMqm2Xm1U', 'https://www.youtube.com/embed/suaMqm2Xm1U'),
(4, 'Ankit Parmar get successful student visa.', '2025-07-10 07:30:28.882098', '2025-07-10 07:30:28.882128', 'https://www.youtube.com/watch?v=NjO4T5enbEk', 'https://www.youtube.com/embed/NjO4T5enbEk'),
(5, 'INTERVIEW OF AKSHIT SHAH WHO GOT STUDENT VISA FOR ', '2025-07-10 07:30:57.510393', '2025-07-10 07:30:57.510428', 'https://www.youtube.com/watch?v=WlgmpegFzgc', 'https://www.youtube.com/embed/WlgmpegFzgc'),
(6, 'INTERVIEW OF AKSHIT SHAH WHO GOT STUDENT VISA FOR ', '2025-07-10 07:31:29.404054', '2025-07-10 07:31:29.404092', 'https://www.youtube.com/watch?v=JCpMolFXg5A', 'https://www.youtube.com/embed/JCpMolFXg5A'),
(7, 'INTERVIEW OF AKSHIT SHAH WHO GOT STUDENT VISA FOR ', '2025-07-10 07:32:23.895868', '2025-07-10 07:32:23.895900', 'https://www.youtube.com/watch?v=0jetDdQRVnw', 'https://www.youtube.com/embed/0jetDdQRVnw'),
(8, 'INTERVIEW OF AKSHIT SHAH WHO GOT STUDENT VISA FOR ', '2025-07-10 07:32:52.170510', '2025-07-10 07:32:52.170541', 'https://www.youtube.com/watch?v=QsdhYhuKoFg', 'https://www.youtube.com/embed/QsdhYhuKoFg'),
(9, 'INTERVIEW OF VRUTANT SHETH WHO GOT STUDENT VISA FO', '2025-07-10 07:33:13.022222', '2025-07-10 07:33:13.022313', 'https://www.youtube.com/watch?v=WAw-J-r1LLk', 'https://www.youtube.com/embed/WAw-J-r1LLk'),
(10, 'INTERVIEW OF MR. JIGAR WHO GOT STUDENT VISA FOR CA', '2025-07-10 07:33:31.864052', '2025-07-10 07:33:31.864084', 'https://www.youtube.com/watch?v=-8UkXvHRJ8A', 'https://www.youtube.com/embed/-8UkXvHRJ8A');

-- --------------------------------------------------------

--
-- Table structure for table `visa_inquiry`
--

CREATE TABLE `visa_inquiry` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `number` varchar(15) NOT NULL,
  `desired_country` varchar(50) DEFAULT NULL,
  `desired_visa_service` varchar(50) DEFAULT NULL,
  `resume` varchar(100) NOT NULL,
  `interested_in_coaching` tinyint(1) NOT NULL,
  `course` varchar(50) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `captcha_entered` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visa_type`
--

CREATE TABLE `visa_type` (
  `id` bigint(20) NOT NULL,
  `visa_type` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `image_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visa_type`
--

INSERT INTO `visa_type` (`id`, `visa_type`, `created_at`, `updated_at`, `description`, `image_url`, `image_id`) VALUES
(1, 'Immigration  PR Visa', '2025-07-09 10:18:29.755182', '2025-07-09 10:25:51.116966', '<h1>Immigration - PR Visa</h1>\r\n\r\n<h3>Turning Your Immigration Dreams into Reality.</h3>\r\n\r\n<p>As per the report of BBC-UK people migrate for many different reasons. These reasons can be classified as economic, social, political or environmental :</p>\r\n\r\n<ul>\r\n	<li>economic migration&nbsp;- moving to find work or follow a particular career path</li>\r\n	<li>social migration&nbsp;- moving somewhere for a better quality of life or to be closer to family or friends</li>\r\n	<li>political migration&nbsp;- moving to escape political persecution or war</li>\r\n	<li>environmental&nbsp;causes of migration include natural disasters such as flooding Some people choose to migrate, eg someone who moves to another country to enhance their career opportunities. Some people are forced to migrate, eg someone who moves due to war or famine.</li>\r\n</ul>\r\n', 'https://drive.google.com/file/d/1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB/view?usp=sharing', '1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB'),
(2, 'Student Visa', '2025-07-09 10:54:02.117881', '2025-07-09 10:54:02.117909', '<h1>Student Visa</h1>\r\n\r\n<h3>Turning Your Immigration Dreams into Reality.</h3>\r\n\r\n<p>As per the report of BBC-UK people migrate for many different reasons. These reasons can be classified as economic, social, political or environmental :</p>\r\n\r\n<ul>\r\n	<li>economic migration&nbsp;- moving to find work or follow a particular career path</li>\r\n	<li>social migration&nbsp;- moving somewhere for a better quality of life or to be closer to family or friends</li>\r\n	<li>political migration&nbsp;- moving to escape political persecution or war</li>\r\n	<li>environmental&nbsp;causes of migration include natural disasters such as flooding Some people choose to migrate, eg someone who moves to another country to enhance their career opportunities. Some people are forced to migrate, eg someone who moves due to war or famine.</li>\r\n</ul>\r\n', 'https://drive.google.com/file/d/1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB/view?usp=sharing', '1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB'),
(3, 'Visitor Visa', '2025-07-09 10:55:01.319602', '2025-07-09 10:55:01.319630', '<h1>Student Visa</h1>\r\n\r\n<h3>Turning Your Immigration Dreams into Reality.</h3>\r\n\r\n<p>As per the report of BBC-UK people migrate for many different reasons. These reasons can be classified as economic, social, political or environmental :</p>\r\n\r\n<ul>\r\n	<li>economic migration&nbsp;- moving to find work or follow a particular career path</li>\r\n	<li>social migration&nbsp;- moving somewhere for a better quality of life or to be closer to family or friends</li>\r\n	<li>political migration&nbsp;- moving to escape political persecution or war</li>\r\n	<li>environmental&nbsp;causes of migration include natural disasters such as flooding Some people choose to migrate, eg someone who moves to another country to enhance their career opportunities. Some people are forced to migrate, eg someone who moves due to war or famine.</li>\r\n</ul>\r\n', 'https://drive.google.com/file/d/1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB/view?usp=sharing', '1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB'),
(4, 'Investor Visa', '2025-07-09 10:56:14.750057', '2025-07-09 10:56:14.750088', '<h1>Investor Visa</h1>\r\n\r\n<h3>Turning Your Immigration Dreams into Reality.</h3>\r\n\r\n<p>As per the report of BBC-UK people migrate for many different reasons. These reasons can be classified as economic, social, political or environmental :</p>\r\n\r\n<ul>\r\n	<li>economic migration&nbsp;- moving to find work or follow a particular career path</li>\r\n	<li>social migration&nbsp;- moving somewhere for a better quality of life or to be closer to family or friends</li>\r\n	<li>political migration&nbsp;- moving to escape political persecution or war</li>\r\n	<li>environmental&nbsp;causes of migration include natural disasters such as flooding Some people choose to migrate, eg someone who moves to another country to enhance their career opportunities. Some people are forced to migrate, eg someone who moves due to war or famine.</li>\r\n</ul>\r\n', 'https://drive.google.com/file/d/1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB/view?usp=sharing', '1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB'),
(5, 'Work Permit Visa', '2025-07-09 10:57:07.200259', '2025-07-09 10:57:07.200284', '<h1>Work Permit Visa</h1>\r\n\r\n<h3>Turning Your Immigration Dreams into Reality.</h3>\r\n\r\n<p>As per the report of BBC-UK people migrate for many different reasons. These reasons can be classified as economic, social, political or environmental :</p>\r\n\r\n<ul>\r\n	<li>economic migration&nbsp;- moving to find work or follow a particular career path</li>\r\n	<li>social migration&nbsp;- moving somewhere for a better quality of life or to be closer to family or friends</li>\r\n	<li>political migration&nbsp;- moving to escape political persecution or war</li>\r\n	<li>environmental&nbsp;causes of migration include natural disasters such as flooding Some people choose to migrate, eg someone who moves to another country to enhance their career opportunities. Some people are forced to migrate, eg someone who moves due to war or famine.</li>\r\n</ul>\r\n', 'https://drive.google.com/file/d/1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB/view?usp=sharing', '1K2oRYsu5tQejiPTqgI6Z20vIorgVLapB');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `myapp_personalizedguidance`
--
ALTER TABLE `myapp_personalizedguidance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_about_us`
--
ALTER TABLE `tbl_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blog_comment`
--
ALTER TABLE `tbl_blog_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_course_name`
--
ALTER TABLE `tbl_course_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cv`
--
ALTER TABLE `tbl_cv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_education_qualification`
--
ALTER TABLE `tbl_education_qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_employeement_detail`
--
ALTER TABLE `tbl_employeement_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_exam_detail`
--
ALTER TABLE `tbl_exam_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_industry_type`
--
ALTER TABLE `tbl_industry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inquiry_association`
--
ALTER TABLE `tbl_inquiry_association`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_intended_study`
--
ALTER TABLE `tbl_intended_study`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_occupation`
--
ALTER TABLE `tbl_occupation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pr_visa_inquiry`
--
ALTER TABLE `tbl_pr_visa_inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_student_visa_inquiry`
--
ALTER TABLE `tbl_student_visa_inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_study_course`
--
ALTER TABLE `tbl_study_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_study_level`
--
ALTER TABLE `tbl_study_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_success_stories`
--
ALTER TABLE `tbl_success_stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team`
--
ALTER TABLE `tbl_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_test_detail`
--
ALTER TABLE `tbl_test_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `tbl_vacancy`
--
ALTER TABLE `tbl_vacancy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visa_inquiry`
--
ALTER TABLE `visa_inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visa_type`
--
ALTER TABLE `visa_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `myapp_personalizedguidance`
--
ALTER TABLE `myapp_personalizedguidance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_about_us`
--
ALTER TABLE `tbl_about_us`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_blog_comment`
--
ALTER TABLE `tbl_blog_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_course_name`
--
ALTER TABLE `tbl_course_name`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_cv`
--
ALTER TABLE `tbl_cv`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_education_qualification`
--
ALTER TABLE `tbl_education_qualification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employeement_detail`
--
ALTER TABLE `tbl_employeement_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_exam_detail`
--
ALTER TABLE `tbl_exam_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_industry_type`
--
ALTER TABLE `tbl_industry_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_inquiry_association`
--
ALTER TABLE `tbl_inquiry_association`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_intended_study`
--
ALTER TABLE `tbl_intended_study`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_occupation`
--
ALTER TABLE `tbl_occupation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_pr_visa_inquiry`
--
ALTER TABLE `tbl_pr_visa_inquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student_visa_inquiry`
--
ALTER TABLE `tbl_student_visa_inquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_study_course`
--
ALTER TABLE `tbl_study_course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_study_level`
--
ALTER TABLE `tbl_study_level`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_success_stories`
--
ALTER TABLE `tbl_success_stories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_team`
--
ALTER TABLE `tbl_team`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_test_detail`
--
ALTER TABLE `tbl_test_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_vacancy`
--
ALTER TABLE `tbl_vacancy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `visa_inquiry`
--
ALTER TABLE `visa_inquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visa_type`
--
ALTER TABLE `visa_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

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
