-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 19 Jul 2022 pada 11.31
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_karyawan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `sub_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `picture` text NOT NULL,
  `logo` text NOT NULL,
  `whatsapp` varchar(100) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `company`
--

INSERT INTO `company` (`id`, `company_name`, `sub_name`, `description`, `picture`, `logo`, `whatsapp`, `facebook`, `twitter`, `instagram`, `phone`, `email`, `address`) VALUES
(1, 'PT Maju Sejahtera', 'Melayanimu dengan sepenuh hati', '<p>halo</p>', '', '', '085157718575', 'asdasd', 'social.net', 'https://www.instagram.com/', '6282130415558', 'admin@gmail.com', 'Jl. Sunan Kalijaga No.63B, RT.2/RW.1\r\nMelawai, Kec. Kby. Baru,');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reimbursements`
--

CREATE TABLE `reimbursements` (
  `reimbursements_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `reimbursements`
--

INSERT INTO `reimbursements` (`reimbursements_id`, `description`, `nominal`, `date`, `company_name`, `status_id`, `user_id`, `photo`, `date_created`) VALUES
(7, 'Beli obat', 8000000, '2022-07-17', 'PT Maju Sejahtera', 1, 30, 'bukti-220717-8a5b5588fc.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_id`
--

CREATE TABLE `role_id` (
  `role_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role_id`
--

INSERT INTO `role_id` (`role_id`, `status_name`) VALUES
(1, 'hrd'),
(2, 'finance'),
(3, 'admin'),
(4, 'karyawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_reimbursements`
--

CREATE TABLE `status_reimbursements` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `status_reimbursements`
--

INSERT INTO `status_reimbursements` (`status_id`, `status_name`) VALUES
(1, 'pengajuan klaim sedang dicek'),
(2, 'pengajuan klaim sedang diproses'),
(3, 'pengajuan klaim sedang berhasil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(128) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `gender` varchar(255) NOT NULL,
  `image` varchar(225) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `phone`, `address`, `gender`, `image`, `role_id`, `is_active`, `date_created`) VALUES
(25, 'admin@admin.com', '$2y$10$pKGfQG2etJ5lDW06PZncIOqY94RJTioYG4oM4n0/Up.cUpnX5HkRO', 'Admin', '085157718575', 'asdasd', 'Laki-laki', 'default.jpg', 1, 1, 1658060850),
(29, 'testadmin@admin.com', '$2y$10$LHEKV0NvI4/u4QkF4Ub.PusJo.Xcg8ibOz/OoQ2rlD6O8/c67fF0C', 'Test Admin', '23423432432423', 'Jl. Sunan Kalijaga No.63B, RT.2/RW.1\r\nMelawai, Kec. Kby. Baru,', 'Laki-laki', 'default.jpg', 3, 1, 1658222143),
(30, 'karyawan@admin.com', '$2y$10$.J0s0ULscPSM/0xW0d8p4.7QFeCsGwWtP6wz4o9fMVyYuDbPumxVm', 'Test Karyawan', '085157718575', 'Jl. Sunan Kalijaga No.63B, RT.2/RW.1\r\nMelawai, Kec. Kby. Baru,', 'Laki-laki', 'default.jpg', 4, 1, 1658060830),
(31, 'finance@admin.com', '$2y$10$8u91rLalxsKNMINqQP05COr.kwqGN5HI9lzM41nsbfp.RDG0nOa9u', 'Test Finance', '2332242', 'Jl. Sunan Kalijaga No.63B, RT.2/RW.1\r\nMelawai, Kec. Kby. Baru,', 'Perempuan', 'default.jpg', 2, 1, 1658065796),
(32, 'norman@admin.com', '$2y$10$gH/jM5aEAqyOxQCfthz88ea.InTkiDY01wJceZ2Dp/GkIyMJmEXc.', 'Norman Ganteng', '085157718575', 'Jl. Sunan Kalijaga No.63B, RT.2/RW.1\r\nMelawai, Kec. Kby. Baru,', 'Laki-laki', 'default.jpg', 4, 1, 1658065900);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_token`
--

INSERT INTO `user_token` (`id`, `type`, `email`, `token`, `date_created`) VALUES
(2, 0, 'admin@gmail.com', 'kKbhYZ3QtrOGE4HHd4y2s+fd7aacj4GmEZn7IjXuUZs=', 1655392185);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reimbursements`
--
ALTER TABLE `reimbursements`
  ADD PRIMARY KEY (`reimbursements_id`);

--
-- Indeks untuk tabel `role_id`
--
ALTER TABLE `role_id`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `status_reimbursements`
--
ALTER TABLE `status_reimbursements`
  ADD PRIMARY KEY (`status_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `reimbursements`
--
ALTER TABLE `reimbursements`
  MODIFY `reimbursements_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `status_reimbursements`
--
ALTER TABLE `status_reimbursements`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
