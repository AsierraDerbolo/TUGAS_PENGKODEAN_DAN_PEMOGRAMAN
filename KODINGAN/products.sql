-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Mar 2025 pada 15.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `description`, `rate`) VALUES
(1, 'iPhone 14', 'Mobile Phones', 'Latest iPhone model with A16 chip', 999.99),
(2, 'Samsung Galaxy S23', 'Mobile Phones', 'Flagship Samsung phone with Snapdragon 8 Gen 2', 899.99),
(3, 'MacBook Pro', 'Laptops', '14-inch MacBook Pro with M2 Pro chip', 1999.99),
(4, 'Dell XPS 13', 'Laptops', 'Compact laptop with 13.4-inch display', 1299.99),
(5, 'Sony WH-1000XM5', 'Headphones', 'Noise-cancelling wireless headphones', 399.99),
(6, 'iPhone 14', 'Mobile Phones', 'Latest iPhone model with A16 chip', 999.99),
(7, 'Samsung Galaxy S23', 'Mobile Phones', 'Flagship Samsung phone with Snapdragon 8 Gen 2', 899.99),
(8, 'MacBook Pro', 'Laptops', '14-inch MacBook Pro with M2 Pro chip', 1999.99),
(9, 'Dell XPS 13', 'Laptops', 'Compact laptop with 13.4-inch display', 1299.99),
(10, 'Sony WH-1000XM5', 'Headphones', 'Noise-cancelling wireless headphones', 399.99);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
