-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 04 Jul 2022 pada 06.37
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
-- Database: `mywifi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `no_rek` varchar(128) NOT NULL,
  `owner` varchar(128) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`bank_id`, `name`, `no_rek`, `owner`, `create_by`) VALUES
(1, 'BRI', '982392', 'Admin', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `carousel`
--

CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `carousel`
--

INSERT INTO `carousel` (`carousel_id`, `images`) VALUES
(4, '1.jpg'),
(5, '21.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cat_expenditure`
--

CREATE TABLE `cat_expenditure` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cat_income`
--

CREATE TABLE `cat_income` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cat_income`
--

INSERT INTO `cat_income` (`category_id`, `name`, `remark`, `create_by`) VALUES
(1, 'Tagihan', 'Otomatis by System', 0);

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
  `owner` varchar(128) NOT NULL,
  `our_story` text NOT NULL,
  `address` text NOT NULL,
  `due_date` int(11) NOT NULL,
  `ppn` int(11) NOT NULL,
  `our_mission` text NOT NULL,
  `policy` text NOT NULL,
  `expired` varchar(50) NOT NULL,
  `isolir` int(11) NOT NULL,
  `import` int(11) NOT NULL,
  `apps_name` varchar(20) NOT NULL,
  `cek_bill` int(11) NOT NULL,
  `cek_usage` int(11) NOT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  `phonecode` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `tawk` text NOT NULL,
  `speedtest` text NOT NULL,
  `maintenance` int(11) NOT NULL,
  `watermark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `company`
--

INSERT INTO `company` (`id`, `company_name`, `sub_name`, `description`, `picture`, `logo`, `whatsapp`, `facebook`, `twitter`, `instagram`, `phone`, `email`, `owner`, `our_story`, `address`, `due_date`, `ppn`, `our_mission`, `policy`, `expired`, `isolir`, `import`, `apps_name`, `cek_bill`, `cek_usage`, `latitude`, `longitude`, `phonecode`, `country`, `currency`, `timezone`, `tawk`, `speedtest`, `maintenance`, `watermark`) VALUES
(1, 'Social Net', 'Melayanimu dengan sepenuh hati', '<p>halo</p>', '', '', '085157718575', 'asdasd', 'social.net', 'https://www.instagram.com/vakbarrr/', '6282130415558', 'admin@gmail.com', 'Dhiyaul', '<p>Berawal dari social.net</p>', 'Jakarta barat', 25, 10, '<ul><li>Menjadi penyedia layanan yang keren</li><li>Menjadi penyedia layanan yang keren</li><li>Menjadi penyedia layanan yang keren</li><li>Menjadi penyedia layanan yang keren</li><li>Menjadi penyedia layanan yang keren</li></ul>', '0', '', 0, 0, 'WIFI', 1, 1, '-7.205830295257313', '107.8256392478943', 62, 0, '', 'Asia/Bangkok', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirm_payment`
--

