-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2024 at 02:41 PM
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
-- Database: `org_chart`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `title`, `parent_id`, `photo_url`) VALUES
(1, 'John Doe', 'CEO', NULL, 'https://thumbs.dreamstime.com/b/business-man-studio-smiling-portrait-office-worker-employee-white-background-corporate-company-business-man-323236358.jpg?w=992'),
(2, 'Jane Smith', 'CTO', 1, 'https://thumbs.dreamstime.com/b/thoughtful-office-worker-thinking-problem-solution-looking-computer-working-serious-smart-young-businessman-employee-138893862.jpg?w=768'),
(3, 'Bob Brown', 'CFO', 1, 'https://thumbs.dreamstime.com/b/thoughtful-office-worker-thinking-problem-solution-looking-computer-working-serious-smart-young-businessman-employee-138893862.jpg?w=768'),
(4, 'Alice Johnson', 'Lead Developer', 2, 'https://thumbs.dreamstime.com/b/thoughtful-office-worker-thinking-problem-solution-looking-computer-working-serious-smart-young-businessman-employee-138893862.jpg?w=768'),
(5, 'Eve Davis', 'Finance Manager', 3, 'https://thumbs.dreamstime.com/b/thoughtful-office-worker-thinking-problem-solution-looking-computer-working-serious-smart-young-businessman-employee-138893862.jpg?w=768'),
(6, 'Charlie White', 'Developer', 4, 'https://thumbs.dreamstime.com/b/thoughtful-office-worker-thinking-problem-solution-looking-computer-working-serious-smart-young-businessman-employee-138893862.jpg?w=768');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
