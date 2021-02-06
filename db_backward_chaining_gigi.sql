-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Feb 2021 pada 10.41
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_backward_chaining_gigi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kesimpulan`
--

CREATE TABLE `tb_kesimpulan` (
  `no` int(11) NOT NULL,
  `kode_penyakit` varchar(100) NOT NULL,
  `nama_penyakit` varchar(100) NOT NULL,
  `fakta` varchar(255) NOT NULL,
  `solusi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kesimpulan`
--

INSERT INTO `tb_kesimpulan` (`no`, `kode_penyakit`, `nama_penyakit`, `fakta`, `solusi`) VALUES
(1, 'PD01', 'Gingivitis (Radang gusi)', 'Bau mulut\\nGusi bengkak, merah dan berdarah\\nPembesaran limfoid di kepala, leher, atau\r\nRahang\\nDemam\\nNyeri gusi', 'Pembersihan karang gigi (scaling) dan perawatan saluran akar gigi (root planing) dengan menggunakan laser atau gelombang suara.\\nPenambalan atau penggantian gigi yang berlubang atau rusak, bila kondisi tersebut terkait dengan gingivitis.'),
(2, 'PD02', 'Karies Gigi (gigi berlubang)', 'Sakit gigi\\nNyeri ringan hingga tajam saat mengonsumsi makanan manis,\\nNoda berwarna cokelat, hitam atau putih pada permukaan gigi\\nNyeri saat menggigit makanan\r\n\r\n', 'Pembersihan di Dokter Gigi\\nTerapi Fluoride\\nPenambalan Gigi\\nPerbaikan Saluran Akar Gigi\\nPencabutan Gigi'),
(4, 'PD03', 'Karang Gigi', 'Bau Mulut\\nGusi berdarah dan kemerahan\\nGusi membengkak dan atau bernanah\\nGusi melorot atau gigi tampak menjadi Panjang\\nGigi goyang dan sensitive\\nGigi menjadi meregang\\nGigi menjadi linu padahal tidak ada yang berlubang', 'Rutin sikat gigi. Sikatlah gigi secara teratur sebanyak 2 kali sehari selama 2 menit, dengan cara menyikat gigi yang benar\\nGunakan benang gigi dan obat kumur\\nKurangi konsumsi gula\\nMinum air putih yang cukup\\nHindari merokok dan minuman beralkohol.'),
(5, 'PD04', 'Stomatitis', 'Hilangnya nafsu makan\\nTerdapat luka yang cukup besar dimulut\\nLuka biasanya terjadi beberapa kali pada area yang sama\\nLuka menyebar ke bagian luar bibir\\nTidak dapat makan dan minum\r\n', 'Umumnya, sariawan tidak perlu diobati dan akan sembuh dengan sendirinya dalam 1–2 minggu. Anda bisa melakukan penanganan secara mandiri di rumah untuk meredakan nyeri, misalnya dengan mengompres bagian yang terasa sakit dengan es batu.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penyakit`
--

CREATE TABLE `tb_penyakit` (
  `kode_penyakit` varchar(10) NOT NULL,
  `penyakit` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penyakit`
--

INSERT INTO `tb_penyakit` (`kode_penyakit`, `penyakit`) VALUES
('PD01', 'Gingivitis (Radang gusi)'),
('PD02', 'Karies Gigi (gigi berlubang)'),
('PD03', 'Karang Gigi'),
('PD04', 'Stomatitis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pertanyaan`
--

CREATE TABLE `tb_pertanyaan` (
  `kode_pertanyaan` varchar(50) NOT NULL,
  `isi_pertanyaan` varchar(250) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pertanyaan`
--

INSERT INTO `tb_pertanyaan` (`kode_pertanyaan`, `isi_pertanyaan`, `id`) VALUES
('PD01', 'Apakah Anda Merasa Bau mulut Dan Apakah Gusi anda bengkak, merah dan berdarah ? ? ', 1),
('PD03', 'Apakah Anda Merasa Bau mulut Dan Apakah gusi anda berdarah dan kemerahan ?', 2),
('PD01', 'Apakaah anda merasa Gingival berkaratin, gaung luka diantara\r\ngigi dan gusi ?\r\n', 3),
('PD01', 'Apakah Anda merasa Pembesaran limfoid di kepala, leher, atau\r\nRahang ?', 4),
('PD01', 'Apakah Anda Demam ? ', 5),
('PD01', 'Apakah anda merasa Nyeri pada gusi ?', 6),
('PD02', 'Apakah Anda Sakit gigi ?', 7),
('PD02', 'Apakah Anda Merasa Nyeri ringan hingga tajam saat mengonsumsi makanan manis ?', 8),
('PD02', 'Apakah Permukaan Gigi anda ada noda berwarna cokelat,hitam atau putih ?', 9),
('PD02', 'Apakah anda Nyeri saat menggigit makanan ?', 10),
('PD03', 'Apakah Gusi anda membengkak atau bernanah ?', 11),
('PD03', 'Apakah Gusi anda melorot atau gigi tampak menjadi Panjang ?', 12),
('PD03', 'Apakah Gigi anda goyang dan sensitive', 13),
('PD03', 'Apakah Gigi anda menjadi meregang (timbul celah-celah diantara gigi) ?', 14),
('PD03', 'Apakah Gigi anda menjadi linu padahal tidak ada yang berlubang ?', 15),
('PD04', 'Apakah anda kehilangan nafsu makan ?', 16),
('PD04', 'Apakah Terdapat luka yang cukup besar dimulut anda ?', 17),
('PD04', 'Apakah terdapat Luka biasanya terjadi beberapa kali pada area yang sama ?\r\n', 18),
('PD04', 'Apakah terdapat Luka menyebar ke bagian luar bibir ?', 19),
('PD04', 'Apakah anda Tidak dapat makan dan minum ?', 20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kesimpulan`
--
ALTER TABLE `tb_kesimpulan`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `tb_penyakit`
--
ALTER TABLE `tb_penyakit`
  ADD PRIMARY KEY (`kode_penyakit`);

--
-- Indeks untuk tabel `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kesimpulan`
--
ALTER TABLE `tb_kesimpulan`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
