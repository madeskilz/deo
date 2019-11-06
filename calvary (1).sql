-- phpMyAdmin SQL Dump
-- version 3.5.0
-- http://www.phpmyadmin.net
--
-- Host: 98.102.204.221
-- Generation Time: Oct 29, 2019 at 10:48 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `calvary`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE IF NOT EXISTS `academic_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  `activity` varchar(255) NOT NULL,
  `starts_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ends_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_academic_calendars_deleted_at` (`deleted_at`),
  KEY `idx_academic_calendars_academic_session_id` (`academic_session_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `academic_calendars`
--

INSERT INTO `academic_calendars` (`id`, `created_at`, `updated_at`, `deleted_at`, `academic_session_id`, `activity`, `starts_at`, `ends_at`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'Registration and Clearance of National Diploma Students', '2019-06-20 14:10:36', '2019-07-20 14:10:36'),
(2, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'Payment of tuition fees/other levies by National Diploma Students', '2019-06-20 14:10:36', '2019-09-20 14:10:36'),
(3, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'National Diploma Students lectures begins', '2019-06-20 14:10:36', '2020-06-20 14:10:36'),
(4, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'National Diploma Students First Test', '2019-10-20 14:10:36', '2019-10-25 14:10:36'),
(5, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'National Diploma Students Second Test', '2019-11-20 14:10:36', '2019-11-25 14:10:36'),
(6, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 'National Diploma Students Examination', '2020-07-22 14:10:36', '2020-08-22 14:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `academic_sessions`
--

CREATE TABLE IF NOT EXISTS `academic_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `starts_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ends_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_academic_sessions_name` (`name`),
  KEY `idx_academic_sessions_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `academic_sessions`
--

INSERT INTO `academic_sessions` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `starts_at`, `ends_at`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, '2018/2019', '2019-02-20 14:10:36', '2020-04-20 14:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `unit` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `semester_id` int(10) unsigned NOT NULL,
  `is_core` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_courses_code` (`code`),
  KEY `idx_courses_department_id` (`department_id`),
  KEY `idx_courses_level_id` (`level_id`),
  KEY `idx_courses_semester_id` (`semester_id`),
  KEY `idx_courses_is_core` (`is_core`),
  KEY `idx_courses_deleted_at` (`deleted_at`),
  KEY `idx_courses_title` (`title`),
  KEY `idx_courses_unit` (`unit`),
  KEY `idx_courses_hours` (`hours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course_instructors`
--

CREATE TABLE IF NOT EXISTS `course_instructors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `instructor_id` int(10) unsigned NOT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_course_instructors_course_id` (`course_id`),
  KEY `idx_course_instructors_instructor_id` (`instructor_id`),
  KEY `idx_course_instructors_academic_session_id` (`academic_session_id`),
  KEY `idx_course_instructors_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `unit_id` int(10) unsigned DEFAULT NULL,
  `is_academic` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_departments_deleted_at` (`deleted_at`),
  KEY `idx_departments_unit_id` (`unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `code`, `unit_id`, `is_academic`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'ELECTRICAL/ELECTRONICS ENGINEERING TECHNOLOGY', 'EEE', 1, 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'COMPUTER ENGINEERING TECHNOLOGY', 'COE', 1, 1),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'COMPUTER SCIENCE', 'COM', 2, 1),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'ACCOUNTING', 'ACC', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department_course_settings`
--

CREATE TABLE IF NOT EXISTS `department_course_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `department_id` int(10) unsigned NOT NULL DEFAULT '0',
  `maximum_allowed_units` varchar(255) NOT NULL DEFAULT '45',
  `minimum_promotion_gpa` int(10) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `idx_department_course_settings_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department_fees`
--

CREATE TABLE IF NOT EXISTS `department_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fee_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_department_fees_deleted_at` (`deleted_at`),
  KEY `idx_department_fees_fee_id` (`fee_id`),
  KEY `idx_department_fees_department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `employee_no` varchar(255) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `other_names` varchar(150) DEFAULT NULL,
  `birth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hired_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `marital_status_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(10) unsigned DEFAULT NULL,
  `local_govt_area_id` int(10) unsigned NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_employees_employee_no` (`employee_no`),
  UNIQUE KEY `uix_employees_user_id` (`user_id`),
  KEY `idx_employees_phone_number` (`phone_number`),
  KEY `idx_employees_deleted_at` (`deleted_at`),
  KEY `idx_employees_first_name` (`first_name`),
  KEY `idx_employees_last_name` (`last_name`),
  KEY `idx_employees_marital_status_id` (`marital_status_id`),
  KEY `idx_employees_gender_id` (`gender_id`),
  KEY `idx_employees_local_govt_area_id` (`local_govt_area_id`),
  KEY `idx_employees_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_postings`
--

CREATE TABLE IF NOT EXISTS `employee_postings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `effective_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resumed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_employee_postings_deleted_at` (`deleted_at`),
  KEY `idx_employee_postings_posted_at` (`posted_at`),
  KEY `idx_employee_postings_effective_at` (`effective_at`),
  KEY `idx_employee_postings_resumed_at` (`resumed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `is_catchment_only` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL,
  `is_applicant` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fees_category_id` (`category_id`),
  KEY `idx_fees_deleted_at` (`deleted_at`),
  KEY `idx_fees_name` (`name`),
  KEY `idx_fees_code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `amount`, `level_id`, `department_id`, `code`, `is_catchment_only`, `category_id`, `is_applicant`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Application Fee', 5000, 1, 1, '1000', 0, 5, 1),
