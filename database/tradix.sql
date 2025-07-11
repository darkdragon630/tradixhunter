-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 09:23 PM
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
-- Database: `tradix`
--

-- --------------------------------------------------------

--
-- Table structure for table `audiomp3`
--

CREATE TABLE `audiomp3` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `audio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audiomp3`
--

INSERT INTO `audiomp3` (`id`, `judul`, `audio`) VALUES
(1, 'Cerita Perjalanan Budaya Jawa', 'jawa.mp3'),
(2, 'Cerita Perjalanan Budaya Kalimantan', 'kalimantan.mp3'),
(3, 'Cerita Perjalanan Budaya Papua', 'papua.mp3'),
(4, 'Cerita Perjalanan Budaya Bali', 'sulawesi.mp3'),
(5, 'Cerita Perjalanan Budaya Sumatera', 'sumatera.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `koleksi`
--

CREATE TABLE `koleksi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reward_id` varchar(50) DEFAULT NULL,
  `nama_reward` varchar(100) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koleksi`
--

INSERT INTO `koleksi` (`id`, `user_id`, `reward_id`, `nama_reward`, `gambar`) VALUES
(1, 14, '686f59f9e1a0f', 'Batik Jawa', ''),
(2, 14, '686f5b6b9a578', 'Songket Sumatera', ''),
(3, 14, '686f8cd0e8cfe', 'Mandau Kalimantan', ''),
(4, 14, '686f8e712aabc', 'Tenun Sulawesi', ''),
(5, 14, '686fb0d116f5c', 'Kain Ikat NTT', ''),
(6, 14, '686fb1fa06c07', 'Koteka Papua', '');

-- --------------------------------------------------------

--
-- Table structure for table `kuis`
--

CREATE TABLE `kuis` (
  `id` int(11) NOT NULL,
  `wilayah` varchar(50) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `jawaban` enum('A','B','C','D') NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kuis`
--

INSERT INTO `kuis` (`id`, `wilayah`, `pertanyaan`, `jawaban`, `gambar`) VALUES
(1, 'jawa', 'Tari tradisional yang menggambarkan keberanian prajurit dan berasal dari Jawa Tengah adalah...', 'D', NULL),
(2, 'jawa', 'Rumah adat khas Jawa Tengah disebut...', 'B', NULL),
(3, 'jawa', 'Wayang kulit dalam budaya Jawa Tengah biasanya diiringi oleh...', 'D', NULL),
(4, 'jawa', 'Upacara adat Sekaten biasa diselenggarakan untuk memperingati...', 'B', NULL),
(5, 'jawa', 'Alat musik tradisional Jawa Tengah yang terdiri dari bilah logam dan dimainkan dipukul disebut...', 'B', NULL),
(6, 'jawa', 'Pertunjukan budaya dalam gambar di atas disebut...', 'C', 'wayang.jpeg'),
(7, 'jawa', 'Nama rumah adat seperti pada gambar adalah...', 'A', 'joglo.jpeg'),
(8, 'jawa', 'Upacara seperti ini disebut...', 'A', 'grebeg.jpeg'),
(9, 'jawa', 'Tari klasik Jawa Tengah yang digambarkan adalah...', 'C', 'tari_gambyong.jpeg'),
(10, 'jawa', 'Tradisi dalam gambar biasanya dilaksanakan saat...', 'B', 'sekaten.jpeg'),
(11, 'jawa', 'Tradisi Ruwatan bertujuan untuk...', 'B', NULL),
(12, 'jawa', 'Bahasa daerah yang digunakan dalam komunikasi sehari-hari masyarakat Jawa Tengah adalah...', 'B', NULL),
(13, 'jawa', 'Pakaian adat pria Jawa Tengah disebut...', 'C', NULL),
(14, 'jawa', 'Salah satu kerajinan khas dari Klaten dan Solo adalah...', 'A', NULL),
(15, 'jawa', 'Tradisi Tedak Siten dalam adat Jawa dilaksanakan saat...', 'A', NULL),
(16, 'sumatera', 'Provinsi di Sumatera yang dikenal dengan Danau Toba adalah...', 'A', NULL),
(17, 'sumatera', 'Rumah adat di Sumatera Barat yang terkenal dengan atapnya yang menjulang tinggi dan berbentuk gonjong disebut...', 'A', NULL),
(18, 'sumatera', 'Alat musik tradisional Sumatera Barat yang dimainkan dengan cara dipetik adalah...', 'B', NULL),
(19, 'sumatera', 'Suku Batak di Sumatera Utara memiliki rumah adat yang disebut...', 'B', NULL),
(20, 'sumatera', 'Tari tradisional dari Sumatera Utara yang menggambarkan kehidupan sehari-hari masyarakat Batak adalah...', 'A', NULL),
(21, 'sumatera', 'Provinsi di Sumatera yang dikenal dengan kota Padang adalah...', 'B', NULL),
(22, 'sumatera', 'Bahasa daerah yang digunakan oleh masyarakat Sumatera Utara adalah...', 'B', NULL),
(23, 'sumatera', 'Salah satu festival budaya terbesar di Sumatera Utara adalah...', 'A', NULL),
(24, 'sumatera', 'Provinsi di Sumatera yang dikenal dengan minyak bumi dan gas alamnya adalah...', 'C', NULL),
(25, 'sumatera', 'Rumah adat di Sumatera Selatan yang terkenal dengan atapnya yang berbentuk limas disebut...', 'B', NULL),
(26, 'sumatera', 'Alat musik tradisional Sumatera yang dimainkan dengan cara ditiup adalah...', 'A', NULL),
(27, 'sumatera', 'Suku Melayu di Sumatera memiliki tradisi yang kaya akan...', 'D', NULL),
(28, 'sumatera', 'Ibukota provinsi Sumatera Utara adalah...', 'A', NULL),
(29, 'sumatera', 'Bahasa daerah yang digunakan oleh masyarakat Sumatera Barat adalah...', 'A', NULL),
(30, 'sumatera', 'Salah satu tarian tradisional dari Sumatera Barat adalah...', 'C', NULL),
(31, 'kalimantan', 'Pulau Kalimantan terletak di bagian... Indonesia.', 'B', NULL),
(32, 'kalimantan', 'Provinsi di Kalimantan yang dikenal dengan hutan hujan tropisnya adalah...', 'D', NULL),
(33, 'kalimantan', 'Rumah adat suku Dayak di Kalimantan disebut...', 'C', NULL),
(34, 'kalimantan', 'Suku Dayak di Kalimantan memiliki tradisi yang kaya akan...', 'D', NULL),
(35, 'kalimantan', 'Ibukota provinsi Kalimantan Timur adalah...', 'C', NULL),
(36, 'kalimantan', 'Provinsi di Kalimantan yang dikenal dengan tambang batubara adalah...', 'D', NULL),
(37, 'kalimantan', 'Tari tradisional suku Dayak di Kalimantan adalah...', 'C', NULL),
(38, 'kalimantan', 'Bahasa daerah yang digunakan oleh masyarakat Kalimantan Selatan adalah...', 'A', NULL),
(39, 'kalimantan', 'Provinsi di Kalimantan yang dikenal dengan keindahan alamnya adalah...', 'D', NULL),
(40, 'kalimantan', 'Suku Banjar di Kalimantan Selatan memiliki tradisi yang kaya akan...', 'D', NULL),
(41, 'kalimantan', 'Ibukota provinsi Kalimantan Tengah adalah...', 'B', NULL),
(42, 'kalimantan', 'Provinsi di Kalimantan yang dikenal dengan delta Sungai Mahakam adalah...', 'C', NULL),
(43, 'kalimantan', 'Alat musik tradisional suku Dayak di Kalimantan adalah...', 'C', NULL),
(44, 'kalimantan', 'Suku Dayak di Kalimantan memiliki kepercayaan animisme dan...', 'D', NULL),
(45, 'kalimantan', 'Provinsi di Kalimantan yang dikenal dengan kota Pontianak adalah...', 'A', NULL),
(46, 'sulawesi', 'Apa nama suku yang terkenal dengan ritual kematian yang unik di Sulawesi?', 'C', NULL),
(47, 'sulawesi', 'Apa nama tarian tradisional yang berasal dari Sulawesi Selatan?', 'D', NULL),
(48, 'sulawesi', 'Apa nama rumah adat tradisional di Tana Toraja?', 'C', NULL),
(49, 'sulawesi', 'Apa nama alat musik tradisional yang sering dimainkan dalam acara-acara adat di Sulawesi?', 'D', NULL),
(50, 'sulawesi', 'Apa nama makanan khas Sulawesi yang terbuat dari sagu?', 'C', NULL),
(51, 'sulawesi', 'Apa nama suku yang banyak mendiami Sulawesi Selatan?', 'B', NULL),
(52, 'sulawesi', 'Apa nama ritual kematian yang unik di Tana Toraja?', 'D', NULL),
(53, 'sulawesi', 'Apa nama tarian tradisional yang menampilkan gerakan yang elegan dan dinamis di Sulawesi?', 'D', NULL),
(54, 'sulawesi', 'Apa nama rumah adat tradisional di Sulawesi yang memiliki atap yang curam?', 'A', NULL),
(55, 'sulawesi', 'Apa nama makanan khas Sulawesi yang terbuat dari daging sapi?', 'A', NULL),
(56, 'sulawesi', 'Apa nama suku yang terkenal dengan keahlian dalam bidang pertanian di Sulawesi?', 'A', NULL),
(57, 'sulawesi', 'Apa nama alat musik tradisional yang digunakan dalam upacara adat di Sulawesi?', 'D', NULL),
(58, 'sulawesi', 'Apa nama tarian tradisional yang menampilkan gerakan yang dinamis dan energik di Sulawesi?', 'D', NULL),
(59, 'sulawesi', 'Apa nama rumah adat tradisional di Sulawesi yang memiliki ukiran yang indah?', 'A', NULL),
(60, 'sulawesi', 'Apa nama makanan khas Sulawesi yang terkenal dengan rasa yang lezat dan bergizi?', 'D', NULL),
(61, 'ntt', 'Ibukota provinsi Nusa Tenggara Timur (NTT) adalah...', 'A', NULL),
(62, 'ntt', 'Pulau terbesar di NTT adalah...', 'C', NULL),
(63, 'ntt', 'Tari tradisional dari NTT yang terkenal adalah...', 'C', NULL),
(64, 'ntt', 'Provinsi NTT dikenal dengan keindahan alamnya, seperti...', 'C', NULL),
(65, 'ntt', 'Suku asli di NTT yang terkenal dengan keahlian memanjat pohon lontar adalah...', 'C', NULL),
(66, 'ntt', 'Bahasa daerah yang digunakan oleh masyarakat NTT adalah...', 'B', NULL),
(67, 'ntt', 'NTT dikenal dengan produksi garamnya yang berkualitas tinggi, terutama di...', 'D', NULL),
(68, 'ntt', 'Salah satu festival budaya terbesar di NTT adalah...', 'C', NULL),
(69, 'ntt', 'NTT memiliki keanekaragaman hayati yang tinggi, terutama di...', 'A', NULL),
(70, 'ntt', 'Pulau Komodo di NTT terkenal dengan habitat...', 'C', NULL),
(71, 'ntt', 'Ibukota kabupaten di NTT yang terkenal dengan kota wisata adalah...', 'C', NULL),
(72, 'ntt', 'NTT memiliki garis pantai yang panjang dan keindahan bawah laut yang luar biasa, terutama di...', 'D', NULL),
(73, 'ntt', 'Suku Manggarai di Flores, NTT, memiliki tradisi yang kaya akan...', 'A', NULL),
(74, 'ntt', 'NTT dikenal dengan produksi kain tenunnya yang indah dan berkualitas tinggi, terutama di...', 'B', NULL),
(75, 'ntt', 'Salah satu tarian tradisional dari NTT yang menggambarkan kehidupan sehari-hari masyarakat adalah...', 'C', NULL),
(76, 'papua', 'Rumah adat masyarakat pegunungan Papua yang berbentuk bulat disebut...', 'A', NULL),
(77, 'papua', 'Alat musik tradisional Papua yang dimainkan dengan cara dipukul adalah...', 'B', NULL),
(78, 'papua', 'Tari tradisional Papua yang sering ditampilkan dalam penyambutan tamu adalah...', 'A', NULL),
(79, 'papua', 'Suku terbesar yang tinggal di Lembah Baliem, Papua adalah suku...', 'A', NULL),
(80, 'papua', 'Tradisi Bakar Batu dalam masyarakat Papua bertujuan untuk...', 'B', NULL),
(81, 'papua', 'Rumah adat seperti pada gambar disebut...', 'A', 'Honai.jpg'),
(82, 'papua', 'Pakaian seperti dalam gambar biasanya digunakan dalam...', 'A', 'Festival_Budaya_Papua.jpg'),
(83, 'papua', 'Tradisi memasak khas Papua seperti dalam gambar dinamakan...', 'B', 'tradisi_batu_bakar.jpg'),
(84, 'papua', 'Alat musik pada gambar tersebut bernama...', 'A', 'Tifa.jpg'),
(85, 'papua', 'Tampilan anak-anak tersebut berkaitan dengan...', 'C', 'Tradisi_Adat_Papua.jpg'),
(86, 'papua', 'Apa nama festival budaya terbesar di Papua yang diselenggarakan setiap tahun di Wamena?', 'B', NULL),
(87, 'papua', 'Hasil kerajinan khas masyarakat Asmat Papua yang terkenal adalah...', 'B', NULL),
(88, 'papua', 'Suku Asmat tinggal di wilayah Papua bagian...', 'C', NULL),
(89, 'papua', 'Bahasa daerah yang digunakan oleh masyarakat Papua sangat banyak. Istilah ini dikenal sebagai…', 'D', NULL),
(90, 'papua', 'Salah satu tarian daerah Papua selain Tari Perang adalah...', 'A', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kuis_jawaban`
--

CREATE TABLE `kuis_jawaban` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kuis_id` int(11) NOT NULL,
  `wilayah` varchar(50) DEFAULT NULL,
  `jawaban_user` varchar(1) DEFAULT NULL,
  `jawaban_benar` varchar(1) DEFAULT NULL,
  `skor` int(11) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kuis_jawaban`
--

INSERT INTO `kuis_jawaban` (`id`, `user_id`, `kuis_id`, `wilayah`, `jawaban_user`, `jawaban_benar`, `skor`, `tanggal`) VALUES
(203, 14, 10, 'jawa', 'B', 'B', 10, '2025-07-10 06:08:42'),
(204, 14, 4, 'jawa', 'B', 'B', 10, '2025-07-10 06:08:50'),
(205, 14, 8, 'jawa', 'A', 'A', 10, '2025-07-10 06:09:05'),
(206, 14, 6, 'jawa', 'C', 'C', 10, '2025-07-10 06:09:24'),
(207, 14, 9, 'jawa', 'C', 'C', 10, '2025-07-10 06:09:38'),
(208, 14, 15, 'jawa', 'A', 'A', 10, '2025-07-10 06:09:46'),
(209, 14, 5, 'jawa', 'B', 'B', 10, '2025-07-10 06:10:42'),
(210, 14, 7, 'jawa', 'A', 'A', 10, '2025-07-10 06:10:50'),
(211, 14, 11, 'jawa', 'B', 'B', 10, '2025-07-10 06:11:09'),
(212, 14, 3, 'jawa', 'D', 'D', 10, '2025-07-10 06:11:21'),
(213, 14, 2, 'jawa', 'B', 'B', 10, '2025-07-10 06:11:33'),
(214, 14, 14, 'jawa', 'A', 'A', 10, '2025-07-10 06:11:42'),
(215, 14, 12, 'jawa', 'B', 'B', 10, '2025-07-10 06:11:48'),
(216, 14, 13, 'jawa', 'C', 'C', 10, '2025-07-10 06:12:03'),
(217, 14, 1, 'jawa', 'D', 'D', 10, '2025-07-10 06:13:13'),
(218, 14, 24, 'sumatera', 'C', 'C', 10, '2025-07-10 06:15:14'),
(219, 14, 17, 'sumatera', 'A', 'A', 10, '2025-07-10 06:15:31'),
(220, 14, 26, 'sumatera', 'A', 'A', 10, '2025-07-10 06:15:42'),
(221, 14, 19, 'sumatera', 'B', 'B', 10, '2025-07-10 06:16:05'),
(222, 14, 21, 'sumatera', 'B', 'B', 10, '2025-07-10 06:16:23'),
(223, 14, 28, 'sumatera', 'A', 'A', 10, '2025-07-10 06:16:41'),
(224, 14, 30, 'sumatera', 'C', 'C', 10, '2025-07-10 06:17:00'),
(225, 14, 25, 'sumatera', 'B', 'B', 10, '2025-07-10 06:17:15'),
(226, 14, 18, 'sumatera', 'B', 'B', 10, '2025-07-10 06:17:50'),
(227, 14, 20, 'sumatera', 'A', 'A', 10, '2025-07-10 06:18:13'),
(228, 14, 27, 'sumatera', 'D', 'D', 10, '2025-07-10 06:18:20'),
(229, 14, 22, 'sumatera', 'B', 'B', 10, '2025-07-10 06:18:33'),
(230, 14, 23, 'sumatera', 'A', 'A', 10, '2025-07-10 06:18:42'),
(231, 14, 16, 'sumatera', 'A', 'A', 10, '2025-07-10 06:18:59'),
(232, 14, 29, 'sumatera', 'A', 'A', 10, '2025-07-10 06:19:23'),
(233, 14, 44, 'kalimantan', 'D', 'D', 10, '2025-07-10 07:02:03'),
(234, 14, 35, 'kalimantan', 'C', 'C', 10, '2025-07-10 07:05:25'),
(235, 14, 38, 'kalimantan', 'A', 'A', 10, '2025-07-10 07:05:53'),
(236, 14, 40, 'kalimantan', 'D', 'D', 10, '2025-07-10 07:36:34'),
(237, 14, 43, 'kalimantan', 'C', 'C', 10, '2025-07-10 07:37:07'),
(238, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 07:42:48'),
(239, 14, 45, 'kalimantan', 'A', 'A', 10, '2025-07-10 07:44:31'),
(240, 14, 34, 'kalimantan', 'D', 'D', 10, '2025-07-10 07:44:49'),
(241, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 07:44:57'),
(242, 14, 31, 'kalimantan', 'B', 'B', 10, '2025-07-10 07:49:00'),
(243, 14, 43, 'kalimantan', 'C', 'C', 10, '2025-07-10 07:49:24'),
(244, 14, 35, 'kalimantan', 'C', 'C', 10, '2025-07-10 07:50:21'),
(245, 14, 39, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:00:37'),
(246, 14, 40, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:00:50'),
(247, 14, 34, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:01:01'),
(248, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:06:33'),
(249, 14, 31, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:07:06'),
(250, 14, 42, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:11:21'),
(251, 14, 33, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:21:52'),
(252, 14, 34, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:22:04'),
(253, 14, 45, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:22:37'),
(254, 14, 40, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:22:55'),
(255, 14, 41, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:23:46'),
(256, 14, 35, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:24:05'),
(257, 14, 37, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:25:13'),
(258, 14, 36, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:27:06'),
(259, 14, 42, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:27:57'),
(260, 14, 38, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:28:58'),
(261, 14, 43, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:29:29'),
(262, 14, 39, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:30:10'),
(263, 14, 44, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:30:24'),
(264, 14, 31, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:30:48'),
(265, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:33:22'),
(266, 14, 41, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:38:59'),
(267, 14, 33, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:39:13'),
(268, 14, 36, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:39:26'),
(269, 14, 45, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:40:07'),
(270, 14, 37, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:40:20'),
(271, 14, 40, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:40:34'),
(272, 14, 35, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:40:49'),
(273, 14, 43, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:40:59'),
(274, 14, 44, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:41:09'),
(275, 14, 31, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:41:25'),
(276, 14, 38, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:41:36'),
(277, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:41:48'),
(278, 14, 42, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:42:06'),
(279, 14, 39, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:42:19'),
(280, 14, 34, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:42:35'),
(281, 14, 32, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:46:32'),
(282, 14, 40, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:46:43'),
(283, 14, 44, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:46:52'),
(284, 14, 31, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:47:05'),
(285, 14, 38, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:47:17'),
(286, 14, 42, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:47:35'),
(287, 14, 39, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:47:44'),
(288, 14, 43, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:47:54'),
(289, 14, 45, 'kalimantan', 'A', 'A', 10, '2025-07-10 09:48:24'),
(290, 14, 33, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:48:36'),
(291, 14, 36, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:49:05'),
(292, 14, 35, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:49:23'),
(293, 14, 37, 'kalimantan', 'C', 'C', 10, '2025-07-10 09:49:34'),
(294, 14, 41, 'kalimantan', 'B', 'B', 10, '2025-07-10 09:49:53'),
(295, 14, 34, 'kalimantan', 'D', 'D', 10, '2025-07-10 09:50:04'),
(296, 14, 58, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:52:34'),
(297, 14, 53, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:52:52'),
(298, 14, 54, 'sulawesi', 'A', 'A', 10, '2025-07-10 09:53:09'),
(299, 14, 47, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:53:32'),
(300, 14, 59, 'sulawesi', 'A', 'A', 10, '2025-07-10 09:53:54'),
(301, 14, 57, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:54:04'),
(302, 14, 48, 'sulawesi', 'C', 'C', 10, '2025-07-10 09:54:28'),
(303, 14, 52, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:54:40'),
(304, 14, 55, 'sulawesi', 'A', 'A', 10, '2025-07-10 09:54:55'),
(305, 14, 50, 'sulawesi', 'C', 'C', 10, '2025-07-10 09:55:14'),
(306, 14, 46, 'sulawesi', 'C', 'C', 10, '2025-07-10 09:55:34'),
(307, 14, 51, 'sulawesi', 'B', 'B', 10, '2025-07-10 09:55:49'),
(308, 14, 60, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:56:05'),
(309, 14, 49, 'sulawesi', 'D', 'D', 10, '2025-07-10 09:56:16'),
(310, 14, 56, 'sulawesi', 'A', 'A', 10, '2025-07-10 09:57:00'),
(311, 14, 73, 'ntt', 'A', 'A', 10, '2025-07-10 12:17:19'),
(312, 14, 63, 'ntt', 'C', 'C', 10, '2025-07-10 12:17:40'),
(313, 14, 74, 'ntt', 'B', 'B', 10, '2025-07-10 12:17:54'),
(314, 14, 64, 'ntt', 'C', 'C', 10, '2025-07-10 12:18:09'),
(315, 14, 70, 'ntt', 'C', 'C', 10, '2025-07-10 12:18:22'),
(316, 14, 65, 'ntt', 'C', 'C', 10, '2025-07-10 12:19:53'),
(317, 14, 75, 'ntt', 'C', 'C', 10, '2025-07-10 12:20:16'),
(318, 14, 68, 'ntt', 'C', 'C', 10, '2025-07-10 12:21:38'),
(319, 14, 67, 'ntt', 'D', 'D', 10, '2025-07-10 12:22:11'),
(320, 14, 61, 'ntt', 'A', 'A', 10, '2025-07-10 12:22:22'),
(321, 14, 71, 'ntt', 'C', 'C', 10, '2025-07-10 12:22:32'),
(322, 14, 62, 'ntt', 'C', 'C', 10, '2025-07-10 12:22:56'),
(323, 14, 69, 'ntt', 'A', 'A', 10, '2025-07-10 12:23:14'),
(324, 14, 66, 'ntt', 'B', 'B', 10, '2025-07-10 12:23:26'),
(325, 14, 72, 'ntt', 'D', 'D', 10, '2025-07-10 12:23:40'),
(326, 14, 80, 'papua', 'B', 'B', 10, '2025-07-10 12:24:21'),
(327, 14, 76, 'papua', 'A', 'A', 10, '2025-07-10 12:24:33'),
(328, 14, 83, 'papua', 'B', 'B', 10, '2025-07-10 12:24:46'),
(329, 14, 82, 'papua', 'A', 'A', 10, '2025-07-10 12:25:18'),
(330, 14, 85, 'papua', 'C', 'C', 10, '2025-07-10 12:25:30'),
(331, 14, 86, 'papua', 'B', 'B', 10, '2025-07-10 12:25:47'),
(332, 14, 81, 'papua', 'A', 'A', 10, '2025-07-10 12:26:01'),
(333, 14, 79, 'papua', 'A', 'A', 10, '2025-07-10 12:26:19'),
(334, 14, 77, 'papua', 'B', 'B', 10, '2025-07-10 12:26:33'),
(335, 14, 89, 'papua', 'D', 'D', 10, '2025-07-10 12:26:47'),
(336, 14, 87, 'papua', 'B', 'B', 10, '2025-07-10 12:27:17'),
(337, 14, 90, 'papua', 'A', 'A', 10, '2025-07-10 12:27:32'),
(338, 14, 88, 'papua', 'C', 'C', 10, '2025-07-10 12:28:00'),
(339, 14, 78, 'papua', 'A', 'A', 10, '2025-07-10 12:28:22'),
(340, 14, 84, 'papua', 'A', 'A', 10, '2025-07-10 12:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `judul`, `isi`, `kategori`, `created_at`) VALUES
(1, 'Petualangan Jawa', '🚀 CERITA PETUALANGAN: KELILING PULAU JAWA\r\n🌈 Halo penjelajah cilik!\r\nHari ini kita naik mobil warna-warni keliling Pulau Jawa. Dari barat sampai timur, kita bakal mampir ke banyak kota, cobain makanan enak, dan lihat budaya keren!\r\n🗺 Pulau Jawa punya 6 provinsi lho!\r\nDan masing-masing punya ibu kota yang unik:\r\n1.	Banten\r\n🏙 Ibu kotanya: Serang\r\nDekat banget sama pantai Anyer & Tanjung Lesung.\r\n2.	DKI Jakarta\r\n🏙 Ibu kotanya: Jakarta sendiri.\r\nKota super sibuk, gedung tinggi, pusat belanja, dan penuh cerita Betawi.\r\n3.	Jawa Barat\r\n🏙 Ibu kotanya: Bandung\r\nDingin, banyak villa, kuliner enak kayak seblak & batagor.\r\n4.	Jawa Tengah\r\n🏙 Ibu kotanya: Semarang\r\nAda Lawang Sewu yang terkenal mistis, dan Lumpia Semarang yang gurih.\r\n5.	DI Yogyakarta\r\n🏙 Ibu kotanya: Yogyakarta juga!\r\nOrang sering bilang Jogja, penuh seniman, batik, dan Malioboro.\r\n6.	Jawa Timur\r\n🏙 Ibu kotanya: Surabaya\r\nKota pahlawan, patung Suro (hiu) & Boyo (buaya) legendaris banget.\r\n🍃 1. Serang, Banten\r\nKita pertama mendarat di Serang. Di sini ada rumah adat Sulah Nyanda dengan atap miring ke belakang. Orang-orang pakai baju adat pangsi & kebaya Banten. Kita diajak makan Rabeg, semur daging kambing yang gurih banget, sama Sate Bandeng yang dagingnya lunak.\r\n🎆 2. Jakarta, Ibu Kota Negara\r\nKita lanjut ke Jakarta yang ramai banget. Banyak gedung tinggi, jalanan sibuk, dan suara klakson di mana-mana. Rumah adatnya Rumah Kebaya, atapnya lipat-lipat kayak kebaya. Orang Betawi pakai sadariah & kebaya encim, terus ngajak kita makan kerak telor di pinggir jalan. Gurih & renyah!\r\n🏞 3. Bandung, Jawa Barat\r\nSekarang kita nanjak ke Bandung. Udaranya sejuk, banyak kebun teh & stroberi. Rumahnya namanya Imah Julang Ngapak, atapnya melebar kayak burung. Kita lihat orang Sunda pakai pangsi & kebaya Sunda, terus nyobain seblak pedas & batagor yang bikin ketagihan.\r\n🏯 4. Semarang, Jawa Tengah\r\nKita terus jalan ke Semarang. Di sini rumah adatnya Joglo, atapnya tinggi bertingkat. Orang-orang pakai beskap & kebaya Jawa, kelihatan anggun banget. Kita disuguhi Lumpia Semarang, kulitnya tipis isi rebung & ayam. Enak banget!\r\n🏰 5. Yogyakarta, DI Yogyakarta\r\nKita berhenti di Jogja, kota seni yang terkenal dengan keraton & Malioboro. Rumah adatnya juga Joglo, tapi coraknya beda, lebih khas keraton. Kita lihat wayang kulit, lalu makan gudeg manis ditemani bakpia buat oleh-oleh.\r\n🌋 6. Surabaya, Jawa Timur\r\nPerjalanan terakhir ke Surabaya. Rumah adatnya Joglo Situbondo, tapi kalau ke Madura ada Tanean Lanjhang. Orang Jawa Timur pakai beskap & kebaya Jawa Timur, suaranya tegas & bersemangat. Kita makan Rawon yang kuahnya hitam pakai kluwek, lalu lanjut Rujak Cingur yang unik.\r\n🎉 Petualangan selesai!\r\nKamu sekarang udah kenal semua provinsi di Pulau Jawa beserta rumah adat, baju adat, makanan khas, sampai cerita uniknya.\r\nKalau nanti main game, bisa jadi misi spesial tuh: “Kumpulkan makanan khas di tiap kota!” atau “Tebak rumah adatnya!”\r\n', 'jawa', '2025-07-10 13:00:23'),
(2, 'Petualangan Sumatra', '🚀 CERITA PETUALANGAN: KELILING PULAU SUMATRA\r\n🎒 Ayo siap-siap!\r\nKita naik perahu layar besar menyeberang Selat Sunda, sampai akhirnya menjejak Pulau Sumatra yang hijau & panjang kayak naga tidur. Yuk mulai petualangan kita dari ujung utara!\r\n🗺 Pulau Sumatra punya 10 provinsi lho!\r\nDan masing-masing punya ibu kota yang unik & cerita seru:\r\n1.	Aceh\r\n🏙 Ibu kotanya: Banda Aceh\r\nDisebut Serambi Mekah, punya Masjid Baiturrahman yang megah banget & Mie Aceh yang pedas nendang.\r\n2.	Sumatra Utara\r\n🏙 Ibu kotanya: Medan\r\nDekat Danau Toba yang luasnya kayak laut. Wajib coba Bika Ambon & durian Medan.\r\n3.	Sumatra Barat\r\n🏙 Ibu kotanya: Padang\r\nPusat budaya Minangkabau dengan Rumah Gadang atap runcing. Rendang & Sate Padangnya juara dunia.\r\n4.	Riau\r\n🏙 Ibu kotanya: Pekanbaru\r\nKaya minyak & tradisi Melayu. Mie Sagu dan Gulai Patin jadi kuliner khasnya.\r\n5.	Kepulauan Riau\r\n🏙 Ibu kotanya: Tanjungpinang\r\nBerpulau-pulau indah, dekat Singapura. Terkenal dengan otak-otak & Lakse.\r\n6.	Jambi\r\n🏙 Ibu kotanya: Jambi\r\nDekat Sungai Batanghari. Kuliner uniknya tempoyak (durian fermentasi) dicampur ikan.\r\n7.	Sumatra Selatan\r\n🏙 Ibu kotanya: Palembang\r\nAda Jembatan Ampera yang ikonik & Sungai Musi. Pempek pakai cuko pedasnya legendaris.\r\n8.	Bengkulu\r\n🏙 Ibu kotanya: Bengkulu\r\nTempat bunga Rafflesia Arnoldi raksasa. Ada Pendap yang gurih & pedas.\r\n9.	Lampung\r\n🏙 Ibu kotanya: Bandar Lampung\r\nGerbang Sumatra dari Jawa. Nikmati Seruit ikan bakar & pantai-pantai cantik.\r\n10.	Bangka Belitung\r\n🏙 Ibu kotanya: Pangkalpinang\r\nPantai berpasir putih & batu granit besar. Lempah Kuning ikannya segar banget.\r\n\r\n🏞 1. Banda Aceh, Nanggroe Aceh Darussalam\r\nDi sini rumahnya namanya Rumoh Aceh, panggung tinggi dengan ukiran cantik. Orang Aceh pakai baju adat Linto Baro & Daro Baro kalau pesta. Kita diajak makan Mie Aceh pedas gurih & Ayam Tangkap yang renyah.\r\n\r\n🏔 2. Medan, Sumatra Utara\r\nKita turun ke Medan, tempat suku Batak tinggal. Rumah adatnya Rumah Bolon besar dengan atap tinggi melengkung. Orang Batak pakai ulos saat upacara. Kita diajak makan Arsik (ikan mas bumbu kuning) & Saksang dari daging babi (untuk Muslim biasanya diganti ayam).\r\n\r\n🏡 3. Padang, Sumatra Barat\r\nMasuk tanah Minangkabau, rumahnya Rumah Gadang yang atapnya runcing kayak tanduk kerbau. Perempuan Minang pakai Suntiang, hiasan kepala besar berkilau emas. Kita makan Rendang empuk & Sate Padang yang kuahnya kuning kental.\r\n\r\n🌳 4. Pekanbaru, Riau\r\nDi sini rumah adatnya Selaso Jatuh Kembar, atapnya bertumpuk dua. Orang Riau pakai Teluk Belanga, baju Melayu yang sopan. Kita makan Gulai Patin sama Mie Sagu yang kenyal.\r\n\r\n⛵ 5. Tanjungpinang, Kepulauan Riau\r\nKita menyeberang ke pulau-pulau kecil, rumah adatnya Belah Bubung, khas Melayu laut. Bajunya Baju Kurung Melayu. Kita makan Otak-otak ikan & Lakse, mirip laksa tapi khas pesisir.\r\n\r\n🌴 6. Jambi\r\nRumah adatnya Kajang Leko, tinggi di atas tiang, biar aman dari banjir. Bajunya Paksian, khas Melayu Jambi. Kita makan Tempoyak (fermentasi durian) dicampur ikan, unik banget!\r\n\r\n🏯 7. Palembang, Sumatra Selatan\r\nRumah adatnya Rumah Limas, besar dengan tangga bertingkat. Bajunya Aesan Gede, mewah berwarna emas. Kita makan Pempek cuko pedas asam, Tekwan, & Model.\r\n\r\n🌾 8. Bengkulu\r\nRumah adatnya Bubungan Lima, simpel tapi artistik. Orang Bengkulu pakai baju adat Rejang. Kita makan Pendap, ikan dibungkus daun talas dengan rempah kuat, dan Lempuk Durian yang legit.\r\n\r\n🌺 9. Bandar Lampung, Lampung\r\nRumah adatnya Nuwo Sesat, buat musyawarah adat. Bajunya Pepadun, penuh hiasan emas. Kita diajak makan Seruit, ikan sungai bakar dengan sambal terasi & tempoyak.\r\n\r\n🐚 10. Pangkalpinang, Bangka Belitung\r\nRumah adatnya Rumah Rakit mengapung di sungai. Bajunya Paksian Melayu dengan songket. Kita makan Lempah Kuning, ikan kuah kunyit, sama Kemplang (kerupuk panggang).\r\n\r\n🎉 Hore, selesai keliling Sumatra!\r\nSekarang kamu udah kenal rumah adat, baju adat, makanan khas & ibu kota masing-masing provinsi di Sumatra.\r\nKalau nanti main game, bisa dapat misi “Kumpulkan Pempek, Rendang, sampai Mie Aceh!” atau “Pasangkan Rumah Adat dengan Provinsinya\r\n\r\n', 'sumatra', '2025-07-10 13:00:23'),
(3, 'Petualangan Sulawesi', '🗺 Pulau Sulawesi punya 6 provinsi lho!\r\nDan masing-masing punya ibu kota yang unik & seru untuk dieksplor:\r\n1.	Sulawesi Utara\r\n🏙 Ibu kotanya: Manado\r\nDeket banget sama Bunaken yang bawah lautnya cantik luar biasa. Orang Manado suka makan pedas, coba deh Tinutuan & Cakalang Fufu.\r\n2.	Gorontalo\r\n🏙 Ibu kotanya: Gorontalo\r\nKota seribu masjid, terkenal dengan Danau Limboto & Saronde Island. Kuliner khasnya Ilabulo (semacam pepes hati ayam).\r\n3.	Sulawesi Tengah\r\n🏙 Ibu kotanya: Palu\r\nAda Teluk Palu yang indah banget & kebudayaan Kaili. Coba Kaledo (sop kaki sapi) kalau kesini.\r\n4.	Sulawesi Barat\r\n🏙 Ibu kotanya: Mamuju\r\nProvinsi termuda di Sulawesi, punya pantai-pantai perawan & kuliner Jepa (roti singkong).\r\n5.	Sulawesi Selatan\r\n🏙 Ibu kotanya: Makassar\r\nKota pelabuhan besar sejak zaman dulu, dekat Pantai Losari. Sop Konro & Coto Makassar wajib dicicip.\r\n6.	Sulawesi Tenggara\r\n🏙 Ibu kotanya: Kendari\r\nPintu gerbang ke Wakatobi, surga diving dunia. Di sini banyak kuliner ikan laut segar & Sinonggi (sagu khas).\r\n🚀 CERITA PETUALANGAN: KELILING PULAU SULAWESI\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik kapal layar lalu pindah ke kapal cepat, karena bentuk Pulau Sulawesi itu unik banget — mirip huruf “K” dengan teluk & tanjung panjang-panjang. Yuk mulai dari utara!\r\n\r\n🐠 1. Manado, Sulawesi Utara\r\nBegitu kita mendarat di Manado, langsung disambut angin laut & senyum orang-orang Manado yang ramah. Rumah adatnya namanya Wale, tinggi di atas tiang. Kita lihat ibu-ibu pakai baju adat Baniang Manado yang cerah.\r\nJangan lupa snorkeling di Bunaken, surga bawah laut penuh ikan warna-warni. Terus kita makan Tinutuan (bubur Manado) hangat & Cakalang Fufu, ikan asap yang gurih banget.\r\n\r\n🕌 2. Gorontalo\r\nTurun sedikit ke Gorontalo, disebut Kota Seribu Masjid. Rumah adatnya Dulohupa, tempat musyawarah adat. Perempuan Gorontalo cantik pakai bili’u, hiasan kepala lebar ke samping. Kita diajak makan Ilabulo, pepes hati ayam yang dibungkus daun pisang. Sore harinya kita naik perahu ke Pulau Saronde, pasir putihnya kayak bedak!\r\n\r\n🌅 3. Palu, Sulawesi Tengah\r\nSampai di Palu, kita jalan-jalan di pinggir Teluk Palu yang membiru. Rumah adatnya Lobo & Tambi, atapnya tinggi lancip. Warga sini pakai baju adat Nggembe, cantik berwarna merah. Kita makan Kaledo, sop kaki sapi dengan kuah pedas, dimakan panas-panas sambil liat sunset.\r\n\r\n🏝 4. Mamuju, Sulawesi Barat\r\nMamuju masih tenang, belum banyak keramaian. Rumah adatnya Boyang, sederhana tapi kokoh. Bajunya Topo’, berwarna cerah. Kita makan Jepa, roti pipih dari singkong yang dimakan dengan ikan bakar. Pantainya panjang, airnya bening banget.\r\n\r\n⛵ 5. Makassar, Sulawesi Selatan\r\nSampai di Makassar, kita langsung diajak ke Pantai Losari, lihat kapal Phinisi legendaris. Rumah adatnya Tongkonan kalau di Tana Toraja (bagian Sulsel juga), atapnya melengkung kayak tanduk kerbau. Baju adatnya megah, penuh manik-manik.\r\nKita makan Coto Makassar sama Sop Konro, tulang iga besar yang empuk banget!\r\n\r\n🐬 6. Kendari, Sulawesi Tenggara\r\nTerakhir kita ke Kendari, pintu gerbang menuju Wakatobi, tempat diving tercantik di dunia. Rumah adatnya Banua Tada, mirip rumah panggung. Bajunya baju adat Tolaki, penuh sulam emas. Kita makan Sinonggi, bubur sagu yang dimakan sama ikan kuah kuning — rasanya segar & unik!\r\n\r\n🎉 Hore, keliling Sulawesi selesai!\r\nKamu sekarang udah lihat sendiri rumah adat, baju adat, makanan khas, dan alam keren di tiap provinsi Sulawesi.\r\nSiapa tahu nanti di game, misinya “cari terumbu karang paling indah di Bunaken!” atau “masak Kaledo bareng orang Palu!”\r\n', 'sulawesi', '2025-07-10 13:00:23'),
(4, 'Petualangan Kalimantan', '🚀 CERITA PETUALANGAN: KELILING PULAU KALIMANTAN\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik kapal besar menyusuri sungai terpanjang Indonesia, Sungai Kapuas, lalu belok-belok melewati hutan hujan lebat dan desa di tepian sungai. Yuk mulai petualangan dari barat!\r\n🗺 Pulau Kalimantan punya 5 provinsi lho!\r\nDan masing-masing punya ibu kota yang unik & penuh cerita:\r\n1.	Kalimantan Barat\r\n🏙 Ibu kotanya: Pontianak\r\nKota yang dilewati garis khatulistiwa. Banyak rumah panjang Dayak & es lidah buaya yang segar banget.\r\n2.	Kalimantan Tengah\r\n🏙 Ibu kotanya: Palangkaraya\r\nTenang, banyak sungai & hutan gambut. Tempat rumah Betang Dayak yang panjang banget.\r\n3.	Kalimantan Selatan\r\n🏙 Ibu kotanya: Banjarmasin\r\nDisebut Kota Seribu Sungai. Unik banget karena ada pasar terapung di atas air.\r\n4.	Kalimantan Timur\r\n🏙 Ibu kotanya: Samarinda\r\nDekat Balikpapan & calon ibu kota baru Indonesia (IKN Nusantara). Banyak Lamin Dayak yang megah.\r\n5.	Kalimantan Utara\r\n🏙 Ibu kotanya: Tanjung Selor\r\nProvinsi termuda di Kalimantan. Punya budaya Tidung & kuliner lawa yang segar.\r\n\r\n🌿 1. Pontianak, Kalimantan Barat\r\nKita sampai di Pontianak, kota yang dilewati garis Khatulistiwa. Rumah adatnya namanya Rumah Panjang, gede banget karena ditinggali ramai-ramai satu keluarga besar. Orang sini pakai King Baba & King Bibinge, pakaian adat Dayak yang penuh manik warna-warni.\r\nKita diajak makan Pengkang, ketan isi ebi yang dibakar, lalu minum Es Lidah Buaya yang seger banget.\r\n\r\n🪵 2. Palangkaraya, Kalimantan Tengah\r\nLanjut ke Palangkaraya, kota tenang yang dikelilingi rawa gambut & sungai-sungai besar. Rumah adatnya Betang, panjangnya bisa puluhan meter, mirip Rumah Panjang tapi dengan ukiran khas Dayak Ngaju. Bajunya Sangkarut, dihiasi bulu burung enggang. Kita makan Juhu Umbut Rotan, sayur dari pucuk rotan yang rasanya unik.\r\n\r\n🐊 3. Banjarmasin, Kalimantan Selatan\r\nSampai di Banjarmasin, kita naik klotok, perahu kayu buat muter-muter di pasar terapung Kuin. Rumah adatnya Bubungan Tinggi, atapnya runcing ke atas. Orang Banjar pakai Baju Baamar Galung Pancaran, kainnya berwarna cerah. Kita makan Soto Banjar yang harum rempah, sama Ketupat Kandangan pakai ikan haruan.\r\n\r\n🌴 4. Samarinda, Kalimantan Timur\r\nKita lanjut ke Samarinda. Rumah adatnya Lamin, panjang & tinggi di atas tiang, tempat suku Dayak Kenyah berkumpul. Baju adatnya Ta’a & Sapei Sapaq, dihiasi manik-manik & bulu burung. Kita makan Sambal Raja, pedas segar pakai ikan goreng, plus Amplang, kerupuk ikan khas sini.\r\n\r\n⚓ 5. Tanjung Selor, Kalimantan Utara\r\nTerakhir kita ke Tanjung Selor, ibu kota Kalimantan Utara, provinsi termuda di Kalimantan. Rumah adatnya mirip Baloy Adat Tidung, dengan ukiran khas. Bajunya Baju Adat Tidung yang penuh bordir emas. Kita makan Lawa, salad ikan mentah pakai jeruk & rempah, rasanya segar banget!\r\n\r\n🎉 Hore, selesai keliling Kalimantan!\r\nKamu sekarang udah kenalan sama rumah panjang Dayak, pasar terapung Banjar, sampai sungai-sungai luas yang isinya kapal kayu & perahu klotok.\r\nSiapa tahu nanti di game ada misi “Menari Dayak pakai bulu enggang” atau “Naik klotok belanja di pasar terapung.”\r\n', 'kalimantan', '2025-07-10 13:00:23'),
(5, 'Petualangan Papua', '🚀 CERITA PETUALANGAN: KELILING PAPUA\r\n🎒 Siap, penjelajah cilik?\r\nSekarang kita terbang naik pesawat kecil melintasi pegunungan tinggi, danau luas, hutan lebat, sampai akhirnya mendarat di tanah paling timur Indonesia: Papua!\r\n🗺 Papua punya 6 provinsi lho!\r\nDan masing-masing punya ibu kota yang unik & penuh warna:\r\n1.	Papua\r\n🏙 Ibu kotanya: Jayapura\r\nKota cantik di tepi Teluk Youtefa, dekat Pantai Base-G dan Danau Sentani yang airnya biru banget.\r\n2.	Papua Tengah\r\n🏙 Ibu kotanya: Nabire\r\nDikenal dengan hiu tutul di Teluk Cenderawasih. Airnya jernih, banyak nelayan ramah.\r\n3.	Papua Pegunungan\r\n🏙 Ibu kotanya: Wamena\r\nTerletak di Lembah Baliem yang sejuk, pusat budaya suku Dani dengan festival bakar batu.\r\n4.	Papua Selatan\r\n🏙 Ibu kotanya: Merauke\r\nPaling ujung timur Indonesia. Tempat patok 0 KM & rumah Suku Marind yang khas.\r\n5.	Papua Barat\r\n🏙 Ibu kotanya: Manokwari\r\nGerbang menuju Raja Ampat yang memesona. Kota ini dikelilingi pantai putih & hutan tropis.\r\n6.	Papua Barat Daya\r\n🏙 Ibu kotanya: Sorong\r\nKota pelabuhan sibuk & titik start kalau mau island hopping ke Raja Ampat.\r\n🌊 1. Jayapura, Papua\r\nBegitu sampai Jayapura, kita langsung diajak main ke Danau Sentani, airnya tenang dengan rumah panggung di pinggirnya. Orang sini pakai koteka (untuk pria) & rok rumbai (untuk wanita) kalau festival adat. Kita makan papeda, bubur sagu yang dimakan pakai ikan kuah kuning — rasanya lembut & gurih.\r\n\r\n🐋 2. Nabire, Papua Tengah\r\nLalu kita naik kapal ke Nabire. Kita lihat hiu tutul berenang santai di Teluk Cenderawasih. Rumah adatnya Honai juga mulai sering dibangun di sini. Kita makan ikan bakar fresh, langsung dari laut, sambil ngobrol dengan nelayan ramah.\r\n\r\n⛰ 3. Wamena, Papua Pegunungan\r\nKita naik pesawat kecil lagi ke Wamena, kotanya dingin karena ada di Lembah Baliem. Rumah adatnya Honai, bundar dengan atap rumbia. Kita lihat festival bakar batu, orang ramai masak daging & ubi dalam tanah pakai batu panas. Asik banget!\r\n\r\n🐊 4. Merauke, Papua Selatan\r\nTerus kita terbang ke ujung timur Indonesia, Merauke. Di sini rumah adatnya Kariwari suku Marind, tinggi dengan atap lancip. Orang sini suka makan sagu lempeng & ikan asap. Jangan lupa foto di patok 0 KM Indonesia!\r\n\r\n🐠 5. Manokwari, Papua Barat\r\nLanjut naik kapal ke Manokwari, gerbang ke Raja Ampat. Kita naik perahu ke pulau-pulau kecil, snorkeling lihat ikan & terumbu karang warna-warni. Kita makan ikan laut bakar sambal colo-colo, pedas segar!\r\n\r\n🏝 6. Sorong, Papua Barat Daya\r\nTerakhir ke Sorong, kota pelabuhan yang ramai. Dari sini banyak kapal berangkat ke Raja Ampat. Kita belanja kerajinan tangan dari kulit kayu & kerang, lalu nikmatin sore sambil makan udang bakar jumbo.\r\n\r\n🎉 Hore, selesai keliling Papua!\r\nKamu sekarang udah kenalan sama rumah Honai di pegunungan, Danau Sentani di Jayapura, sampai laut biru Nabire & Raja Ampat.\r\nSiapa tahu nanti di game misinya “mancing di Teluk Cenderawasih bareng nelayan,” atau “bantu suku Dani siapin bakar batu.”\r\n', 'papua', '2025-07-10 13:00:24'),
(6, 'Petualangan Bali', '🗺 Pulau Bali hanya punya 1 provinsi lho!\r\nDan ibu kotanya adalah:\r\n🏙 Denpasar\r\nKota ini jadi pusat pemerintahan, ekonomi, & kebudayaan Bali. Dekat banget ke Kuta, Sanur, dan punya banyak pura megah di tengah kota.\r\n\r\n🚀 CERITA PETUALANGAN: JALAN-JALAN KE PULAU BALI\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik pesawat kecil dari Kupang dan mendarat di Denpasar. Dari atas kelihatan sawah bertingkat warna hijau & pantai panjang berpasir putih. Kita langsung disambut senyum orang Bali yang pakai udeng & kebaya.\r\n\r\n🏠 Rumah adatnya?\r\nNamanya Rumah Gapura Candi Bentar, berupa gerbang batu terbelah dua yang khas banget di setiap rumah Bali. Dalamnya ada banyak paviliun kecil (Bale) untuk tidur, menerima tamu, atau upacara. Hampir semua rumah punya pura kecil buat sembahyang.\r\n\r\n👘 Baju adatnya?\r\nOrang Bali sehari-hari pakai sarung & kebaya, pria pakai udeng (ikat kepala) saat sembahyang. Kalau ada upacara adat, perempuan pakai kebaya putih & kamen (kain panjang) dengan selendang kuning, ditambah bunga di sanggul. Cantik banget!\r\n\r\n🍽 Makanan khasnya?\r\nKita diajak makan Ayam Betutu, ayam utuh diisi bumbu rempah pedas lalu dikukus lama sampai empuk & wangi. Ada juga Lawar, sayur campur kelapa & daging cincang. Jangan lupa Babi Guling untuk yang non-muslim — garing & bumbunya meresap!\r\n\r\n🌺 Upacara & budaya?\r\nDi Bali hampir tiap hari ada upacara adat, orang bawa canang sari (sesajen bunga) untuk sembahyang. Kita bisa nonton Tari Kecak di Uluwatu saat sunset, penarinya duduk melingkar sambil teriak “cak cak cak”.\r\n\r\n🌊 Wisata alamnya?\r\nKita ke Ubud lihat sawah terasering & monyet lucu di Monkey Forest. Terus lanjut ke Tanah Lot, pura megah di atas karang laut. Kalau mau surfing, tinggal lompat ke Pantai Kuta yang ombaknya tinggi.\r\n\r\n🎉 Hore, selesai keliling Bali!\r\nKamu sekarang udah kenalan sama gapura candi bentar, udeng & kebaya, ayam betutu, sampai pura yang berdiri di atas karang laut.\r\nKalau nanti di game, siapa tahu misinya “membuat canang sari,” atau “menari Kecak bareng penduduk lokal.”\r\n', 'bali', '2025-07-10 13:00:24'),
(7, 'Petualangan Maluku', '🚀 CERITA PETUALANGAN: KELILING KEPULAUAN MALUKU\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik kapal cepat menyeberangi laut biru bening, melewati gugusan pulau-pulau hijau kecil. Kita sampai di Kepulauan Maluku, tempat dulu bangsa Eropa datang ramai-ramai cuma mau rebutan pala & cengkih!\r\n\r\n🌺 1. Ambon, Maluku\r\nPertama kita mampir ke Ambon, ibu kota Provinsi Maluku. Kota ini dikelilingi laut biru & perbukitan hijau. Rumah adatnya Baileo, luas tanpa dinding, tempat musyawarah adat & upacara. Orang sini pakai baju cele bercorak kotak merah & emas yang cerah banget.\r\nKita makan Papeda, bubur sagu lembut ditarik pakai garpu bambu, lalu dicelup ke ikan kuah kuning yang asam segar. Sore hari kita duduk di tepi Pantai Natsepa, makan rujak dengan kacang & cabai melimpah. Pedas manisnya nampol!\r\n\r\n🌋 2. Pulau Seram & Buru (Masih Maluku)\r\nLalu kita naik kapal ke Pulau Seram, pulau terbesar di Maluku. Gunung-gunungnya tinggi berkabut. Kita lihat upacara cuci negeri, adat syukur masyarakat Seram. Rumah adatnya juga Baileo, dihiasi ukiran tumbuhan & binatang.\r\nTerus menyeberang lagi ke Pulau Buru. Di sini sawahnya luas, warganya ramah sekali. Kita makan ikan bakar sambal colo-colo, rasanya pedas asam segar.\r\n\r\n🌴 3. Sofifi, Maluku Utara\r\nSekarang kita ke utara, naik feri sampai Sofifi, ibu kota Maluku Utara. Kota ini tenang di tepi laut Halmahera. Orang-orangnya suka pakai baju adat Manteren Lamo, panjang berwarna hitam dengan hiasan emas, bikin gagah banget.\r\n\r\n🏝 4. Ternate & Tidore (Masih Maluku Utara)\r\nDari Sofifi kita naik speed boat ke Ternate, pulau kecil dengan Gunung Gamalama menjulang tinggi. Kita mampir ke Benteng Oranje, sisa peninggalan Belanda. Terus makan Gohu Ikan, semacam sashimi tuna dicampur jeruk nipis, cabe & kenari — segar banget!\r\nTak jauh, ada Tidore, saudara dekat Ternate. Di sini kita lihat festival Kora-Kora, lomba perahu panjang berwarna-warni yang rame banget.\r\n\r\n🐚 5. Pulau Halmahera & Morotai (Masih Maluku Utara)\r\nTerakhir kita ke Pulau Halmahera, pulau terbesar di Maluku Utara. Rumah adatnya disebut Sasadu, luas tanpa dinding, tempat kumpul & upacara adat. Kita makan Kohu-Kohu, ikan suwir pakai kelapa muda & jeruk, segar sekali.\r\nKalau mau lihat laut yang cantik banget, kita lanjut ke Pulau Morotai, bekas basis Perang Dunia II. Airnya bening, pasirnya putih, kita bisa snorkeling lihat ikan warna-warni.\r\n\r\n🎉 Hore, selesai keliling Kepulauan Maluku!\r\nKamu sekarang udah kenalan sama Baileo di Ambon, Sasadu di Halmahera, baju cele yang meriah, papeda lengket, sampai Gohu Ikan yang asam segar.\r\nSiapa tahu nanti di game, misinya “mancing tuna bareng nelayan Ternate,” atau “lomba dayung Kora-Kora rame-rame!”\r\n', 'maluku', '2025-07-10 13:00:24'),
(8, 'Petualangan NTB', '🚀 CERITA PETUALANGAN: KELILING NUSA TENGGARA BARAT (NTB)\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik kapal cepat dari Bali menyeberang ke timur, dan sampai di NTB, provinsi dengan dua pulau utama: Lombok & Sumbawa. Kita akan keliling dua pulau ini yang penuh kejutan budaya & alam.\r\n\r\n🌴 1. Pulau Lombok\r\nBegitu sampai di pelabuhan Lembar, Lombok langsung menyambut dengan pemandangan gunung tinggi. Itu Gunung Rinjani, salah satu gunung api tertinggi di Indonesia.\r\n🏠 Rumah adatnya?\r\nDi Lombok, kita mampir ke desa Sade, rumah adatnya bernama Bale Tani, atapnya dari alang-alang, dinding bambu, lantainya tanah liat yang kadang dioles kotoran kerbau biar keras & anti serangga (unik kan?).\r\n👘 Baju adatnya?\r\nOrang Sasak (suku asli Lombok) pakai kain songket tenun Lombok, perempuan pakai kebaya & sanggul, laki-laki pakai sapuk (ikat kepala) dengan keris kecil di pinggang.\r\n🍽 Makanan khasnya?\r\nKita makan Ayam Taliwang, ayam bakar pedas pakai sambal terasi tomat, rasanya nendang banget. Jangan lupa coba Plecing Kangkung, kangkung direbus disiram sambal kacang pedas asam.\r\n🌊 Wisata alamnya?\r\nSore hari kita main ke Pantai Kuta Mandalika, pasirnya putih halus seperti merica. Kalau mau snorkeling, tinggal ke Gili Trawangan, pulau kecil yang airnya biru jernih & penuh ikan warna-warni.\r\n\r\n⛰ 2. Pulau Sumbawa\r\nKita lanjut naik kapal ferry ke timur, mendarat di Sumbawa, pulau yang lebih sepi tapi punya alam yang luar biasa.\r\n🏠 Rumah adatnya?\r\nNamanya Dalam Loka, rumah panggung kayu sangat besar, dulu istana Sultan Sumbawa. Ukirannya rumit & penuh filosofi.\r\n👘 Baju adatnya?\r\nOrang Sumbawa pakai songket tenun Sumbawa, coraknya khas dengan warna terang. Laki-laki kadang bawa parang kecil yang diselipkan di pinggang.\r\n🍽 Makanan khasnya?\r\nKita makan Sepat, semacam sup ikan kuah asam pedas pakai belimbing wuluh & rempah. Segar banget! Ada juga Jepa, roti pipih dari singkong bakar dimakan sama ikan asin.\r\n🌋 Wisata alamnya?\r\nDi Sumbawa kita bisa trekking ke Gunung Tambora, gunung yang letusannya dulu bikin perubahan iklim dunia pada 1815. Atau main selancar di Lakey Beach, salah satu surga surfing kelas dunia.\r\n\r\n🎉 Hore, selesai keliling NTB!\r\nKamu sekarang udah kenalan sama Bale Tani di Lombok, Dalam Loka di Sumbawa, kain tenun cantik, ayam taliwang, sampai pantai putih Mandalika & ombak tinggi Lakey.\r\nKalau nanti di game, siapa tahu misinya “memasak Ayam Taliwang sambil belajar tenun,” atau “menari adat Sasak di desa Sade.”\r\n', 'ntb', '2025-07-10 13:00:24'),
(9, 'Petualangan NTT', '🚀 CERITA PETUALANGAN: KELILING NUSA TENGGARA TIMUR (NTT)\r\n🎒 Siap, penjelajah cilik?\r\nKali ini kita naik pesawat dari Lombok ke arah timur. Dari atas kelihatan pulau-pulau hijau bertebaran di laut biru. Kita mendarat di Kupang, ibu kota Provinsi NTT, yang terletak di Pulau Timor bagian barat.\r\n\r\n🌞 1. Kupang, Pulau Timor\r\nKita mulai dari Kupang, kota panas di tepi laut. Kita mampir ke pasar lihat tenun ikat Timor warna merah-hitam yang cantik.\r\n🏠 Rumah adatnya disebut Ume Kebubu, bulat dengan atap tinggi runcing dari ilalang.\r\nKita makan Se’i sapi, daging asap khas Timor, dicocol sambal lu’at pedas asam. Jangan lupa minum es kelapa muda pinggir pantai Lasiana!\r\n\r\n🌺 2. Pulau Rote\r\nNaik kapal dari Kupang, kita menyeberang ke Pulau Rote, pulau paling selatan Indonesia. Kita lihat orang sini main Sasando, alat musik petik dari daun lontar yang suaranya merdu banget.\r\nKita makan Jagung Bose, bubur jagung santan gurih, sambil duduk di rumah panggung kayu sederhana.\r\n\r\n⛰ 3. Pulau Sumba\r\nKapal kita lanjut ke barat laut, sampai di Pulau Sumba. Kita ke kampung adat Ratenggaro, lihat rumah adatnya yang atapnya tinggi menjulang seperti menara (disebut Uma Mbatangu).\r\nOrang Sumba pakai tenun ikat Sumba yang megah banget, sering dipakai saat Pasola, festival perang tombak di padang sabana.\r\nKita makan Kambing Bakar Sumba, dimasak pakai bumbu khas dengan daun pepaya biar empuk.\r\n\r\n🏞 4. Pulau Flores\r\nNaik kapal lagi, kita ke Pulau Flores. Dari Labuan Bajo, kita naik perahu ke Pulau Komodo, lihat komodo jalan santai di sabana emas.\r\nKalau ke Bajawa, kita mampir ke kampung adat Bena, lihat Sao Ngaza, rumah adat kayu beratap ilalang tinggi, kadang dihiasi tanduk kerbau.\r\nKita makan Jagung Titi, jagung geprek digoreng gurih, lalu minum kopi Flores yang harum banget.\r\n\r\n🏝 5. Pulau Alor & Lembata\r\nTerus kita menyeberang ke Alor & Lembata, pulau kecil di timur Flores. Kita lihat suku Abui menari dengan pakaian tenun gelap & kalung manik besar.\r\nKita diajak makan ikan bakar colo-colo, sambal tomat cabe mentah yang pedasnya nampol.\r\nKalau di Lembata, orang sini biasa berburu paus tradisional pakai perahu kecil, unik tapi pakai ritual adat yang sakral banget.\r\n\r\n🎉 Hore, selesai keliling NTT!\r\nKamu sekarang udah kenalan sama Ume Kebubu di Timor, Sasando di Rote, Uma Mbatangu di Sumba, Komodo di Flores, sampai tari tradisi di Alor & Lembata.\r\nSiapa tahu nanti di game misinya “menenun kain ikat,” atau “bermain Sasando sambil lihat matahari terbenam di Rote.”\r\n', 'ntt', '2025-07-10 13:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `multiplayer_answers`
--

CREATE TABLE `multiplayer_answers` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kuis_id` int(11) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `benar` tinyint(1) DEFAULT NULL,
  `waktu_jawab` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multiplayer_rooms`
--

CREATE TABLE `multiplayer_rooms` (
  `id` int(11) NOT NULL,
  `kode_room` varchar(10) DEFAULT NULL,
  `status` enum('waiting','in_game','finished') DEFAULT 'waiting',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `multiplayer_rooms`
--

INSERT INTO `multiplayer_rooms` (`id`, `kode_room`, `status`, `created_at`) VALUES
(1, 'TRX123', 'waiting', '2025-07-08 12:57:21'),
(2, 'TRX456', 'in_game', '2025-07-08 12:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `multiplayer_score`
--

CREATE TABLE `multiplayer_score` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multiplayer_users`
--

CREATE TABLE `multiplayer_users` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skor` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opsi_kuis`
--

CREATE TABLE `opsi_kuis` (
  `id` int(11) NOT NULL,
  `kuis_id` int(11) DEFAULT NULL,
  `kode` enum('a','b','c','d') NOT NULL,
  `teks_opsi` varchar(255) DEFAULT NULL,
  `benar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opsi_kuis`
--

INSERT INTO `opsi_kuis` (`id`, `kuis_id`, `kode`, `teks_opsi`, `benar`) VALUES
(1, 1, 'a', 'Tari Saman', 0),
(2, 1, 'b', 'Tari Kecak', 0),
(3, 1, 'c', 'Tari Gambyong', 0),
(4, 1, 'd', 'Tari Kuda Lumping', 1),
(5, 2, 'a', 'Rumah Gadang', 0),
(6, 2, 'b', 'Rumah Joglo', 1),
(7, 2, 'c', 'Rumah Limas', 0),
(8, 2, 'd', 'Rumah Tongkonan', 0),
(9, 3, 'a', 'Musik pop', 0),
(10, 3, 'b', 'Musik rebana', 0),
(11, 3, 'c', 'Musik dangdut', 0),
(12, 3, 'd', 'Gamelan', 1),
(13, 4, 'a', 'Hari Kemerdekaan', 0),
(14, 4, 'b', 'Maulid Nabi Muhammad SAW', 1),
(15, 4, 'c', 'Hari Panen Raya', 0),
(16, 4, 'd', 'Hari Nyepi', 0),
(17, 5, 'a', 'Angklung', 0),
(18, 5, 'b', 'Gamelan', 1),
(19, 5, 'c', 'Saluang', 0),
(20, 5, 'd', 'Kolintang', 0),
(21, 6, 'a', 'Ludruk', 0),
(22, 6, 'b', 'Ketoprak', 0),
(23, 6, 'c', 'Wayang Kulit', 1),
(24, 6, 'd', 'Reog', 0),
(25, 7, 'a', 'Joglo', 1),
(26, 7, 'b', 'Gadang', 0),
(27, 7, 'c', 'Limas', 0),
(156, 7, 'd', 'Banjar', 0),
(157, 8, 'a', 'Grebeg', 1),
(158, 8, 'b', 'Seren Taun', 0),
(159, 8, 'c', 'Tedak Siten', 0),
(160, 8, 'd', 'Ngaben', 0),
(161, 9, 'a', 'Tari Jaipong', 0),
(162, 9, 'b', 'Tari Pendet', 0),
(163, 9, 'c', 'Tari Gambyong', 1),
(164, 9, 'd', 'Tari Legong', 0),
(165, 10, 'a', 'Upacara pernikahan', 0),
(166, 10, 'b', 'Sekaten atau Grebeg Maulud', 1),
(167, 10, 'c', 'Nyepi', 0),
(168, 10, 'd', 'Hari Kemerdekaan', 0),
(169, 11, 'a', 'Menghibur raja', 0),
(170, 11, 'b', 'Membersihkan nasib buruk atau tolak bala', 1),
(171, 11, 'c', 'Menyambut tamu', 0),
(172, 11, 'd', 'Upacara potong rambut', 0),
(173, 12, 'a', 'Sunda', 0),
(174, 12, 'b', 'Jawa', 1),
(175, 12, 'c', 'Betawi', 0),
(176, 12, 'd', 'Madura', 0),
(177, 13, 'a', 'Bodo', 0),
(178, 13, 'b', 'Pangsi', 0),
(179, 13, 'c', 'Beskap', 1),
(180, 13, 'd', 'Ulos', 0),
(181, 14, 'a', 'Batik Tulis', 1),
(182, 14, 'b', 'Tenun Ulos', 0),
(183, 14, 'c', 'Anyaman bambu', 0),
(184, 14, 'd', 'Kain Songket', 0),
(185, 15, 'a', 'Bayi mulai belajar berdiri dan berjalan', 1),
(186, 15, 'b', 'Menikah', 0),
(187, 15, 'c', 'Bayi lahir', 0),
(188, 15, 'd', 'Upacara panen', 0),
(197, 16, 'a', 'Sumatera Utara', 1),
(198, 16, 'b', 'Sumatera Barat', 0),
(199, 16, 'c', 'Sumatera Selatan', 0),
(200, 16, 'd', 'Lampung', 0),
(201, 17, 'a', 'Rumah Gadang', 1),
(202, 17, 'b', 'Rumah Limas', 0),
(203, 17, 'c', 'Rumah Bolon', 0),
(204, 17, 'd', 'Rumah Joglo', 0),
(205, 18, 'a', 'Gendang', 0),
(206, 18, 'b', 'Saluang', 1),
(207, 18, 'c', 'Talempong', 0),
(208, 18, 'd', 'Rebana', 0),
(209, 19, 'a', 'Rumah Gadang', 0),
(210, 19, 'b', 'Rumah Bolon', 1),
(211, 19, 'c', 'Rumah Limas', 0),
(212, 19, 'd', 'Rumah Betang', 0),
(213, 20, 'a', 'Tari Tor-tor', 1),
(214, 20, 'b', 'Tari Saman', 0),
(215, 20, 'c', 'Tari Jaipong', 0),
(216, 20, 'd', 'Tari Merak', 0),
(217, 21, 'a', 'Sumatera Utara', 0),
(218, 21, 'b', 'Sumatera Barat', 1),
(219, 21, 'c', 'Sumatera Selatan', 0),
(220, 21, 'd', 'Riau', 0),
(221, 22, 'a', 'Bahasa Minangkabau', 0),
(222, 22, 'b', 'Bahasa Batak', 1),
(223, 22, 'c', 'Bahasa Melayu', 0),
(224, 22, 'd', 'Bahasa Jawa', 0),
(225, 23, 'a', 'Festival Danau Toba', 1),
(226, 23, 'b', 'Festival Lembah Baliem', 0),
(227, 23, 'c', 'Festival Erau', 0),
(228, 23, 'd', 'Festival Tomohon Internasional Flower Festival', 0),
(229, 24, 'a', 'Sumatera Utara', 0),
(230, 24, 'b', 'Sumatera Barat', 0),
(231, 24, 'c', 'Riau', 1),
(232, 24, 'd', 'Lampung', 0),
(233, 25, 'a', 'Rumah Gadang', 0),
(234, 25, 'b', 'Rumah Limas', 1),
(235, 25, 'c', 'Rumah Bolon', 0),
(236, 25, 'd', 'Rumah Joglo', 0),
(237, 26, 'a', 'Saluang', 1),
(238, 26, 'b', 'Gendang', 0),
(239, 26, 'c', 'Talempong', 0),
(240, 26, 'd', 'Gong', 0),
(241, 27, 'a', 'Musik dan tarian', 0),
(242, 27, 'b', 'Seni ukir dan anyaman', 0),
(243, 27, 'c', 'Ritual adat dan kepercayaan', 0),
(244, 27, 'd', 'Semua jawaban benar', 1),
(245, 28, 'a', 'Medan', 1),
(246, 28, 'b', 'Padang', 0),
(247, 28, 'c', 'Palembang', 0),
(248, 28, 'd', 'Bandar Lampung', 0),
(249, 29, 'a', 'Bahasa Minangkabau', 1),
(250, 29, 'b', 'Bahasa Batak', 0),
(251, 29, 'c', 'Bahasa Melayu', 0),
(252, 29, 'd', 'Bahasa Jawa', 0),
(253, 30, 'a', 'Tari Tor-tor', 0),
(254, 30, 'b', 'Tari Saman', 0),
(255, 30, 'c', 'Tari Randai', 1),
(256, 30, 'd', 'Tari Jaipong', 0),
(257, 31, 'a', 'Barat', 0),
(258, 31, 'b', 'Timur', 1),
(259, 31, 'c', 'Tengah', 0),
(260, 31, 'd', 'Utara', 0),
(261, 32, 'a', 'Kalimantan Barat', 0),
(262, 32, 'b', 'Kalimantan Tengah', 0),
(263, 32, 'c', 'Kalimantan Timur', 0),
(264, 32, 'd', 'Semua jawaban benar', 1),
(265, 33, 'a', 'Rumah Gadang', 0),
(266, 33, 'b', 'Rumah Limas', 0),
(267, 33, 'c', 'Rumah Betang', 1),
(268, 33, 'd', 'Rumah Joglo', 0),
(269, 34, 'a', 'Musik dan tarian', 0),
(270, 34, 'b', 'Seni ukir dan anyaman', 0),
(271, 34, 'c', 'Ritual adat dan kepercayaan', 0),
(272, 34, 'd', 'Semua jawaban benar', 1),
(273, 35, 'a', 'Pontianak', 0),
(274, 35, 'b', 'Palangka Raya', 0),
(275, 35, 'c', 'Samarinda', 1),
(276, 35, 'd', 'Banjarmasin', 0),
(277, 36, 'a', 'Kalimantan Barat', 0),
(278, 36, 'b', 'Kalimantan Tengah', 0),
(279, 36, 'c', 'Kalimantan Timur', 0),
(280, 36, 'd', 'Kalimantan Selatan', 1),
(281, 37, 'a', 'Tari Tor-tor', 0),
(282, 37, 'b', 'Tari Saman', 0),
(283, 37, 'c', 'Tari Hudoq', 1),
(284, 37, 'd', 'Tari Jaipong', 0),
(285, 38, 'a', 'Bahasa Banjar', 1),
(286, 38, 'b', 'Bahasa Dayak', 0),
(287, 38, 'c', 'Bahasa Melayu', 0),
(288, 38, 'd', 'Bahasa Jawa', 0),
(289, 39, 'a', 'Kalimantan Barat', 0),
(290, 39, 'b', 'Kalimantan Tengah', 0),
(291, 39, 'c', 'Kalimantan Timur', 0),
(292, 39, 'd', 'Semua jawaban benar', 1),
(293, 40, 'a', 'Musik dan tarian', 0),
(294, 40, 'b', 'Seni ukir dan anyaman', 0),
(295, 40, 'c', 'Ritual adat dan kepercayaan', 0),
(296, 40, 'd', 'Semua jawaban benar', 1),
(297, 41, 'a', 'Pontianak', 0),
(298, 41, 'b', 'Palangka Raya', 1),
(299, 41, 'c', 'Samarinda', 0),
(300, 41, 'd', 'Banjarmasin', 0),
(301, 42, 'a', 'Kalimantan Barat', 0),
(302, 42, 'b', 'Kalimantan Tengah', 0),
(303, 42, 'c', 'Kalimantan Timur', 1),
(304, 42, 'd', 'Kalimantan Selatan', 0),
(305, 43, 'a', 'Gendang', 0),
(306, 43, 'b', 'Saluang', 0),
(307, 43, 'c', 'Sape', 1),
(308, 43, 'd', 'Gong', 0),
(309, 44, 'a', 'Islam', 0),
(310, 44, 'b', 'Kristen', 0),
(311, 44, 'c', 'Hindu', 0),
(312, 44, 'd', 'Kepercayaan leluhur', 1),
(313, 45, 'a', 'Kalimantan Barat', 1),
(314, 45, 'b', 'Kalimantan Tengah', 0),
(315, 45, 'c', 'Kalimantan Timur', 0),
(316, 45, 'd', 'Kalimantan Selatan', 0),
(317, 46, 'a', 'Suku Bugis', 0),
(318, 46, 'b', 'Suku Makassar', 0),
(319, 46, 'c', 'Suku Toraja', 1),
(320, 46, 'd', 'Suku Minahasa', 0),
(321, 47, 'a', 'Tari Legong', 0),
(322, 47, 'b', 'Tari Kecak', 0),
(323, 47, 'c', 'Tari Toraja', 0),
(324, 47, 'd', 'Tari Bugis', 1),
(325, 48, 'a', 'Rumah Gadang', 0),
(326, 48, 'b', 'Rumah Bolon', 0),
(327, 48, 'c', 'Tongkonan', 1),
(328, 48, 'd', 'Rumah Joglo', 0),
(329, 49, 'a', 'Gong', 0),
(330, 49, 'b', 'Kacapi', 0),
(331, 49, 'c', 'Seruling', 0),
(332, 49, 'd', 'Semua jawaban benar', 1),
(333, 50, 'a', 'Coto Makassar', 0),
(334, 50, 'b', 'Pallubasa', 0),
(335, 50, 'c', 'Kapurung', 1),
(336, 50, 'd', 'Soto Makassar', 0),
(337, 51, 'a', 'Suku Toraja', 0),
(338, 51, 'b', 'Suku Bugis', 1),
(339, 51, 'c', 'Suku Makassar', 0),
(340, 51, 'd', 'Suku Minahasa', 0),
(341, 52, 'a', 'Rambu Solo', 0),
(342, 52, 'b', 'Ma\'nene', 0),
(343, 52, 'c', 'Mangrara Banua', 0),
(344, 52, 'd', 'Semua jawaban benar', 1),
(345, 53, 'a', 'Tari Toraja', 0),
(346, 53, 'b', 'Tari Bugis', 0),
(347, 53, 'c', 'Tari Makassar', 0),
(348, 53, 'd', 'Semua jawaban benar', 1),
(349, 54, 'a', 'Tongkonan', 1),
(350, 54, 'b', 'Rumah Gadang', 0),
(351, 54, 'c', 'Rumah Bolon', 0),
(352, 54, 'd', 'Rumah Joglo', 0),
(353, 55, 'a', 'Coto Makassar', 1),
(354, 55, 'b', 'Pallubasa', 0),
(355, 55, 'c', 'Kapurung', 0),
(356, 55, 'd', 'Soto Makassar', 0),
(357, 56, 'a', 'Suku Toraja', 1),
(358, 56, 'b', 'Suku Bugis', 0),
(359, 56, 'c', 'Suku Makassar', 0),
(360, 56, 'd', 'Suku Minahasa', 0),
(361, 57, 'a', 'Gong', 0),
(362, 57, 'b', 'Kacapi', 0),
(363, 57, 'c', 'Seruling', 0),
(364, 57, 'd', 'Semua jawaban benar', 1),
(365, 58, 'a', 'Tari Toraja', 0),
(366, 58, 'b', 'Tari Bugis', 0),
(367, 58, 'c', 'Tari Makassar', 0),
(368, 58, 'd', 'Semua jawaban benar', 1),
(369, 59, 'a', 'Tongkonan', 1),
(370, 59, 'b', 'Rumah Gadang', 0),
(371, 59, 'c', 'Rumah Bolon', 0),
(372, 59, 'd', 'Rumah Joglo', 0),
(373, 60, 'a', 'Coto Makassar', 0),
(374, 60, 'b', 'Pallubasa', 0),
(375, 60, 'c', 'Kapurung', 0),
(376, 60, 'd', 'Semua jawaban benar', 1),
(377, 61, 'a', 'Kupang', 1),
(378, 61, 'b', 'Mataram', 0),
(379, 61, 'c', 'Denpasar', 0),
(380, 61, 'd', 'Makassar', 0),
(381, 62, 'a', 'Pulau Flores', 0),
(382, 62, 'b', 'Pulau Sumba', 0),
(383, 62, 'c', 'Pulau Timor', 1),
(384, 62, 'd', 'Pulau Alor', 0),
(385, 63, 'a', 'Tari Legong', 0),
(386, 63, 'b', 'Tari Kecak', 0),
(387, 63, 'c', 'Tari Poco-poco', 1),
(388, 63, 'd', 'Tari Jaipong', 0),
(389, 64, 'a', 'Danau Toba', 0),
(390, 64, 'b', 'Gunung Rinjani', 0),
(391, 64, 'c', 'Pantai Labuan Bajo', 1),
(392, 64, 'd', 'Taman Nasional Komodo', 0),
(393, 65, 'a', 'Suku Sasak', 0),
(394, 65, 'b', 'Suku Bali', 0),
(395, 65, 'c', 'Suku Atoni', 1),
(396, 65, 'd', 'Suku Dayak', 0),
(397, 66, 'a', 'Bahasa Indonesia', 0),
(398, 66, 'b', 'Bahasa Daerah setempat', 1),
(399, 66, 'c', 'Bahasa Inggris', 0),
(400, 66, 'd', 'Bahasa Arab', 0),
(401, 67, 'a', 'Pulau Flores', 0),
(402, 67, 'b', 'Pulau Sumba', 0),
(403, 67, 'c', 'Pulau Timor', 0),
(404, 67, 'd', 'Pulau Rote', 1),
(405, 68, 'a', 'Festival Danau Toba', 0),
(406, 68, 'b', 'Festival Lembah Baliem', 0),
(407, 68, 'c', 'Festival Pesona Budaya Bajo', 1),
(408, 68, 'd', 'Festival Tomohon Internasional Flower Festival', 0),
(409, 69, 'a', 'Taman Nasional Komodo', 1),
(410, 69, 'b', 'Taman Nasional Ujung Kulon', 0),
(411, 69, 'c', 'Taman Nasional Gunung Leuser', 0),
(412, 69, 'd', 'Taman Nasional Kerinci Seblat', 0),
(413, 70, 'a', 'Harimau Sumatera', 0),
(414, 70, 'b', 'Gajah Sumatera', 0),
(415, 70, 'c', 'Komodo', 1),
(416, 70, 'd', 'Orangutan', 0),
(417, 71, 'a', 'Ende', 0),
(418, 71, 'b', 'Maumere', 0),
(419, 71, 'c', 'Labuan Bajo', 1),
(420, 71, 'd', 'Kupang', 0),
(421, 72, 'a', 'Pulau Flores', 0),
(422, 72, 'b', 'Pulau Sumba', 0),
(423, 72, 'c', 'Pulau Timor', 0),
(424, 72, 'd', 'Semua jawaban benar', 1),
(425, 73, 'a', 'Musik dan tarian', 1),
(426, 73, 'b', 'Seni ukir dan anyaman', 0),
(427, 73, 'c', 'Ritual adat dan kepercayaan', 0),
(428, 73, 'd', 'Semua jawaban benar', 0),
(429, 74, 'a', 'Pulau Flores', 0),
(430, 74, 'b', 'Pulau Sumba', 1),
(431, 74, 'c', 'Pulau Timor', 0),
(432, 74, 'd', 'Pulau Alor', 0),
(433, 75, 'a', 'Tari Tor-tor', 0),
(434, 75, 'b', 'Tari Saman', 0),
(435, 75, 'c', 'Tari Poco-poco', 1),
(436, 75, 'd', 'Tari Jaipong', 0),
(437, 76, 'a', 'Honai', 1),
(438, 76, 'b', 'Lopo', 0),
(439, 76, 'c', 'Joglo', 0),
(440, 76, 'd', 'Tongkonan', 0),
(441, 77, 'a', 'Saluang', 0),
(442, 77, 'b', 'Tifa', 1),
(443, 77, 'c', 'Kolintang', 0),
(444, 77, 'd', 'Gamelan', 0),
(445, 78, 'a', 'Tari Perang', 1),
(446, 78, 'b', 'Tari Pendet', 0),
(447, 78, 'c', 'Tari Reog', 0),
(448, 78, 'd', 'Tari Topeng', 0),
(449, 79, 'a', 'Dani', 1),
(450, 79, 'b', 'Asmat', 0),
(451, 79, 'c', 'Dayak', 0),
(452, 79, 'd', 'Batak', 0),
(453, 80, 'a', 'Upacara kematian', 0),
(454, 80, 'b', 'Mengolah makanan bersama dalam acara adat', 1),
(455, 80, 'c', 'Membersihkan rumah adat', 0),
(456, 80, 'd', 'Merayakan panen padi', 0),
(457, 81, 'a', 'Honai', 1),
(458, 81, 'b', 'Gadang', 0),
(459, 81, 'c', 'Limas', 0),
(460, 81, 'd', 'Bale', 0),
(461, 82, 'a', 'Festival budaya', 1),
(462, 82, 'b', 'Upacara pernikahan modern', 0),
(463, 82, 'c', 'Sekaten', 0),
(464, 82, 'd', 'Rapat adat di balai', 0),
(465, 83, 'a', 'Liwetan', 0),
(466, 83, 'b', 'Bakar Batu', 1),
(467, 83, 'c', 'Ngaben', 0),
(468, 83, 'd', 'Nasi Liwet', 0),
(469, 84, 'a', 'Tifa', 1),
(470, 84, 'b', 'Kendang', 0),
(471, 84, 'c', 'Gong', 0),
(472, 84, 'd', 'Suling', 0),
(473, 85, 'a', 'Tari sambutan', 0),
(474, 85, 'b', 'Upacara kemerdekaan', 0),
(475, 85, 'c', 'Ritual adat dan budaya Papua', 1),
(476, 85, 'd', 'Sekolah tari', 0),
(477, 86, 'a', 'Festival Danau Sentani', 0),
(478, 86, 'b', 'Festival Lembah Baliem', 1),
(479, 86, 'c', 'Festival Asmat', 0),
(480, 86, 'd', 'Festival Raja Ampat', 0),
(481, 87, 'a', 'Anyaman pandan', 0),
(482, 87, 'b', 'Ukiran kayu', 1),
(483, 87, 'c', 'Keramik tanah', 0),
(484, 87, 'd', 'Batik lukis', 0),
(485, 88, 'a', 'Pegunungan Tengah', 0),
(486, 88, 'b', 'Dataran tinggi', 0),
(487, 88, 'c', 'Pesisir Selatan', 1),
(488, 88, 'd', 'Pulau Biak', 0),
(489, 89, 'a', 'Bahasa Serumpun', 0),
(490, 89, 'b', 'Bahasa Lokal', 0),
(491, 89, 'c', 'Bahasa Daerah', 0),
(492, 89, 'd', 'Bahasa Melanesia', 1),
(493, 90, 'a', 'Tari Musyoh', 1),
(494, 90, 'b', 'Tari Kecak', 0),
(495, 90, 'c', 'Tari Legong', 0),
(496, 90, 'd', 'Tari Payung', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pencapaian`
--

CREATE TABLE `pencapaian` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `progress_user`
--

CREATE TABLE `progress_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wilayah` varchar(50) NOT NULL,
  `level` int(11) DEFAULT 1,
  `selesai` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_user`
--

INSERT INTO `progress_user` (`id`, `user_id`, `wilayah`, `level`, `selesai`, `created_at`, `updated_at`) VALUES
(25, 14, 'jawa', 1, 1, '2025-07-10 06:03:48', '2025-07-10 06:13:13'),
(26, 14, 'sumatera', 1, 1, '2025-07-10 06:13:13', '2025-07-10 06:19:23'),
(27, 14, 'kalimantan', 1, 1, '2025-07-10 06:19:23', '2025-07-10 09:50:08'),
(28, 14, 'sulawesi', 1, 1, '2025-07-10 09:50:08', '2025-07-10 09:57:05'),
(29, 14, 'ntt', 1, 1, '2025-07-10 09:57:05', '2025-07-10 12:23:45'),
(30, 14, 'papua', 1, 1, '2025-07-10 12:23:45', '2025-07-10 12:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wilayah` varchar(50) DEFAULT NULL,
  `poin_didapat` int(11) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards_log`
--

CREATE TABLE `rewards_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wilayah` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `reward_poin` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards_log`
--

INSERT INTO `rewards_log` (`id`, `user_id`, `wilayah`, `item`, `reward_poin`, `waktu`) VALUES
(13, 14, 'jawa', 'Batik Jawa', 150, '2025-07-10 06:13:13'),
(14, 14, 'sumatera', 'Songket Sumatera', 150, '2025-07-10 06:19:23'),
(15, 14, 'kalimantan', 'Mandau Kalimantan', 150, '2025-07-10 09:50:08'),
(16, 14, 'sulawesi', 'Tenun Sulawesi', 150, '2025-07-10 09:57:05'),
(17, 14, 'ntt', 'Kain Ikat NTT', 150, '2025-07-10 12:23:45'),
(18, 14, 'papua', 'Koteka Papua', 150, '2025-07-10 12:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `poin` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `avatar`, `poin`, `created_at`, `updated_at`) VALUES
(14, 'burhan', 'Burhanjepara41@gmail.com', '$2y$10$HUjidzgxm7f1lGXDWwl1y.vy6oVo8GTQD6E2m9OHoSOR/Rzog6g3a', 'default.jpg', 900, '2025-07-10 05:37:52', '2025-07-10 12:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `video_youtube`
--

CREATE TABLE `video_youtube` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `youtube_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_youtube`
--

INSERT INTO `video_youtube` (`id`, `judul`, `youtube_id`) VALUES
(1, 'Legenda Calon Arang | Cerita Rakyat Bali | Kisah Nusantara', '1uc_t0F4fIY'),
(2, '06 New Animasi Wayang Lucu Bagong Nyolong Banowati Dalang Seno Nugroho', 'txPVtgZ7oyw'),
(3, 'LEGENDA BATU GANTUNG ~ Cerita Rakyat Sumatera Utara | Dongeng Kita', 'PivNaESVfwQ'),
(4, 'Tari Saman | Santri Putri Darussalam Blokagung || DBF23', 'zY0Np-bCPP4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audiomp3`
--
ALTER TABLE `audiomp3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `koleksi`
--
ALTER TABLE `koleksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuis_jawaban`
--
ALTER TABLE `kuis_jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiplayer_answers`
--
ALTER TABLE `multiplayer_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kuis_id` (`kuis_id`);

--
-- Indexes for table `multiplayer_rooms`
--
ALTER TABLE `multiplayer_rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_room` (`kode_room`);

--
-- Indexes for table `multiplayer_score`
--
ALTER TABLE `multiplayer_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiplayer_users`
--
ALTER TABLE `multiplayer_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `opsi_kuis`
--
ALTER TABLE `opsi_kuis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kuis_id` (`kuis_id`);

--
-- Indexes for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `progress_user`
--
ALTER TABLE `progress_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`wilayah`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards_log`
--
ALTER TABLE `rewards_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- Indexes for table `video_youtube`
--
ALTER TABLE `video_youtube`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audiomp3`
--
ALTER TABLE `audiomp3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `koleksi`
--
ALTER TABLE `koleksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `kuis_jawaban`
--
ALTER TABLE `kuis_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `multiplayer_answers`
--
ALTER TABLE `multiplayer_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multiplayer_rooms`
--
ALTER TABLE `multiplayer_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `multiplayer_score`
--
ALTER TABLE `multiplayer_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multiplayer_users`
--
ALTER TABLE `multiplayer_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `opsi_kuis`
--
ALTER TABLE `opsi_kuis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT for table `pencapaian`
--
ALTER TABLE `pencapaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress_user`
--
ALTER TABLE `progress_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rewards_log`
--
ALTER TABLE `rewards_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `video_youtube`
--
ALTER TABLE `video_youtube`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `koleksi`
--
ALTER TABLE `koleksi`
  ADD CONSTRAINT `koleksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `multiplayer_answers`
--
ALTER TABLE `multiplayer_answers`
  ADD CONSTRAINT `multiplayer_answers_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `multiplayer_rooms` (`id`),
  ADD CONSTRAINT `multiplayer_answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `multiplayer_answers_ibfk_3` FOREIGN KEY (`kuis_id`) REFERENCES `kuis` (`id`);

--
-- Constraints for table `multiplayer_users`
--
ALTER TABLE `multiplayer_users`
  ADD CONSTRAINT `multiplayer_users_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `multiplayer_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `multiplayer_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `opsi_kuis`
--
ALTER TABLE `opsi_kuis`
  ADD CONSTRAINT `opsi_kuis_ibfk_1` FOREIGN KEY (`kuis_id`) REFERENCES `kuis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD CONSTRAINT `pencapaian_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rewards_log`
--
ALTER TABLE `rewards_log`
  ADD CONSTRAINT `fk_rewards_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
