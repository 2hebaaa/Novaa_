-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2026 at 11:34 PM
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
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('present','absent') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `course_id`, `date`, `status`) VALUES
(1, 89, 2, '2026-04-01', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `doctor_id`) VALUES
(1, 'CCNA R&S I', 1),
(2, 'Database Programming 2', 1),
(3, 'Capstone Design', 2),
(4, 'Web Programming (2)', 3),
(5, 'Java Programming (1)', 3),
(6, 'Data Structure', 4);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `group_id` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `group_id`) VALUES
(1, 9, 1, 'A'),
(2, 9, 2, 'A'),
(3, 9, 3, 'A'),
(4, 9, 4, 'A'),
(5, 9, 5, 'A'),
(6, 9, 6, 'A'),
(7, 10, 1, 'A'),
(8, 10, 2, 'A'),
(9, 10, 3, 'A'),
(10, 10, 4, 'A'),
(11, 10, 5, 'A'),
(12, 10, 6, 'A'),
(13, 11, 1, 'A'),
(14, 11, 2, 'A'),
(15, 11, 3, 'A'),
(16, 11, 4, 'A'),
(17, 11, 5, 'A'),
(18, 11, 6, 'A'),
(19, 12, 1, 'A'),
(20, 12, 2, 'A'),
(21, 12, 3, 'A'),
(22, 12, 4, 'A'),
(23, 12, 5, 'A'),
(24, 12, 6, 'A'),
(25, 13, 1, 'A'),
(26, 13, 2, 'A'),
(27, 13, 3, 'A'),
(28, 13, 4, 'A'),
(29, 13, 5, 'A'),
(30, 13, 6, 'A'),
(31, 14, 1, 'A'),
(32, 14, 2, 'A'),
(33, 14, 3, 'A'),
(34, 14, 4, 'A'),
(35, 14, 5, 'A'),
(36, 14, 6, 'A'),
(37, 15, 1, 'A'),
(38, 15, 2, 'A'),
(39, 15, 3, 'A'),
(40, 15, 4, 'A'),
(41, 15, 5, 'A'),
(42, 15, 6, 'A'),
(43, 16, 1, 'A'),
(44, 16, 2, 'A'),
(45, 16, 3, 'A'),
(46, 16, 4, 'A'),
(47, 16, 5, 'A'),
(48, 16, 6, 'A'),
(49, 17, 1, 'A'),
(50, 17, 2, 'A'),
(51, 17, 3, 'A'),
(52, 17, 4, 'A'),
(53, 17, 5, 'A'),
(54, 17, 6, 'A'),
(55, 18, 1, 'A'),
(56, 18, 2, 'A'),
(57, 18, 3, 'A'),
(58, 18, 4, 'A'),
(59, 18, 5, 'A'),
(60, 18, 6, 'A'),
(61, 19, 1, 'A'),
(62, 19, 2, 'A'),
(63, 19, 3, 'A'),
(64, 19, 4, 'A'),
(65, 19, 5, 'A'),
(66, 19, 6, 'A'),
(67, 20, 1, 'A'),
(68, 20, 2, 'A'),
(69, 20, 3, 'A'),
(70, 20, 4, 'A'),
(71, 20, 5, 'A'),
(72, 20, 6, 'A'),
(73, 21, 1, 'A'),
(74, 21, 2, 'A'),
(75, 21, 3, 'A'),
(76, 21, 4, 'A'),
(77, 21, 5, 'A'),
(78, 21, 6, 'A'),
(79, 22, 1, 'A'),
(80, 22, 2, 'A'),
(81, 22, 3, 'A'),
(82, 22, 4, 'A'),
(83, 22, 5, 'A'),
(84, 22, 6, 'A'),
(85, 23, 1, 'A'),
(86, 23, 2, 'A'),
(87, 23, 3, 'A'),
(88, 23, 4, 'A'),
(89, 23, 5, 'A'),
(90, 23, 6, 'A'),
(91, 24, 1, 'A'),
(92, 24, 2, 'A'),
(93, 24, 3, 'A'),
(94, 24, 4, 'A'),
(95, 24, 5, 'A'),
(96, 24, 6, 'A'),
(97, 25, 1, 'A'),
(98, 25, 2, 'A'),
(99, 25, 3, 'A'),
(100, 25, 4, 'A'),
(101, 25, 5, 'A'),
(102, 25, 6, 'A'),
(103, 26, 1, 'A'),
(104, 26, 2, 'A'),
(105, 26, 3, 'A'),
(106, 26, 4, 'A'),
(107, 26, 5, 'A'),
(108, 26, 6, 'A'),
(109, 27, 1, 'A'),
(110, 27, 2, 'A'),
(111, 27, 3, 'A'),
(112, 27, 4, 'A'),
(113, 27, 5, 'A'),
(114, 27, 6, 'A'),
(115, 28, 1, 'A'),
(116, 28, 2, 'A'),
(117, 28, 3, 'A'),
(118, 28, 4, 'A'),
(119, 28, 5, 'A'),
(120, 28, 6, 'A'),
(121, 29, 1, 'A'),
(122, 29, 2, 'A'),
(123, 29, 3, 'A'),
(124, 29, 4, 'A'),
(125, 29, 5, 'A'),
(126, 29, 6, 'A'),
(127, 30, 1, 'A'),
(128, 30, 2, 'A'),
(129, 30, 3, 'A'),
(130, 30, 4, 'A'),
(131, 30, 5, 'A'),
(132, 30, 6, 'A'),
(133, 31, 1, 'A'),
(134, 31, 2, 'A'),
(135, 31, 3, 'A'),
(136, 31, 4, 'A'),
(137, 31, 5, 'A'),
(138, 31, 6, 'A'),
(139, 32, 1, 'A'),
(140, 32, 2, 'A'),
(141, 32, 3, 'A'),
(142, 32, 4, 'A'),
(143, 32, 5, 'A'),
(144, 32, 6, 'A'),
(145, 33, 1, 'A'),
(146, 33, 2, 'A'),
(147, 33, 3, 'A'),
(148, 33, 4, 'A'),
(149, 33, 5, 'A'),
(150, 33, 6, 'A'),
(151, 34, 1, 'A'),
(152, 34, 2, 'A'),
(153, 34, 3, 'A'),
(154, 34, 4, 'A'),
(155, 34, 5, 'A'),
(156, 34, 6, 'A'),
(157, 35, 1, 'A'),
(158, 35, 2, 'A'),
(159, 35, 3, 'A'),
(160, 35, 4, 'A'),
(161, 35, 5, 'A'),
(162, 35, 6, 'A'),
(163, 36, 1, 'A'),
(164, 36, 2, 'A'),
(165, 36, 3, 'A'),
(166, 36, 4, 'A'),
(167, 36, 5, 'A'),
(168, 36, 6, 'A'),
(169, 37, 1, 'A'),
(170, 37, 2, 'A'),
(171, 37, 3, 'A'),
(172, 37, 4, 'A'),
(173, 37, 5, 'A'),
(174, 37, 6, 'A'),
(175, 38, 1, 'A'),
(176, 38, 2, 'A'),
(177, 38, 3, 'A'),
(178, 38, 4, 'A'),
(179, 38, 5, 'A'),
(180, 38, 6, 'A'),
(181, 39, 1, 'A'),
(182, 39, 2, 'A'),
(183, 39, 3, 'A'),
(184, 39, 4, 'A'),
(185, 39, 5, 'A'),
(186, 39, 6, 'A'),
(187, 40, 1, 'A'),
(188, 40, 2, 'A'),
(189, 40, 3, 'A'),
(190, 40, 4, 'A'),
(191, 40, 5, 'A'),
(192, 40, 6, 'A'),
(193, 41, 1, 'A'),
(194, 41, 2, 'A'),
(195, 41, 3, 'A'),
(196, 41, 4, 'A'),
(197, 41, 5, 'A'),
(198, 41, 6, 'A'),
(199, 42, 1, 'A'),
(200, 42, 2, 'A'),
(201, 42, 3, 'A'),
(202, 42, 4, 'A'),
(203, 42, 5, 'A'),
(204, 42, 6, 'A'),
(205, 43, 1, 'A'),
(206, 43, 2, 'A'),
(207, 43, 3, 'A'),
(208, 43, 4, 'A'),
(209, 43, 5, 'A'),
(210, 43, 6, 'A'),
(211, 44, 1, 'A'),
(212, 44, 2, 'A'),
(213, 44, 3, 'A'),
(214, 44, 4, 'A'),
(215, 44, 5, 'A'),
(216, 44, 6, 'A'),
(217, 45, 1, 'A'),
(218, 45, 2, 'A'),
(219, 45, 3, 'A'),
(220, 45, 4, 'A'),
(221, 45, 5, 'A'),
(222, 45, 6, 'A'),
(223, 46, 1, 'A'),
(224, 46, 2, 'A'),
(225, 46, 3, 'A'),
(226, 46, 4, 'A'),
(227, 46, 5, 'A'),
(228, 46, 6, 'A'),
(229, 47, 1, 'A'),
(230, 47, 2, 'A'),
(231, 47, 3, 'A'),
(232, 47, 4, 'A'),
(233, 47, 5, 'A'),
(234, 47, 6, 'A'),
(235, 48, 1, 'A'),
(236, 48, 2, 'A'),
(237, 48, 3, 'A'),
(238, 48, 4, 'A'),
(239, 48, 5, 'A'),
(240, 48, 6, 'A'),
(241, 49, 1, 'A'),
(242, 49, 2, 'A'),
(243, 49, 3, 'A'),
(244, 49, 4, 'A'),
(245, 49, 5, 'A'),
(246, 49, 6, 'A'),
(247, 50, 1, 'A'),
(248, 50, 2, 'A'),
(249, 50, 3, 'A'),
(250, 50, 4, 'A'),
(251, 50, 5, 'A'),
(252, 50, 6, 'A'),
(253, 51, 1, 'A'),
(254, 51, 2, 'A'),
(255, 51, 3, 'A'),
(256, 51, 4, 'A'),
(257, 51, 5, 'A'),
(258, 51, 6, 'A'),
(259, 52, 1, 'A'),
(260, 52, 2, 'A'),
(261, 52, 3, 'A'),
(262, 52, 4, 'A'),
(263, 52, 5, 'A'),
(264, 52, 6, 'A'),
(265, 53, 1, 'A'),
(266, 53, 2, 'A'),
(267, 53, 3, 'A'),
(268, 53, 4, 'A'),
(269, 53, 5, 'A'),
(270, 53, 6, 'A'),
(271, 54, 1, 'A'),
(272, 54, 2, 'A'),
(273, 54, 3, 'A'),
(274, 54, 4, 'A'),
(275, 54, 5, 'A'),
(276, 54, 6, 'A'),
(277, 55, 1, 'A'),
(278, 55, 2, 'A'),
(279, 55, 3, 'A'),
(280, 55, 4, 'A'),
(281, 55, 5, 'A'),
(282, 55, 6, 'A'),
(283, 56, 1, 'A'),
(284, 56, 2, 'A'),
(285, 56, 3, 'A'),
(286, 56, 4, 'A'),
(287, 56, 5, 'A'),
(288, 56, 6, 'A'),
(289, 57, 1, 'A'),
(290, 57, 2, 'A'),
(291, 57, 3, 'A'),
(292, 57, 4, 'A'),
(293, 57, 5, 'A'),
(294, 57, 6, 'A'),
(295, 58, 1, 'A'),
(296, 58, 2, 'A'),
(297, 58, 3, 'A'),
(298, 58, 4, 'A'),
(299, 58, 5, 'A'),
(300, 58, 6, 'A'),
(301, 59, 1, 'A'),
(302, 59, 2, 'A'),
(303, 59, 3, 'A'),
(304, 59, 4, 'A'),
(305, 59, 5, 'A'),
(306, 59, 6, 'A'),
(307, 60, 1, 'A'),
(308, 60, 2, 'A'),
(309, 60, 3, 'A'),
(310, 60, 4, 'A'),
(311, 60, 5, 'A'),
(312, 60, 6, 'A'),
(313, 61, 1, 'A'),
(314, 61, 2, 'A'),
(315, 61, 3, 'A'),
(316, 61, 4, 'A'),
(317, 61, 5, 'A'),
(318, 61, 6, 'A'),
(319, 62, 1, 'A'),
(320, 62, 2, 'A'),
(321, 62, 3, 'A'),
(322, 62, 4, 'A'),
(323, 62, 5, 'A'),
(324, 62, 6, 'A'),
(325, 63, 1, 'A'),
(326, 63, 2, 'A'),
(327, 63, 3, 'A'),
(328, 63, 4, 'A'),
(329, 63, 5, 'A'),
(330, 63, 6, 'A'),
(331, 64, 1, 'A'),
(332, 64, 2, 'A'),
(333, 64, 3, 'A'),
(334, 64, 4, 'A'),
(335, 64, 5, 'A'),
(336, 64, 6, 'A'),
(337, 65, 1, 'A'),
(338, 65, 2, 'A'),
(339, 65, 3, 'A'),
(340, 65, 4, 'A'),
(341, 65, 5, 'A'),
(342, 65, 6, 'A'),
(343, 66, 1, 'A'),
(344, 66, 2, 'A'),
(345, 66, 3, 'A'),
(346, 66, 4, 'A'),
(347, 66, 5, 'A'),
(348, 66, 6, 'A'),
(349, 67, 1, 'A'),
(350, 67, 2, 'A'),
(351, 67, 3, 'A'),
(352, 67, 4, 'A'),
(353, 67, 5, 'A'),
(354, 67, 6, 'A'),
(355, 68, 1, 'A'),
(356, 68, 2, 'A'),
(357, 68, 3, 'A'),
(358, 68, 4, 'A'),
(359, 68, 5, 'A'),
(360, 68, 6, 'A'),
(361, 69, 1, 'A'),
(362, 69, 2, 'A'),
(363, 69, 3, 'A'),
(364, 69, 4, 'A'),
(365, 69, 5, 'A'),
(366, 69, 6, 'A'),
(367, 70, 1, 'A'),
(368, 70, 2, 'A'),
(369, 70, 3, 'A'),
(370, 70, 4, 'A'),
(371, 70, 5, 'A'),
(372, 70, 6, 'A'),
(373, 71, 1, 'A'),
(374, 71, 2, 'A'),
(375, 71, 3, 'A'),
(376, 71, 4, 'A'),
(377, 71, 5, 'A'),
(378, 71, 6, 'A'),
(379, 72, 1, 'A'),
(380, 72, 2, 'A'),
(381, 72, 3, 'A'),
(382, 72, 4, 'A'),
(383, 72, 5, 'A'),
(384, 72, 6, 'A'),
(385, 73, 1, 'A'),
(386, 73, 2, 'A'),
(387, 73, 3, 'A'),
(388, 73, 4, 'A'),
(389, 73, 5, 'A'),
(390, 73, 6, 'A'),
(391, 74, 1, 'A'),
(392, 74, 2, 'A'),
(393, 74, 3, 'A'),
(394, 74, 4, 'A'),
(395, 74, 5, 'A'),
(396, 74, 6, 'A'),
(397, 75, 1, 'A'),
(398, 75, 2, 'A'),
(399, 75, 3, 'A'),
(400, 75, 4, 'A'),
(401, 75, 5, 'A'),
(402, 75, 6, 'A'),
(403, 76, 1, 'A'),
(404, 76, 2, 'A'),
(405, 76, 3, 'A'),
(406, 76, 4, 'A'),
(407, 76, 5, 'A'),
(408, 76, 6, 'A'),
(409, 77, 1, 'A'),
(410, 77, 2, 'A'),
(411, 77, 3, 'A'),
(412, 77, 4, 'A'),
(413, 77, 5, 'A'),
(414, 77, 6, 'A'),
(415, 78, 1, 'A'),
(416, 78, 2, 'A'),
(417, 78, 3, 'A'),
(418, 78, 4, 'A'),
(419, 78, 5, 'A'),
(420, 78, 6, 'A'),
(421, 79, 1, 'A'),
(422, 79, 2, 'A'),
(423, 79, 3, 'A'),
(424, 79, 4, 'A'),
(425, 79, 5, 'A'),
(426, 79, 6, 'A'),
(427, 80, 1, 'A'),
(428, 80, 2, 'A'),
(429, 80, 3, 'A'),
(430, 80, 4, 'A'),
(431, 80, 5, 'A'),
(432, 80, 6, 'A'),
(433, 81, 1, 'A'),
(434, 81, 2, 'A'),
(435, 81, 3, 'A'),
(436, 81, 4, 'A'),
(437, 81, 5, 'A'),
(438, 81, 6, 'A'),
(439, 82, 1, 'A'),
(440, 82, 2, 'A'),
(441, 82, 3, 'A'),
(442, 82, 4, 'A'),
(443, 82, 5, 'A'),
(444, 82, 6, 'A'),
(445, 83, 1, 'A'),
(446, 83, 2, 'A'),
(447, 83, 3, 'A'),
(448, 83, 4, 'A'),
(449, 83, 5, 'A'),
(450, 83, 6, 'A'),
(451, 84, 1, 'A'),
(452, 84, 2, 'A'),
(453, 84, 3, 'A'),
(454, 84, 4, 'A'),
(455, 84, 5, 'A'),
(456, 84, 6, 'A'),
(457, 85, 1, 'A'),
(458, 85, 2, 'A'),
(459, 85, 3, 'A'),
(460, 85, 4, 'A'),
(461, 85, 5, 'A'),
(462, 85, 6, 'A'),
(463, 86, 1, 'A'),
(464, 86, 2, 'A'),
(465, 86, 3, 'A'),
(466, 86, 4, 'A'),
(467, 86, 5, 'A'),
(468, 86, 6, 'A'),
(469, 87, 1, 'A'),
(470, 87, 2, 'A'),
(471, 87, 3, 'A'),
(472, 87, 4, 'A'),
(473, 87, 5, 'A'),
(474, 87, 6, 'A'),
(475, 88, 1, 'A'),
(476, 88, 2, 'A'),
(477, 88, 3, 'A'),
(478, 88, 4, 'A'),
(479, 88, 5, 'A'),
(480, 88, 6, 'A'),
(481, 89, 1, 'A'),
(482, 89, 2, 'A'),
(483, 89, 3, 'A'),
(484, 89, 4, 'A'),
(485, 89, 5, 'A'),
(486, 89, 6, 'A'),
(487, 90, 1, 'A'),
(488, 90, 2, 'A'),
(489, 90, 3, 'A'),
(490, 90, 4, 'A'),
(491, 90, 5, 'A'),
(492, 90, 6, 'A'),
(493, 91, 1, 'A'),
(494, 91, 2, 'A'),
(495, 91, 3, 'A'),
(496, 91, 4, 'A'),
(497, 91, 5, 'A'),
(498, 91, 6, 'A'),
(499, 92, 1, 'A'),
(500, 92, 2, 'A'),
(501, 92, 3, 'A'),
(502, 92, 4, 'A'),
(503, 92, 5, 'A'),
(504, 92, 6, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('lecture','assignment') DEFAULT 'lecture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `course_id`, `title`, `file`, `created_at`, `type`) VALUES
(1, 2, 'lecture1', 'DBP_SP26-Lect (1-2).pdf', '2026-04-01 03:21:56', 'lecture');

-- --------------------------------------------------------

--
-- Table structure for table `material_files`
--

CREATE TABLE `material_files` (
  `id` int(11) NOT NULL,
  `material_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_files`
--

INSERT INTO `material_files` (`id`, `material_id`, `file_name`, `created_at`) VALUES
(1, 2, 'DBP_SP26-Ass1_Code.pdf', '2026-04-01 03:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `student_id`, `course_id`, `title`, `file`, `created_at`) VALUES
(1, 89, 3, 'Our Project', '1776485438_lms_project.rar', '2026-04-18 04:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `final` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `course_id`, `mid`, `final`, `total`) VALUES
(1, 89, 2, 20, 80, 100);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `group_id` varchar(10) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `instructor` varchar(100) DEFAULT NULL,
  `course_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `group_id`, `day`, `time_slot`, `course_name`, `room`, `instructor`, `course_id`, `created_at`) VALUES
(1, 'B', 'Saturday', '9-11', 'CCNA R&S I', 'A106', 'م. احمد فتحي', 'CCNA101', '2026-04-17 23:24:05'),
(2, 'C', 'Saturday', '9-12', 'Database Programming', 'A105', 'م. بسمة رمضان', 'DB101', '2026-04-17 23:24:05'),
(3, 'A', 'Saturday', '12-2', 'CCNA R&S I', 'A106', 'م. احمد فتحي', 'CCNA101', '2026-04-17 23:24:05'),
(4, 'B', 'Saturday', '1-4', 'Database Programming', 'A105', 'م. بسمة رمضان', 'DB101', '2026-04-17 23:24:05'),
(5, 'ALL', 'Sunday', '10-12', 'CCNA R&S I', 'A325', 'د. اسامة مختار', 'CCNA101', '2026-04-17 23:24:05'),
(6, 'ALL', 'Sunday', '11-12', 'Database Programming', 'A325', 'د. اسامة مختار', 'DB101', '2026-04-17 23:24:05'),
(7, 'B', 'Sunday', '12-2', 'Data Structure', 'A205', 'م. ربيع', 'DS101', '2026-04-17 23:24:05'),
(8, 'C', 'Sunday', '2-4', 'Data Structure', 'A205', 'م. ربيع', 'DS101', '2026-04-17 23:24:05'),
(9, 'C', 'Sunday', '12-1', 'CCNA R&S I', 'A106', 'م. احمد فتحي', 'CCNA101', '2026-04-17 23:24:05'),
(10, 'ALL', 'Monday', '9-11', 'Data Structure', 'A325', 'د. عبير ايوب', 'DS101', '2026-04-17 23:24:05'),
(11, 'A', 'Monday', '11-12', 'Java Programming I', 'A105', 'م. اسراء حاتم', 'JAVA101', '2026-04-17 23:24:05'),
(12, 'ALL', 'Monday', '12-1', 'Java Programming I', 'A101', 'م. سارة محمد', 'JAVA101', '2026-04-17 23:24:05'),
(13, 'A', 'Monday', '2-4', 'Java Programming I', 'A105', 'م. اسراء حاتم', 'JAVA101', '2026-04-17 23:24:05'),
(14, 'A', 'Tuesday', '10-11', 'Data Structure', 'A205', 'م. ربيع', 'DS101', '2026-04-17 23:24:05'),
(15, 'B', 'Tuesday', '11-12', 'Web Programming II', 'A204', 'م. منى', 'WEB201', '2026-04-17 23:24:05'),
(16, 'C', 'Tuesday', '12-1', 'Java Programming I', 'A104', 'م. اسراء حاتم', 'JAVA101', '2026-04-17 23:24:05'),
(17, 'A', 'Tuesday', '2-3', 'Database Programming', 'A105', 'م. بسمة رمضان', 'DB101', '2026-04-17 23:24:05'),
(18, 'B', 'Tuesday', '3-4', 'Web Programming II', 'A204', 'م. منى', 'WEB201', '2026-04-17 23:24:05'),
(19, 'C', 'Tuesday', '4-5', 'Java Programming I', 'A104', 'م. اسراء حاتم', 'JAVA101', '2026-04-17 23:24:05'),
(20, 'C', 'Wednesday', '9-12', 'Web Programming II', 'A204', 'م. منى', 'WEB201', '2026-04-17 23:24:05'),
(21, 'B', 'Wednesday', '10-2', 'Java Programming I', 'A105', 'م. اسراء حاتم', 'JAVA101', '2026-04-17 23:24:05'),
(22, 'ALL', 'Thursday', '10-2', 'Capstone Design', 'A313', 'م. احمد فتحي', 'CAP101', '2026-04-17 23:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `training_name` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `period` varchar(100) DEFAULT NULL,
  `total_weeks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('student','doctor') DEFAULT NULL,
  `group` varchar(1) DEFAULT 'A',
  `image` varchar(255) DEFAULT 'default.png',
  `group_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `group`, `image`, `group_id`) VALUES
(1, 'Dr Osama Mokhtar', 'osama@btu.edu.eg', '$2y$10$a9NPi06LC.pvoyJCm2FhcOV1FHmqefEh2k9MQF6Mf0oHARPfHxUnG', 'doctor', 'A', 'default.png', 'A'),
(2, 'Dr Ahmed Fathy', 'ahmed.fathy@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(3, 'Dr Sara Mohamed', 'sara@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(4, 'Dr Abeer Ayoub', 'abeer@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(5, 'Dr Basma Elshoky', 'basma@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(6, 'Dr Mona Abdelaziz', 'mona@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(7, 'Dr Esraa Hatem', 'esraa@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(8, 'Dr Rabie Masoud', 'rabie@btu.edu.eg', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'A', 'default.png', 'A'),
(9, 'Ibrahim Atef Ezzat Zaki', 'Ibrahim.20241@btu.edu.eg', 'b2d042a58596f14030e917b56a6567a1', 'student', 'A', 'default.png', 'A'),
(10, 'Ahmed Gamal El Sayed Mohamed', 'Ahmed.20242@btu.edu.eg', '336939ac941506a60b9fe99fe9fb2086', 'student', 'A', 'default.png', 'A'),
(11, 'Ahmed Rabie Mohamed Abdel Latif', 'Ahmed.20243@btu.edu.eg', '769f8f418237a826f43b8738aa7f9df8', 'student', 'A', 'default.png', 'A'),
(12, 'Ahmed Fathy Ramadan Saeed', 'Ahmed.20244@btu.edu.eg', 'c8d4d1e863b8f16f6c80b2e7385ec0d3', 'student', 'A', 'default.png', 'A'),
(13, 'Adham Mokhtar Taha Tamam', 'Adham.20245@btu.edu.eg', '7f1dcd1e0dd5491888bdade32e7c471b', 'student', 'A', 'default.png', 'A'),
(14, 'Alaa Ayman Ismail Hamed', 'Alaa.20246@btu.edu.eg', '4a39822d13742af9a1992c50279198d5', 'student', 'A', 'default.png', 'A'),
(15, 'Amal Mohamed Mohi El Din Hassan', 'Amal.20247@btu.edu.eg', '60e3424d42777ecdb8f187c9f333d9d2', 'student', 'A', 'default.png', 'A'),
(16, 'Amir Alaa El Din Mohamed Korni', 'Amir.20248@btu.edu.eg', 'bc6fe65943b1297e50a124b18766a8f8', 'student', 'A', 'default.png', 'A'),
(17, 'Amira Farag Ahmed Ali', 'Amira.20249@btu.edu.eg', 'ba8e8a01155970a7c820cc0623f45ffa', 'student', 'A', 'default.png', 'A'),
(18, 'Amina Mohamed Abdel Basset Ahmed', 'Amina.202410@btu.edu.eg', 'a30ed57a820f8fb7b0595ce3607cd7a6', 'student', 'A', 'default.png', 'A'),
(19, 'Anasimon Emil Ibrahim Nessim', 'Anasimon.202411@btu.edu.eg', '7d22a0bcebe7b9aceac7003593cf16db', 'student', 'A', 'default.png', 'A'),
(20, 'Aya Mohamed Adel Ibrahim Rushwan', 'Aya.202412@btu.edu.eg', '6423337030e85067ab1db7986385e7dd', 'student', 'A', 'default.png', 'A'),
(21, 'Basmala Mustafa Aql Ahmed', 'Basmala.202413@btu.edu.eg', '5bfc62f0a7c93953a0aca691db8d841e', 'student', 'A', 'default.png', 'A'),
(22, 'Paula Farah Bushra Qaisar Tawadros', 'Paula.202414@btu.edu.eg', '69a3375a7750b42505d54105bd0dd142', 'student', 'A', 'default.png', 'A'),
(23, 'Thomas Farag Allah Fahmy Bishay Rizk', 'Thomas.202415@btu.edu.eg', '989cb0875cdac16ba7816d6710661e1f', 'student', 'A', 'default.png', 'A'),
(24, 'George Hani Nadi Aziz', 'George.202416@btu.edu.eg', 'fb9254cb1c51992848e10c43f76f4517', 'student', 'A', 'default.png', 'A'),
(25, 'Habiba Ismail Salah El Din', 'Habiba.202417@btu.edu.eg', '55d5fcfdead51f2b9193163ba78c310c', 'student', 'A', 'default.png', 'A'),
(26, 'Khaled Walid Sayed Mohamed', 'Khaled.202418@btu.edu.eg', '6db05d35e585aa7fe0125187fee0a9d6', 'student', 'A', 'default.png', 'A'),
(27, 'Rahma Abdel Fattah Abdel Rady Mohamed', 'Rahma.202419@btu.edu.eg', '6a28b96b39db6c9101479b9f17970862', 'student', 'A', 'default.png', 'A'),
(28, 'Retaj Ragab Abdullah Adam', 'Retaj.202420@btu.edu.eg', '7875f66f7adedab43ef01d54e815de39', 'student', 'A', 'default.png', 'A'),
(29, 'Zahraa Sayed Ahmed Mohamed Ali', 'Zahraa.202421@btu.edu.eg', '40e821766c30d7badbcc7043617dc44c', 'student', 'A', 'default.png', 'B'),
(30, 'Ziad Hassan Hussein Abdel Mutalib', 'Ziad.202422@btu.edu.eg', 'd7e2c5a72042f1f728af5af93fb62196', 'student', 'A', 'default.png', 'B'),
(31, 'Ziad Mohamed Shehata Abdel Hasib', 'Ziad.202423@btu.edu.eg', 'bc56a10d4d2944e4c000872e88fee4c2', 'student', 'A', 'default.png', 'B'),
(32, 'Ziad Mohamed Marouf Labib', 'Ziad.202424@btu.edu.eg', 'e787e845d65bc43997beb373c906bd02', 'student', 'A', 'default.png', 'B'),
(33, 'Sarah Khaled Ibrahim Khalil', 'Sarah.202425@btu.edu.eg', 'e8bb617f53fddbf93d13cde6fc309e20', 'student', 'A', 'default.png', 'B'),
(34, 'Sarah Mahmoud Gaber Moussa', 'Sarah.202426@btu.edu.eg', '2d6c0060963a582e930e8a224abcdff8', 'student', 'A', 'default.png', 'B'),
(35, 'Samia Mohamed Ahmed Tony', 'Samia.202427@btu.edu.eg', 'fc9771bdfc319aef7a35e7ed5dc479a1', 'student', 'B', 'default.png', 'B'),
(36, 'Salma Taha Mohamed Tarfawi', 'Salma.202428@btu.edu.eg', 'ef2972bec9a56a05f282cc2e7e2f7ba7', 'student', 'B', 'default.png', 'B'),
(37, 'Sama Mohamed Hamed Eid Abdullah', 'Sama.202429@btu.edu.eg', '1385edb6c1e913b9ffbb80a17e4bd8d1', 'student', 'B', 'default.png', 'B'),
(38, 'Samia Bakr Salah Mohamed', 'Samia.202430@btu.edu.eg', '1a05a1b24998efbcf9e3bc8f94f36b34', 'student', 'B', 'default.png', 'B'),
(39, 'Samia Shaaban Zein Mahmoud', 'Samia.202431@btu.edu.eg', '5501ea2f32318ee9c2610a438c3513cb', 'student', 'B', 'default.png', 'B'),
(40, 'Samira Ahmed Abu Khaisha Mohamed', 'Samira.202432@btu.edu.eg', 'fc98f474e530e8c942c19396d20a29bc', 'student', 'B', 'default.png', 'B'),
(41, 'Shahed Mohamed Hassan Abu Zeid', 'Shahed.202433@btu.edu.eg', 'c237878506c0bb4c9f9e65ad4743a7af', 'student', 'B', 'default.png', 'B'),
(42, 'Shahed Mohamed Abdel Gawad Ahmed Ahmed', 'Shahed.202434@btu.edu.eg', 'd29099be7d61aec858e2c390cdc6d76f', 'student', 'B', 'default.png', 'B'),
(43, 'Shaimaa Nasr Mohamed Abdullah', 'Shaimaa.202435@btu.edu.eg', '88ef434e774dad1e2cd1c74d6238e1e7', 'student', 'B', 'default.png', 'B'),
(44, 'Salah Mohamed Ahmed Hussein Ahmed', 'Salah.202436@btu.edu.eg', 'b273260ee973f76c29b5c8b736ae9cf9', 'student', 'B', 'default.png', 'B'),
(45, 'Doha Gamal Abbas Ahmed', 'Doha.202437@btu.edu.eg', 'd9f86ad5660ce092fc5705851fa6a8c5', 'student', 'B', 'default.png', 'B'),
(46, 'Abdelrahman Mohamed Abdel Aziz Moawad Abdel Aziz', 'Abdelrahman.202438@btu.edu.eg', '83574ee27e18d9f9e5465e985cbf5d09', 'student', 'B', 'default.png', 'B'),
(47, 'Abdelrahman Ashraf Mohamed Mustafa Mousa', 'Abdelrahman.202439@btu.edu.eg', '54a7f1786c3851cf42ce83b873367d0a', 'student', 'B', 'default.png', 'B'),
(48, 'Abdelrahman Ragab Mohamed Mahmoud Farag', 'Abdelrahman.202440@btu.edu.eg', 'b46b1aff0d7b9c6015a25a1134f8739a', 'student', 'B', 'default.png', 'B'),
(49, 'Abdelrahman Sayed Shamran Abdel Maqsoud', 'Abdelrahman.202441@btu.edu.eg', '256ae4ac47ae6bf326d44f8d1e90f6a9', 'student', 'B', 'default.png', 'B'),
(50, 'Abdelrahman Talal Hassan Haroun', 'Abdelrahman.202442@btu.edu.eg', '10bce8cf48fbe99c4d279739e19bc8d3', 'student', 'B', 'default.png', 'B'),
(51, 'Abdelrahman Hisham Mohamed Ali Mohamed', 'Abdelrahman.202443@btu.edu.eg', 'f7e77850e821a11ee31a3060a5eea005', 'student', 'B', 'default.png', 'B'),
(52, 'Abdullah Ali Ali Suleiman', 'Abdullah.202444@btu.edu.eg', 'fa24c2545794f7311cce4f3d2679fffd', 'student', 'B', 'default.png', 'B'),
(53, 'Abdullah Mohamed Abdullah Madi Abdel Baqi', 'Abdullah.202445@btu.edu.eg', 'bef82d6d998fae4734d2b38a4d1ce294', 'student', 'B', 'default.png', 'B'),
(54, 'Essam Mohamed Ahmed Mohamed', 'Essam.202446@btu.edu.eg', 'e75e5ee2bcc38ac1cb7a0e94fa8001af', 'student', 'B', 'default.png', 'B'),
(55, 'Alaa Emad El Din Mohamed Saeed Abdel Aziz', 'Alaa.202447@btu.edu.eg', 'b75e927d201f6227055f23c2f51146a7', 'student', 'B', 'default.png', 'B'),
(56, 'Ali Ashraf Mohamed Ali', 'Ali.202448@btu.edu.eg', '36c6c3684eb4f2c50efa5ad382267014', 'student', 'B', 'default.png', 'B'),
(57, 'Ammar Gamal Ragai Ibrahim', 'Ammar.202449@btu.edu.eg', '628a4539c2fa5e3c8c150b0d1f66b44c', 'student', 'B', 'default.png', 'C'),
(58, 'Omar Emad Ramadan Abdel Latif', 'Omar.202450@btu.edu.eg', 'b620a760a9212fdf946b25309506c96b', 'student', 'B', 'default.png', 'C'),
(59, 'Amr Ahmed Ishaq Ali', 'Amr.202451@btu.edu.eg', '25586ec5bcee480ea340c6c9c3f32400', 'student', 'B', 'default.png', 'C'),
(60, 'Fadi Safwat Aziz Younan Wahba', 'Fadi.202452@btu.edu.eg', '19c773c3f9a8d0c6ec54b1dbb8413205', 'student', 'B', 'default.png', 'C'),
(61, 'Fatima Ashraf Kamal Fahmy', 'Fatima.202453@btu.edu.eg', 'a35b54df538f8adefd395275bc93efa6', 'student', 'B', 'default.png', 'C'),
(62, 'Karim Nabil Essawy Abdel Halim', 'Karim.202454@btu.edu.eg', '3444c3cf7547d0ef682ec6bd227f09ec', 'student', 'B', 'default.png', 'C'),
(63, 'Kyrillos Saad Samir Gad El Sayed', 'Kyrillos.202455@btu.edu.eg', '156ac1693d81db8114de8ed4edbf1852', 'student', 'B', 'default.png', 'C'),
(64, 'Liqaa Mujahid Hassan Abdel Muntaleb', 'Liqaa.202456@btu.edu.eg', '220a82ea0fee16b92e1d526022f1f7d1', 'student', 'B', 'default.png', 'C'),
(65, 'Moamen Reda Abdel Allah Hassan', 'Moamen.202457@btu.edu.eg', '09f60fccb1f1179ec09d56e369ac39c2', 'student', 'B', 'default.png', 'C'),
(66, 'Martin Nader Makram Emil Fawzy', 'Martin.202458@btu.edu.eg', 'cc28a3bbc7bc7c5ec683bb64927e1b9b', 'student', 'B', 'default.png', 'C'),
(67, 'Mohamed Ahmed Suleiman Abdel Gawad', 'Mohamed.202459@btu.edu.eg', 'aa3cd95536786093052788bbd95f3ad6', 'student', 'B', 'default.png', 'C'),
(68, 'Mohamed Ahmed Sayed Gomaa', 'Mohamed.202460@btu.edu.eg', 'f34741e7188864262b0c4ab5a56cad7e', 'student', 'B', 'default.png', 'C'),
(69, 'Mohamed Ashraf Mohamed Wahba', 'Mohamed.202461@btu.edu.eg', '8b97f7a0eed8dd2952f10dc95454f7c1', 'student', 'B', 'default.png', 'C'),
(70, 'Mohamed Abdel Rahman Mohamed Zidan', 'Mohamed.202462@btu.edu.eg', '4ceac8ee66f99ed1155c250b5c1439e6', 'student', 'B', 'default.png', 'C'),
(71, 'Mohamed Mahmoud Sobhi Ali', 'Mohamed.202463@btu.edu.eg', 'e54021e434b1f3b9e57f3b7d0530c120', 'student', 'B', 'default.png', 'C'),
(72, 'Mohamed Hesham Abdel Aati Mohamed Gomaa', 'Mohamed.202464@btu.edu.eg', '2257ea6a4175d829e2955d277d7d0573', 'student', 'B', 'default.png', 'C'),
(73, 'Mahmoud Tamer Najah Mahdi', 'Mahmoud.202465@btu.edu.eg', '1f083025eb0776011623d934d025a691', 'student', 'C', 'default.png', 'C'),
(74, 'Mahmoud Essam Mahmoud Ahmed Ibrahim', 'Mahmoud.202466@btu.edu.eg', 'b8afecb975b4fee57019bf7936ec811b', 'student', 'C', 'default.png', 'C'),
(75, 'Mahmoud Omar Tawfiq Mohamed', 'Mahmoud.202467@btu.edu.eg', '6414ed4faf615a0622f68ca1e7396742', 'student', 'C', 'default.png', 'C'),
(76, 'Mahmoud Mohamed Abdel Fattah Dakhili', 'Mahmoud.202468@btu.edu.eg', '14c02f4f7bc5c73d5c69880f2b1a8a34', 'student', 'C', 'default.png', 'C'),
(77, 'Maryam Mahmoud Hassanein Ragheb', 'Maryam.202469@btu.edu.eg', '6a50582d97bb95b9a87873637b7d6c4a', 'student', 'C', 'default.png', 'C'),
(78, 'Malak Sayed Fathy Ahmed', 'Malak.202470@btu.edu.eg', '58fbf9447368b6ed8892e5665f9f8e2b', 'student', 'C', 'default.png', 'C'),
(79, 'Malak Mahmoud El Tayry Mahmoud', 'Malak.202471@btu.edu.eg', '136763c9079ab9110949e15022d8cc61', 'student', 'C', 'default.png', 'C'),
(80, 'Mona Morsi Mohamed Morsi', 'Mona.202472@btu.edu.eg', '836f1bf222fa0fe9a0bdbbf3522a3776', 'student', 'C', 'default.png', 'C'),
(81, 'Mai Mahmoud Atta Shehata Sayed', 'Mai.202473@btu.edu.eg', '0a592c70b80ec97860fdb0d57c9441b6', 'student', 'C', 'default.png', 'C'),
(82, 'Mirna Makram Saeed Saeed', 'Mirna.202474@btu.edu.eg', 'd23ce9a5da56ebce8cf9f8add67d04f4', 'student', 'C', 'default.png', 'C'),
(83, 'Nada Omar Mansour Mustafa Nasr Abdel Majeed', 'Nada.202475@btu.edu.eg', 'caaa5a9a11e6af0da716f59f8ccf03c9', 'student', 'C', 'default.png', 'C'),
(84, 'Nada Khairy Salah El Din Mohamed', 'Nada.202476@btu.edu.eg', '9678b8c9127fcc5ca69c5ec8775fc54a', 'student', 'C', 'default.png', 'C'),
(85, 'Nada Saber Mohamed Saber', 'Nada.202477@btu.edu.eg', 'd27ddd25c77ac70f61e2acf1d8800193', 'student', 'C', 'default.png', 'C'),
(86, 'Nada Abu Zeid Abdel Rahman Mohamed', 'Nada.202478@btu.edu.eg', 'f09fb7d20890dc0814bc7229231f094c', 'student', 'C', 'default.png', 'C'),
(87, 'Narmin Fayed Fathy Abdel Hamid', 'Narmin.202479@btu.edu.eg', 'f3b67a9d6f3c6297381986c89f939534', 'student', 'C', 'default.png', 'C'),
(88, 'Nour El Husseiny Ali Naguib', 'Nour.202480@btu.edu.eg', 'd579f2cd8479c90dde0ebc45658259f0', 'student', 'C', 'default.png', 'C'),
(89, 'Heba Ahmed Ali Abdel Aleem', 'Heba.202481@btu.edu.eg', '$2y$10$ErIkMA18t0/500IbtdGMreono3NiIJzsarSvHrhjNPfhr9Bvhuecy', 'student', 'C', 'default.png', 'C'),
(90, 'Yasmine Mohamed Kamel Eid', 'Yasmine.202482@btu.edu.eg', '73f69499a4233795da675f4b8e2f0e7a', 'student', 'C', 'default.png', 'C'),
(91, 'Youssef Khaled Anwar Habashi Ismail', 'Youssef.202483@btu.edu.eg', 'aede6883c99572a485ef7072e2fe4ab8', 'student', 'C', 'default.png', 'C'),
(92, 'Youssef Shaaban Mohamed Mustafa', 'Youssef.202484@btu.edu.eg', '3edc91617e56dec2e6751080f7f9c375', 'student', 'C', 'default.png', 'C');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_files`
--
ALTER TABLE `material_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `material_files`
--
ALTER TABLE `material_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
