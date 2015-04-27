
-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 27, 2015 at 02:23 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `ios`
--

-- --------------------------------------------------------

--
-- Table structure for table `donor2`
--

CREATE TABLE `donor2` (
  `firstname` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `lastname` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `bloodgroup` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `phone` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `country` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `state` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `city` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `uid` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `passcode` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `donor2`
--
