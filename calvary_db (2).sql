-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 29, 2019 at 10:09 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calvary_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `department` int(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(20) NOT NULL,
  `dateofbirth` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alt_contact_rel` varchar(50) NOT NULL,
  `alt_contact_name` varchar(500) NOT NULL,
  `alt_contact_phone` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `lga` int(100) NOT NULL,
  `state` int(50) NOT NULL,
  `address` text NOT NULL,
  `jamb_score` int(5) NOT NULL,
  `jamb_reg_no` varchar(11) NOT NULL,
  `exam_sitting` int(11) NOT NULL,
  `uploaded_result` tinyint(1) NOT NULL DEFAULT '0',
  `uploaded_birth_cert` tinyint(1) NOT NULL DEFAULT '0',
  `uploaded_lga_cert` tinyint(1) NOT NULL DEFAULT '0',
  `uploaded_jamb_printout` tinyint(1) NOT NULL DEFAULT '0',
  `paid_application_fee` tinyint(1) NOT NULL DEFAULT '0',
  `done_exam` tinyint(1) NOT NULL,
  `admission_no` varchar(100) NOT NULL,
  `admission_status` varchar(100) NOT NULL,
  `confirm_details` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  KEY `user_id` (`user_id`),
  KEY `state` (`state`),
  KEY `lga` (`lga`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `firstname`, `lastname`, `middlename`, `department`, `image`, `title`, `dateofbirth`, `phone`, `user_id`, `alt_contact_rel`, `alt_contact_name`, `alt_contact_phone`, `gender`, `marital_status`, `country`, `lga`, `state`, `address`, `jamb_score`, `jamb_reg_no`, `exam_sitting`, `uploaded_result`, `uploaded_birth_cert`, `uploaded_lga_cert`, `uploaded_jamb_printout`, `paid_application_fee`, `done_exam`, `admission_no`, `admission_status`, `confirm_details`, `datecreated`) VALUES
(1, 'Gloria', 'Okonye', 'Ukamaka', 3, '851Okonye.jpg', 'Ms.', '1996-02-24', '07064936800', 3, 'Parent', 'Mr &amp; Mrs Okonye', '08159277099', 'Female', 'Single', 'Nigeria', 183, 10, '100 Ajuebor Street', 252, '123456GF', 1, 1, 0, 1, 1, 0, 0, 'AP/2019/0003', 'processing', 1, '2019-10-11 13:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `application_exam`
--

DROP TABLE IF EXISTS `application_exam`;
CREATE TABLE IF NOT EXISTS `application_exam` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `score` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_exam`
--

INSERT INTO `application_exam` (`id`, `user_id`, `score`) VALUES
(1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `birth_certs`
--

DROP TABLE IF EXISTS `birth_certs`;
CREATE TABLE IF NOT EXISTS `birth_certs` (
  `id` int(110) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `certificate` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_session`
--

DROP TABLE IF EXISTS `ci_session`;
CREATE TABLE IF NOT EXISTS `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('05ir5mie0j1u5quhb6c4dlcbgdefaeec', '::1', 1570454668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435343636383b),
('0g69a09dv31an9561rh72v6ctpgvd9c3', '::1', 1570855938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303835353734393b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('0gbcqq9bik6lbic7b4a7n50c52e1r1hm', '::1', 1570554588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303535343538383b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('0miats23s17oloj4p1lijhg4guamcqn5', '::1', 1570911155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303931313135353b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('0pa7s4qt00jo3tthu1ohsg6sk34kukkl', '::1', 1570531012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533313031323b),
('0sh7a2uvnbasb27133vnhetrnv170h67', '::1', 1570448018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303434383031383b),
('12vrqf4mfvm52q9hfm9djbhctbb6a8o3', '::1', 1571407121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537313430373032313b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b74786e5f7265667c733a31363a2256686834786d73517949766172466b6e223b7461626c655f747970657c733a31303a226170706c6963616e7473223b7061796d656e745f69647c733a343a2236323037223b616d6f756e747c693a3730303030303b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('3cu6s8sn6qkmvnnns19isprmf0ggm3i2', '::1', 1570805051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830353035313b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('5v9r02rvca3sfbr0k36d5rcd5i37tmb6', '::1', 1570540545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303534303534353b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('5vhffrpiufp4a50urb0so3jsv6pooqie', '::1', 1570451765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435313736353b),
('6gq16hvaadbjh3qqqfsl91t89md1l44i', '::1', 1570802020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830323032303b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('7j3mnsobgeuk9oiakk0btg3fb84j5dii', '::1', 1570854380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303835343338303b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('7spepp5fgrkursesup2qqlr0vd8egr2m', '::1', 1570455434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435353433343b),
('85e9egbedo9mr0l9rgdrevgdb4j83kj5', '::1', 1570455082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435353038323b),
('b4qtq8vpi7l9pio9sd72p1ro4sn0u3t8', '::1', 1570853979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303835333937393b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b5f5f63695f766172737c613a313a7b733a31313a22737563636573735f6d7367223b733a333a226f6c64223b7d),
('bbkvg5ga1uriure9rfkk9h36hs8eo39m', '::1', 1570461888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303436313838383b),
('bgpj5qb7l7bb06h9cgqaarhgg55aa1tg', '::1', 1570801281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830313238313b),
('bi4nopk9fv4s40u2qsrsrhkj883ti7tn', '::1', 1570804298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830343239383b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('bq4i551ltq144a55mvjscsebplckldau', '::1', 1570461327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303436313332373b),
('bvpp520unr2kqglqa5bvg4rl6e8ahsfa', '::1', 1570539475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533393437353b),
('c1ilmrmshd1enqql736cpc8pcgu31q33', '::1', 1570803394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830333339343b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('cfn1l49bmuv021pnq1ilfi7hir7snjln', '::1', 1570805051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830353035313b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('cir3jvtv0ukg0kl13s77tvft82bs267g', '::1', 1570855749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303835353734393b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('dal6lgsfbl3s6nl8l2oj4k97qtkhel7d', '::1', 1570453598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435333539383b),
('dda1rlk20o2dmoaj0qc4lb2da5qusvui', '::1', 1570537266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533373236363b),
('du4fut24l2ot841k3a8pb5pdlrc54a56', '::1', 1570801604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830313630343b),
('er1h55fflaogjpdnathlhurodh8e2v1s', '::1', 1570703619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303730333631393b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2234223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('fhm75ktnqb565t0ld00ruoq2548mfpql', '::1', 1570537836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533373833363b),
('fna6ot809dan1i2i0amancehfeikggdg', '::1', 1570541001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303534313030313b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('fpg4tu23f05fec79i080dv5thilja3gi', '::1', 1570485671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303438353531393b),
('g101o967dpal8o96q5csl05n22d7h57u', '::1', 1570804674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830343637343b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('g7hc2dqkf6hejcb1t30gtbfs67edrbm4', '::1', 1570703942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303730333934323b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2234223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('gfh1q4busatb4orb86d91b2h57tvinmg', '::1', 1570453950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435333935303b),
('gls2d3abbqhvp5kncrf7eojesbollsrp', '::1', 1570855327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303835353332373b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('gq1pg8n1l73q4a8o533gumd356k4e1mu', '::1', 1570704305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303730343237313b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2234223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('hclu8ri4tvoks4lcnu89geq4vdci39fu', '::1', 1570452177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435323137373b),
('hdvun307cd2drtktbde3964mnpsilbkf', '::1', 1570535353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533353335333b),
('ibnt6rqkn9f0bfauj1mb1cbfm7293vmg', '::1', 1570536804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533363830343b),
('kfdr6ah8u80ied89qrhogkrh3k3roal9', '::1', 1570541079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303534313030313b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('m1mbievnr48b4vbmcff412mosja0lusv', '::1', 1570799592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303739393539323b),
('m9ntbd5jnd18243cc78j6j78g2co9hv8', '::1', 1570554593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303535343538383b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('n9ked3j22vqjde3id03qrhe7mp7infjk', '::1', 1570609930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303630393930393b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('nc32rjol0h0vtiqj9e9j7e4pakiidkar', '::1', 1570462238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303436323233383b),
('ne4lehq5m6mf3rk6p2vmd37fcrrlc6ok', '::1', 1570452819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435323831393b),
('p5q4fjpesqoamroham0tj1ferieg21ui', '::1', 1570535658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533353635383b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('q9jqe9qkqmadnn14rsf3fvgfjs03eimm', '::1', 1570911165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303931313135353b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('r6ckglnlfcusa1e3j9j3pdbngt1kmg60', '::1', 1570802508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303830323530383b757365725f69647c733a313a2233223b656d61696c7c733a32333a22676c6f7269616d69636861656c40676d61696c2e636f6d223b6c6576656c7c733a313a2235223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('reunskstdo4s02u5d652vh9ohrmk1575', '::1', 1570704271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303730343237313b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2234223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('sd6nulk8j6p108u396j9n0pvvj5u0lm5', '::1', 1570536192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303533363139323b757365725f69647c733a313a2231223b656d61696c7c733a32373a2261646d696e4064656f67726174696173706f6c792e6564752e6e67223b6c6576656c7c733a313a2231223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('sdb0hv5bpaiqcrlg378hf5gse78cro2d', '::1', 1570462627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303436323535303b),
('t6ndbk9u23gnk3cj22fr0nnj4ivbr7gk', '::1', 1570703292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303730333239323b757365725f69647c733a313a2232223b656d61696c7c733a32363a226d69636861656c6164656b6f6e69796540676d61696c2e636f6d223b6c6576656c7c733a313a2234223b6163746976657c733a313a2231223b6c6f676765645f696e7c623a313b),
('uenqgn4ij1mvlqa9elcp189i0tr6h29g', '::1', 1570452489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435323438393b),
('um9epj7ulb4ocrin1n7fvojdihcc38p0', '::1', 1570454282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303435343238323b),
('urvc6gs9gvoh7lnrl9iv6i69nbrikflp', '::1', 1570718165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303731383135303b),
('uteto6miqtsgh3k0vln58et1ukl37hvi', '::1', 1570485519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303438353531393b),
('vqbcl8gvfc9qhnsv6a7uomu52checn9n', '::1', 1570462550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537303436323535303b);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `units` int(2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `level` int(10) NOT NULL,
  `semester` int(1) NOT NULL,
  `dpt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `details` text NOT NULL,
  `program` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`),
  KEY `program` (`program`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `details`, `program`, `school_id`) VALUES
(1, 'Electrical/Electronics Engineering Studies', 'Electrical/Electronics Engineering Studies', 1, 1),
(2, 'Computer Engineering Technology', 'Computer Engineering Technology', 1, 1),
(3, 'Computer Science', 'Computer Science', 1, 2),
(4, 'Accountancy', 'Accountancy', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `exam_type` int(11) NOT NULL,
  `exam_no` varchar(100) NOT NULL,
  `exam_year` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `exam_type` (`exam_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `user_id`, `exam_type`, `exam_no`, `exam_year`) VALUES
(1, 3, 1, '42316007', '2013-06');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `grade` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`),
  KEY `subject` (`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_results`
--

INSERT INTO `exam_results` (`id`, `exam_id`, `subject`, `grade`) VALUES
(19, 1, 2, 'B3'),
(20, 1, 5, 'C4'),
(21, 1, 6, 'B3'),
(22, 1, 3, 'B3'),
(23, 1, 1, 'B2'),
(24, 1, 26, 'C4'),
(25, 1, 7, 'A1'),
(26, 1, 48, 'B3');

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

DROP TABLE IF EXISTS `exam_type`;
CREATE TABLE IF NOT EXISTS `exam_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_type`
--

INSERT INTO `exam_type` (`id`, `name`) VALUES
(3, 'GCE'),
(2, 'NECO'),
(1, 'WASSCE');

-- --------------------------------------------------------

--
-- Table structure for table `jamb_printouts`
--

DROP TABLE IF EXISTS `jamb_printouts`;
CREATE TABLE IF NOT EXISTS `jamb_printouts` (
  `id` int(110) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `certificate` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jamb_printouts`
--

INSERT INTO `jamb_printouts` (`id`, `user_id`, `certificate`) VALUES
(1, 3, '1898_jamb_printout_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE IF NOT EXISTS `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `name`) VALUES
(1, 'ND1'),
(2, 'ND2'),
(3, 'HND1'),
(4, 'HND2');

-- --------------------------------------------------------

--
-- Table structure for table `lga_certs`
--

DROP TABLE IF EXISTS `lga_certs`;
CREATE TABLE IF NOT EXISTS `lga_certs` (
  `id` int(110) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `certificate` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lga_certs`
--

INSERT INTO `lga_certs` (`id`, `user_id`, `certificate`) VALUES
(1, 3, '1740_lga_cert_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `locals`
--

DROP TABLE IF EXISTS `locals`;
CREATE TABLE IF NOT EXISTS `locals` (
  `local_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `local_name` varchar(100) NOT NULL,
  PRIMARY KEY (`local_id`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=738 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locals`
--

INSERT INTO `locals` (`local_id`, `state_id`, `local_name`) VALUES
(1, 1, 'Aba South'),
(2, 1, 'Arochukwu'),
(3, 1, 'Bende'),
(4, 1, 'Ikwuano'),
(5, 1, 'Isiala Ngwa North'),
(6, 1, 'Isiala Ngwa South'),
(7, 1, 'Isuikwuato'),
(8, 1, 'Obi Ngwa'),
(9, 1, 'Ohafia'),
(10, 1, 'Osisioma'),
(11, 1, 'Ugwunagbo'),
(12, 1, 'Ukwa East'),
(13, 1, 'Ukwa West'),
(14, 1, 'Umuahia North'),
(15, 1, 'Umuahia South'),
(16, 1, 'Umu Nneochi'),
(17, 2, 'Fufure'),
(18, 2, 'Ganye'),
(19, 2, 'Gayuk'),
(20, 2, 'Gombi'),
(21, 2, 'Grie'),
(22, 2, 'Hong'),
(23, 2, 'Jada'),
(24, 2, 'Lamurde'),
(25, 2, 'Madagali'),
(26, 2, 'Maiha'),
(27, 2, 'Mayo Belwa'),
(28, 2, 'Michika'),
(29, 2, 'Mubi North'),
(30, 2, 'Mubi South'),
(31, 2, 'Numan'),
(32, 2, 'Shelleng'),
(33, 2, 'Song'),
(34, 2, 'Toungo'),
(35, 2, 'Yola North'),
(36, 2, 'Yola South'),
(37, 3, 'Eastern Obolo'),
(38, 3, 'Eket'),
(39, 3, 'Esit Eket'),
(40, 3, 'Essien Udim'),
(41, 3, 'Etim Ekpo'),
(42, 3, 'Etinan'),
(43, 3, 'Ibeno'),
(44, 3, 'Ibesikpo Asutan'),
(45, 3, 'Ibiono-Ibom'),
(46, 3, 'Ika'),
(47, 3, 'Ikono'),
(48, 3, 'Ikot Abasi'),
(49, 3, 'Ikot Ekpene'),
(50, 3, 'Ini'),
(51, 3, 'Itu'),
(52, 3, 'Mbo'),
(53, 3, 'Mkpat-Enin'),
(54, 3, 'Nsit-Atai'),
(55, 3, 'Nsit-Ibom'),
(56, 3, 'Nsit-Ubium'),
(57, 3, 'Obot Akara'),
(58, 3, 'Okobo'),
(59, 3, 'Onna'),
(60, 3, 'Oron'),
(61, 3, 'Oruk Anam'),
(62, 3, 'Udung-Uko'),
(63, 3, 'Ukanafun'),
(64, 3, 'Uruan'),
(65, 3, 'Urue-Offong/Oruko'),
(66, 3, 'Uyo'),
(67, 4, 'Anambra East'),
(68, 4, 'Anambra West'),
(69, 4, 'Anaocha'),
(70, 4, 'Awka North'),
(71, 4, 'Awka South'),
(72, 4, 'Ayamelum'),
(73, 4, 'Dunukofia'),
(74, 4, 'Ekwusigo'),
(75, 4, 'Idemili North'),
(76, 4, 'Idemili South'),
(77, 4, 'Ihiala'),
(78, 4, 'Njikoka'),
(79, 4, 'Nnewi North'),
(80, 4, 'Nnewi South'),
(81, 4, 'Ogbaru'),
(82, 4, 'Onitsha North'),
(83, 4, 'Onitsha South'),
(84, 4, 'Orumba North'),
(85, 4, 'Orumba South'),
(86, 4, 'Oyi'),
(87, 5, 'Bauchi'),
(88, 5, 'Bogoro'),
(89, 5, 'Damban'),
(90, 5, 'Darazo'),
(91, 5, 'Dass'),
(92, 5, 'Gamawa'),
(93, 5, 'Ganjuwa'),
(94, 5, 'Giade'),
(95, 5, 'Itas/Gadau'),
(96, 5, 'Jama\'are'),
(97, 5, 'Katagum'),
(98, 5, 'Kirfi'),
(99, 5, 'Misau'),
(100, 5, 'Ningi'),
(101, 5, 'Shira'),
(102, 5, 'Tafawa Balewa'),
(103, 5, 'Toro'),
(104, 5, 'Warji'),
(105, 5, 'Zaki'),
(106, 6, 'Ekeremor'),
(107, 6, 'Kolokuma/Opokuma'),
(108, 6, 'Nembe'),
(109, 6, 'Ogbia'),
(110, 6, 'Sagbama'),
(111, 6, 'Southern Ijaw'),
(112, 6, 'Yenagoa'),
(113, 7, 'Apa'),
(114, 7, 'Ado'),
(115, 7, 'Buruku'),
(116, 7, 'Gboko'),
(117, 7, 'Guma'),
(118, 7, 'Gwer East'),
(119, 7, 'Gwer West'),
(120, 7, 'Katsina-Ala'),
(121, 7, 'Konshisha'),
(122, 7, 'Kwande'),
(123, 7, 'Logo'),
(124, 7, 'Makurdi'),
(125, 7, 'Obi'),
(126, 7, 'Ogbadibo'),
(127, 7, 'Ohimini'),
(128, 7, 'Oju'),
(129, 7, 'Okpokwu'),
(130, 7, 'Oturkpo'),
(131, 7, 'Tarka'),
(132, 7, 'Ukum'),
(133, 7, 'Ushongo'),
(134, 7, 'Vandeikya'),
(135, 8, 'Askira/Uba'),
(136, 8, 'Bama'),
(137, 8, 'Bayo'),
(138, 8, 'Biu'),
(139, 8, 'Chibok'),
(140, 8, 'Damboa'),
(141, 8, 'Dikwa'),
(142, 8, 'Gubio'),
(143, 8, 'Guzamala'),
(144, 8, 'Gwoza'),
(145, 8, 'Hawul'),
(146, 8, 'Jere'),
(147, 8, 'Kaga'),
(148, 8, 'Kala/Balge'),
(149, 8, 'Konduga'),
(150, 8, 'Kukawa'),
(151, 8, 'Kwaya Kusar'),
(152, 8, 'Mafa'),
(153, 8, 'Magumeri'),
(154, 8, 'Maiduguri'),
(155, 8, 'Marte'),
(156, 8, 'Mobbar'),
(157, 8, 'Monguno'),
(158, 8, 'Ngala'),
(159, 8, 'Nganzai'),
(160, 8, 'Shani'),
(161, 9, 'Akamkpa'),
(162, 9, 'Akpabuyo'),
(163, 9, 'Bakassi'),
(164, 9, 'Bekwarra'),
(165, 9, 'Biase'),
(166, 9, 'Boki'),
(167, 9, 'Calabar Municipal'),
(168, 9, 'Calabar South'),
(169, 9, 'Etung'),
(170, 9, 'Ikom'),
(171, 9, 'Obanliku'),
(172, 9, 'Obubra'),
(173, 9, 'Obudu'),
(174, 9, 'Odukpani'),
(175, 9, 'Ogoja'),
(176, 9, 'Yakuur'),
(177, 9, 'Yala'),
(178, 10, 'Aniocha South'),
(179, 10, 'Bomadi'),
(180, 10, 'Burutu'),
(181, 10, 'Ethiope East'),
(182, 10, 'Ethiope West'),
(183, 10, 'Ika North East'),
(184, 10, 'Ika South'),
(185, 10, 'Isoko North'),
(186, 10, 'Isoko South'),
(187, 10, 'Ndokwa East'),
(188, 10, 'Ndokwa West'),
(189, 10, 'Okpe'),
(190, 10, 'Oshimili North'),
(191, 10, 'Oshimili South'),
(192, 10, 'Patani'),
(193, 10, 'Sapele'),
(194, 10, 'Udu'),
(195, 10, 'Ughelli North'),
(196, 10, 'Ughelli South'),
(197, 10, 'Ukwuani'),
(198, 10, 'Uvwie'),
(199, 10, 'Warri North'),
(200, 10, 'Warri South'),
(201, 10, 'Warri South West'),
(202, 11, 'Afikpo North'),
(203, 11, 'Afikpo South'),
(204, 11, 'Ebonyi'),
(205, 11, 'Ezza North'),
(206, 11, 'Ezza South'),
(207, 11, 'Ikwo'),
(208, 11, 'Ishielu'),
(209, 11, 'Ivo'),
(210, 11, 'Izzi'),
(211, 11, 'Ohaozara'),
(212, 11, 'Ohaukwu'),
(213, 11, 'Onicha'),
(214, 12, 'Egor'),
(215, 12, 'Esan Central'),
(216, 12, 'Esan North-East'),
(217, 12, 'Esan South-East'),
(218, 12, 'Esan West'),
(219, 12, 'Etsako Central'),
(220, 12, 'Etsako East'),
(221, 12, 'Etsako West'),
(222, 12, 'Igueben'),
(223, 12, 'Ikpoba Okha'),
(224, 12, 'Orhionmwon'),
(225, 12, 'Oredo'),
(226, 12, 'Ovia North-East'),
(227, 12, 'Ovia South-West'),
(228, 12, 'Owan East'),
(229, 12, 'Owan West'),
(230, 12, 'Uhunmwonde'),
(231, 13, 'Efon'),
(232, 13, 'Ekiti East'),
(233, 13, 'Ekiti South-West'),
(234, 13, 'Ekiti West'),
(235, 13, 'Emure'),
(236, 13, 'Gbonyin'),
(237, 13, 'Ido Osi'),
(238, 13, 'Ijero'),
(239, 13, 'Ikere'),
(240, 13, 'Ikole'),
(241, 13, 'Ilejemeje'),
(242, 13, 'Irepodun/Ifelodun'),
(243, 13, 'Ise/Orun'),
(244, 13, 'Moba'),
(245, 13, 'Oye'),
(246, 14, 'Awgu'),
(247, 14, 'Enugu East'),
(248, 14, 'Enugu North'),
(249, 14, 'Enugu South'),
(250, 14, 'Ezeagu'),
(251, 14, 'Igbo Etiti'),
(252, 14, 'Igbo Eze North'),
(253, 14, 'Igbo Eze South'),
(254, 14, 'Isi Uzo'),
(255, 14, 'Nkanu East'),
(256, 14, 'Nkanu West'),
(257, 14, 'Nsukka'),
(258, 14, 'Oji River'),
(259, 14, 'Udenu'),
(260, 14, 'Udi'),
(261, 14, 'Uzo Uwani'),
(262, 15, 'Bwari'),
(263, 15, 'Gwagwalada'),
(264, 15, 'Kuje'),
(265, 15, 'Kwali'),
(266, 15, 'Municipal Area Council'),
(267, 16, 'Balanga'),
(268, 16, 'Billiri'),
(269, 16, 'Dukku'),
(270, 16, 'Funakaye'),
(271, 16, 'Gombe'),
(272, 16, 'Kaltungo'),
(273, 16, 'Kwami'),
(274, 16, 'Nafada'),
(275, 16, 'Shongom'),
(276, 16, 'Yamaltu/Deba'),
(277, 17, 'Ahiazu Mbaise'),
(278, 17, 'Ehime Mbano'),
(279, 17, 'Ezinihitte'),
(280, 17, 'Ideato North'),
(281, 17, 'Ideato South'),
(282, 17, 'Ihitte/Uboma'),
(283, 17, 'Ikeduru'),
(284, 17, 'Isiala Mbano'),
(285, 17, 'Isu'),
(286, 17, 'Mbaitoli'),
(287, 17, 'Ngor Okpala'),
(288, 17, 'Njaba'),
(289, 17, 'Nkwerre'),
(290, 17, 'Nwangele'),
(291, 17, 'Obowo'),
(292, 17, 'Oguta'),
(293, 17, 'Ohaji/Egbema'),
(294, 17, 'Okigwe'),
(295, 17, 'Orlu'),
(296, 17, 'Orsu'),
(297, 17, 'Oru East'),
(298, 17, 'Oru West'),
(299, 17, 'Owerri Municipal'),
(300, 17, 'Owerri North'),
(301, 17, 'Owerri West'),
(302, 17, 'Unuimo'),
(303, 18, 'Babura'),
(304, 18, 'Biriniwa'),
(305, 18, 'Birnin Kudu'),
(306, 18, 'Buji'),
(307, 18, 'Dutse'),
(308, 18, 'Gagarawa'),
(309, 18, 'Garki'),
(310, 18, 'Gumel'),
(311, 18, 'Guri'),
(312, 18, 'Gwaram'),
(313, 18, 'Gwiwa'),
(314, 18, 'Hadejia'),
(315, 18, 'Jahun'),
(316, 18, 'Kafin Hausa'),
(317, 18, 'Kazaure'),
(318, 18, 'Kiri Kasama'),
(319, 18, 'Kiyawa'),
(320, 18, 'Kaugama'),
(321, 18, 'Maigatari'),
(322, 18, 'Malam Madori'),
(323, 18, 'Miga'),
(324, 18, 'Ringim'),
(325, 18, 'Roni'),
(326, 18, 'Sule Tankarkar'),
(327, 18, 'Taura'),
(328, 18, 'Yankwashi'),
(329, 19, 'Chikun'),
(330, 19, 'Giwa'),
(331, 19, 'Igabi'),
(332, 19, 'Ikara'),
(333, 19, 'Jaba'),
(334, 19, 'Jema\'a'),
(335, 19, 'Kachia'),
(336, 19, 'Kaduna North'),
(337, 19, 'Kaduna South'),
(338, 19, 'Kagarko'),
(339, 19, 'Kajuru'),
(340, 19, 'Kaura'),
(341, 19, 'Kauru'),
(342, 19, 'Kubau'),
(343, 19, 'Kudan'),
(344, 19, 'Lere'),
(345, 19, 'Makarfi'),
(346, 19, 'Sabon Gari'),
(347, 19, 'Sanga'),
(348, 19, 'Soba'),
(349, 19, 'Zangon Kataf'),
(350, 19, 'Zaria'),
(351, 20, 'Albasu'),
(352, 20, 'Bagwai'),
(353, 20, 'Bebeji'),
(354, 20, 'Bichi'),
(355, 20, 'Bunkure'),
(356, 20, 'Dala'),
(357, 20, 'Dambatta'),
(358, 20, 'Dawakin Kudu'),
(359, 20, 'Dawakin Tofa'),
(360, 20, 'Doguwa'),
(361, 20, 'Fagge'),
(362, 20, 'Gabasawa'),
(363, 20, 'Garko'),
(364, 20, 'Garun Mallam'),
(365, 20, 'Gaya'),
(366, 20, 'Gezawa'),
(367, 20, 'Gwale'),
(368, 20, 'Gwarzo'),
(369, 20, 'Kabo'),
(370, 20, 'Kano Municipal'),
(371, 20, 'Karaye'),
(372, 20, 'Kibiya'),
(373, 20, 'Kiru'),
(374, 20, 'Kumbotso'),
(375, 20, 'Kunchi'),
(376, 20, 'Kura'),
(377, 20, 'Madobi'),
(378, 20, 'Makoda'),
(379, 20, 'Minjibir'),
(380, 20, 'Nasarawa'),
(381, 20, 'Rano'),
(382, 20, 'Rimin Gado'),
(383, 20, 'Rogo'),
(384, 20, 'Shanono'),
(385, 20, 'Sumaila'),
(386, 20, 'Takai'),
(387, 20, 'Tarauni'),
(388, 20, 'Tofa'),
(389, 20, 'Tsanyawa'),
(390, 20, 'Tudun Wada'),
(391, 20, 'Ungogo'),
(392, 20, 'Warawa'),
(393, 20, 'Wudil'),
(394, 21, 'Batagarawa'),
(395, 21, 'Batsari'),
(396, 21, 'Baure'),
(397, 21, 'Bindawa'),
(398, 21, 'Charanchi'),
(399, 21, 'Dandume'),
(400, 21, 'Danja'),
(401, 21, 'Dan Musa'),
(402, 21, 'Daura'),
(403, 21, 'Dutsi'),
(404, 21, 'Dutsin Ma'),
(405, 21, 'Faskari'),
(406, 21, 'Funtua'),
(407, 21, 'Ingawa'),
(408, 21, 'Jibia'),
(409, 21, 'Kafur'),
(410, 21, 'Kaita'),
(411, 21, 'Kankara'),
(412, 21, 'Kankia'),
(413, 21, 'Katsina'),
(414, 21, 'Kurfi'),
(415, 21, 'Kusada'),
(416, 21, 'Mai\'Adua'),
(417, 21, 'Malumfashi'),
(418, 21, 'Mani'),
(419, 21, 'Mashi'),
(420, 21, 'Matazu'),
(421, 21, 'Musawa'),
(422, 21, 'Rimi'),
(423, 21, 'Sabuwa'),
(424, 21, 'Safana'),
(425, 21, 'Sandamu'),
(426, 21, 'Zango'),
(427, 22, 'Arewa Dandi'),
(428, 22, 'Argungu'),
(429, 22, 'Augie'),
(430, 22, 'Bagudo'),
(431, 22, 'Birnin Kebbi'),
(432, 22, 'Bunza'),
(433, 22, 'Dandi'),
(434, 22, 'Fakai'),
(435, 22, 'Gwandu'),
(436, 22, 'Jega'),
(437, 22, 'Kalgo'),
(438, 22, 'Koko/Besse'),
(439, 22, 'Maiyama'),
(440, 22, 'Ngaski'),
(441, 22, 'Sakaba'),
(442, 22, 'Shanga'),
(443, 22, 'Suru'),
(444, 22, 'Wasagu/Danko'),
(445, 22, 'Yauri'),
(446, 22, 'Zuru'),
(447, 23, 'Ajaokuta'),
(448, 23, 'Ankpa'),
(449, 23, 'Bassa'),
(450, 23, 'Dekina'),
(451, 23, 'Ibaji'),
(452, 23, 'Idah'),
(453, 23, 'Igalamela Odolu'),
(454, 23, 'Ijumu'),
(455, 23, 'Kabba/Bunu'),
(456, 23, 'Kogi'),
(457, 23, 'Lokoja'),
(458, 23, 'Mopa Muro'),
(459, 23, 'Ofu'),
(460, 23, 'Ogori/Magongo'),
(461, 23, 'Okehi'),
(462, 23, 'Okene'),
(463, 23, 'Olamaboro'),
(464, 23, 'Omala'),
(465, 23, 'Yagba East'),
(466, 23, 'Yagba West'),
(467, 24, 'Baruten'),
(468, 24, 'Edu'),
(469, 24, 'Ekiti'),
(470, 24, 'Ifelodun'),
(471, 24, 'Ilorin East'),
(472, 24, 'Ilorin South'),
(473, 24, 'Ilorin West'),
(474, 24, 'Irepodun'),
(475, 24, 'Isin'),
(476, 24, 'Kaiama'),
(477, 24, 'Moro'),
(478, 24, 'Offa'),
(479, 24, 'Oke Ero'),
(480, 24, 'Oyun'),
(481, 24, 'Pategi'),
(482, 25, 'Ajeromi-Ifelodun'),
(483, 25, 'Alimosho'),
(484, 25, 'Amuwo-Odofin'),
(485, 25, 'Apapa'),
(486, 25, 'Badagry'),
(487, 25, 'Epe'),
(488, 25, 'Eti Osa'),
(489, 25, 'Ibeju-Lekki'),
(490, 25, 'Ifako-Ijaiye'),
(491, 25, 'Ikeja'),
(492, 25, 'Ikorodu'),
(493, 25, 'Kosofe'),
(494, 25, 'Lagos Island'),
(495, 25, 'Lagos Mainland'),
(496, 25, 'Mushin'),
(497, 25, 'Ojo'),
(498, 25, 'Oshodi-Isolo'),
(499, 25, 'Shomolu'),
(500, 25, 'Surulere'),
(501, 26, 'Awe'),
(502, 26, 'Doma'),
(503, 26, 'Karu'),
(504, 26, 'Keana'),
(505, 26, 'Keffi'),
(506, 26, 'Kokona'),
(507, 26, 'Lafia'),
(508, 26, 'Nasarawa'),
(509, 26, 'Nasarawa Egon'),
(510, 26, 'Obi'),
(511, 26, 'Toto'),
(512, 26, 'Wamba'),
(513, 27, 'Agwara'),
(514, 27, 'Bida'),
(515, 27, 'Borgu'),
(516, 27, 'Bosso'),
(517, 27, 'Chanchaga'),
(518, 27, 'Edati'),
(519, 27, 'Gbako'),
(520, 27, 'Gurara'),
(521, 27, 'Katcha'),
(522, 27, 'Kontagora'),
(523, 27, 'Lapai'),
(524, 27, 'Lavun'),
(525, 27, 'Magama'),
(526, 27, 'Mariga'),
(527, 27, 'Mashegu'),
(528, 27, 'Mokwa'),
(529, 27, 'Moya'),
(530, 27, 'Paikoro'),
(531, 27, 'Rafi'),
(532, 27, 'Rijau'),
(533, 27, 'Shiroro'),
(534, 27, 'Suleja'),
(535, 27, 'Tafa'),
(536, 27, 'Wushishi'),
(537, 28, 'Abeokuta South'),
(538, 28, 'Ado-Odo/Ota'),
(539, 28, 'Egbado North'),
(540, 28, 'Egbado South'),
(541, 28, 'Ewekoro'),
(542, 28, 'Ifo'),
(543, 28, 'Ijebu East'),
(544, 28, 'Ijebu North'),
(545, 28, 'Ijebu North East'),
(546, 28, 'Ijebu Ode'),
(547, 28, 'Ikenne'),
(548, 28, 'Imeko Afon'),
(549, 28, 'Ipokia'),
(550, 28, 'Obafemi Owode'),
(551, 28, 'Odeda'),
(552, 28, 'Odogbolu'),
(553, 28, 'Ogun Waterside'),
(554, 28, 'Remo North'),
(555, 28, 'Shagamu'),
(556, 29, 'Akoko North-West'),
(557, 29, 'Akoko South-West'),
(558, 29, 'Akoko South-East'),
(559, 29, 'Akure North'),
(560, 29, 'Akure South'),
(561, 29, 'Ese Odo'),
(562, 29, 'Idanre'),
(563, 29, 'Ifedore'),
(564, 29, 'Ilaje'),
(565, 29, 'Ile Oluji/Okeigbo'),
(566, 29, 'Irele'),
(567, 29, 'Odigbo'),
(568, 29, 'Okitipupa'),
(569, 29, 'Ondo East'),
(570, 29, 'Ondo West'),
(571, 29, 'Ose'),
(572, 29, 'Owo'),
(573, 30, 'Atakunmosa West'),
(574, 30, 'Aiyedaade'),
(575, 30, 'Aiyedire'),
(576, 30, 'Boluwaduro'),
(577, 30, 'Boripe'),
(578, 30, 'Ede North'),
(579, 30, 'Ede South'),
(580, 30, 'Ife Central'),
(581, 30, 'Ife East'),
(582, 30, 'Ife North'),
(583, 30, 'Ife South'),
(584, 30, 'Egbedore'),
(585, 30, 'Ejigbo'),
(586, 30, 'Ifedayo'),
(587, 30, 'Ifelodun'),
(588, 30, 'Ila'),
(589, 30, 'Ilesa East'),
(590, 30, 'Ilesa West'),
(591, 30, 'Irepodun'),
(592, 30, 'Irewole'),
(593, 30, 'Isokan'),
(594, 30, 'Iwo'),
(595, 30, 'Obokun'),
(596, 30, 'Odo Otin'),
(597, 30, 'Ola Oluwa'),
(598, 30, 'Olorunda'),
(599, 30, 'Oriade'),
(600, 30, 'Orolu'),
(601, 30, 'Osogbo'),
(602, 31, 'Akinyele'),
(603, 31, 'Atiba'),
(604, 31, 'Atisbo'),
(605, 31, 'Egbeda'),
(606, 31, 'Ibadan North'),
(607, 31, 'Ibadan North-East'),
(608, 31, 'Ibadan North-West'),
(609, 31, 'Ibadan South-East'),
(610, 31, 'Ibadan South-West'),
(611, 31, 'Ibarapa Central'),
(612, 31, 'Ibarapa East'),
(613, 31, 'Ibarapa North'),
(614, 31, 'Ido'),
(615, 31, 'Irepo'),
(616, 31, 'Iseyin'),
(617, 31, 'Itesiwaju'),
(618, 31, 'Iwajowa'),
(619, 31, 'Kajola'),
(620, 31, 'Lagelu'),
(621, 31, 'Ogbomosho North'),
(622, 31, 'Ogbomosho South'),
(623, 31, 'Ogo Oluwa'),
(624, 31, 'Olorunsogo'),
(625, 31, 'Oluyole'),
(626, 31, 'Ona Ara'),
(627, 31, 'Orelope'),
(628, 31, 'Ori Ire'),
(629, 31, 'Oyo'),
(630, 31, 'Oyo East'),
(631, 31, 'Saki East'),
(632, 31, 'Saki West'),
(633, 31, 'Surulere'),
(634, 32, 'Barkin Ladi'),
(635, 32, 'Bassa'),
(636, 32, 'Jos East'),
(637, 32, 'Jos North'),
(638, 32, 'Jos South'),
(639, 32, 'Kanam'),
(640, 32, 'Kanke'),
(641, 32, 'Langtang South'),
(642, 32, 'Langtang North'),
(643, 32, 'Mangu'),
(644, 32, 'Mikang'),
(645, 32, 'Pankshin'),
(646, 32, 'Qua\'an Pan'),
(647, 32, 'Riyom'),
(648, 32, 'Shendam'),
(649, 32, 'Wase'),
(650, 33, 'Ahoada East'),
(651, 33, 'Ahoada West'),
(652, 33, 'Akuku-Toru'),
(653, 33, 'Andoni'),
(654, 33, 'Asari-Toru'),
(655, 33, 'Bonny'),
(656, 33, 'Degema'),
(657, 33, 'Eleme'),
(658, 33, 'Emuoha'),
(659, 33, 'Etche'),
(660, 33, 'Gokana'),
(661, 33, 'Ikwerre'),
(662, 33, 'Khana'),
(663, 33, 'Obio/Akpor'),
(664, 33, 'Ogba/Egbema/Ndoni'),
(665, 33, 'Ogu/Bolo'),
(666, 33, 'Okrika'),
(667, 33, 'Omuma'),
(668, 33, 'Opobo/Nkoro'),
(669, 33, 'Oyigbo'),
(670, 33, 'Port Harcourt'),
(671, 33, 'Tai'),
(672, 34, 'Bodinga'),
(673, 34, 'Dange Shuni'),
(674, 34, 'Gada'),
(675, 34, 'Goronyo'),
(676, 34, 'Gudu'),
(677, 34, 'Gwadabawa'),
(678, 34, 'Illela'),
(679, 34, 'Isa'),
(680, 34, 'Kebbe'),
(681, 34, 'Kware'),
(682, 34, 'Rabah'),
(683, 34, 'Sabon Birni'),
(684, 34, 'Shagari'),
(685, 34, 'Silame'),
(686, 34, 'Sokoto North'),
(687, 34, 'Sokoto South'),
(688, 34, 'Tambuwal'),
(689, 34, 'Tangaza'),
(690, 34, 'Tureta'),
(691, 34, 'Wamako'),
(692, 34, 'Wurno'),
(693, 34, 'Yabo'),
(694, 35, 'Bali'),
(695, 35, 'Donga'),
(696, 35, 'Gashaka'),
(697, 35, 'Gassol'),
(698, 35, 'Ibi'),
(699, 35, 'Jalingo'),
(700, 35, 'Karim Lamido'),
(701, 35, 'Kumi'),
(702, 35, 'Lau'),
(703, 35, 'Sardauna'),
(704, 35, 'Takum'),
(705, 35, 'Ussa'),
(706, 35, 'Wukari'),
(707, 35, 'Yorro'),
(708, 35, 'Zing'),
(709, 36, 'Bursari'),
(710, 36, 'Damaturu'),
(711, 36, 'Fika'),
(712, 36, 'Fune'),
(713, 36, 'Geidam'),
(714, 36, 'Gujba'),
(715, 36, 'Gulani'),
(716, 36, 'Jakusko'),
(717, 36, 'Karasuwa'),
(718, 36, 'Machina'),
(719, 36, 'Nangere'),
(720, 36, 'Nguru'),
(721, 36, 'Potiskum'),
(722, 36, 'Tarmuwa'),
(723, 36, 'Yunusari'),
(724, 36, 'Yusufari'),
(725, 37, 'Bakura'),
(726, 37, 'Birnin Magaji/Kiyaw'),
(727, 37, 'Bukkuyum'),
(728, 37, 'Bungudu'),
(729, 37, 'Gummi'),
(730, 37, 'Gusau'),
(731, 37, 'Kaura Namoda'),
(732, 37, 'Maradun'),
(733, 37, 'Maru'),
(734, 37, 'Shinkafi'),
(735, 37, 'Talata Mafara'),
(736, 37, 'Chafe'),
(737, 37, 'Zurmi');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(500) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(110) NOT NULL,
  `status` varchar(110) NOT NULL,
  `amount` decimal(65,0) NOT NULL,
  `charge` decimal(10,0) NOT NULL,
  `total` decimal(65,0) NOT NULL,
  `date_initiated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(500) NOT NULL,
  `amount_paid` decimal(65,0) NOT NULL,
  `payment_reference` varchar(500) DEFAULT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `response_code` varchar(500) NOT NULL,
  `response_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `amount` decimal(65,0) NOT NULL,
  `process_charge` decimal(65,0) NOT NULL,
  `total` decimal(65,0) NOT NULL,
  `code` int(5) NOT NULL,
  `product_id` int(3) NOT NULL,
  `remark` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`, `amount`, `process_charge`, `total`, `code`, `product_id`, `remark`) VALUES
(1, 'ND Application Fee', '5000', '1500', '6500', 1001, 101, 'ISO (SCHOOLVILLE-N1,300, INTERSWITCH-N100, BANK-N100)'),
(2, 'Acceptance Fee', '10000', '1500', '11500', 1002, 102, 'ISO (SCHOOLVILLE-N1,300, INTERSWITCH-N100, BANK-N100)'),
(3, 'ND Accounting School Fee', '60000', '1500', '61500', 1003, 103, 'ISO (SCHOOLVILLE-N1,300, INTERSWITCH-N100, BANK-N100)'),
(4, 'ND Others School Fee', '65000', '1500', '66500', 1004, 104, 'ISO (SCHOOLVILLE-N1,300, INTERSWITCH-N100, BANK-N100)');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `short` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `details`, `short`) VALUES
(1, 'National Diploma', 'National Diploma ', 'ND'),
(2, 'Higher National Diploma', 'Higher National Diploma', 'HND');

-- --------------------------------------------------------

--
-- Table structure for table `prospective_students`
--

DROP TABLE IF EXISTS `prospective_students`;
CREATE TABLE IF NOT EXISTS `prospective_students` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `department` int(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(20) NOT NULL,
  `dateofbirth` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alt_contact_rel` varchar(50) NOT NULL,
  `alt_contact_name` varchar(500) NOT NULL,
  `alt_contact_phone` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `lga` int(100) NOT NULL,
  `state` int(50) NOT NULL,
  `address` text NOT NULL,
  `jamb_score` int(5) NOT NULL,
  `jamb_reg_no` varchar(11) NOT NULL,
  `admission_no` varchar(100) NOT NULL,
  `exam_sitting` int(11) NOT NULL,
  `paid_acceptance_fee` tinyint(1) NOT NULL DEFAULT '0',
  `paid_school_fee` tinyint(1) NOT NULL DEFAULT '0',
  `matric_no` varchar(100) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  KEY `user_id` (`user_id`),
  KEY `state` (`state`),
  KEY `lga` (`lga`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prospective_students`
--

INSERT INTO `prospective_students` (`id`, `firstname`, `lastname`, `middlename`, `department`, `image`, `title`, `dateofbirth`, `phone`, `user_id`, `alt_contact_rel`, `alt_contact_name`, `alt_contact_phone`, `gender`, `marital_status`, `country`, `lga`, `state`, `address`, `jamb_score`, `jamb_reg_no`, `admission_no`, `exam_sitting`, `paid_acceptance_fee`, `paid_school_fee`, `matric_no`, `datecreated`) VALUES
(1, 'Adekoniye', 'Adedoyin', 'M', 1, '764Adedoyin.jpg', 'Mr.', '1998-02-04', '08159277099', 2, 'Parent', 'Adekoniye Adedoyin', '9277099', 'Male', 'Single', 'Nigeria', 488, 25, '17babs street', 263, '901292HG', 'AP/2019/0002', 0, 1, 0, '', '2019-10-10 10:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `details`) VALUES
(1, 'Engineering Technology', 'Engineering Technology'),
(2, 'Applied Science', 'Applied Science'),
(3, 'Management Studies', 'Management Studies');

-- --------------------------------------------------------

--
-- Table structure for table `school_session`
--

DROP TABLE IF EXISTS `school_session`;
CREATE TABLE IF NOT EXISTS `school_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(201) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_session`
--

INSERT INTO `school_session` (`id`, `session`, `status`) VALUES
(1, '2019/2020', 'next'),
(2, '2018/2019', 'current');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) NOT NULL,
  `item_setting` bit(1) NOT NULL DEFAULT b'0',
  `item_type` varchar(100) NOT NULL DEFAULT 'settings',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `item_name`, `item_setting`, `item_type`, `datecreated`) VALUES
(1, 'Admission Open', b'1', 'session', '2019-09-19 21:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Abia', '2019-07-27 17:06:52', '2019-07-27 17:13:57'),
(2, 'Adamawa', '2019-07-27 17:06:52', '2019-07-27 17:14:00'),
(3, 'Akwa Ibom', '2019-07-27 17:06:52', '2019-07-27 17:14:04'),
(4, 'Anambra', '2019-07-27 17:06:52', '2019-07-27 17:14:08'),
(5, 'Bauchi', '2019-07-27 17:06:52', '2019-07-27 17:14:12'),
(6, 'Bayelsa', '2019-07-27 17:06:52', '2019-07-27 17:14:15'),
(7, 'Benue', '2019-07-27 17:06:52', '2019-07-27 17:14:18'),
(8, 'Bornu', '2019-07-27 17:06:52', '2019-07-27 17:14:23'),
(9, 'Cross River', '2019-07-27 17:06:52', '2019-07-27 17:14:26'),
(10, 'Delta', '2019-07-27 17:06:52', '2019-07-27 17:14:29'),
(11, 'Ebonyi', '2019-07-27 17:06:52', '2019-07-27 17:14:34'),
(12, 'Edo', '2019-07-27 17:06:52', '2019-07-27 17:14:40'),
(13, 'Ekiti', '2019-07-27 17:06:52', '2019-07-27 17:14:43'),
(14, 'Enugu', '2019-07-27 17:06:52', '2019-07-27 17:14:49'),
(15, 'FCT', '2019-07-27 17:06:52', '2019-07-27 17:14:53'),
(16, 'Gombe', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(17, 'Imo', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(18, 'Jigawa', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(19, 'Kaduna', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(20, 'Kano', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(21, 'Katsina', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(22, 'Kebbi', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(23, 'Kogi', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(24, 'Kwara', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(25, 'Lagos', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(26, 'Nasarawa', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(27, 'Niger', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(28, 'Ogun', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(29, 'Ondo', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(30, 'Osun', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(31, 'Oyo', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(32, 'Plateau', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(33, 'Rivers', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(34, 'Sokoto', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(35, 'Taraba', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(36, 'Yobe', '2019-07-27 17:06:52', '2019-07-27 17:06:52'),
(37, 'Zamfara', '2019-07-27 17:06:52', '2019-07-27 17:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `department` int(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(20) NOT NULL,
  `dateofbirth` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alt_contact_rel` varchar(50) NOT NULL,
  `alt_contact_name` varchar(500) NOT NULL,
  `alt_contact_phone` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `lga` int(100) NOT NULL,
  `state` int(50) NOT NULL,
  `address` text NOT NULL,
  `jamb_score` int(5) NOT NULL,
  `jamb_reg_no` varchar(11) NOT NULL,
  `admission_no` varchar(100) NOT NULL,
  `exam_sitting` int(11) NOT NULL,
  `paid_school_fee_1` tinyint(1) NOT NULL DEFAULT '0',
  `paid_school_fee_2` tinyint(1) NOT NULL DEFAULT '0',
  `matric_no` varchar(100) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `department` (`department`),
  KEY `user_id` (`user_id`),
  KEY `state` (`state`),
  KEY `lga` (`lga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_clearance`
--

DROP TABLE IF EXISTS `student_clearance`;
CREATE TABLE IF NOT EXISTS `student_clearance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `matric_no` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matric_no` (`matric_no`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
CREATE TABLE IF NOT EXISTS `student_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `matric_no` varchar(100) NOT NULL,
  `course_id` int(111) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_level`
--

DROP TABLE IF EXISTS `student_level`;
CREATE TABLE IF NOT EXISTS `student_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `matric_no` varchar(111) NOT NULL,
  `current_level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(7, 'Agricultural Science'),
(12, 'Animal Husbandry'),
(15, 'Automobile Parts Merchandising'),
(6, 'Biology'),
(16, 'Book Keeping'),
(42, 'Catering Craft Practice'),
(1, 'Chemistry'),
(29, 'Christian Studies'),
(11, 'Civic Education'),
(43, 'Clothing & Textile'),
(17, 'Commerce'),
(8, 'Computer & IT'),
(44, 'Cosmetology'),
(37, 'Dyeing & Bleaching'),
(26, 'Economics'),
(5, 'English Language'),
(18, 'Financial Accounting'),
(13, 'Fisheries'),
(45, 'Food & Nutrition'),
(33, 'French'),
(4, 'Further Mathematics'),
(46, 'Garment Making'),
(2, 'General Mathematics'),
(48, 'Geography'),
(28, 'Government'),
(36, 'Hausa'),
(9, 'Health Education'),
(32, 'History'),
(47, 'Home Management'),
(34, 'Igbo'),
(19, 'Insurance'),
(30, 'Islamic Studies'),
(27, 'Literature in English'),
(14, 'Marketing'),
(31, 'Music'),
(20, 'Office Practice'),
(39, 'Painting & Decorating'),
(38, 'Photography'),
(10, 'Physical Education'),
(3, 'Physics'),
(21, 'Salesmanship'),
(22, 'Stenography'),
(23, 'Store Keeping'),
(24, 'Store Management'),
(40, 'Tourism'),
(25, 'Type Writing'),
(41, 'Visual Art'),
(35, 'Yoruba');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `matric_no` varchar(28) NOT NULL,
  `user_password` text NOT NULL,
  `user_level` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `matric_no`, `user_password`, `user_level`, `active`) VALUES
(1, 'admin@calvarypoly.edu.ng', 'administrator', '441af4e13a08eb1303d1342fbb0589f3', 1, b'1'),
(2, 'michaeladekoniye@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 4, b'1'),
(3, 'gloriamichael@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 5, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `level`, `name`) VALUES
(1, '1', 'admin'),
(2, '2', 'lecturer'),
(3, '3', 'student'),
(4, '4', 'prospective-student'),
(5, '5', 'applicant'),
(6, '6', 'bursar'),
(7, '7', 'hod');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `applicants_ibfk_2` FOREIGN KEY (`department`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `applicants_ibfk_3` FOREIGN KEY (`lga`) REFERENCES `locals` (`local_id`),
  ADD CONSTRAINT `applicants_ibfk_4` FOREIGN KEY (`state`) REFERENCES `states` (`id`);

--
-- Constraints for table `application_exam`
--
ALTER TABLE `application_exam`
  ADD CONSTRAINT `application_exam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `birth_certs`
--
ALTER TABLE `birth_certs`
  ADD CONSTRAINT `birth_certs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `departments_ibfk_2` FOREIGN KEY (`program`) REFERENCES `programs` (`id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`exam_type`) REFERENCES `exam_type` (`id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `locals`
--
ALTER TABLE `locals`
  ADD CONSTRAINT `locals_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`type`) REFERENCES `payment_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
