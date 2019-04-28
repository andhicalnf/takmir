-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2018 at 05:45 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_takmir`
--
CREATE DATABASE `db_takmir` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_takmir`;

-- --------------------------------------------------------

--
-- Table structure for table `kandidatvoting`
--

CREATE TABLE IF NOT EXISTS `kandidatvoting` (
  `id_kandidatvoting` int(11) NOT NULL AUTO_INCREMENT,
  `ketua` varchar(50) NOT NULL,
  `jenkel` int(11) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `foto` varchar(200) NOT NULL,
  `poin` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kandidatvoting`),
  KEY `hasil_kandidat` (`poin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `kandidatvoting`
--

INSERT INTO `kandidatvoting` (`id_kandidatvoting`, `ketua`, `jenkel`, `visi`, `misi`, `foto`, `poin`) VALUES
(30, 'Bije Abdul Somat', 1, 'Menjadi masjid yang menyatukan dan memajukan umat menuju kesejahteraan dan kemaslahatan hidup bersama ', '1.         Mengelola  masjid sebagai pusat ibadah yang  kondusif dan nyaman bagi umat\r\n2.         Menyelenggarakan kegiatan dakwah  untuk pembinaan umat.\r\n3.         Menyelenggarakan kegiatan pendidikan Islami non formal maupun formal yang unggul dalam melahirkan generasi qurani\r\n4.         Menyelenggarakan pembinaan remaja muslim ', 'calon-5147-bije-abdul-somat.jpg', 0),
(31, 'Faizal Mansyur', 1, 'Terwujudnya Masjid yang Makmur sebagai Sentra Peribadatan dan Pemberdayaan Ummat Islam.', '1.Mengembangkan dakwah dan pembinaan ummat Islam, melalui Khutbah Jumat, kegiatan hari-hari besar Islam, Majelis Taâ€™lim, dan kajian-kajian yang berkesinambungan.\r\n2.Mengembangkan Pendidikan Islam bagi anak-anak, remaja dan dewasa melalui Taman Pendidikan Al-Qurâ€™an (TPA), Program Terjemah Al-Qurâ€™an, dan pelatihan-pelatihan keagamaan.\r\n3.Mengembangkan kesejahteraan dan pemberdayaan ummat melalui kegiatan amil zakat, infak dan shodaqoh.\r\n4.Mengajak seluruh masyarakat untuk bersama-sama memakmurkan masjid dalam peningkatan kualitas keimanan dan ketaqwaan melalui berbagai kegiatan keagamaan.\r\n5.Menjaga dan memelihara keindahan, ketertiban dan kebersihan masjid sehingga memberikan suasanan yang nyaman, aman dan kondusif bagi jamaah dan siapa saja yang datang ke masjid Al-Karomah.\r\n6.Menggunakan Teknologi Informasi sebagai salah satu sarana untuk pengembangan informasi dan dakwah Islamiyah.\r\n\r\n', 'calon-4433-faizal-mansyur.jpg', 0),
(32, 'Dimas Hambali', 1, 'Menjadikan Masjid sebagai tempat ibadah yang "Aman, Nyaman, Bertambah Iman dan Taqwa" bagi umat dan jama''ah', '1.Memberikan pembinaan kepada umat muslim untuk meningkatkan kualitas iman dan taqwa kepada Allah SWT dengan cara-cara yang sesuai dengan ajaran Al Qur''an dan Al Hadist.\r\n2.Turut serta dalam kegiatan-kegiatan amar ma''ruf nahi munkar.\r\n3.Meningkatkan silaturahim antar umat muslim untuk mendorong kepedulian, kepekaan dan solidaritas umat muslim terhadap masalah-masalah kebangsaan dan umat dalam hal ekonomi, pendidikan, politik, hukum, sosial dan budaya.\r\n4.Kegiatan-kegiatan lainnya yang sejalan dengan ajaran Al Qur''an dan Al Hadist dalam upaya memakmurkan masjid sebagaimana yanng dicontohkan oleh Rasulullah SAW. \r\n', 'calon-8753-dimas-hambali.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kriteria` varchar(255) NOT NULL,
  `tipe_kriteria` varchar(10) NOT NULL,
  `bobot_kriteria` double NOT NULL,
  PRIMARY KEY (`id_kriteria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `tipe_kriteria`, `bobot_kriteria`) VALUES
(7, 'Kepemimpinan (VT)', 'benefit', 90),
(8, 'Kewibawaan (VT)', 'benefit', 90),
(9, 'Keagamaan (VT)', 'benefit', 90),
(10, 'Keaktifan', 'benefit', 80),
(11, 'Moral', 'cost', 70),
(12, 'Kesehatan', 'cost', 70);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int(6) NOT NULL AUTO_INCREMENT,
  `ket_nilai` varchar(45) NOT NULL,
  `jum_nilai` double NOT NULL,
  PRIMARY KEY (`id_nilai`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `ket_nilai`, `jum_nilai`) VALUES
(7, 'Baik', 80),
(9, 'Sangat Baik', 90),
(11, 'Cukup Baik', 70),
(12, 'Buruk', 60);

-- --------------------------------------------------------

--
-- Table structure for table `rangking`
--

CREATE TABLE IF NOT EXISTS `rangking` (
  `id_kandidat` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai_rangking` double NOT NULL,
  `nilai_normalisasi` double NOT NULL,
  `bobot_normalisasi` double NOT NULL,
  PRIMARY KEY (`id_kandidat`,`id_kriteria`),
  KEY `id_kriteria` (`id_kriteria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rangking`
--

INSERT INTO `rangking` (`id_kandidat`, `id_kriteria`, `nilai_rangking`, `nilai_normalisasi`, `bobot_normalisasi`) VALUES
(1, 7, 80, 7200, 648000),
(1, 8, 90, 8100, 729000),
(1, 9, 70, 6300, 567000),
(1, 10, 60, 5400, 432000),
(1, 11, 90, 5400, 378000),
(1, 12, 70, 4900, 343000),
(2, 7, 80, 7200, 648000),
(2, 8, 90, 8100, 729000),
(2, 9, 80, 7200, 648000),
(2, 10, 70, 6300, 504000),
(2, 11, 60, 3600, 252000),
(2, 12, 70, 4900, 343000),
(3, 7, 90, 8100, 729000),
(3, 8, 70, 6300, 567000),
(3, 9, 70, 6300, 567000),
(3, 10, 80, 7200, 576000),
(3, 11, 90, 5400, 378000),
(3, 12, 70, 4900, 343000),
(8, 7, 90, 8100, 729000),
(8, 8, 80, 7200, 648000),
(8, 9, 90, 8100, 729000),
(8, 10, 90, 8100, 648000),
(8, 11, 70, 4200, 294000),
(8, 12, 70, 4900, 343000),
(10, 7, 80, 7200, 648000),
(10, 8, 90, 8100, 729000),
(10, 9, 80, 7200, 648000),
(10, 10, 90, 8100, 648000),
(10, 11, 80, 4800, 336000),
(10, 12, 70, 4900, 343000),
(11, 7, 80, 7200, 648000),
(11, 8, 60, 5400, 486000),
(11, 9, 70, 6300, 567000),
(11, 10, 90, 8100, 648000),
(11, 11, 70, 4200, 294000),
(11, 12, 90, 6300, 441000),
(13, 7, 90, 8100, 729000),
(13, 8, 80, 7200, 648000),
(13, 9, 70, 6300, 567000),
(13, 10, 80, 7200, 576000),
(13, 11, 80, 4800, 336000),
(13, 12, 70, 4900, 343000),
(14, 7, 80, 7200, 648000),
(14, 8, 90, 8100, 729000),
(14, 9, 60, 5400, 486000),
(14, 10, 70, 6300, 504000),
(14, 11, 70, 4200, 294000),
(14, 12, 90, 6300, 441000),
(15, 7, 70, 6300, 567000),
(15, 8, 90, 8100, 729000),
(15, 9, 90, 8100, 729000),
(15, 10, 90, 8100, 648000),
(15, 11, 80, 4800, 336000),
(15, 12, 90, 6300, 441000),
(16, 7, 80, 7200, 648000),
(16, 8, 60, 5400, 486000),
(16, 9, 90, 8100, 729000),
(16, 10, 70, 6300, 504000),
(16, 11, 60, 3600, 252000),
(16, 12, 70, 4900, 343000),
(17, 7, 90, 8100, 729000),
(17, 8, 80, 7200, 648000),
(17, 9, 80, 7200, 648000),
(17, 10, 60, 5400, 432000),
(17, 11, 70, 4200, 294000),
(17, 12, 70, 4900, 343000),
(18, 7, 80, 7200, 648000),
(18, 8, 70, 6300, 567000),
(18, 9, 80, 7200, 648000),
(18, 10, 70, 6300, 504000),
(18, 11, 60, 3600, 252000),
(18, 12, 80, 5600, 392000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kandidat`
--

CREATE TABLE IF NOT EXISTS `tbl_kandidat` (
  `id_kandidat` int(11) NOT NULL AUTO_INCREMENT,
  `ketua` varchar(50) NOT NULL,
  `jenkel` int(11) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `foto` varchar(200) NOT NULL,
  `hasil_kandidat` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kandidat`),
  KEY `hasil_kandidat` (`hasil_kandidat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_kandidat`
--

INSERT INTO `tbl_kandidat` (`id_kandidat`, `ketua`, `jenkel`, `visi`, `misi`, `foto`, `hasil_kandidat`) VALUES
(1, 'Abdul Falaq', 1, 'Distinctively pursue cross functional process', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness.', 'calon-6336-dwey-robby-hendrawanmahriyana.jpg', 3097000),
(2, 'Sokhibul Fikri', 1, 'Distinctively pursue cross functional process', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness.', 'calon-6336-dwey-robby-hendrawanmahriyana.jpg', 3124000),
(3, 'Faizal ', 1, 'Distinctively pursue cross functional process', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness.', 'calon-6336-dwey-robby-hendrawanmahriyana.jpg', 3160000),
(8, 'Faizal Mansyur', 1, 'Distinctively pursue cross functional process', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness.', 'calon-7789-muhammad-yandiayik-dhian-winarni.jpg', 3391000),
(10, 'Dimas Hambali', 1, 'Credibly grow empowered intellectual readiness.', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness. Conveniently architect long-term high-impact functionalities through error-free testing procedures. Authoritatively foster team building services with sustainable scenarios. Distinctively myocardinate bleeding-edge data without scalable relationships. Quickly transform superior intellectual capital vis-a-vis pandemic &quot;outside the box&quot; thinking.', 'calon-6336-dwey-robby-hendrawanmahriyana.jpg', 3352000),
(11, 'Wahyu Pratama', 1, 'Credibly grow empowered intellectual', 'Credibly grow empowered intellectual capital vis-a-vis premium web-readiness. Conveniently architect long-term high-impact functionalities through error-free testing procedures. Authoritatively foster team building services with sustainable scenarios. Distinctively myocardinate bleeding-edge data without scalable relationships. Quickly transform superior intellectual capital vis-a-vis pandemic &quot;outside the box&quot; thinking.', 'calon-4344-ahmad-huseinhusein-ahmad.png', 3084000),
(13, 'Soffa Abdul', 1, 'Menjadikan yang terbaik', 'Appropriately transform resource sucking customer service via team driven technologies. Conveniently implement accurate methodologies rather than alternative action items. Holisticly predominate cutting-edge leadership without clicks-and-mortar human capital. Rapidiously visualize error-free value vis-a-vis open-source channels. Synergistically innovate synergistic information before leveraged portals.', 'calon-3079-soffa-abdul.png', 3199000),
(14, 'Andhica Fata', 1, 'usfaugsf', 'kdbjdhjhhhhhskkk ksnkabf mfjha', 'calon-3425-andhica-fata.jpg', 3102000),
(15, 'Bije Abdul Somat', 1, 'ffefeaga', 'ngdhrgg rhhadf', 'calon-4687-bije-arifin.png', 3450000),
(16, 'Dimas Prasetyo', 1, 'halooo', 'haiiii', 'calon-5178-dimas-prasetyo.png', 2962000),
(17, 'Hadi Wahyudi', 1, 'yuhuu', 'oioiii', 'calon-1723-hadi-wahyudi.png', 3094000),
(18, 'Wisnu Pratama', 1, 'oioiii', 'haloo', 'calon-1709-wisnu-pratama.jpg', 3011000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE IF NOT EXISTS `tbl_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `username`, `nama`, `password`, `level`) VALUES
(1, 'admin', 'Administrator', '2a24588d01f86c4822d68b5c383cb141', 1),
(2, 'D002', 'Dwey Robby Hendrawan', 'b3460c056d63af44fe66bd92c961a144', 2),
(8, 'D001', 'RAHMI FEBRIANTY', '23e590a651f35d7ec249f4c44db89645', 2),
(9, 'C001', 'MAHRIYANA', '23e590a651f35d7ec249f4c44db89645', 2),
(10, 'B001', 'AYIK DHIAN WINARNI', '23e590a651f35d7ec249f4c44db89645', 2),
(11, 'A003', 'FAHRIZAL RIZALDI', '23e590a651f35d7ec249f4c44db89645', 2),
(12, 'A002', '', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(13, 'A001', '', '827ccb0eea8a706c4c34a16891f84e7b', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voting`
--

CREATE TABLE IF NOT EXISTS `tbl_voting` (
  `id_voting` int(11) NOT NULL AUTO_INCREMENT,
  `id_kandidatvoting` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `waktu` datetime NOT NULL,
  `poin` int(11) NOT NULL,
  PRIMARY KEY (`id_voting`),
  KEY `id_login` (`id_login`),
  KEY `id_kandidatvoting` (`id_kandidatvoting`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_voting`
--

INSERT INTO `tbl_voting` (`id_voting`, `id_kandidatvoting`, `id_login`, `waktu`, `poin`) VALUES
(5, 31, 11, '2018-05-11 00:34:06', 0),
(6, 30, 8, '2018-05-11 00:35:38', 0),
(7, 32, 13, '2018-05-11 00:43:23', 1),
(8, 31, 12, '2018-05-11 00:43:39', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rangking`
--
ALTER TABLE `rangking`
  ADD CONSTRAINT `rangking_ibfk_1` FOREIGN KEY (`id_kandidat`) REFERENCES `tbl_kandidat` (`id_kandidat`),
  ADD CONSTRAINT `rangking_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