CREATE TABLE `confirm_payment` (
  `confirm_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `no_services` varchar(25) NOT NULL,
  `metode_payment` varchar(50) NOT NULL,
  `date_payment` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `remark` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `no_services` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `register_date` varchar(50) NOT NULL,
  `due_date` int(11) NOT NULL,
  `address` text NOT NULL,
  `no_wa` varchar(128) NOT NULL,
  `p_item_id` int(11) NOT NULL,
  `c_status` varchar(128) NOT NULL,
  `ppn` int(11) NOT NULL,
  `no_ktp` varchar(128) NOT NULL,
  `ktp` text NOT NULL,
  `created` int(11) NOT NULL,
  `nama_pengirim` varchar(255) NOT NULL,
  `nama_bank` varchar(128) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL,
  `coverage` int(11) NOT NULL,
  `auto_isolir` int(11) NOT NULL,
  `type_id` varchar(50) NOT NULL,
  `router` int(11) NOT NULL,
  `codeunique` int(11) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `latitude` text NOT NULL,
  `longitude` text NOT NULL,
  `user_profile` varchar(50) NOT NULL,
  `action` int(11) NOT NULL,
  `type_payment` int(11) NOT NULL,
  `max_due_isolir` int(11) NOT NULL,
  `olt` int(11) NOT NULL,
  `connection` int(11) NOT NULL,
  `cust_amount` int(11) NOT NULL,
  `mac_address` varchar(50) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `no_services`, `email`, `register_date`, `due_date`, `address`, `no_wa`, `p_item_id`, `c_status`, `ppn`, `no_ktp`, `ktp`, `created`, `nama_pengirim`, `nama_bank`, `bukti_pembayaran`, `coverage`, `auto_isolir`, `type_id`, `router`, `codeunique`, `phonecode`, `latitude`, `longitude`, `user_profile`, `action`, `type_payment`, `max_due_isolir`, `olt`, `connection`, `cust_amount`, `mac_address`, `level`) VALUES
(1, 'Gian', '220616171139', 'virgian.akbar@optima-exchange.info', '', 0, '  ', '0851577185752', 3, '4', 0, '4545435643564353', '', 1655287759, '', '', '0', 0, 0, '', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, 0, '', 0),
(43, '10 Mbps', '220704062533', 'gian@gmail.com', '', 0, '   adsasdasda', '085157718575', 2, '4', 0, '2323423423', '', 1656908753, 'GIAN', 'BRI', 'bukti-220704-4ac676cff8.png', 0, 0, '', 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_status`
--

CREATE TABLE `c_status` (
  `c_status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `c_status`
--

INSERT INTO `c_status` (`c_status_id`, `status_name`) VALUES
(1, 'menunggu verifikasi data'),
(2, 'menunggu pembayaran\r\n'),
(3, 'proses install'),
(4, 'success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `protocol` varchar(50) NOT NULL,
  `host` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `port` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `send_payment` int(11) NOT NULL,
  `send_verify` int(11) NOT NULL,
  `forgot_password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `email`
--

INSERT INTO `email` (`id`, `protocol`, `host`, `email`, `password`, `port`, `name`, `send_payment`, `send_verify`, `forgot_password`) VALUES
(1, 'smtp', 'mail.1112-project.com', 'admin@admin.com', 'adminadminadmin', '587', 'Social-net', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenditure`
--

CREATE TABLE `expenditure` (
  `expenditure_id` int(11) NOT NULL,
  `date_payment` varchar(125) NOT NULL,
  `nominal` varchar(125) NOT NULL,
  `remark` text NOT NULL,
  `created` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `income`
--

CREATE TABLE `income` (
  `income_id` int(11) NOT NULL,
  `date_payment` varchar(125) NOT NULL,
  `nominal` varchar(125) NOT NULL,
  `remark` text NOT NULL,
  `created` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `invoice_id` int(20) NOT NULL,
  `no_services` varchar(50) NOT NULL,
  `mode_payment` varchar(50) NOT NULL,
  `picture` text NOT NULL,
  `coverage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `income`
--

INSERT INTO `income` (`income_id`, `date_payment`, `nominal`, `remark`, `created`, `category`, `create_by`, `invoice_id`, `no_services`, `mode_payment`, `picture`, `coverage`) VALUES
(1, '2022-06-29', '80000', 'Pembayaran Tagihan no layanan 220615120905 a/n Gian Periode Juni 2022', 1655289447, 0, 0, 0, '', '', '', 0),
(2, '2022-06-16', '80000', 'Pembayaran Tagihan no layanan 220615120905 a/n Gian Periode Juni 2022', 1655392658, 0, 0, 0, '', '', '', 0),
(3, '2022-06-22', '180000', 'Pembayaran Tagihan no layanan 220616171139 a/n Gian Akbar Periode Juni 2022', 1655728359, 0, 0, 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice` varchar(128) NOT NULL,
  `code_unique` int(11) NOT NULL,
  `month` varchar(11) NOT NULL,
  `year` int(11) NOT NULL,
  `no_services` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `i_ppn` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date_payment` int(11) DEFAULT NULL,
  `metode_payment` varchar(100) NOT NULL,
  `admin_fee` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `token` text NOT NULL,
  `payment_type` varchar(128) NOT NULL,
  `transaction_time` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `va_number` varchar(50) NOT NULL,
  `pdf_url` text NOT NULL,
  `status_code` varchar(5) NOT NULL,
  `expired` text NOT NULL,
  `x_id` varchar(128) NOT NULL,
  `x_bank_code` varchar(128) NOT NULL,
  `x_method` varchar(50) NOT NULL,
  `x_account_number` varchar(50) NOT NULL,
  `x_expired` varchar(50) NOT NULL,
  `x_external_id` varchar(50) NOT NULL,
  `x_amount` varchar(50) NOT NULL,
  `x_qrcode` text NOT NULL,
  `reference` text NOT NULL,
  `payment_url` text NOT NULL,
  `code_coupon` varchar(50) NOT NULL,
  `disc_coupon` int(11) NOT NULL,
  `outlet` int(11) NOT NULL,
  `status_income` varchar(40) NOT NULL,
  `inv_due_date` varchar(40) NOT NULL,
  `date_isolir` varchar(50) NOT NULL,
  `send_before_due` varchar(50) NOT NULL,
  `send_due` varchar(50) NOT NULL,
  `picture` text NOT NULL,
  `inv_ppn` int(11) NOT NULL,
  `picture1` text NOT NULL,
  `send_bill` varchar(50) NOT NULL,
  `send_paid` varchar(50) NOT NULL,
  `date_paid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice`, `code_unique`, `month`, `year`, `no_services`, `status`, `i_ppn`, `created`, `create_by`, `date_payment`, `metode_payment`, `admin_fee`, `amount`, `order_id`, `token`, `payment_type`, `transaction_time`, `bank`, `va_number`, `pdf_url`, `status_code`, `expired`, `x_id`, `x_bank_code`, `x_method`, `x_account_number`, `x_expired`, `x_external_id`, `x_amount`, `x_qrcode`, `reference`, `payment_url`, `code_coupon`, `disc_coupon`, `outlet`, `status_income`, `inv_due_date`, `date_isolir`, `send_before_due`, `send_due`, `picture`, `inv_ppn`, `picture1`, `send_bill`, `send_paid`, `date_paid`) VALUES
(3, '220616001', 967, '06', 2022, '220615120905', 'SUDAH BAYAR', 0, 1655392422, 0, 1655392658, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, '', '', '', ''),
(6, '220620001', 148, '06', 2022, '', 'BELUM BAYAR', 0, 1655728281, 0, NULL, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, '', '', '', ''),
(10, '220703001', 339, '07', 2022, '220616171139', 'BELUM BAYAR', 0, 1656854975, 0, NULL, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `detail_id` int(11) NOT NULL,
  `invoice_id` varchar(128) NOT NULL,
  `price` varchar(125) NOT NULL,
  `qty` varchar(125) NOT NULL,
  `disc` varchar(128) NOT NULL,
  `remark` text NOT NULL,
  `total` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `d_month` int(11) NOT NULL,
  `d_year` int(11) NOT NULL,
  `d_no_services` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `invoice_detail`
--

INSERT INTO `invoice_detail` (`detail_id`, `invoice_id`, `price`, `qty`, `disc`, `remark`, `total`, `item_id`, `category_id`, `d_month`, `d_year`, `d_no_services`) VALUES
(3, '220616001', '180000', '1', '100000', 'Jangan lupa bayar', '80000', 1, 1, 0, 0, ''),
(6, '220703001', '200000', '1', '0', '', '200000', 3, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datetime` int(11) NOT NULL,
  `date_log` varchar(40) NOT NULL,
  `category` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `package_item`
--

CREATE TABLE `package_item` (
  `p_item_id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `category` varchar(125) NOT NULL,
  `price` varchar(125) NOT NULL,
  `picture` text NOT NULL,
  `description` text NOT NULL,
  `description_item` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `public` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `package_item`
--

INSERT INTO `package_item` (`p_item_id`, `name`, `category`, `price`, `picture`, `description`, `description_item`, `date_created`, `date_update`, `public`, `is_active`, `create_by`) VALUES
(1, '5 Mbps ', 'Paket A', '100000', '', '<ul><li>Bebas Fair Usage Policy(FUP) / Kouta Unlimited</li><li>Wifi Fiber Modem</li><li>IP Dynamic Private</li><li>Social.Net Shopping Bag</li><li>Social.Net Video</li><li>Social.Net NEO Web Space</li></ul>', 'Baik digunakan untuk 1-3 device.', 1656449284, 0, 0, 0, 0),
(2, '10 Mbps', 'Paket B', '150000', '', '<ul><li>Bebas Fair Usage Policy(FUP) / Kouta Unlimited</li><li>Wifi Fiber Modem</li><li>IP Dynamic Private</li><li>Social.Net Shopping Bag</li><li>Social.Net Video</li><li>Social.Net NEO Web Space</li></ul>', 'Baik digunakan untuk 1-10 device.', 1656449256, 0, 0, 0, 0),
(3, '20 Mpbs', 'Paket C', '200000', '', '<ul><li>Bebas Fair Usage Policy(FUP) / Kouta Unlimited</li><li>Wifi Fiber Modem</li><li>IP Dynamic Private</li><li>Social.Net Shopping Bag</li><li>Social.Net Video</li><li>Social.Net NEO Web Space</li></ul>', 'Baik digunakan untuk 1-10 device.', 1656449250, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `picture` text NOT NULL,
  `remark` text NOT NULL,
  `link` text NOT NULL,
  `description` text NOT NULL,
  `date_created` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_transaction`
--

CREATE TABLE `report_transaction` (
  `report_id` int(128) NOT NULL,
  `date` varchar(128) NOT NULL,
  `income` varchar(128) NOT NULL,
  `expenditure` varchar(128) NOT NULL,
  `remark` text NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `report_transaction`
--

INSERT INTO `report_transaction` (`report_id`, `date`, `income`, `expenditure`, `remark`, `created`) VALUES
(1, '2022-06-29', '80000', '0', 'Pembayaran Tagihan no layanan 220615120905 a/n Gian Periode Juni 2022', 1655289447),
(2, '2022-06-16', '80000', '0', 'Pembayaran Tagihan no layanan 220615120905 a/n Gian Periode Juni 2022', 1655392658),
(3, '2022-06-22', '180000', '0', 'Pembayaran Tagihan no layanan 220616171139 a/n Gian Akbar Periode Juni 2022', 1655728359);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_management`
--

CREATE TABLE `role_management` (
  `role_id` int(11) NOT NULL,
  `show_customer` int(11) NOT NULL,
  `add_customer` int(11) NOT NULL,
  `edit_customer` int(11) NOT NULL,
  `del_customer` int(11) NOT NULL,
  `show_item` int(11) NOT NULL,
  `add_item` int(11) NOT NULL,
  `edit_item` int(11) NOT NULL,
  `del_item` int(11) NOT NULL,
  `show_bill` int(11) NOT NULL,
  `add_bill` int(11) NOT NULL,
  `del_bill` int(11) NOT NULL,
  `show_coverage` int(11) NOT NULL,
  `add_coverage` int(11) NOT NULL,
  `edit_coverage` int(11) NOT NULL,
  `del_coverage` int(11) NOT NULL,
  `coverage_operator` int(11) NOT NULL,
  `show_slide` int(11) NOT NULL,
  `add_slide` int(11) NOT NULL,
  `edit_slide` int(11) NOT NULL,
  `del_slide` int(11) NOT NULL,
  `show_router` int(11) NOT NULL,
  `add_router` int(11) NOT NULL,
  `edit_router` int(11) NOT NULL,
  `del_router` int(11) NOT NULL,
  `show_saldo` int(11) NOT NULL,
  `show_income` int(11) NOT NULL,
  `add_income` int(11) NOT NULL,
  `edit_income` int(11) NOT NULL,
  `del_income` int(11) NOT NULL,
  `show_user` int(11) NOT NULL,
  `edit_user` int(11) NOT NULL,
  `del_user` int(11) NOT NULL,
  `add_user` int(11) NOT NULL,
  `show_product` int(11) NOT NULL,
  `add_product` int(11) NOT NULL,
  `edit_product` int(11) NOT NULL,
  `del_product` int(11) NOT NULL,
  `show_usage` int(11) NOT NULL,
  `show_history` int(11) NOT NULL,
  `show_speedtest` int(11) NOT NULL,
  `show_log` int(11) NOT NULL,
  `cek_bill` int(11) NOT NULL,
  `cek_usage` int(11) NOT NULL,
  `show_help` int(11) NOT NULL,
  `edit_help` int(11) NOT NULL,
  `del_help` int(11) NOT NULL,
  `add_help` int(11) NOT NULL,
  `register_coverage` int(11) NOT NULL,
  `register_maps` int(11) NOT NULL,
  `register_show` int(11) NOT NULL,
  `coverage_teknisi` int(11) NOT NULL,
  `customer_free` int(11) NOT NULL,
  `customer_isolir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role_management`
--

INSERT INTO `role_management` (`role_id`, `show_customer`, `add_customer`, `edit_customer`, `del_customer`, `show_item`, `add_item`, `edit_item`, `del_item`, `show_bill`, `add_bill`, `del_bill`, `show_coverage`, `add_coverage`, `edit_coverage`, `del_coverage`, `coverage_operator`, `show_slide`, `add_slide`, `edit_slide`, `del_slide`, `show_router`, `add_router`, `edit_router`, `del_router`, `show_saldo`, `show_income`, `add_income`, `edit_income`, `del_income`, `show_user`, `edit_user`, `del_user`, `add_user`, `show_product`, `add_product`, `edit_product`, `del_product`, `show_usage`, `show_history`, `show_speedtest`, `show_log`, `cek_bill`, `cek_usage`, `show_help`, `edit_help`, `del_help`, `add_help`, `register_coverage`, `register_maps`, `register_show`, `coverage_teknisi`, `customer_free`, `customer_isolir`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(3, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_menu`
--

CREATE TABLE `role_menu` (
  `role_id` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `customer_menu` int(11) NOT NULL,
  `customer_add` int(11) NOT NULL,
  `customer_active` int(11) NOT NULL,
  `customer_non_active` int(11) NOT NULL,
  `customer_waiting` int(11) NOT NULL,
  `customer_whatsapp` int(11) NOT NULL,
  `customer_chart` int(11) NOT NULL,
  `customer_maps` int(11) NOT NULL,
  `services_menu` int(11) NOT NULL,
  `services_add` int(11) NOT NULL,
  `services_item` int(11) NOT NULL,
  `services_category` int(11) NOT NULL,
  `coverage` int(11) NOT NULL,
  `coverage_add` int(11) NOT NULL,
  `coverage_menu` int(11) NOT NULL,
  `coverage_maps` int(11) NOT NULL,
  `bill` int(11) NOT NULL,
  `bill_menu` int(11) NOT NULL,
  `bill_unpaid` int(11) NOT NULL,
  `bill_paid` int(11) NOT NULL,
  `bill_due_date` int(11) NOT NULL,
  `bill_draf` int(11) NOT NULL,
  `bill_debt` int(11) NOT NULL,
  `bill_confirm` int(11) NOT NULL,
  `bill_code_coupon` int(11) NOT NULL,
  `bill_history` int(11) NOT NULL,
  `bill_delete` int(11) NOT NULL,
  `bill_send` int(11) NOT NULL,
  `finance_menu` int(11) NOT NULL,
  `finance_income` int(11) NOT NULL,
  `finance_expend` int(11) NOT NULL,
  `finance_report` int(11) NOT NULL,
  `help` int(11) NOT NULL,
  `help_menu` int(11) NOT NULL,
  `help_category` int(11) NOT NULL,
  `router` int(11) NOT NULL,
  `router_menu` int(11) NOT NULL,
  `router_customer` int(11) NOT NULL,
  `router_schedule` int(11) NOT NULL,
  `website_menu` int(11) NOT NULL,
  `website_slide` int(11) NOT NULL,
  `website_product` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `user_menu` int(11) NOT NULL,
  `user_add` int(11) NOT NULL,
  `user_admin` int(11) NOT NULL,
  `user_operator` int(11) NOT NULL,
  `user_teknisi` int(11) NOT NULL,
  `user_mitra` int(11) NOT NULL,
  `user_outlet` int(11) NOT NULL,
  `user_customer` int(11) NOT NULL,
  `user_kolektor` int(11) NOT NULL,
  `user_finance` int(11) NOT NULL,
  `role_menu` int(11) NOT NULL,
  `role_access` int(11) NOT NULL,
  `role_sub_menu` int(11) NOT NULL,
  `integration_menu` int(11) NOT NULL,
  `integration_whatsapp` int(11) NOT NULL,
  `integration_email` int(11) NOT NULL,
  `integration_telegram` int(11) NOT NULL,
  `integration_sms` int(11) NOT NULL,
  `integration_payment_gateway` int(11) NOT NULL,
  `integration_olt` int(11) NOT NULL,
  `integration_radius` int(11) NOT NULL,
  `setting_menu` int(11) NOT NULL,
  `setting_company` int(11) NOT NULL,
  `setting_about_company` int(11) NOT NULL,
  `setting_bank_account` int(11) NOT NULL,
  `setting_terms_condition` int(11) NOT NULL,
  `setting_privacy_policy` int(11) NOT NULL,
  `setting_logs` int(11) NOT NULL,
  `setting_backup` int(11) NOT NULL,
  `setting_other` int(11) NOT NULL,
  `customer_free` int(11) NOT NULL,
  `customer_isolir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role_menu`
--

INSERT INTO `role_menu` (`role_id`, `customer`, `customer_menu`, `customer_add`, `customer_active`, `customer_non_active`, `customer_waiting`, `customer_whatsapp`, `customer_chart`, `customer_maps`, `services_menu`, `services_add`, `services_item`, `services_category`, `coverage`, `coverage_add`, `coverage_menu`, `coverage_maps`, `bill`, `bill_menu`, `bill_unpaid`, `bill_paid`, `bill_due_date`, `bill_draf`, `bill_debt`, `bill_confirm`, `bill_code_coupon`, `bill_history`, `bill_delete`, `bill_send`, `finance_menu`, `finance_income`, `finance_expend`, `finance_report`, `help`, `help_menu`, `help_category`, `router`, `router_menu`, `router_customer`, `router_schedule`, `website_menu`, `website_slide`, `website_product`, `user`, `user_menu`, `user_add`, `user_admin`, `user_operator`, `user_teknisi`, `user_mitra`, `user_outlet`, `user_customer`, `user_kolektor`, `user_finance`, `role_menu`, `role_access`, `role_sub_menu`, `integration_menu`, `integration_whatsapp`, `integration_email`, `integration_telegram`, `integration_sms`, `integration_payment_gateway`, `integration_olt`, `integration_radius`, `setting_menu`, `setting_company`, `setting_about_company`, `setting_bank_account`, `setting_terms_condition`, `setting_privacy_policy`, `setting_logs`, `setting_backup`, `setting_other`, `customer_free`, `customer_isolir`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0),
(5, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `router`
--

CREATE TABLE `router` (
  `id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `ip_address` text NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` int(11) NOT NULL,
  `date_reset` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `router`
--

INSERT INTO `router` (`id`, `is_active`, `alias`, `ip_address`, `username`, `password`, `port`, `date_reset`, `create_by`) VALUES
(1, 0, 'Master', 'IP PUBLIC / VPN REMOTE', 'test', 'mywifi', 8728, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `services_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `no_services` varchar(125) NOT NULL,
  `qty` varchar(128) NOT NULL,
  `price` varchar(128) NOT NULL,
  `disc` varchar(128) DEFAULT NULL,
  `total` varchar(128) NOT NULL,
  `remark` text NOT NULL,
  `services_create` int(11) NOT NULL,
  `create_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`services_id`, `email`, `item_id`, `no_services`, `qty`, `price`, `disc`, `total`, `remark`, `services_create`, `create_by`) VALUES
(1, '', 1, '220615120905', '1', '180000', '100000', '80000', 'Jangan lupa bayar', 1655287813, 0),
(9, '', 7, '220615125754', '1', '200000', '0', '200000', '', 1656610423, 0),
(11, '', 3, '220616171139', '1', '200000', '0', '200000', '', 1656822456, 0),
(13, '', 1, '220703042041', '1', '100000', '0', '100000', '', 1656824303, 0),
(14, '', 1, '220703044027', '1', '100000', '0', '100000', '', 1656904788, 0),
(15, '', 3, '220703061838', '1', '200000', '0', '200000', '', 1656907784, 0),
(16, '', 2, '220704062533', '1', '150000', '0', '150000', '', 1656908916, 0);

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
  `image` varchar(225) NOT NULL,
  `role_id` text NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `no_services` varchar(50) NOT NULL,
  `fee` int(11) NOT NULL,
  `ppn` varchar(40) NOT NULL,
  `pph` varchar(40) NOT NULL,
  `bhp` varchar(40) NOT NULL,
  `uso` varchar(40) NOT NULL,
  `admin` varchar(40) NOT NULL,
  `fee_active` varchar(40) NOT NULL,
  `fee_mitra` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `phone`, `address`, `image`, `role_id`, `is_active`, `date_created`, `gender`, `no_services`, `fee`, `ppn`, `pph`, `bhp`, `uso`, `admin`, `fee_active`, `fee_mitra`) VALUES
(1, 'admin@gmail.com', '$2y$10$/XdV2yxyW7I/p0obVJHdieXLx2TCRCncHotQPZLZZLXnKANiw983i', 'Admin', '082337481227', 'Kp. Ciparay', 'default1.jpg', '1', 1, 1565599788, 'Male', '', 0, '', '', '', '', '', '', ''),
(25, 'admin@admin.com', '$2y$10$pKGfQG2etJ5lDW06PZncIOqY94RJTioYG4oM4n0/Up.cUpnX5HkRO', 'Admin', '', '', 'default.jpg', '1', 1, 1640543193, '', '', 0, '', '', '', '', '', '', '');

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
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indeks untuk tabel `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`carousel_id`);

--
-- Indeks untuk tabel `cat_expenditure`
--
ALTER TABLE `cat_expenditure`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `cat_income`
--
ALTER TABLE `cat_income`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `confirm_payment`
--
ALTER TABLE `confirm_payment`
  ADD PRIMARY KEY (`confirm_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `p_item_id` (`p_item_id`);

--
-- Indeks untuk tabel `c_status`
--
ALTER TABLE `c_status`
  ADD PRIMARY KEY (`c_status_id`);

--
-- Indeks untuk tabel `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenditure`
--
ALTER TABLE `expenditure`
  ADD PRIMARY KEY (`expenditure_id`);

--
-- Indeks untuk tabel `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice` (`invoice`);

--
-- Indeks untuk tabel `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks untuk tabel `package_item`
--
ALTER TABLE `package_item`
  ADD PRIMARY KEY (`p_item_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report_transaction`
--
ALTER TABLE `report_transaction`
  ADD PRIMARY KEY (`report_id`);

--
-- Indeks untuk tabel `role_management`
--
ALTER TABLE `role_management`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `router`
--
ALTER TABLE `router`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`services_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `carousel`
--
ALTER TABLE `carousel`
  MODIFY `carousel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `cat_expenditure`
--
ALTER TABLE `cat_expenditure`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cat_income`
--
ALTER TABLE `cat_income`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `confirm_payment`
--
ALTER TABLE `confirm_payment`
  MODIFY `confirm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `c_status`
--
ALTER TABLE `c_status`
  MODIFY `c_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `expenditure`
--
ALTER TABLE `expenditure`
  MODIFY `expenditure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `package_item`
--
ALTER TABLE `package_item`
  MODIFY `p_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `report_transaction`
--
ALTER TABLE `report_transaction`
  MODIFY `report_id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `role_management`
--
ALTER TABLE `role_management`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `router`
--
ALTER TABLE `router`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