(2, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Application Fee', 5000, 1, 2, '1100', 0, 5, 1),
(3, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Application Fee', 5000, 1, 3, '1200', 0, 5, 1),
(4, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Application Fee', 5000, 1, 4, '1300', 0, 5, 1),
(5, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Acceptance Fee', 10000, 1, 1, '2000', 0, 6, 1),
(6, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Acceptance Fee', 10000, 1, 2, '2100', 0, 6, 1),
(7, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Acceptance Fee', 10000, 1, 3, '2200', 0, 6, 1),
(8, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND Acceptance Fee', 10000, 1, 4, '2300', 0, 6, 1),
(9, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND School Fee', 70000, 1, 1, '3100', 0, 8, 0),
(10, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND School Fee', 70000, 1, 2, '3200', 0, 8, 0),
(11, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND School Fee', 70000, 1, 3, '3300', 0, 8, 0),
(12, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ND School Fee', 65000, 1, 4, '3400', 0, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_files_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_type`, `file_path`) VALUES
(1, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 'graphql-upload-IMG-20190212-WA0002', 'image', 'http://res.cloudinary.com/beets/image/upload/v1550831707/nxpjbq1jbsrjqrnezfeu.jpg'),
(2, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 'graphql-upload-Capture1.PNG', 'image', 'http://res.cloudinary.com/beets/image/upload/v1550835495/d1v4c155yiu8pjzyfcjh.png');

-- --------------------------------------------------------

--
-- Table structure for table `grading_rules`
--

CREATE TABLE IF NOT EXISTS `grading_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `minimum_score` double NOT NULL,
  `maximum_score` double NOT NULL,
  `grade_letter` varchar(255) NOT NULL,
  `grade_point` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_grading_rules_maximum_score` (`maximum_score`),
  KEY `idx_grading_rules_grade_letter` (`grade_letter`),
  KEY `idx_grading_rules_grade_point` (`grade_point`),
  KEY `idx_grading_rules_deleted_at` (`deleted_at`),
  KEY `idx_grading_rules_minimum_score` (`minimum_score`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `grading_rules`
--

INSERT INTO `grading_rules` (`id`, `created_at`, `updated_at`, `deleted_at`, `minimum_score`, `maximum_score`, `grade_letter`, `grade_point`) VALUES
(1, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 75, 100, 'A', 4),
(2, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 70, 74, 'AB', 3.5),
(3, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 65, 69, 'B', 3.25),
(4, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 60, 64, 'BC', 3),
(5, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 55, 59, 'C', 2.75),
(6, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 50, 54, 'CD', 2.5),
(7, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 45, 49, 'D', 2.25),
(8, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 40, 44, 'E', 2),
(9, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 0, 44, 'F', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jamb_certs`
--

CREATE TABLE IF NOT EXISTS `jamb_certs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `school_first_choice` varchar(255) NOT NULL,
  `school_second_choice` varchar(255) NOT NULL,
  `course_first_choice` varchar(255) NOT NULL,
  `course_second_choice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_jamb_certs_student_id` (`student_id`),
  UNIQUE KEY `uix_jamb_certs_registration_no` (`registration_no`),
  KEY `idx_jamb_certs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jamb_certs`
--

INSERT INTO `jamb_certs` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `registration_no`, `score`, `year`, `school_first_choice`, `school_second_choice`, `course_first_choice`, `course_second_choice`) VALUES
(1, '2019-02-25 14:47:42', '2019-02-25 14:47:42', NULL, 1, '86569294BF', 207, 2000, 'University of Lagos', 'Lagos State University', 'Pharmacy', 'Dentistry and Dental Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  `program_id` int(10) unsigned NOT NULL,
  `is_entry_level` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_levels_deleted_at` (`deleted_at`),
  KEY `idx_levels_name` (`name`),
  KEY `idx_levels_program_id` (`program_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `program_id`, `is_entry_level`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'I', 1, 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'II', 1, 0),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'I', 2, 1),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'II', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `local_govt_areas`
--

CREATE TABLE IF NOT EXISTS `local_govt_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_local_govt_areas_deleted_at` (`deleted_at`),
  KEY `idx_local_govt_areas_state_id` (`state_id`),
  KEY `idx_local_govt_areas_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=769 ;

--
-- Dumping data for table `local_govt_areas`
--

INSERT INTO `local_govt_areas` (`id`, `created_at`, `updated_at`, `deleted_at`, `state_id`, `name`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'ABA NORTH'),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'ABA SOUTH'),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'AROCHUKWU'),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'BENDE'),
(5, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'IKWUANO'),
(6, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'ISIALA NGWA NORTH'),
(7, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'ISIALA NGWA SOUTH'),
(8, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'ISUIKWUATO'),
(9, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'OBI NGWA'),
(10, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'OHAFIA'),
(11, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'OSISIOMA'),
(12, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UGWUNAGBO'),
(13, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UKWA EAST'),
(14, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UKWA WEST'),
(15, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UMUAHIA NORTH'),
(16, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UMUAHIA SOUTH'),
(17, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 'UMU NNEOCHI'),
(18, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'DEMSA'),
(19, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'FUFURE'),
(20, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'GANYE'),
(21, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'GAYUK'),
(22, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'GOMBI'),
(23, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'GRIE'),
(24, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'HONG'),
(25, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'JADA'),
(26, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'LAMURDE'),
(27, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'MADAGALI'),
(28, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 'MAIHA'),
(29, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'MAYO BELWA'),
(30, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'MICHIKA'),
(31, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'MUBI NORTH'),
(32, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'MUBI SOUTH'),
(33, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'NUMAN'),
(34, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'SHELLENG'),
(35, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'SONG'),
(36, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'TOUNGO'),
(37, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'YOLA NORTH'),
(38, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 2, 'YOLA SOUTH'),
(39, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ABAK'),
(40, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'EASTERN OBOLO'),
(41, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'EKET'),
(42, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ESIT EKET'),
(43, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ESSIEN UDIM'),
(44, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ETIM EKPO'),
(45, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ETINAN'),
(46, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IBENO'),
(47, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IBESIKPO ASUTAN'),
(48, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IBIONO-IBOM'),
(49, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IKA'),
(50, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IKONO'),
(51, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IKOT ABASI'),
(52, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'IKOT EKPENE'),
(53, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'INI'),
(54, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ITU'),
(55, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'MBO'),
(56, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'MKPAT-ENIN'),
(57, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'NSIT-ATAI'),
(58, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'NSIT-IBOM'),
(59, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'NSIT-UBIUM'),
(60, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'OBOT AKARA'),
(61, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'OKOBO'),
(62, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ONNA'),
(63, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ORON'),
(64, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'ORUK ANAM'),
(65, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'UDUNG-UKO'),
(66, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'UKANAFUN'),
(67, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'URUAN'),
(68, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'URUE-OFFONG/ORUKO'),
(69, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 3, 'UYO'),
(70, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'AGUATA'),
(71, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ANAMBRA EAST'),
(72, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ANAMBRA WEST'),
(73, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ANAOCHA'),
(74, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'AWKA NORTH'),
(75, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'AWKA SOUTH'),
(76, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'AYAMELUM'),
(77, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'DUNUKOFIA'),
(78, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'EKWUSIGO'),
(79, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'IDEMILI NORTH'),
(80, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'IDEMILI SOUTH'),
(81, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'IHIALA'),
(82, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'NJIKOKA'),
(83, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'NNEWI NORTH'),
(84, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'NNEWI SOUTH'),
(85, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'OGBARU'),
(86, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ONITSHA NORTH'),
(87, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ONITSHA SOUTH'),
(88, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ORUMBA NORTH'),
(89, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'ORUMBA SOUTH'),
(90, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 4, 'OYI'),
(91, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'ALKALERI'),
(92, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'BAUCHI'),
(93, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'BOGORO'),
(94, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'DAMBAN'),
(95, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'DARAZO'),
(96, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'DASS'),
(97, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'GAMAWA'),
(98, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'GANJUWA'),
(99, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'GIADE'),
(100, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'ITAS/GADAU'),
(101, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'JAMA''ARE'),
(102, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'KATAGUM'),
(103, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'KIRFI'),
(104, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'MISAU'),
(105, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'NINGI'),
(106, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'SHIRA'),
(107, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'TAFAWA BALEWA'),
(108, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'TORO'),
(109, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'WARJI'),
(110, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 5, 'ZAKI'),
(111, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'BRASS'),
(112, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'EKEREMOR'),
(113, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'KOLOKUMA/OPOKUMA'),
(114, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'NEMBE'),
(115, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'OGBIA'),
(116, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'SAGBAMA'),
(117, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'SOUTHERN IJAW'),
(118, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 6, 'YENAGOA'),
(119, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'AGATU'),
(120, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'APA'),
(121, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'ADO'),
(122, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'BURUKU'),
(123, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'GBOKO'),
(124, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'GUMA'),
(125, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'GWER EAST'),
(126, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'GWER WEST'),
(127, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'KATSINA-ALA'),
(128, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'KONSHISHA'),
(129, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'KWANDE'),
(130, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'LOGO'),
(131, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'MAKURDI'),
(132, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 7, 'OBI'),
(133, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'OGBADIBO'),
(134, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'OHIMINI'),
(135, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'OJU'),
(136, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'OKPOKWU'),
(137, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'OTURKPO'),
(138, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'TARKA'),
(139, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'UKUM'),
(140, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'USHONGO'),
(141, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 7, 'VANDEIKYA'),
(142, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'ABADAM'),
(143, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'ASKIRA/UBA'),
(144, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'BAMA'),
(145, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'BAYO'),
(146, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'BIU'),
(147, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'CHIBOK'),
(148, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'DAMBOA'),
(149, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'DIKWA'),
(150, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'GUBIO'),
(151, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'GUZAMALA'),
(152, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'GWOZA'),
(153, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'HAWUL'),
(154, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'JERE'),
(155, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'KAGA'),
(156, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'KALA/BALGE'),
(157, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'KONDUGA'),
(158, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'KUKAWA'),
(159, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'KWAYA KUSAR'),
(160, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MAFA'),
(161, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MAGUMERI'),
(162, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MAIDUGURI'),
(163, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MARTE'),
(164, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MOBBAR'),
(165, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'MONGUNO'),
(166, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'NGALA'),
(167, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'NGANZAI'),
(168, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 8, 'SHANI'),
(169, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'ABI'),
(170, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'AKAMKPA'),
(171, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'AKPABUYO'),
(172, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'BAKASSI'),
(173, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'BEKWARRA'),
(174, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'BIASE'),
(175, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'BOKI'),
(176, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'CALABAR MUNICIPAL'),
(177, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'CALABAR SOUTH'),
(178, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'ETUNG'),
(179, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'IKOM'),
(180, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'OBANLIKU'),
(181, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'OBUBRA'),
(182, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'OBUDU'),
(183, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'ODUKPANI'),
(184, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'OGOJA'),
(185, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'YAKUUR'),
(186, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 9, 'YALA'),
(187, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ANIOCHA NORTH'),
(188, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ANIOCHA SOUTH'),
(189, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'BOMADI'),
(190, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'BURUTU'),
(191, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ETHIOPE EAST'),
(192, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ETHIOPE WEST'),
(193, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'IKA NORTH EAST'),
(194, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'IKA SOUTH'),
(195, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ISOKO NORTH'),
(196, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'ISOKO SOUTH'),
(197, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'NDOKWA EAST'),
(198, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'NDOKWA WEST'),
(199, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'OKPE'),
(200, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'OSHIMILI NORTH'),
(201, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'OSHIMILI SOUTH'),
(202, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'PATANI'),
(203, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'SAPELE'),
(204, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'UDU'),
(205, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'UGHELLI NORTH'),
(206, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'UGHELLI SOUTH'),
(207, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'UKWUANI'),
(208, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'UVWIE'),
(209, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'WARRI NORTH'),
(210, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'WARRI SOUTH'),
(211, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 10, 'WARRI SOUTH WEST'),
(212, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'ABAKALIKI'),
(213, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'AFIKPO NORTH'),
(214, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'AFIKPO SOUTH'),
(215, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'EBONYI'),
(216, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'EZZA NORTH'),
(217, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'EZZA SOUTH'),
(218, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'IKWO'),
(219, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'ISHIELU'),
(220, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'IVO'),
(221, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'IZZI'),
(222, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'OHAOZARA'),
(223, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'OHAUKWU'),
(224, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 11, 'ONICHA'),
(225, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'AKOKO-EDO'),
(226, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'EGOR'),
(227, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ESAN CENTRAL'),
(228, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ESAN NORTH-EAST'),
(229, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ESAN SOUTH-EAST'),
(230, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ESAN WEST'),
(231, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ETSAKO CENTRAL'),
(232, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ETSAKO EAST'),
(233, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'ETSAKO WEST'),
(234, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'IGUEBEN'),
(235, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 12, 'IKPOBA OKHA'),
(236, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'ORHIONMWON'),
(237, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'OREDO'),
(238, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'OVIA NORTH-EAST'),
(239, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'OVIA SOUTH-WEST'),
(240, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'OWAN EAST'),
(241, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'OWAN WEST'),
(242, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 12, 'UHUNMWONDE'),
(243, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'ADO EKITI'),
(244, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'EFON'),
(245, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'EKITI EAST'),
(246, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'EKITI SOUTH-WEST'),
(247, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'EKITI WEST'),
(248, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'EMURE'),
(249, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'GBONYIN'),
(250, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'IDO OSI'),
(251, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'IJERO'),
(252, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'IKERE'),
(253, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'IKOLE'),
(254, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'ILEJEMEJE'),
(255, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'IREPODUN/IFELODUN'),
(256, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'ISE/ORUN'),
(257, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'MOBA'),
(258, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 13, 'OYE'),
(259, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'ANINRI'),
(260, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'AWGU'),
(261, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'ENUGU EAST'),
(262, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'ENUGU NORTH'),
(263, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'ENUGU SOUTH'),
(264, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'EZEAGU'),
(265, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'IGBO ETITI'),
(266, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'IGBO EZE NORTH'),
(267, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'IGBO EZE SOUTH'),
(268, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'ISI UZO'),
(269, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'NKANU EAST'),
(270, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'NKANU WEST'),
(271, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'NSUKKA'),
(272, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'OJI RIVER'),
(273, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'UDENU'),
(274, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'UDI'),
(275, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 14, 'UZO UWANI'),
(276, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'ABAJI'),
(277, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'BWARI'),
(278, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'GWAGWALADA'),
(279, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'KUJE'),
(280, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'KWALI'),
(281, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 15, 'MUNICIPAL AREA COUNCIL'),
(282, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'AKKO'),
(283, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'BALANGA'),
(284, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'BILLIRI'),
(285, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'DUKKU'),
(286, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'FUNAKAYE'),
(287, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'GOMBE'),
(288, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'KALTUNGO'),
(289, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'KWAMI'),
(290, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'NAFADA'),
(291, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'SHONGOM'),
(292, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 16, 'YAMALTU/DEBA'),
(293, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ABOH MBAISE'),
(294, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'AHIAZU MBAISE'),
(295, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'EHIME MBANO'),
(296, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'EZINIHITTE'),
(297, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'IDEATO NORTH'),
(298, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'IDEATO SOUTH'),
(299, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'IHITTE/UBOMA'),
(300, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'IKEDURU'),
(301, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ISIALA MBANO'),
(302, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ISU'),
(303, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'MBAITOLI'),
(304, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'NGOR OKPALA'),
(305, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'NJABA'),
(306, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'NKWERRE'),
(307, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'NWANGELE'),
(308, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OBOWO'),
(309, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OGUTA'),
(310, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OHAJI/EGBEMA'),
(311, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OKIGWE'),
(312, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ORLU'),
(313, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ORSU'),
(314, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ORU EAST'),
(315, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'ORU WEST'),
(316, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OWERRI MUNICIPAL'),
(317, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OWERRI NORTH'),
(318, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'OWERRI WEST'),
(319, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 17, 'UNUIMO'),
(320, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'AUYO'),
(321, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'BABURA'),
(322, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'BIRINIWA'),
(323, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'BIRNIN KUDU'),
(324, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'BUJI'),
(325, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'DUTSE'),
(326, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GAGARAWA'),
(327, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GARKI'),
(328, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GUMEL'),
(329, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GURI'),
(330, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GWARAM'),
(331, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'GWIWA'),
(332, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'HADEJIA'),
(333, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'JAHUN'),
(334, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'KAFIN HAUSA'),
(335, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'KAZAURE'),
(336, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'KIRI KASAMA'),
(337, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 18, 'KIYAWA'),
(338, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'KAUGAMA'),
(339, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'MAIGATARI'),
(340, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'MALAM MADORI'),
(341, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'MIGA'),
(342, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'RINGIM'),
(343, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'RONI'),
(344, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'SULE TANKARKAR'),
(345, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'TAURA'),
(346, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 18, 'YANKWASHI'),
(347, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'BIRNIN GWARI'),
(348, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'CHIKUN'),
(349, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'GIWA'),
(350, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'IGABI'),
(351, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'IKARA'),
(352, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'JABA'),
(353, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'JEMA''A'),
(354, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KACHIA'),
(355, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KADUNA NORTH'),
(356, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KADUNA SOUTH'),
(357, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KAGARKO'),
(358, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KAJURU'),
(359, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KAURA'),
(360, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KAURU'),
(361, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KUBAU'),
(362, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'KUDAN'),
(363, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'LERE'),
(364, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'MAKARFI'),
(365, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'SABON GARI'),
(366, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'SANGA'),
(367, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'SOBA'),
(368, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'ZANGON KATAF'),
(369, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 19, 'ZARIA'),
(370, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'AJINGI'),
(371, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'ALBASU'),
(372, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'BAGWAI'),
(373, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'BEBEJI'),
(374, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'BICHI'),
(375, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'BUNKURE'),
(376, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'DALA'),
(377, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'DAMBATTA'),
(378, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'DAWAKIN KUDU'),
(379, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'DAWAKIN TOFA'),
(380, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'DOGUWA'),
(381, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'FAGGE'),
(382, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GABASAWA'),
(383, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GARKO'),
(384, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GARUN MALLAM'),
(385, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GAYA'),
(386, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GEZAWA'),
(387, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GWALE'),
(388, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'GWARZO'),
(389, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KABO'),
(390, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KANO MUNICIPAL'),
(391, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KARAYE'),
(392, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KIBIYA'),
(393, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KIRU'),
(394, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KUMBOTSO'),
(395, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KUNCHI'),
(396, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'KURA'),
(397, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'MADOBI'),
(398, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'MAKODA'),
(399, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'MINJIBIR'),
(400, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'NASARAWA'),
(401, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'RANO'),
(402, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'RIMIN GADO'),
(403, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'ROGO'),
(404, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'SHANONO'),
(405, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'SUMAILA'),
(406, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'TAKAI'),
(407, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'TARAUNI'),
(408, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'TOFA'),
(409, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'TSANYAWA'),
(410, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'TUDUN WADA'),
(411, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'UNGOGO'),
(412, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'WARAWA'),
(413, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 20, 'WUDIL'),
(414, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'BAKORI'),
(415, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'BATAGARAWA'),
(416, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'BATSARI'),
(417, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'BAURE'),
(418, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'BINDAWA'),
(419, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'CHARANCHI'),
(420, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DANDUME'),
(421, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DANJA'),
(422, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DAN MUSA'),
(423, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DAURA'),
(424, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DUTSI'),
(425, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'DUTSIN MA'),
(426, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'FASKARI'),
(427, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'FUNTUA'),
(428, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'INGAWA'),
(429, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'JIBIA'),
(430, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KAFUR'),
(431, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KAITA'),
(432, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KANKARA'),
(433, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KANKIA'),
(434, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KATSINA'),
(435, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KURFI'),
(436, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 21, 'KUSADA'),
(437, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MAI''ADUA'),
(438, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MALUMFASHI'),
(439, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MANI'),
(440, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MASHI'),
(441, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MATAZU'),
(442, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'MUSAWA'),
(443, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'RIMI'),
(444, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'SABUWA'),
(445, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'SAFANA'),
(446, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'SANDAMU'),
(447, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 21, 'ZANGO'),
(448, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'ALEIRO'),
(449, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'AREWA DANDI'),
(450, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'ARGUNGU'),
(451, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'AUGIE'),
(452, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'BAGUDO'),
(453, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'BIRNIN KEBBI'),
(454, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'BUNZA'),
(455, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'DANDI'),
(456, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'FAKAI'),
(457, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'GWANDU'),
(458, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'JEGA'),
(459, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'KALGO'),
(460, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'KOKO/BESSE'),
(461, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'MAIYAMA'),
(462, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'NGASKI'),
(463, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'SAKABA'),
(464, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'SHANGA'),
(465, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'SURU'),
(466, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'WASAGU/DANKO'),
(467, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'YAURI'),
(468, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 22, 'ZURU'),
(469, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'ADAVI'),
(470, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'AJAOKUTA'),
(471, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'ANKPA'),
(472, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'BASSA'),
(473, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'DEKINA'),
(474, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'IBAJI'),
(475, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'IDAH'),
(476, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'IGALAMELA ODOLU'),
(477, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'IJUMU'),
(478, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'KABBA/BUNU'),
(479, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'KOGI'),
(480, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'LOKOJA'),
(481, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'MOPA MURO'),
(482, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OFU'),
(483, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OGORI/MAGONGO'),
(484, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OKEHI'),
(485, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OKENE'),
(486, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OLAMABORO'),
(487, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'OMALA'),
(488, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'YAGBA EAST'),
(489, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 23, 'YAGBA WEST'),
(490, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'ASA'),
(491, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'BARUTEN'),
(492, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'EDU'),
(493, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'EKITI'),
(494, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'IFELODUN'),
(495, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'ILORIN EAST'),
(496, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'ILORIN SOUTH'),
(497, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'ILORIN WEST'),
(498, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'IREPODUN'),
(499, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'ISIN'),
(500, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'KAIAMA'),
(501, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'MORO'),
(502, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'OFFA'),
(503, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'OKE ERO'),
(504, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'OYUN'),
(505, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 24, 'PATEGI'),
(506, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'AGEGE'),
(507, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'AJEROMI-IFELODUN'),
(508, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'ALIMOSHO'),
(509, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'AMUWO-ODOFIN'),
(510, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'APAPA'),
(511, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'BADAGRY'),
(512, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'EPE'),
(513, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'ETI OSA'),
(514, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'IBEJU-LEKKI'),
(515, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'IFAKO-IJAIYE'),
(516, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'IKEJA'),
(517, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'IKORODU'),
(518, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'KOSOFE'),
(519, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'LAGOS ISLAND'),
(520, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'LAGOS MAINLAND'),
(521, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'MUSHIN'),
(522, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'OJO'),
(523, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'OSHODI-ISOLO'),
(524, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'SHOMOLU'),
(525, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 25, 'SURULERE'),
(526, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'AKWANGA'),
(527, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'AWE'),
(528, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'DOMA'),
(529, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'KARU'),
(530, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'KEANA'),
(531, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 26, 'KEFFI'),
(532, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 26, 'KOKONA'),
(533, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 26, 'LAFIA'),
(534, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 26, 'NASARAWA EGON'),
(535, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 26, 'TOTO'),
(536, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 26, 'WAMBA'),
(537, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'AGAIE'),
(538, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'AGWARA'),
(539, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'BIDA'),
(540, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'BORGU'),
(541, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'BOSSO'),
(542, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'CHANCHAGA'),
(543, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'EDATI'),
(544, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'GBAKO'),
(545, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'GURARA'),
(546, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'KATCHA'),
(547, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'KONTAGORA'),
(548, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'LAPAI'),
(549, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'LAVUN'),
(550, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'MAGAMA'),
(551, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'MARIGA'),
(552, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'MASHEGU'),
(553, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'MOKWA'),
(554, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'MOYA'),
(555, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'PAIKORO'),
(556, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'RAFI'),
(557, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'RIJAU'),
(558, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'SHIRORO'),
(559, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'SULEJA'),
(560, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'TAFA'),
(561, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 27, 'WUSHISHI'),
(562, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'ABEOKUTA NORTH'),
(563, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'ABEOKUTA SOUTH'),
(564, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'ADO-ODO/OTA'),
(565, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'EGBADO NORTH'),
(566, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'EGBADO SOUTH'),
(567, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'EWEKORO'),
(568, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IFO'),
(569, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IJEBU EAST'),
(570, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IJEBU NORTH'),
(571, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IJEBU NORTH EAST'),
(572, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IJEBU ODE'),
(573, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IKENNE'),
(574, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IMEKO AFON'),
(575, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'IPOKIA'),
(576, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'OBAFEMI OWODE'),
(577, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'ODEDA'),
(578, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'ODOGBOLU'),
(579, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'OGUN WATERSIDE'),
(580, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'REMO NORTH'),
(581, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 28, 'SHAGAMU'),
(582, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKOKO NORTH-EAST'),
(583, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKOKO NORTH-WEST'),
(584, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKOKO SOUTH-WEST'),
(585, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKOKO SOUTH-EAST'),
(586, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKURE NORTH'),
(587, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'AKURE SOUTH'),
(588, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ESE ODO'),
(589, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'IDANRE'),
(590, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'IFEDORE'),
(591, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ILAJE'),
(592, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ILE OLUJI/OKEIGBO'),
(593, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'IRELE'),
(594, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ODIGBO'),
(595, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'OKITIPUPA'),
(596, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ONDO EAST'),
(597, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'ONDO WEST'),
(598, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'OSE'),
(599, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 29, 'OWO'),
(600, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ATAKUNMOSA EAST'),
(601, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ATAKUNMOSA WEST'),
(602, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'AIYEDAADE'),
(603, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'AIYEDIRE'),
(604, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'BOLUWADURO'),
(605, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'BORIPE'),
(606, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'EDE NORTH'),
(607, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'EDE SOUTH'),
(608, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IFE CENTRAL'),
(609, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IFE EAST'),
(610, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IFE NORTH'),
(611, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IFE SOUTH'),
(612, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'EGBEDORE'),
(613, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'EJIGBO'),
(614, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IFEDAYO'),
(615, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ILA'),
(616, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ILESA EAST'),
(617, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ILESA WEST'),
(618, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IREWOLE'),
(619, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ISOKAN'),
(620, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'IWO'),
(621, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'OBOKUN'),
(622, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 30, 'ODO OTIN'),
(623, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 30, 'OLA OLUWA'),
(624, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 30, 'OLORUNDA'),
(625, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 30, 'ORIADE'),
(626, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 30, 'OROLU'),
(627, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 30, 'OSOGBO'),
(628, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'AFIJIO'),
(629, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'AKINYELE'),
(630, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ATIBA'),
(631, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ATISBO'),
(632, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'EGBEDA'),
(633, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBADAN NORTH'),
(634, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBADAN NORTH-EAST'),
(635, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBADAN NORTH-WEST'),
(636, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBADAN SOUTH-EAST'),
(637, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBADAN SOUTH-WEST'),
(638, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBARAPA CENTRAL'),
(639, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBARAPA EAST'),
(640, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IBARAPA NORTH'),
(641, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IDO'),
(642, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IREPO'),
(643, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ISEYIN'),
(644, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ITESIWAJU'),
(645, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'IWAJOWA'),
(646, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'KAJOLA'),
(647, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'LAGELU'),
(648, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OGBOMOSHO NORTH'),
(649, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OGBOMOSHO SOUTH'),
(650, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OGO OLUWA'),
(651, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OLORUNSOGO'),
(652, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OLUYOLE'),
(653, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ONA ARA'),
(654, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ORELOPE'),
(655, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'ORI IRE'),
(656, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OYO'),
(657, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'OYO EAST'),
(658, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'SAKI EAST'),
(659, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 31, 'SAKI WEST'),
(660, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'BOKKOS'),
(661, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'BARKIN LADI'),
(662, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'JOS EAST'),
(663, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'JOS NORTH'),
(664, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'JOS SOUTH'),
(665, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'KANAM'),
(666, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'KANKE'),
(667, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'LANGTANG SOUTH'),
(668, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'LANGTANG NORTH'),
(669, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'MANGU'),
(670, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'MIKANG'),
(671, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'PANKSHIN'),
(672, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'QUA''AN PAN'),
(673, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'RIYOM'),
(674, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'SHENDAM'),
(675, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 32, 'WASE'),
(676, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'ABUA/ODUAL'),
(677, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'AHOADA EAST'),
(678, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'AHOADA WEST'),
(679, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'AKUKU-TORU'),
(680, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'ANDONI'),
(681, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'ASARI-TORU'),
(682, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'BONNY'),
(683, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'DEGEMA'),
(684, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'ELEME'),
(685, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'EMUOHA'),
(686, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'ETCHE'),
(687, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'GOKANA'),
(688, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'IKWERRE'),
(689, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'KHANA'),
(690, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OBIO/AKPOR');
INSERT INTO `local_govt_areas` (`id`, `created_at`, `updated_at`, `deleted_at`, `state_id`, `name`) VALUES
(691, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OGBA/EGBEMA/NDONI'),
(692, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OGU/BOLO'),
(693, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OKRIKA'),
(694, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OMUMA'),
(695, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OPOBO/NKORO'),
(696, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'OYIGBO'),
(697, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'PORT HARCOURT'),
(698, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 33, 'TAI'),
(699, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'BINJI'),
(700, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'BODINGA'),
(701, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'DANGE SHUNI'),
(702, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'GADA'),
(703, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'GORONYO'),
(704, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'GUDU'),
(705, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'GWADABAWA'),
(706, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'ILLELA'),
(707, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'ISA'),
(708, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'KEBBE'),
(709, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'KWARE'),
(710, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'RABAH'),
(711, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'SABON BIRNI'),
(712, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'SHAGARI'),
(713, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'SILAME'),
(714, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'SOKOTO NORTH'),
(715, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'SOKOTO SOUTH'),
(716, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'TAMBUWAL'),
(717, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'TANGAZA'),
(718, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 34, 'TURETA'),
(719, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 34, 'WAMAKO'),
(720, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 34, 'WURNO'),
(721, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 34, 'YABO'),
(722, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'ARDO KOLA'),
(723, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'BALI'),
(724, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'DONGA'),
(725, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'GASHAKA'),
(726, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'GASSOL'),
(727, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'IBI'),
(728, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'JALINGO'),
(729, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'KARIM LAMIDO'),
(730, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'KUMI'),
(731, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'LAU'),
(732, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'SARDAUNA'),
(733, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'TAKUM'),
(734, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'USSA'),
(735, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'WUKARI'),
(736, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'YORRO'),
(737, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 35, 'ZING'),
(738, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'BADE'),
(739, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'BURSARI'),
(740, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'DAMATURU'),
(741, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'FIKA'),
(742, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'FUNE'),
(743, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'GEIDAM'),
(744, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'GUJBA'),
(745, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'GULANI'),
(746, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'JAKUSKO'),
(747, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'KARASUWA'),
(748, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'MACHINA'),
(749, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'NANGERE'),
(750, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'NGURU'),
(751, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'POTISKUM'),
(752, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'TARMUWA'),
(753, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'YUNUSARI'),
(754, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 36, 'YUSUFARI'),
(755, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'ANKA'),
(756, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'BAKURA'),
(757, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'BIRNIN MAGAJI/KIYAW'),
(758, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'BUKKUYUM'),
(759, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'BUNGUDU'),
(760, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'GUMMI'),
(761, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'GUSAU'),
(762, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'KAURA NAMODA'),
(763, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'MARADUN'),
(764, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'MARU'),
(765, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'SHINKAFI'),
(766, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'TALATA MAFARA'),
(767, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'CHAFE'),
(768, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 37, 'ZURMI');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `is_exact` tinyint(1) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `component` varchar(255) NOT NULL,
  `is_sidebar_menu` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_menus_code` (`code`),
  KEY `idx_menus_deleted_at` (`deleted_at`),
  KEY `idx_menus_path` (`path`),
  KEY `idx_menus_position` (`position`),
  KEY `idx_menus_component` (`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `code`, `sub_title`, `path`, `is_exact`, `icon`, `position`, `component`, `is_sidebar_menu`) VALUES
(1, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Profile', 'student:profile', NULL, '/c_ns', 0, 'user', 1, 'StudentProfile', 0),
(2, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Profile home', 'student:profile:default', NULL, '/c_ns', 1, NULL, 1, 'StudentProfileDefault', 0),
(3, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Update profile', 'student:profile:update', NULL, '/c_ns/:studentID', 1, NULL, 2, 'StudentProfileUpdate', 0),
(4, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Certificate', 'student:certificate', NULL, '/c_ns/certificates', 0, 'certificate', 2, 'StudentCertificate', 0),
(5, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Certificate', 'student:certificate:default', NULL, '/c_ns/certificates', 1, 'home', 1, 'StudentCertificateDefault', 0),
(6, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Post Primary School', 'student:certificate:post_primary_cert', NULL, '/c_ns/certificates/post-primary', 0, 'note', 2, 'StudentPostPrimaryCert', 1),
(7, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'PostPrimarySchoolCertificateHome', 'student:certificate:post_primary_cert:default', NULL, '/c_ns/certificates/post-primary', 1, NULL, 1, 'StudentPostPrimaryCertDefault', 0),
(8, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Student post primary certificate new', 'student:certificate:post_primary_cert:create', NULL, '/c_ns/certificates/post-primary/create', 1, NULL, 2, 'StudentPostPrimaryCertCreate', 0),
(9, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 'Student post primary certificate update', 'student:certificate:post_primary_cert:update', NULL, '/c_ns/certificates/post-primary/:id/edit', 1, NULL, 3, 'StudentPostPrimaryCertUpdate', 0),
(10, '2019-02-20 14:10:39', '2019-02-20 14:10:40', NULL, 'Jamb Examination', 'student:certificate:jamb_cert', NULL, '/c_ns/certificates/jamb', 1, 'crop_din', 3, 'StudentJambCert', 1),
(11, '2019-02-20 14:10:39', '2019-02-20 14:10:40', NULL, 'Tertiary School', 'student:certificate:tertiary_cert', NULL, '/c_ns/certificates/tertiary', 1, 'filter_6', 4, 'StudentTertiaryCert', 1),
(12, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payment', 'student:payment', NULL, '/c_ns/payments', 0, 'suitcase-rolling', 3, 'StudentPayment', 0),
(13, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payment', 'student:payment:default', NULL, '/c_ns/payments', 1, NULL, 1, 'StudentPaymentDefault', 0),
(14, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payment', 'student:payment:create', NULL, '/c_ns/payments/new', 0, NULL, 1, 'StudentPaymentCreate', 0),
(15, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payment', 'student:payment:summary', NULL, '/c_ns/payments/summary', 0, NULL, 1, 'StudentPaymentSummary', 0),
(16, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payment', 'student:payment:response', NULL, '/c_ns/payments/:transactionRef/response', 0, NULL, 1, 'StudentPaymentResponse', 0),
(17, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Admission Letter', 'student:admission', NULL, '/c_ns/admission-letter/', 0, 'envelope', 4, 'StudentAdmissionLetter', 0),
(18, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'View admission letter', 'student:admission:default', NULL, '/c_ns/admission-letter', 1, NULL, 1, 'StudentAdmissionLetterDefault', 0),
(19, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Profile', 'control:profile', NULL, '/c_ns', 1, 'user', 1, 'ControlProfile', 0),
(20, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Student', 'control:student', NULL, '/c_ns/students', 0, 'users', 2, 'ControlStudent', 0),
(21, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Students', 'control:student:default', NULL, '/c_ns/students', 1, 'home', 1, 'ControlStudentDefault', 0),
(22, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'New student', 'control:student:create', NULL, '/c_ns/students/create', 1, 'home', 2, 'ControlStudentCreate', 0),
(23, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Profile', 'control:student:detail', NULL, '/c_ns/students/:studentID', 1, 'home', 3, 'ControlStudentDetail', 0),
(24, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Certificates', 'control:student:detail:certificate:default', NULL, '/c_ns/students/:studentID/certificates', 1, 'home', 4, 'ControlStudentDetailCertificateDefault', 0),
(25, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payments', 'control:student:detail:payment:default', NULL, '/c_ns/students/:studentID/payments', 1, 'home', 5, 'ControlStudentDetailPaymentDefault', 0),
(26, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Payments', 'control:payment', NULL, '/c_ns/payments', 0, 'suitcase-rolling', 3, 'ControlPayment', 0),
(27, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Units', 'control:unit', NULL, '/c_ns/units', 0, 'gopuram', 4, 'ControlUnit', 0),
(28, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Units', 'control:unit:default', NULL, '/c_ns/units', 1, 'home', 1, 'ControlUnitDefault', 0),
(29, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'New Unit', 'control:unit:create', NULL, '/c_ns/units/create', 1, 'home', 2, 'ControlUnitCreate', 0),
(30, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Update Unit', 'control:unit:update', NULL, '/c_ns/units/:unitID/update', 1, 'home', 2, 'ControlUnitUpdate', 0),
(31, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Delete Unit', 'control:unit:delete', NULL, '/c_ns/units/:unitID/delete', 1, 'home', 3, 'ControlUnitDelete', 0),
(32, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Departments', 'control:department', NULL, '/c_ns/departments', 0, 'building', 5, 'ControlDepartment', 0),
(33, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Departments', 'control:department:default', NULL, '/c_ns/departments', 1, 'home', 1, 'ControlDepartmentDefault', 0),
(34, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'New Department', 'control:department:create', NULL, '/c_ns/departments/create', 1, 'home', 2, 'ControlDepartmentCreate', 0),
(35, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Update Department', 'control:department:update', NULL, '/c_ns/departments/:departmentID/update', 1, 'home', 2, 'ControlDepartmentUpdate', 0),
(36, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Delete Department', 'control:department:delete', NULL, '/c_ns/departments/:departmentID/delete', 1, 'home', 3, 'ControlDepartmentDelete', 0),
(37, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Programs', 'control:program', NULL, '/c_ns/programs', 0, 'product-hunt', 6, 'ControlProgram', 0),
(38, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Programs', 'control:program:default', NULL, '/c_ns/programs', 1, 'home', 1, 'ControlProgramDefault', 0),
(39, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'New Program', 'control:program:create', NULL, '/c_ns/programs/create', 1, 'home', 2, 'ControlProgramCreate', 0),
(40, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Update Program', 'control:program:update', NULL, '/c_ns/programs/:programID/update', 1, 'home', 2, 'ControlProgramUpdate', 0),
(41, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Delete Program', 'control:program:delete', NULL, '/c_ns/programs/:programID/delete', 1, 'home', 3, 'ControlProgramDelete', 0),
(42, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Courses', 'control:course', NULL, '/c_ns/courses', 0, 'book-reader', 7, 'ControlCourse', 0),
(43, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Course List', 'control:course:default', NULL, '/c_ns/courses', 1, 'home', 1, 'ControlCourseDefault', 0),
(44, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'New Course', 'control:course:create', NULL, '/c_ns/courses/create', 1, 'home', 2, 'ControlCourseCreate', 0),
(45, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Update Course', 'control:course:update', NULL, '/c_ns/courses/:courseID/update', 1, 'home', 2, 'ControlCourseUpdate', 0),
(46, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Delete Course', 'control:course:delete', NULL, '/c_ns/courses/:courseID/delete', 1, 'home', 3, 'ControlCourseDelete', 0),
(47, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'View Course', 'control:course:show', NULL, '/c_ns/courses/:courseID', 1, 'home', 4, 'ControlCourseDetail', 0),
(48, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'View Course Instructor', 'control:course:course_instructor:default', NULL, '/c_ns/courses/:courseID/instructors', 1, 'home', 5, 'ControlCourseCourseInstuctorList', 0),
(49, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'View Course Instructor', 'control:course:course_instructor:create', NULL, '/c_ns/courses/:courseID/instructors/create', 1, 'home', 5, 'ControlCourseCourseInstuctorCreate', 0),
(50, '2019-02-20 14:10:40', '2019-02-20 14:10:40', NULL, 'Course Instructors', 'control:course_instructor', NULL, '/c_ns/course-instructors', 0, 'home', 8, 'ControlCourseInstructor', 0),
(51, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Fees', 'control:fee', NULL, '/c_ns/fees', 0, 'clipboard-list', 9, 'ControlFee', 0),
(52, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Fee List', 'control:fee:default', NULL, '/c_ns/fees', 1, 'home', 1, 'ControlFeeDefault', 0),
(53, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'New Fee', 'control:fee:create', NULL, '/c_ns/fees/create', 1, 'home', 2, 'ControlFeeCreate', 0),
(54, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Update Fee', 'control:fee:update', NULL, '/c_ns/fees/:feeID/update', 1, 'home', 2, 'ControlFeeUpdate', 0),
(55, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Delete Fee', 'control:fee:delete', NULL, '/c_ns/fees/:feeID/delete', 1, 'home', 3, 'ControlFeeDelete', 0),
(56, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Academic Sessions', 'control:academic_session', NULL, '/c_ns/academic-sessions', 0, 'home', 10, 'ControlAcademicSession', 0),
(57, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Academic Session List', 'control:academic_session:default', NULL, '/c_ns/academic-sessions', 1, 'home', 1, 'ControlAcademicSessionDefault', 0),
(58, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'New Academic Session', 'control:academic_session:create', NULL, '/c_ns/academic-sessions/create', 1, 'home', 2, 'ControlAcademicSessionCreate', 0),
(59, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Update Academic Session', 'control:academic_session:update', NULL, '/c_ns/academic-sessions/:academicSessionID/update', 1, 'home', 3, 'ControlAcademicSessionUpdate', 0),
(60, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Delete Academic Session', 'control:academic_session:delete', NULL, '/c_ns/academic-sessions/:academicSessionID/delete', 1, 'home', 4, 'ControlAcademicSessionDelete', 0),
(61, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Users', 'control:user', NULL, '/c_ns/users', 0, 'user-alt', 11, 'ControlUser', 0),
(62, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'User List', 'control:user:default', NULL, '/c_ns/users', 1, 'home', 1, 'ControlUserDefault', 0),
(63, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'New User', 'control:user:create', NULL, '/c_ns/users/create', 1, 'home', 2, 'ControlUserCreate', 0),
(64, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Update User', 'control:user:update', NULL, '/c_ns/users/:userID/update', 1, 'home', 3, 'ControlUserUpdate', 0),
(65, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Delete User', 'control:user:delete', NULL, '/c_ns/users/:userID/delete', 1, 'home', 4, 'ControlUserDelete', 0),
(66, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'View User Detail', 'control:user:show', NULL, '/c_ns/users/:userID', 1, 'home', 5, 'ControlUserDetail', 0),
(67, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'View and Manage User Permissions', 'control:user:permission:default', NULL, '/c_ns/users/:userID/permissions', 1, 'home', 6, 'ControlUserPermissionDefault', 0),
(68, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'View and Manage User Roles', 'control:user:role:default', NULL, '/c_ns/users/:userID/roles', 1, 'home', 7, 'ControlUserRoleList', 0),
(69, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Terms', 'control:term', NULL, '/c_ns/terms', 0, 'cog', 12, 'ControlTerm', 0),
(70, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'User List', 'control:term:default', NULL, '/c_ns/terms', 1, 'home', 1, 'ControlTermDefault', 0),
(71, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'New Term', 'control:term:create', NULL, '/c_ns/terms/create', 1, 'home', 2, 'ControlTermCreate', 0),
(72, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Update Term', 'control:term:update', NULL, '/c_ns/terms/:termID/update', 1, 'home', 3, 'ControlTermUpdate', 0),
(73, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 'Delete Term', 'control:term:delete', NULL, '/c_ns/terms/:termID/delete', 1, 'home', 4, 'ControlTermDelete', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_childrens`
--

CREATE TABLE IF NOT EXISTS `menu_childrens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_menu_id` int(10) unsigned DEFAULT NULL,
  `child_menu_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_menu_childrens_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `menu_childrens`
--

INSERT INTO `menu_childrens` (`id`, `created_at`, `updated_at`, `deleted_at`, `parent_menu_id`, `child_menu_id`) VALUES
(1, NULL, NULL, NULL, 1, 2),
(2, NULL, NULL, NULL, 1, 3),
(3, NULL, NULL, NULL, 4, 5),
(4, NULL, NULL, NULL, 6, 7),
(5, NULL, NULL, NULL, 6, 8),
(6, NULL, NULL, NULL, 6, 9),
(7, NULL, NULL, NULL, 4, 6),
(8, NULL, NULL, NULL, 4, 10),
(9, NULL, NULL, NULL, 4, 11),
(10, NULL, NULL, NULL, 12, 13),
(11, NULL, NULL, NULL, 12, 14),
(12, NULL, NULL, NULL, 12, 15),
(13, NULL, NULL, NULL, 12, 16),
(14, NULL, NULL, NULL, 17, 18),
(15, NULL, NULL, NULL, 20, 21),
(16, NULL, NULL, NULL, 20, 22),
(17, NULL, NULL, NULL, 20, 23),
(18, NULL, NULL, NULL, 20, 24),
(19, NULL, NULL, NULL, 20, 25),
(20, NULL, NULL, NULL, 27, 28),
(21, NULL, NULL, NULL, 27, 29),
(22, NULL, NULL, NULL, 27, 30),
(23, NULL, NULL, NULL, 27, 31),
(24, NULL, NULL, NULL, 32, 33),
(25, NULL, NULL, NULL, 32, 34),
(26, NULL, NULL, NULL, 32, 35),
(27, NULL, NULL, NULL, 32, 36),
(28, NULL, NULL, NULL, 37, 38),
(29, NULL, NULL, NULL, 37, 39),
(30, NULL, NULL, NULL, 37, 40),
(31, NULL, NULL, NULL, 37, 41),
(32, NULL, NULL, NULL, 42, 43),
(33, NULL, NULL, NULL, 42, 44),
(34, NULL, NULL, NULL, 42, 45),
(35, NULL, NULL, NULL, 42, 46),
(36, NULL, NULL, NULL, 42, 47),
(37, NULL, NULL, NULL, 42, 48),
(38, NULL, NULL, NULL, 42, 49),
(39, NULL, NULL, NULL, 51, 52),
(40, NULL, NULL, NULL, 51, 53),
(41, NULL, NULL, NULL, 51, 54),
(42, NULL, NULL, NULL, 51, 55),
(43, NULL, NULL, NULL, 56, 57),
(44, NULL, NULL, NULL, 56, 58),
(45, NULL, NULL, NULL, 56, 59),
(46, NULL, NULL, NULL, 56, 60),
(47, NULL, NULL, NULL, 61, 62),
(48, NULL, NULL, NULL, 61, 63),
(49, NULL, NULL, NULL, 61, 64),
(50, NULL, NULL, NULL, 61, 65),
(51, NULL, NULL, NULL, 61, 66),
(52, NULL, NULL, NULL, 61, 67),
(53, NULL, NULL, NULL, 61, 68),
(54, NULL, NULL, NULL, 69, 70),
(55, NULL, NULL, NULL, 69, 71),
(56, NULL, NULL, NULL, 69, 72),
(57, NULL, NULL, NULL, 69, 73);

-- --------------------------------------------------------

--
-- Table structure for table `menu_permissions`
--

CREATE TABLE IF NOT EXISTS `menu_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_menu_permissions_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `menu_permissions`
--

INSERT INTO `menu_permissions` (`id`, `created_at`, `updated_at`, `deleted_at`, `menu_id`, `permission_id`) VALUES
(1, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 1, 1),
(2, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 2, 2),
(3, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 3, 3),
(4, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 4, 9),
(5, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 5, 10),
(6, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 6, 11),
(7, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 7, 11),
(8, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 8, 12),
(9, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 9, 13),
(10, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 10, 19),
(11, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 11, 24),
(12, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 12, 4),
(13, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 13, 5),
(14, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 14, 6),
(15, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 15, 7),
(16, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 16, 8),
(17, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 17, 27),
(18, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 18, 28),
(19, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 19, 36),
(20, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 20, 47),
(21, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 21, 48),
(22, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 22, 52),
(23, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 23, 49),
(24, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 24, 50),
(25, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 25, 51),
(26, '2019-02-20 14:10:41', '2019-02-20 14:10:41', NULL, 26, 53),
(27, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 27, 54),
(28, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 28, 55),
(29, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 29, 56),
(30, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 30, 57),
(31, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 31, 58),
(32, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 32, 59),
(33, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 33, 60),
(34, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 34, 61),
(35, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 35, 62),
(36, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 36, 63),
(37, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 37, 64),
(38, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 38, 65),
(39, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 39, 66),
(40, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 40, 67),
(41, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 41, 68),
(42, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 42, 69),
(43, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 43, 70),
(44, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 44, 71),
(45, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 45, 72),
(46, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 46, 73),
(47, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 47, 74),
(48, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 48, 75),
(49, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 49, 76),
(50, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 50, 77),
(51, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 51, 42),
(52, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 52, 43),
(53, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 53, 44),
(54, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 54, 45),
(55, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 55, 46),
(56, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 56, 37),
(57, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 57, 38),
(58, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 58, 39),
(59, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 59, 40),
(60, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 60, 41),
(61, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 61, 83),
(62, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 62, 84),
(63, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 63, 85),
(64, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 64, 86),
(65, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 65, 94),
(66, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 66, 96),
(67, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 67, 97),
(68, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 68, 87),
(69, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 69, 88),
(70, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 70, 89),
(71, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 71, 90),
(72, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 72, 91),
(73, '2019-02-20 14:10:42', '2019-02-20 14:10:42', NULL, 73, 92);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned DEFAULT NULL,
  `transaction_ref` varchar(255) NOT NULL,
  `sub_total` double NOT NULL DEFAULT '0',
  `service_charge` double NOT NULL DEFAULT '0',
  `is_successful` tinyint(1) DEFAULT '0',
  `response_code` varchar(255) DEFAULT NULL,
  `response_description` varchar(255) DEFAULT NULL,
  `is_web_pay` tinyint(1) DEFAULT '0',
  `payment_reference` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_reference` varchar(255) DEFAULT NULL,
  `merchant_reference` varchar(255) DEFAULT NULL,
  `lead_bank_cbn_code` varchar(255) DEFAULT NULL,
  `retrieval_reference_number` varchar(255) DEFAULT NULL,
  `response_redirect_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_payments_transaction_ref` (`transaction_ref`),
  KEY `idx_payments_academic_session_id` (`academic_session_id`),
  KEY `idx_payments_student_id` (`student_id`),
  KEY `idx_payments_is_successful` (`is_successful`),
  KEY `idx_payments_response_code` (`response_code`),
  KEY `idx_payments_is_web_pay` (`is_web_pay`),
  KEY `idx_payments_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `created_at`, `updated_at`, `deleted_at`, `academic_session_id`, `student_id`, `transaction_ref`, `sub_total`, `service_charge`, `is_successful`, `response_code`, `response_description`, `is_web_pay`, `payment_reference`, `card_number`, `card_reference`, `merchant_reference`, `lead_bank_cbn_code`, `retrieval_reference_number`, `response_redirect_url`) VALUES
(1, '2019-02-22 11:20:24', '2019-02-22 11:23:13', NULL, 1, 1, '6982158707', 5000, 1500, 1, '00', 'Approved Successful', 1, 'GTB|WEB|CALVP|13-02-2019|005986', '0866', NULL, NULL, NULL, '001244259226', 'http://portal.calvarypoly.edu.ng/c_ns/payments/6982158707/response'),
(2, '2019-02-22 11:37:26', '2019-03-20 08:33:02', NULL, 1, 2, '3599794531', 5000, 1500, 1, '00', 'Approved Successful', 1, 'FBN|WEB|CALVP|13-02-2019|011309', '0085', NULL, NULL, NULL, '001246320130', 'http://portal.calvarypoly.edu.ng/c_ns/payments/3599794531/response');

-- --------------------------------------------------------

--
-- Table structure for table `payment_line_items`
--

CREATE TABLE IF NOT EXISTS `payment_line_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fee_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_payment_line_items_deleted_at` (`deleted_at`),
  KEY `idx_payment_line_items_fee_id` (`fee_id`),
  KEY `idx_payment_line_items_amount` (`amount`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment_line_items`
--

INSERT INTO `payment_line_items` (`id`, `created_at`, `updated_at`, `deleted_at`, `fee_id`, `payment_id`, `amount`, `description`, `quantity`) VALUES
(1, '2019-02-22 11:20:24', '2019-02-22 11:20:24', NULL, 4, 1, 5000, 'ND Application Fee', 0),
(2, '2019-02-22 11:37:26', '2019-02-22 11:37:26', NULL, 4, 2, 5000, 'ND Application Fee', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `category_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_permissions_code` (`code`),
  KEY `idx_permissions_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `created_at`, `updated_at`, `deleted_at`, `code`, `category_code`, `name`) VALUES
(1, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:profile', 'student:profile', 'Profile'),
(2, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:profile:default', 'student:profile', 'Profile home'),
(3, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:profile:update', 'student:profile', 'Update profile'),
(4, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:payment', 'student:payment', 'Payments'),
(5, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:payment:default', 'student:payment', 'All Payments'),
(6, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:payment:create', 'student:payment', 'New Payment'),
(7, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:payment:summary', 'student:payment', 'Payment summary'),
(8, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:payment:response', 'student:payment', 'Payment response from interswitch'),
(9, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate', 'student:certificate', 'Certificates'),
(10, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:default', 'student:certificate', 'View summary of all certificates'),
(11, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:post_primary_cert:default', 'student:certificate', 'View post primary certificates and line items'),
(12, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:post_primary_cert:create', 'student:certificate', 'Create post primary certificate and line items'),
(13, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:post_primary_cert:update', 'student:certificate', 'Update post primary certificates and line items'),
(14, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:post_primary_cert:delete', 'student:certificate', 'Delete post primary certificates'),
(15, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:print', 'student:print', 'Print'),
(16, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:print:acknowledgement_card:show', 'student:print', 'Print acknowledgement card'),
(17, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:print:application_slip:show', 'student:print', 'Print application slip'),
(18, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:print:payment_receipt:show', 'student:print', 'Print payment receipt'),
(19, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:jamb_cert:default', 'student:certificate', 'View jamb result'),
(20, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:jamb_cert:create', 'student:certificate', 'Create jamb result'),
(21, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:jamb_cert:update', 'student:certificate', 'Update jamb result'),
(22, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:jamb_cert:delete', 'student:certificate', 'Delete jamb result'),
(23, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:tertiary_cert', 'student:certificate', 'Tertiary certificate'),
(24, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:tertiary_cert:default', 'student:certificate', 'View tertiary certificate'),
(25, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:tertiary_cert:create', 'student:certificate', 'Create tertiary certificate'),
(26, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:certificate:tertiary_cert:update', 'student:certificate', 'Update tertiary certificate'),
(27, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:admission', 'student:admission', 'Admission Letter'),
(28, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:admission:default', 'student:admission', 'View admission letter'),
(29, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course', 'student:department', 'Departmental Courses'),
(30, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:default', 'student:department', 'View departmental courses'),
(31, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:enrollment:default', 'student:department', 'View enrolled courses'),
(32, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:enrollment:create', 'student:department', 'Create student courses (create course enrollment)'),
(33, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:enrollment:delete', 'student:department', 'Delete student courses (drop course enrollment)'),
(34, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:enrollment:update', 'student:department', 'Update student courses (update course enrollment)'),
(35, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'student:department:course:assessment:default', 'student:department', 'View student course assessments'),
(36, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:profile', 'control:profile', 'Profile'),
(37, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:academic_session', 'control:academic_session', 'Academic Session'),
(38, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:academic_session:default', 'control:academic_session', 'View academic sessions'),
(39, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:academic_session:create', 'control:academic_session', 'Create academic session'),
(40, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:academic_session:update', 'control:academic_session', 'Update academic session'),
(41, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:academic_session:delete', 'control:academic_session', 'Delete academic session'),
(42, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:fee', 'control:fee', 'Fees'),
(43, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:fee:default', 'control:fee', 'View fees'),
(44, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:fee:create', 'control:fee', 'Create fees'),
(45, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:fee:update', 'control:fee', 'Update fees'),
(46, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:fee:delete', 'control:fee', 'Delete fees'),
(47, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student', 'control:student', 'Students'),
(48, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student:default', 'control:student', 'View students'),
(49, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student:detail', 'control:student', 'View student profile'),
(50, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student:detail:certificate:default', 'control:student', 'View student certificates'),
(51, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student:detail:payment:default', 'control:student', 'View student payments'),
(52, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:student:create', 'control:student', 'Create student'),
(53, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:payment', 'control:payment', 'Payments'),
(54, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:unit', 'control:unit', 'Units'),
(55, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:unit:default', 'control:unit', 'View units'),
(56, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:unit:create', 'control:unit', 'Create unit'),
(57, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:unit:update', 'control:unit', 'Update unit'),
(58, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:unit:delete', 'control:unit', 'Delete unit'),
(59, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:department', 'control:department', 'Departments'),
(60, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:department:default', 'control:department', 'View departments'),
(61, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:department:create', 'control:department', 'Create departments'),
(62, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:department:update', 'control:department', 'Update departments'),
(63, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:department:delete', 'control:department', 'Delete departments'),
(64, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:program', 'control:program', 'Programs'),
(65, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:program:default', 'control:program', 'View programs'),
(66, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:program:create', 'control:program', 'Create program'),
(67, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:program:update', 'control:program', 'Update program'),
(68, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:program:delete', 'control:program', 'Delete program'),
(69, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course', 'control:course', 'Courses'),
(70, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:default', 'control:course', 'View courses'),
(71, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:create', 'control:course', 'Create courses'),
(72, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:update', 'control:course', 'Update courses'),
(73, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:delete', 'control:course', 'Delete courses'),
(74, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:show', 'control:course', 'View course detail'),
(75, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:course_instructor:default', 'control:course', 'View course instructors'),
(76, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course:course_instructor:create', 'control:course', 'Create course instructors'),
(77, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course_instructor', 'control:course_instructor', 'Course Instructors'),
(78, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:course_instructor:default', 'control:course_instructor', 'View course instructor'),
(79, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:staff', 'control:staff', 'Staffs'),
(80, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:staff:default', 'control:staff', 'View staffs'),
(81, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:staff:create', 'control:staff', 'Create staffs'),
(82, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:staff:update', 'control:staff', 'Update staffs'),
(83, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user', 'control:user', 'Users'),
(84, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:default', 'control:user', 'View users'),
(85, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:create', 'control:user', 'Create user'),
(86, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:update', 'control:user', 'Update user'),
(87, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:role:default', 'control:user', 'View and manage user''s roles'),
(88, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:term', 'control:term', 'Terms'),
(89, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:term:default', 'control:term', 'View terms'),
(90, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:term:create', 'control:term', 'Create term'),
(91, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:term:update', 'control:term', 'Update term'),
(92, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:term:delete', 'control:term', 'Delete term'),
(93, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:menu', 'control:menu', 'Menus'),
(94, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:delete', 'control:user', 'Delete user'),
(95, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:suppend', 'control:user', 'Suppend user'),
(96, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:show', 'control:user', 'Show user detail'),
(97, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'control:user:permission:default', 'control:user', 'View and manage user''s permissions');

-- --------------------------------------------------------

--
-- Table structure for table `post_primary_certs`
--

CREATE TABLE IF NOT EXISTS `post_primary_certs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `examination_year` int(11) NOT NULL,
  `examination_type_id` int(10) unsigned NOT NULL,
  `examination_no` varchar(30) NOT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_post_primary_certs_deleted_at` (`deleted_at`),
  KEY `idx_post_primary_certs_examination_year` (`examination_year`),
  KEY `idx_post_primary_certs_examination_type_id` (`examination_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `post_primary_certs`
--

INSERT INTO `post_primary_certs` (`id`, `created_at`, `updated_at`, `deleted_at`, `examination_year`, `examination_type_id`, `examination_no`, `is_verified`) VALUES
(1, '2019-02-22 12:08:00', '2019-02-25 14:54:45', NULL, 2017, 1, '5251318176', 0),
(2, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2018, 1, '4110744052', 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_primary_cert_line_items`
--

CREATE TABLE IF NOT EXISTS `post_primary_cert_line_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `post_primary_cert_id` int(10) unsigned DEFAULT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `subject_grade_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_post_primary_cert_line_items_deleted_at` (`deleted_at`),
  KEY `idx_post_primary_cert_line_items_post_primary_cert_id` (`post_primary_cert_id`),
  KEY `idx_post_primary_cert_line_items_subject_id` (`subject_id`),
  KEY `idx_post_primary_cert_line_items_subject_grade_id` (`subject_grade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `post_primary_cert_line_items`
--

INSERT INTO `post_primary_cert_line_items` (`id`, `created_at`, `updated_at`, `deleted_at`, `post_primary_cert_id`, `subject_id`, `subject_grade_id`) VALUES
(1, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 33, 63),
(2, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 37, 46),
(3, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 34, 48),
(4, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 36, 46),
(5, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 28, 46),
(6, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 29, 48),
(7, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 31, 46),
(8, '2019-02-22 12:08:00', '2019-02-22 12:08:00', '2019-02-22 15:28:50', 1, 41, 46),
(9, '2019-02-22 15:28:50', '2019-02-25 14:54:45', NULL, 1, 40, 66),
(10, '2019-02-25 14:50:35', '2019-02-25 14:54:45', NULL, 1, 33, 63),
(11, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 37, 46),
(12, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 34, 48),
(13, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 36, 46),
(14, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 28, 46),
(15, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 29, 48),
(16, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 31, 46),
(17, '2019-02-25 14:54:45', '2019-02-25 14:54:45', NULL, 1, 41, 46),
(18, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 68, 64),
(19, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 37, 50),
(20, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 34, 49),
(21, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 40, 48),
(22, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 28, 66),
(23, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 29, 50),
(24, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 31, 66),
(25, '2019-02-26 10:22:26', '2019-02-26 13:15:07', NULL, 2, 41, 66),
(26, '2019-02-26 13:15:07', '2019-02-26 13:15:07', NULL, 2, 69, 66);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '24',
  PRIMARY KEY (`id`),
  KEY `idx_programs_deleted_at` (`deleted_at`),
  KEY `idx_programs_name` (`name`),
  KEY `idx_programs_abbreviation` (`abbreviation`),
  KEY `idx_programs_duration` (`duration`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `abbreviation`, `display_name`, `duration`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'National Diploma', 'ND', 'National Diploma (ND)', 24),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Higher National Diploma', 'HND', 'Higher National Diploma (HND)', 24);

-- --------------------------------------------------------

--
-- Table structure for table `program_certificate_requirements`
--

CREATE TABLE IF NOT EXISTS `program_certificate_requirements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `program_id` int(10) unsigned NOT NULL,
  `certificate_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_program_certificate_requirements_certificate_id` (`certificate_id`),
  KEY `idx_program_certificate_requirements_deleted_at` (`deleted_at`),
  KEY `idx_program_certificate_requirements_program_id` (`program_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `program_certificate_requirements`
--

INSERT INTO `program_certificate_requirements` (`id`, `created_at`, `updated_at`, `deleted_at`, `program_id`, `certificate_id`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 53),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 54),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 53),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 2, 55);

-- --------------------------------------------------------

--
-- Table structure for table `program_departments`
--

CREATE TABLE IF NOT EXISTS `program_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `program_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `is_admitting` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_program_departments_program_id` (`program_id`),
  KEY `idx_program_departments_department_id` (`department_id`),
  KEY `idx_program_departments_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `program_departments`
--

INSERT INTO `program_departments` (`id`, `created_at`, `updated_at`, `deleted_at`, `program_id`, `department_id`, `is_admitting`) VALUES
(1, '2019-02-20 14:10:28', '2019-03-20 08:35:24', NULL, 1, 1, 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 2, 1),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 3, 1),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_types`
--

CREATE TABLE IF NOT EXISTS `program_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `program_id` int(10) unsigned NOT NULL,
  `is_admitting` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_program_types_code` (`code`),
  KEY `idx_program_types_deleted_at` (`deleted_at`),
  KEY `idx_program_types_name` (`name`),
  KEY `idx_program_types_program_id` (`program_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `program_types`
--

INSERT INTO `program_types` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `code`, `program_id`, `is_admitting`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Regular', '001', 1, 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Regular', '002', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_roles_name` (`name`),
  KEY `idx_roles_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `display_name`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'CANDIDATE_HND', 'CANDIDATE (HND)'),
(2, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'CANDIDATE_ND', 'CANDIDATE (ND)'),
(3, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'STUDENT_HND', 'STUDENT (HND)'),
(4, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'STUDENT_ND', 'STUDENT (ND)'),
(5, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'COURSE_ADVISOR', 'COURSE ADVISOR'),
(6, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ADMIN', 'ADMIN'),
(7, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'SUPER_ADMIN', 'SUPER ADMIN'),
(8, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'LECTURER', 'LECTURER'),
(9, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'SUPERVISOR', 'SUPERVISOR'),
(10, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'ACCOUNT', 'ACCOUNT'),
(11, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'REGISTRY', 'REGISTRY'),
(12, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'RECTOR', 'RECTOR'),
(13, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'REGISTRAR', 'REGISTRAR'),
(14, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'BURSAR', 'BURSAR');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_permissions_deleted_at` (`deleted_at`),
  KEY `idx_role_permissions_role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `created_at`, `updated_at`, `deleted_at`, `role_id`, `permission_id`) VALUES
(1, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 1),
(2, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 2),
(3, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 3),
(4, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 4),
(5, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 5),
(6, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 6),
(7, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 7),
(8, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 8),
(9, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 9),
(10, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 10),
(11, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 11),
(12, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 12),
(13, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 13),
(14, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 14),
(15, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 15),
(16, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 16),
(17, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 17),
(18, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 18),
(19, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 19),
(20, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 20),
(21, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 21),
(22, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 22),
(23, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 1),
(24, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 2),
(25, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 3),
(26, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 4),
(27, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 5),
(28, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 6),
(29, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 7),
(30, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 8),
(31, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 9),
(32, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 10),
(33, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 11),
(34, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 12),
(35, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 13),
(36, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 14),
(37, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 15),
(38, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 16),
(39, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 17),
(40, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 18),
(41, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 23),
(42, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 24),
(43, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 25),
(44, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 1, 26),
(45, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 1),
(46, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 2),
(47, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 3),
(48, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 4),
(49, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 5),
(50, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 6),
(51, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 7),
(52, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 8),
(53, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 9),
(54, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 10),
(55, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 11),
(56, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 12),
(57, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 13),
(58, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 14),
(59, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 15),
(60, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 16),
(61, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 17),
(62, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 18),
(63, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 29),
(64, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 30),
(65, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 31),
(66, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 32),
(67, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 33),
(68, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 34),
(69, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 4, 35),
(70, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 1),
(71, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 2),
(72, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 3),
(73, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 4),
(74, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 5),
(75, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 6),
(76, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 7),
(77, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 8),
(78, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 9),
(79, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 10),
(80, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 11),
(81, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 12),
(82, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 13),
(83, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 14),
(84, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 15),
(85, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 16),
(86, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 17),
(87, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 18),
(88, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 23),
(89, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 24),
(90, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 25),
(91, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 3, 26),
(92, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 36),
(93, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 37),
(94, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 38),
(95, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 39),
(96, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 40),
(97, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 41),
(98, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 42),
(99, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 43),
(100, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 44),
(101, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 45),
(102, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 46),
(103, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 47),
(104, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 48),
(105, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 49),
(106, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 50),
(107, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 51),
(108, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 52),
(109, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 53),
(110, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 54),
(111, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 55),
(112, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 56),
(113, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 57),
(114, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 58),
(115, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 59),
(116, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 60),
(117, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 61),
(118, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 62),
(119, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 63),
(120, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 64),
(121, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 65),
(122, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 66),
(123, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 67),
(124, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 68),
(125, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 69),
(126, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 70),
(127, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 71),
(128, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 72),
(129, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 73),
(130, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 74),
(131, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 75),
(132, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 76),
(133, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 77),
(134, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 78),
(135, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 79),
(136, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 80),
(137, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 81),
(138, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 82),
(139, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 83),
(140, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 84),
(141, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 85),
(142, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 86),
(143, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 87),
(144, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 88),
(145, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 89),
(146, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 90),
(147, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 91),
(148, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 6, 92),
(149, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 36),
(150, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 37),
(151, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 38),
(152, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 39),
(153, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 40),
(154, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 41),
(155, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 42),
(156, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 43),
(157, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 44),
(158, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 45),
(159, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 46),
(160, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 47),
(161, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 48),
(162, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 49),
(163, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 50),
(164, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 51),
(165, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 52),
(166, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 53),
(167, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 54),
(168, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 55),
(169, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 56),
(170, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 57),
(171, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 58),
(172, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 59),
(173, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 60),
(174, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 61),
(175, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 62),
(176, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 63),
(177, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 64),
(178, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 65),
(179, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 66),
(180, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 67),
(181, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 68),
(182, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 69),
(183, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 70),
(184, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 71),
(185, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 72),
(186, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 73),
(187, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 74),
(188, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 75),
(189, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 76),
(190, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 77),
(191, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 78),
(192, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 79),
(193, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 80),
(194, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 81),
(195, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 82),
(196, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 83),
(197, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 84),
(198, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 85),
(199, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 86),
(200, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 87),
(201, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 88),
(202, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 89),
(203, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 90),
(204, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 91),
(205, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 92),
(206, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 93),
(207, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 94),
(208, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 95),
(209, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 96),
(210, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 7, 97);

-- --------------------------------------------------------

--
-- Table structure for table `service_charges`
--

CREATE TABLE IF NOT EXISTS `service_charges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_service_charges_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `service_charges`
--

INSERT INTO `service_charges` (`id`, `created_at`, `updated_at`, `deleted_at`, `amount`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `service_charge_splits`
--

CREATE TABLE IF NOT EXISTS `service_charge_splits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `service_charge_id` int(10) unsigned NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_service_charge_splits_account_number` (`account_number`),
  KEY `idx_service_charge_splits_deleted_at` (`deleted_at`),
  KEY `idx_service_charge_splits_service_charge_id` (`service_charge_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `service_charge_splits`
--

INSERT INTO `service_charge_splits` (`id`, `created_at`, `updated_at`, `deleted_at`, `service_charge_id`, `bank_id`, `account_name`, `account_number`, `amount`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, '7', 'Schoolville Limited', '1018635822', 1300);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_states_deleted_at` (`deleted_at`),
  KEY `idx_states_country_id` (`country_id`),
  KEY `idx_states_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `created_at`, `updated_at`, `deleted_at`, `country_id`, `name`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 59, 'ABIA'),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 59, 'ADAMAWA'),
(3, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 59, 'AKWA IBOM'),
(4, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 59, 'ANAMBRA'),
(5, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 59, 'BAUCHI'),
(6, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 59, 'BAYELSA'),
(7, '2019-02-20 14:10:29', '2019-02-20 14:10:29', NULL, 59, 'BENUE'),
(8, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 59, 'BORNO'),
(9, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 59, 'CROSS RIVER'),
(10, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 59, 'DELTA'),
(11, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 59, 'EBONYI'),
(12, '2019-02-20 14:10:30', '2019-02-20 14:10:30', NULL, 59, 'EDO'),
(13, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'EKITI'),
(14, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'ENUGU'),
(15, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'FCT'),
(16, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'GOMBE'),
(17, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'IMO'),
(18, '2019-02-20 14:10:31', '2019-02-20 14:10:31', NULL, 59, 'JIGAWA'),
(19, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 59, 'KADUNA'),
(20, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 59, 'KANO'),
(21, '2019-02-20 14:10:32', '2019-02-20 14:10:32', NULL, 59, 'KATSINA'),
(22, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 59, 'KEBBI'),
(23, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 59, 'KOGI'),
(24, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 59, 'KWARA'),
(25, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 59, 'LAGOS'),
(26, '2019-02-20 14:10:33', '2019-02-20 14:10:33', NULL, 59, 'NASARAWA'),
(27, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 59, 'NIGER'),
(28, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 59, 'OGUN'),
(29, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 59, 'ONDO'),
(30, '2019-02-20 14:10:34', '2019-02-20 14:10:34', NULL, 59, 'OSUN'),
(31, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 59, 'OYO'),
(32, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 59, 'PLATEAU'),
(33, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 59, 'RIVERS'),
(34, '2019-02-20 14:10:35', '2019-02-20 14:10:35', NULL, 59, 'SOKOTO'),
(35, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 59, 'TARABA'),
(36, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 59, 'YOBE'),
(37, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 59, 'ZAMFARA');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `title_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `other_names` varchar(150) DEFAULT NULL,
  `birth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `marital_status_id` int(10) unsigned DEFAULT NULL,
  `gender_id` int(10) unsigned DEFAULT NULL,
  `local_govt_area_id` int(10) unsigned NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `matriculation_no` varchar(255) DEFAULT NULL,
  `registration_no` varchar(30) NOT NULL,
  `is_cleared` tinyint(1) DEFAULT '0',
  `clearance_code` varchar(255) DEFAULT NULL,
  `cleared_at` timestamp NULL DEFAULT NULL,
  `program_id` int(10) unsigned NOT NULL,
  `program_type_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `department_option_id` int(10) unsigned DEFAULT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  `photo_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_students_matriculation_no` (`matriculation_no`),
  KEY `idx_students_phone_number` (`phone_number`),
  KEY `idx_students_program_id` (`program_id`),
  KEY `idx_students_deleted_at` (`deleted_at`),
  KEY `idx_students_marital_status_id` (`marital_status_id`),
  KEY `idx_students_local_govt_area_id` (`local_govt_area_id`),
  KEY `idx_students_email` (`email`),
  KEY `idx_students_department_id` (`department_id`),
  KEY `idx_students_department_option_id` (`department_option_id`),
  KEY `idx_students_academic_session_id` (`academic_session_id`),
  KEY `idx_students_title_id` (`title_id`),
  KEY `idx_students_user_id` (`user_id`),
  KEY `idx_students_gender_id` (`gender_id`),
  KEY `idx_students_program_type_id` (`program_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `created_at`, `updated_at`, `deleted_at`, `title_id`, `user_id`, `first_name`, `last_name`, `other_names`, `birth_date`, `marital_status_id`, `gender_id`, `local_govt_area_id`, `email`, `phone_number`, `matriculation_no`, `registration_no`, `is_cleared`, `clearance_code`, `cleared_at`, `program_id`, `program_type_id`, `department_id`, `department_option_id`, `academic_session_id`, `photo_id`) VALUES
(1, '2019-02-22 10:34:04', '2019-03-07 12:52:08', NULL, 0, 4, 'Isioma', 'Oboite', 'Glory', '2000-02-10 23:00:00', 22, 62, 287, 'purepinkyoboite@gmail.com', '08127333496', NULL, 'ND181900100001', 1, '941731026344', '2019-03-07 12:52:08', 1, 1, 4, NULL, 1, 1),
(2, '2019-02-22 11:37:13', '2019-03-06 14:06:59', NULL, 0, 5, 'Godsent', 'Ogborin', 'Mmert', '2000-01-10 23:00:00', 22, 61, 193, 'Ogborin.godsent@gmail.com', '07031947703', NULL, 'ND181900100002', 1, '97018070392', '2019-03-06 14:06:59', 1, 1, 4, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_alternate_contacts`
--

CREATE TABLE IF NOT EXISTS `student_alternate_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_alternate_contacts_deleted_at` (`deleted_at`),
  KEY `idx_student_alternate_contacts_student_id` (`student_id`),
  KEY `idx_student_alternate_contacts_type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `student_alternate_contacts`
--

INSERT INTO `student_alternate_contacts` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `last_name`, `first_name`, `phone_number`, `email`, `type_id`) VALUES
(1, '2019-02-22 10:34:05', '2019-02-22 10:34:05', NULL, 1, 'Oboite', 'Isioma', '08127333496', 'purepinkyoboite@gmail.com', 58),
(2, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 2, 'Ogborin', 'johnny', '07031947703', 'Ogborin.godsent@gmail.com', 58);

-- --------------------------------------------------------

--
-- Table structure for table `student_certificates`
--

CREATE TABLE IF NOT EXISTS `student_certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `program_certificate_requirement_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_certificates_deleted_at` (`deleted_at`),
  KEY `idx_student_certificates_student_id` (`student_id`),
  KEY `idx_student_certificates_program_certificate_requirement_id` (`program_certificate_requirement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student_certificates`
--

INSERT INTO `student_certificates` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `program_certificate_requirement_id`) VALUES
(1, '2019-02-22 12:08:00', '2019-02-22 12:08:00', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE IF NOT EXISTS `student_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `is_outstanding` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_student_courses_student_id` (`student_id`),
  KEY `idx_student_courses_is_outstanding` (`is_outstanding`),
  KEY `idx_student_courses_deleted_at` (`deleted_at`),
  KEY `idx_student_courses_course_id` (`course_id`),
  KEY `idx_student_courses_academic_session_id` (`academic_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_course_assessments`
--

CREATE TABLE IF NOT EXISTS `student_course_assessments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `course_enrollment_id` int(10) unsigned NOT NULL,
  `assessment_type_id` int(10) unsigned NOT NULL,
  `score` double NOT NULL,
  `instructor_employee_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_course_assessments_instructor_employee_id` (`instructor_employee_id`),
  KEY `idx_student_course_assessments_deleted_at` (`deleted_at`),
  KEY `idx_student_course_assessments_course_enrollment_id` (`course_enrollment_id`),
  KEY `idx_student_course_assessments_assessment_type_id` (`assessment_type_id`),
  KEY `idx_student_course_assessments_score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_course_grades`
--

CREATE TABLE IF NOT EXISTS `student_course_grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_course_id` int(10) unsigned DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `total_score` double NOT NULL DEFAULT '0',
  `grade_letter` varchar(255) DEFAULT NULL,
  `grade_point` double DEFAULT NULL,
  `is_released` tinyint(1) DEFAULT '0',
  `instructor_employee_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_student_course_grades_student_course_id` (`student_course_id`),
  KEY `idx_student_course_grades_instructor_employee_id` (`instructor_employee_id`),
  KEY `idx_student_course_grades_deleted_at` (`deleted_at`),
  KEY `idx_student_course_grades_grade_letter` (`grade_letter`),
  KEY `idx_student_course_grades_grade_point` (`grade_point`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_fee_logs`
--

CREATE TABLE IF NOT EXISTS `student_fee_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `academic_session_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fee_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) DEFAULT '0',
  `paid_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_fee_logs_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `student_fee_logs`
--

INSERT INTO `student_fee_logs` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `academic_session_id`, `fee_id`, `is_paid`, `paid_at`) VALUES
(1, '2019-02-22 10:34:05', '2019-02-22 10:34:05', NULL, 1, 1, 4, 0, NULL),
(2, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 2, 1, 4, 0, NULL),
(3, '2019-03-06 14:06:59', '2019-03-06 14:06:59', NULL, 2, 1, 8, 0, NULL),
(4, '2019-03-07 12:52:08', '2019-03-07 12:52:08', NULL, 1, 1, 8, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_levels`
--

CREATE TABLE IF NOT EXISTS `student_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `academic_session_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `grade_point_average` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_levels_student_id` (`student_id`),
  KEY `idx_student_levels_academic_session_id` (`academic_session_id`),
  KEY `idx_student_levels_level_id` (`level_id`),
  KEY `idx_student_levels_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `student_levels`
--

INSERT INTO `student_levels` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `academic_session_id`, `level_id`, `grade_point_average`) VALUES
(1, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 1, 1, 1, NULL),
(2, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 2, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_post_primary_certs`
--

CREATE TABLE IF NOT EXISTS `student_post_primary_certs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `post_primary_cert_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_post_primary_certs_deleted_at` (`deleted_at`),
  KEY `idx_student_post_primary_certs_student_id` (`student_id`),
  KEY `idx_student_post_primary_certs_post_primary_cert_id` (`post_primary_cert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `student_post_primary_certs`
--

INSERT INTO `student_post_primary_certs` (`id`, `created_at`, `updated_at`, `deleted_at`, `student_id`, `post_primary_cert_id`) VALUES
(1, '2019-02-22 12:08:00', '2019-02-22 12:08:00', NULL, 1, 1),
(2, '2019-02-26 10:22:26', '2019-02-26 10:22:26', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_resource_uploads`
--

CREATE TABLE IF NOT EXISTS `student_resource_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_student_resource_uploads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_tertiary_certs`
--

CREATE TABLE IF NOT EXISTS `student_tertiary_certs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `tertiary_cert_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_tertiary_certs_deleted_at` (`deleted_at`),
  KEY `idx_student_tertiary_certs_student_id` (`student_id`),
  KEY `idx_student_tertiary_certs_tertiary_cert_id` (`tertiary_cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `term_set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_terms_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `term_set_id`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'WAEC SSCE', 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'WAEC GCE', 1),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'NECO SSCE', 1),
(4, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'NECO GCE', 1),
(5, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Application', 2),
(6, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Acceptance', 2),
(7, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Matriculation Gown', 2),
(8, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Tuition', 2),
(9, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Levy', 2),
(10, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'NATIONAL DIPLOMA', 3),
(11, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'ACKNOWLEDGEMENT', 4),
(12, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'ADMISSION_LETTER', 4),
(13, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'First (I)', 5),
(14, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Second (II)', 5),
(15, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Mr', 6),
(16, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Mrs', 6),
(17, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Ms', 6),
(18, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Miss', 6),
(19, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Master', 6),
(20, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Doctor', 6),
(21, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Prof', 6),
(22, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Single', 7),
(23, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Married', 7),
(24, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Divorced', 7),
(25, '2019-02-20 14:10:28', '2019-03-06 14:16:06', NULL, 'Separated', 7),
(26, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Widow', 7),
(27, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Widower', 7),
(28, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Agricultural Science', 8),
(29, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Biology', 8),
(30, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Christian Religios Studies', 8),
(31, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Chemistry', 8),
(32, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Commerce', 8),
(33, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Economics', 8),
(34, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'English', 8),
(35, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'French', 8),
(36, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Further Mathematics', 8),
(37, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Geography', 8),
(38, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Government', 8),
(39, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Literature in English', 8),
(40, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Mathematics', 8),
(41, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Physics', 8),
(42, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Typewriter', 8),
(43, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Hausa', 8),
(44, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Igbo', 8),
(45, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Yoruba', 8),
(46, '2019-02-20 14:10:28', '2019-02-22 11:51:20', NULL, 'A1', 9),
(47, '2019-02-20 14:10:28', '2019-02-22 11:51:51', NULL, 'B2', 9),
(48, '2019-02-20 14:10:28', '2019-02-22 11:52:18', NULL, 'B3', 9),
(49, '2019-02-20 14:10:28', '2019-02-22 11:54:34', NULL, 'D7', 9),
(50, '2019-02-20 14:10:28', '2019-02-22 11:53:48', NULL, 'E8', 9),
(51, '2019-02-20 14:10:28', '2019-02-22 11:53:34', NULL, 'F9', 9),
(52, '2019-02-20 14:10:28', '2019-02-22 11:55:13', NULL, 'Awaiting Result', 9),
(53, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'POST_PRIMARY', 10),
(54, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'JAMB', 10),
(55, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'TERTIARY', 10),
(56, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'PARENT', 11),
(57, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'GUARDIAN', 11),
(58, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'NEXT OF KIN', 11),
(59, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Nigeria', 12),
(60, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Others', 12),
(61, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Male', 13),
(62, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'Female', 13),
(63, '2019-02-22 11:55:35', '2019-02-22 12:05:22', NULL, 'ABS', 9),
(64, '2019-02-22 12:09:19', '2019-02-22 12:09:19', NULL, 'C4', 9),
(65, '2019-02-22 12:09:32', '2019-02-22 12:09:32', NULL, 'C5', 9),
(66, '2019-02-22 12:09:36', '2019-02-22 12:09:36', NULL, 'C6', 9),
(67, '2019-02-22 12:12:14', '2019-02-22 12:12:14', NULL, 'B4', 9),
(68, '2019-02-25 16:17:42', '2019-02-25 16:17:42', NULL, 'MARKETING', 8),
(69, '2019-02-26 10:24:44', '2019-02-26 10:24:44', NULL, 'Civic Education', 8),
(70, '2019-02-26 13:11:23', '2019-02-26 13:11:23', NULL, 'Civic Education', 8),
(71, '2019-02-26 13:11:50', '2019-02-26 13:11:50', NULL, 'Civic Education', 8),
(72, '2019-02-26 13:11:55', '2019-02-26 13:11:55', NULL, 'Civic Education', 8),
(73, '2019-02-26 13:11:58', '2019-02-26 13:11:58', NULL, 'Civic Education', 8);

-- --------------------------------------------------------

--
-- Table structure for table `term_sets`
--

CREATE TABLE IF NOT EXISTS `term_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_editable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_term_sets_name` (`name`),
  KEY `idx_term_sets_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `term_sets`
--

INSERT INTO `term_sets` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `display_name`, `is_editable`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'POST_PRIMARY_EXAM', 'POST PRIMARY EXAM;true', 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'FEE_CATEGORY', 'FEE CATEGORY;false', 0),
(3, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'TERTIARY_QUALIFICATION', 'TERTIARY QUALIFICATION;false', 0),
(4, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'STUDENT_RESOURCE_UPLOAD', 'STUDENT RESOURCE UPLOAD;true', 1),
(5, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'SEMESTER', 'SEMESTER;false', 0),
(6, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'TITLE', 'TITLE;true', 1),
(7, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'MARITAL_STATUS', 'MARITAL STATUS;true', 1),
(8, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'POST_PRIMARY_SUBJECT', 'POST PRIMARY SUBJECT;true', 1),
(9, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'POST_PRIMARY_SUBJECT_GRADE', 'POST PRIMARY SUBJECT GRADE;true', 1),
(10, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'PROGRAM_CERTIFICATE_REQUIREMENT', 'PROGRAM CERTIFICATE REQUIREMENT;false', 0),
(11, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'ALTERNATE_CONTACT_TYPE', 'ALTERNATE CONTACT TYPE;false', 0),
(12, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'COUNTRY', 'COUNTRY;true', 1),
(13, '2019-02-20 14:10:28', '2019-02-20 14:14:59', NULL, 'GENDER', 'GENDER;false', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tertiary_certs`
--

CREATE TABLE IF NOT EXISTS `tertiary_certs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `school` varchar(255) NOT NULL,
  `course_studied` varchar(255) NOT NULL,
  `year_graduated` int(11) NOT NULL,
  `cgpa` double NOT NULL,
  `qualification_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tertiary_certs_deleted_at` (`deleted_at`),
  KEY `idx_tertiary_certs_qualification_id` (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_academic` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_units_name` (`name`),
  UNIQUE KEY `uix_units_code` (`code`),
  KEY `idx_units_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `code`, `is_academic`) VALUES
(1, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'SCHOOL OF ENGINEERING TECHNOLOGY', 'ENG', 1),
(2, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'SCHOOL OF APPLIED SCIENCE', 'FBA', 1),
(3, '2019-02-20 14:10:28', '2019-02-20 14:10:28', NULL, 'SCHOOL OF MANAGEMENT STUDIES', 'FSM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`, `ip_address`, `password`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 'Smith', 'Samuel', '', '$2a$10$DCX3VetrgB1.muDiGFo0..cF3lW8Fczr0bTefc//vKbTvHEna7qLa'),
(2, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'Charles', 'Omordia', '', '$2a$10$DCX3VetrgB1.muDiGFo0..cF3lW8Fczr0bTefc//vKbTvHEna7qLa'),
(3, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 'Samuel', 'Ochiga', '', '$2a$10$DCX3VetrgB1.muDiGFo0..cF3lW8Fczr0bTefc//vKbTvHEna7qLa'),
(4, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 'Isioma', 'Oboite', '', '$2a$10$k/BK809jAEX05bwijawPYOPKmscTfHtFCXACwRq5hifAjoJng./CK'),
(5, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 'Godsent', 'Ogborin', '', '$2a$10$u2GHvx.l.TbwlCQk7fz24e1Ht9n.Xi3T9WgXUTfRzakJ8tyabSdcO');

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE IF NOT EXISTS `user_credentials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_user_credentials_username` (`username`),
  KEY `idx_user_credentials_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `username`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, '08138238095'),
(2, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 's.aitufe@schoolville.com'),
(3, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, '08064028176'),
(4, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 'c.omordia@schoolville.com'),
(5, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 's.ochiga@schoolville.com'),
(6, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 'purepinkyoboite@gmail.com'),
(7, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, '08127333496'),
(8, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 'ND181900100001'),
(9, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 'Ogborin.godsent@gmail.com'),
(10, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, '07031947703'),
(11, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 'ND181900100002');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE IF NOT EXISTS `user_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_permissions_role_id` (`role_id`),
  KEY `idx_user_permissions_deleted_at` (`deleted_at`),
  KEY `idx_user_permissions_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=225 ;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `role_id`, `permission_id`) VALUES
(1, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 36),
(2, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 37),
(3, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 38),
(4, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 39),
(5, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 40),
(6, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 41),
(7, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 42),
(8, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 43),
(9, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 44),
(10, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 45),
(11, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 46),
(12, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 47),
(13, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 48),
(14, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 49),
(15, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 50),
(16, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 51),
(17, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 52),
(18, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 53),
(19, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 54),
(20, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 55),
(21, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 56),
(22, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 57),
(23, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 58),
(24, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 59),
(25, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 60),
(26, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 61),
(27, '2019-02-20 14:10:38', '2019-02-20 14:10:38', NULL, 1, 7, 62),
(28, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 63),
(29, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 64),
(30, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 65),
(31, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 66),
(32, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 67),
(33, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 68),
(34, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 69),
(35, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 70),
(36, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 71),
(37, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 72),
(38, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 73),
(39, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 74),
(40, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 75),
(41, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 76),
(42, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 77),
(43, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 78),
(44, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 79),
(45, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 80),
(46, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 81),
(47, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 82),
(48, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 83),
(49, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 84),
(50, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 85),
(51, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 86),
(52, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 87),
(53, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 88),
(54, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 89),
(55, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 90),
(56, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 91),
(57, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 92),
(58, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 93),
(59, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 94),
(60, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 95),
(61, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 96),
(62, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 1, 7, 97),
(63, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 36),
(64, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 37),
(65, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 38),
(66, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 39),
(67, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 40),
(68, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 41),
(69, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 42),
(70, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 43),
(71, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 44),
(72, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 45),
(73, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 46),
(74, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 47),
(75, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 48),
(76, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 49),
(77, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 50),
(78, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 51),
(79, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 52),
(80, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 53),
(81, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 54),
(82, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 55),
(83, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 56),
(84, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 57),
(85, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 58),
(86, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 59),
(87, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 60),
(88, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 61),
(89, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 62),
(90, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 63),
(91, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 64),
(92, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 65),
(93, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 66),
(94, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 67),
(95, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 68),
(96, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 69),
(97, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 70),
(98, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 71),
(99, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 72),
(100, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 73),
(101, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 74),
(102, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 75),
(103, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 76),
(104, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 77),
(105, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 78),
(106, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 79),
(107, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 80),
(108, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 81),
(109, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 82),
(110, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 83),
(111, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 84),
(112, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 85),
(113, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 86),
(114, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 87),
(115, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 88),
(116, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 89),
(117, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 90),
(118, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 91),
(119, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 2, 6, 92),
(120, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 36),
(121, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 37),
(122, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 38),
(123, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 39),
(124, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 40),
(125, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 41),
(126, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 42),
(127, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 43),
(128, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 44),
(129, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 45),
(130, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 46),
(131, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 47),
(132, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 48),
(133, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 49),
(134, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 50),
(135, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 51),
(136, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 52),
(137, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 53),
(138, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 54),
(139, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 55),
(140, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 56),
(141, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 57),
(142, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 58),
(143, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 59),
(144, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 60),
(145, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 61),
(146, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 62),
(147, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 63),
(148, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 64),
(149, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 65),
(150, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 66),
(151, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 67),
(152, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 68),
(153, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 69),
(154, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 70),
(155, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 71),
(156, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 72),
(157, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 73),
(158, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 74),
(159, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 75),
(160, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 76),
(161, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 77),
(162, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 78),
(163, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 79),
(164, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 80),
(165, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 81),
(166, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 82),
(167, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 83),
(168, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 84),
(169, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 85),
(170, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 86),
(171, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 87),
(172, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 88),
(173, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 89),
(174, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 90),
(175, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 91),
(176, '2019-02-20 14:10:39', '2019-02-20 14:10:39', NULL, 3, 6, 92),
(177, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 1),
(178, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 2),
(179, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 3),
(180, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 4),
(181, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 5),
(182, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 6),
(183, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 7),
(184, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 8),
(185, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 9),
(186, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 10),
(187, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 11),
(188, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 12),
(189, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 13),
(190, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 14),
(191, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 15),
(192, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 16),
(193, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 17),
(194, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 18),
(195, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 19),
(196, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 20),
(197, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 21),
(198, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2, 22),
(199, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 1),
(200, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 2),
(201, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 3),
(202, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 4),
(203, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 5),
(204, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 6),
(205, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 7),
(206, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2, 8),
(207, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 9),
(208, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 10),
(209, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 11),
(210, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 12),
(211, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 13),
(212, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 14),
(213, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 15),
(214, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 16),
(215, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 17),
(216, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 18),
(217, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 19),
(218, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 20),
(219, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 21),
(220, '2019-02-22 11:37:13', '2019-02-22 11:37:13', NULL, 5, 2, 22),
(221, '2019-03-06 14:06:59', '2019-03-06 14:06:59', NULL, 5, 2, 27),
(222, '2019-03-06 14:06:59', '2019-03-06 14:06:59', NULL, 5, 2, 28),
(223, '2019-03-07 12:52:08', '2019-03-07 12:52:08', NULL, 4, 2, 27),
(224, '2019-03-07 12:52:09', '2019-03-07 12:52:09', NULL, 4, 2, 28);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_roles_user_id` (`user_id`),
  KEY `idx_user_roles_role_id` (`role_id`),
  KEY `idx_user_roles_deleted_at` (`deleted_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `role_id`) VALUES
(1, '2019-02-20 14:10:36', '2019-02-20 14:10:36', NULL, 1, 7),
(2, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 2, 6),
(3, '2019-02-20 14:10:37', '2019-02-20 14:10:37', NULL, 3, 6),
(4, '2019-02-22 10:34:04', '2019-02-22 10:34:04', NULL, 4, 2),
(5, '2019-02-22 11:37:12', '2019-02-22 11:37:12', NULL, 5, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
