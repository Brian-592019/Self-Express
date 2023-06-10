-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 02:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selfexpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_i_follow`
--

CREATE TABLE `content_i_follow` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `likes` text DEFAULT NULL,
  `contentid` bigint(20) DEFAULT NULL,
  `following` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `type`, `likes`, `contentid`, `following`) VALUES
(1, 'user', '[{\"userid\":\"626716683095\",\"date\":\"2023-06-10 01:58:54\"},{\"userid\":\"964865209902658925\",\"date\":\"2023-06-10 02:19:48\"}]', 257915693745488957, NULL),
(2, 'user', NULL, 5288318, '[]'),
(3, 'post', '[]', 405292541782427, NULL),
(4, 'user', NULL, 626716683095, '[{\"userid\":\"257915693745488957\",\"date\":\"2023-06-10 01:58:54\"}]'),
(5, 'post', '[]', 3308043156479701827, NULL),
(6, 'post', '[]', 3446693654, NULL),
(7, 'user', NULL, 964865209902658925, '[{\"userid\":\"257915693745488957\",\"date\":\"2023-06-10 02:19:48\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `activity` varchar(10) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_owner` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `userid`, `activity`, `contentid`, `content_owner`, `content_type`, `date`) VALUES
(1, 5288318, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:09:43'),
(2, 5288318, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:09:46'),
(3, 5288318, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:09:55'),
(4, 5288318, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:09:56'),
(5, 5288318, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:10:06'),
(6, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 00:59:28'),
(7, 5288318, 'like', 405292541782427, 5288318, 'post', '2023-06-10 01:17:33'),
(8, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 01:18:23'),
(9, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 01:18:27'),
(10, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 01:49:19'),
(11, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 01:58:54'),
(12, 964865209902658925, 'like', 3308043156479701827, 964865209902658925, 'post', '2023-06-10 02:18:38'),
(13, 964865209902658925, 'like', 3446693654, 964865209902658925, 'post', '2023-06-10 02:19:08'),
(14, 0, 'follow', 257915693745488957, 257915693745488957, 'profile', '2023-06-10 02:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `notification_seen`
--

CREATE TABLE `notification_seen` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `notification_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `post` text NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `has_image` tinyint(1) NOT NULL DEFAULT 0,
  `is_profile_image` tinyint(1) NOT NULL DEFAULT 0,
  `is_cover_image` tinyint(1) NOT NULL DEFAULT 0,
  `parent` bigint(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` bigint(20) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `tags` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `postid`, `post`, `image`, `has_image`, `is_profile_image`, `is_cover_image`, `parent`, `date`, `userid`, `likes`, `comments`, `tags`) VALUES
(3, 700244111246, '', 'uploads/34289/PvyxDY6zyfzjoEh.jpg', 1, 1, 0, 0, '2023-06-10 03:54:32', 34289, 0, 0, '[]'),
(4, 40474962, '', 'uploads/34289/90q8SIGElofSOkB.jpg', 1, 0, 1, 0, '2023-06-10 03:54:47', 34289, 0, 0, '[]'),
(5, 17764, '', 'uploads/34289/0jbMF6bsGygxtU9.jpg', 1, 0, 1, 0, '2023-06-10 03:56:01', 34289, 0, 0, '[]'),
(10, 76556549341, '', 'uploads/25666188434776/Z9E8lQ7erPkCHq7.jpg', 1, 1, 0, 0, '2023-06-10 04:06:03', 25666188434776, 0, 0, '[]'),
(11, 818261034, '', 'uploads/25666188434776/ETuJDkro0qfLT9P.jpg', 1, 0, 1, 0, '2023-06-10 04:06:11', 25666188434776, 0, 0, '[]'),
(12, 53977, 'Hi my name is Brian!', '', 0, 0, 0, 0, '2023-06-10 04:06:38', 25666188434776, 0, 0, '[]'),
(14, 20614769067033, '', 'uploads/951986888/4WMzuPMR05fSRxW.jpg', 1, 1, 0, 0, '2023-06-10 04:11:30', 951986888, 0, 0, '[]'),
(15, 88314177418821, '', 'uploads/951986888/Ac8jg2L35ajAXKq.jpg', 1, 0, 1, 0, '2023-06-10 04:11:38', 951986888, 0, 0, '[]'),
(16, 83533, 'Hello my name is Brian!', '', 0, 0, 0, 0, '2023-06-10 04:11:55', 951986888, 0, 1, '[]'),
(17, 459792362918296, 'Hello', '', 0, 0, 0, 83533, '2023-06-10 04:12:06', 951986888, 0, 0, '[]'),
(18, 3308043156479701827, 'Hi my name is Brian!', '', 0, 0, 0, 0, '2023-06-10 04:18:31', 964865209902658925, 0, 1, '[]'),
(19, 910167, 'hello!', '', 0, 0, 0, 3308043156479701827, '2023-06-10 04:18:49', 964865209902658925, 0, 0, '[]'),
(20, 3446693654, '', 'uploads/964865209902658925/NyD8yfpuHef2LuH.jpg', 1, 0, 0, 0, '2023-06-10 04:19:03', 964865209902658925, 0, 0, '[]'),
(21, 70275995, '', 'uploads/964865209902658925/sLzHTELmZd55HnK.jpg', 1, 1, 0, 0, '2023-06-10 04:19:20', 964865209902658925, 0, 0, '[]'),
(22, 9488626, '', 'uploads/964865209902658925/5sjdV7iZI9gaO0E.jpg', 1, 0, 1, 0, '2023-06-10 04:19:29', 964865209902658925, 0, 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `cover_image` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `online` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `url_address` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `about` text DEFAULT NULL,
  `tag_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `first_name`, `last_name`, `gender`, `profile_image`, `cover_image`, `date`, `online`, `email`, `password`, `url_address`, `likes`, `about`, `tag_name`) VALUES
(1, 257915693745488957, 'Example', 'User', 'Female', NULL, NULL, '2023-06-10 01:01:31', 0, 'ExampleUser@yahoo.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Example.User', 2, NULL, 'ExampleUser'),
(15, 964865209902658925, 'Brian', 'Moya', 'Male', 'uploads/964865209902658925/sLzHTELmZd55HnK.jpg', 'uploads/964865209902658925/5sjdV7iZI9gaO0E.jpg', '2023-06-10 04:18:10', 0, 'mackmoya@gmail.com', 'dedc0406a4c17302b464a84be081f2d2e94903ec', 'brian.moya', 0, NULL, 'brianmoya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content_i_follow`
--
ALTER TABLE `content_i_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `content_owner` (`content_owner`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `notification_seen`
--
ALTER TABLE `notification_seen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`postid`),
  ADD KEY `date` (`date`),
  ADD KEY `parent` (`parent`),
  ADD KEY `userid` (`userid`),
  ADD KEY `likes` (`likes`),
  ADD KEY `comments` (`comments`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `date` (`date`),
  ADD KEY `online` (`online`),
  ADD KEY `email` (`email`),
  ADD KEY `url_address` (`url_address`),
  ADD KEY `likes` (`likes`),
  ADD KEY `tag_name` (`tag_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `content_i_follow`
--
ALTER TABLE `content_i_follow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_seen`
--
ALTER TABLE `notification_seen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
