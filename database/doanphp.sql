-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2023 lúc 05:42 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doanphp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `taikhoan` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `taikhoan`, `password`) VALUES
(1, 'kiet', '123456'),
(12, 'admin1', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `idhoadon` int(20) NOT NULL,
  `idsanpham` int(20) NOT NULL,
  `soluong` int(12) NOT NULL DEFAULT 1,
  `gia` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`idhoadon`, `idsanpham`, `soluong`, `gia`) VALUES
(2, 6, 8, 8000000),
(3, 6, 17, 7000000),
(3, 7, 2, 7800000),
(3, 8, 2, 7800000),
(139, 6, 1, 7000000),
(139, 7, 1, 8000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietwishlist`
--

CREATE TABLE `chitietwishlist` (
  `idwishlist` int(20) NOT NULL,
  `idsanpham` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietwishlist`
--

INSERT INTO `chitietwishlist` (`idwishlist`, `idsanpham`) VALUES
(2, 6),
(2, 7),
(3, 6),
(3, 7),
(2, 8),
(3, 8),
(7, 6),
(7, 9),
(7, 7),
(5, 6),
(10, 6),
(10, 7),
(11, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `idkhachhang` int(20) NOT NULL,
  `idsanpham` int(20) NOT NULL,
  `ngay` datetime NOT NULL DEFAULT current_timestamp(),
  `noidung` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `idkhachhang`, `idsanpham`, `ngay`, `noidung`, `status`) VALUES
(1, 2, 6, '2023-06-29 03:43:47', 'Sản phẩm đẹp', 1),
(2, 114, 8, '2023-06-29 03:57:32', 'Sản phẩm rất đẹp, dùng rất thích', 1),
(3, 2, 8, '2023-06-29 03:58:27', 'Sản phẩm oke', 1),
(4, 115, 6, '2023-06-29 14:55:15', 'sản phẩm dùng rất ổn', 1),
(5, 116, 6, '2023-06-29 15:07:33', 'Sản phẩm không có lỗi', 1),
(6, 117, 7, '2023-06-30 00:33:38', 'Sản phẩm dùng rất tốt', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(20) NOT NULL,
  `idkhachhang` int(20) NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT current_timestamp(),
  `noidung` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `id` int(20) NOT NULL,
  `idkieuthanhtoan` int(20) NOT NULL,
  `idkhachhang` int(20) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `ngaylaphoadon` datetime DEFAULT current_timestamp(),
  `ngayxulihoadon` datetime DEFAULT NULL,
  `tennguoinhan` varchar(150) DEFAULT NULL,
  `diachi` varchar(500) DEFAULT NULL,
  `sodienthoai` varchar(20) DEFAULT NULL,
  `tonggia` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`id`, `idkieuthanhtoan`, `idkhachhang`, `status`, `ngaylaphoadon`, `ngayxulihoadon`, `tennguoinhan`, `diachi`, `sodienthoai`, `tonggia`) VALUES
(2, 1, 2, 0, '2023-04-02 22:36:18', NULL, 'Phương', 'Hà Nội', '0977766688', 4485000),
(3, 1, 3, 0, '2023-04-02 23:49:25', NULL, 'Linh', 'Hà Nội', '231321321', 23560000),
(4, 1, 4, 0, '2023-04-03 15:17:28', NULL, 'Lâm', 'Hà Nội', '321321321', 20000000),
(139, 1, 110, 0, '2023-06-25 23:53:38', NULL, NULL, NULL, NULL, NULL),
(140, 1, 111, 0, '2023-06-26 00:03:07', NULL, NULL, NULL, NULL, NULL),
(141, 1, 112, 0, '2023-06-26 02:57:01', NULL, NULL, NULL, NULL, NULL),
(142, 1, 113, 0, '2023-06-26 13:53:43', NULL, NULL, NULL, NULL, NULL),
(143, 1, 114, 0, '2023-06-29 03:45:06', NULL, NULL, NULL, NULL, NULL),
(144, 1, 115, 0, '2023-06-29 14:54:37', NULL, NULL, NULL, NULL, NULL),
(145, 1, 116, 0, '2023-06-29 15:06:37', NULL, NULL, NULL, NULL, NULL),
(146, 1, 117, 0, '2023-06-30 00:32:54', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `id` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `hovaten` varchar(30) NOT NULL,
  `sodienthoai` varchar(20) NOT NULL,
  `diachi` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`id`, `username`, `password`, `hovaten`, `sodienthoai`, `diachi`, `email`, `status`) VALUES
(2, 'phuong', '123', 'Nguyễn Khánh Phương', '123456789', 'Thanh Xuân', 'phuong@gmail.com', 1),
(3, 'linh', '123', 'Nguyễn Khánh Linh', '0123456789', 'Hà Nội', 'linh@gmail.com', 1),
(4, 'lam', '123', 'Phạm Đỗ Bảo Lâm', '321890312321', 'Hà Nội', 'lam@gmail.com', 0),
(110, 'Duy', '123', 'Phạm Cao Duy', '0977766688', 'N4A trung hòa nhân chính', 'duy@gmail.com', NULL),
(111, 'nam', '123', 'Phạm Cao Nam', '111', 'N4A trung hòa nhân chính', 'nam@gmail.com', NULL),
(112, 'Tam', '321', 'Phạm Xuân Tâm', '8999999', 'N4A trung hòa nhân chính', 'tam@gmail.com', NULL),
(113, 'tien', '123', 'Nguyễn Mạnh Tiến', '012349999', '55 Giải Phóng', 'tien@gmail.com', NULL),
(114, 'kiet', '123', 'Đào Tuấn Kiệt', '09999999', 'N4A trung hòa nhân chính', 'kiet@gmail.com', NULL),
(115, 'A', '123', 'Nguyễn Van a', '012345678', 'N4A trung hòa nhân chính', 'a@gmail.com', NULL),
(116, 'b', '123', 'Nguyễn Văn B', '123456888', 'N4A trung hòa nhân chính', 'b@gmail.com', NULL),
(117, 'c', '123', 'Nguyễn Văn CB', '1234555555', 'Hà Nội', 'c@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id` int(10) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `ten`, `status`) VALUES
(4, 'Máy Nintendo Switch', 1),
(5, 'Game Nintendo Switch', 1),
(7, 'Game Switch cũ', 1),
(9, 'Phụ kiện Nintendo Switch', 1),
(16, 'Tay cầm Nintendo Switch', 1),
(17, 'Phụ kiện cho tay cầm & Joy-con', 1),
(18, 'Cover Case ốp lưng & Bóp đựng máy Switch\r\n', 1),
(19, 'Hộp đựng băng game và đế dựng ', 1),
(20, 'Adapter - Cáp sạc', 1),
(21, 'Thẻ nhớ cho  Nintendo Switch', 1),
(22, 'Phụ kiện Switch OLED ', 1),
(23, 'Tay cầm Nintendo Switch OLED', 1),
(24, 'Phụ kiện cho tay cầm & Joy-con', 1),
(25, 'Miếng dán bảo vệ màn hình Switch OLED', 1),
(26, 'Cover Case ốp lưng & Bóp đựng máy OLED', 1),
(27, 'Hộp đựng băng game và đế dựng ', 1),
(28, 'Adapter - Cáp sạc', 1),
(29, 'Thẻ nhớ cho Nintendo Switch OLED', 1),
(30, 'Phụ kiện Switch Lite', 1),
(31, 'Tay cầm Nintendo Switch Lite', 1),
(32, 'Phụ kiện cho tay cầm & Joy-con', 1),
(33, 'Miếng dán bảo vệ màn hình Switch Lite', 1),
(34, 'Cover Case ốp lưng & Bóp đựng máy LITE', 1),
(35, 'Hộp đựng băng game và đế dựng ', 1),
(36, 'Adapter - Cáp sạc', 1),
(37, 'Thẻ nhớ cho Nintendo Switch Lite', 1),
(38, 'Amiibo', 1),
(39, 'Máy game cũ giá rẻ', 1),
(40, 'Miếng dán bảo vệ màn hình Switch ', 1),
(41, 'Máy game PS5', 1),
(42, 'Mua game PS5', 1),
(43, 'Game PS4', 1),
(44, 'Phụ kiện PS4 & PS5', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `id` int(20) NOT NULL,
  `tennhacungcap` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `sodienthoai` varchar(20) NOT NULL,
  `diachi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`id`, `tennhacungcap`, `email`, `sodienthoai`, `diachi`) VALUES
(4, 'NINTENDO', 'nintendo@gmail.com', '0989066525', 'Nhật Bản'),
(5, 'SONY', 'sony@gmail.com', '09765421312', 'Mỹ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `tennguoinhan` varchar(255) NOT NULL,
  `sodienthoai` varchar(20) NOT NULL,
  `thanhpho` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `tonggia` int(255) NOT NULL,
  `status` bigint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `guestcheck` tinyint(1) NOT NULL DEFAULT 1,
  `customerId` int(255) DEFAULT NULL,
  `package` tinyint(1) NOT NULL DEFAULT 0,
  `onlinepaymentcheck` tinyint(1) NOT NULL DEFAULT 0,
  `ngaytao` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `tennguoinhan`, `sodienthoai`, `thanhpho`, `diachi`, `tonggia`, `status`, `email`, `guestcheck`, `customerId`, `package`, `onlinepaymentcheck`, `ngaytao`) VALUES
(162, 'tien', '0866718960', 'Hà Nội', '21313', 14015000, 0, 'varuss@gmail.com', 0, 113, 0, 0, '2023-06-26'),
(163, 'tien', '0866718960', 'Hà Nội', '123', 4115000, 0, 'varuss@gmail.com', 0, 113, 0, 0, '2023-06-26'),
(164, 'tien', '0866718960', 'Hà Nội', '123', 15015000, 0, 'varuss@gmail.com', 0, 113, 0, 0, '2023-06-26'),
(165, 'phuong', '0866718960', 'Hà Nội', '12321', 43015000, 0, 'varuss@gmail.com', 0, 2, 0, 0, '2023-06-26'),
(166, 'nam', '0866718960', 'Hà Nội', 'n4a trung hoa nhan chinh', 80015000, 0, 'varuss@gmail.com', 0, 111, 0, 0, '2023-06-27'),
(167, 'nam', '0866718960', 'Hà Nội', 'n4a trung hoa nhan chinh', 7015000, 1, 'varuss@gmail.com', 0, 111, 0, 1, '2023-06-27'),
(168, 'Kiệt', '0866718960', 'Hà Nội', 'm4a', 56015000, 0, 'varuss@gmail.com', 1, NULL, 0, 0, '2023-06-27'),
(169, 'Kiệt', '0866718960', 'Hà Nội', 'n4a', 7015000, 0, 'varuss@gmail.com', 1, NULL, 0, 1, '2023-06-27'),
(170, 'KIET', '0866718960', 'Hà Nội', '123', 7015000, 1, 'varuss@gmail.com', 1, NULL, 0, 1, '2023-06-27'),
(171, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', '123456', 41045000, 0, 'kiet@gmail.com', 1, NULL, 0, 0, '2023-06-29'),
(172, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', '123', 31215000, 1, 'varuss@gmail.com', 0, 114, 0, 1, '2023-06-29'),
(173, 'Nam', '0866718960', 'Hà Nội', '123', 32295000, 0, 'varuss@gmail.com', 1, NULL, 0, 0, '2023-06-29'),
(174, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', '123', 70535000, 0, 'varuss@gmail.com', 1, NULL, 0, 0, '2023-06-29'),
(175, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', 'n4a', 15615000, 1, 'varuss@gmail.com', 1, NULL, 0, 1, '2023-06-29'),
(176, 'a', '0866718960', 'Hà Nội', '123', 8015000, 0, 'a@gmail.com', 0, 115, 0, 0, '2023-06-29'),
(177, 'Nguyễn Van A', '0123456789', 'Hà Nội', 'n4a', 49815000, 1, 'a@gmail.com', 0, 115, 0, 1, '2023-06-29'),
(178, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', 'n4a', 95015000, 0, 'kiet@gmail.com', 1, NULL, 0, 0, '2023-06-29'),
(179, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', 'n4a trung hòa nhân chính', 50815000, 1, 'varuss@gmail.com', 1, NULL, 0, 1, '2023-06-29'),
(180, 'Nguyễn Van b', '0866718960', 'Hà Nội', 'n4a', 24415000, 0, 'b@gmail.com', 0, 116, 0, 0, '2023-06-29'),
(181, 'nguyễn van b', '0866718960', 'Hà Nội', 'Hà Nội', 23415000, 1, 'b@gmail.com', 0, 116, 0, 1, '2023-06-29'),
(182, 'Kiệt', '0866718960', 'Hà Nội', 'Trung hòa Nhân Chính', 126215000, 0, 'varuss@gmail.com', 0, 2, 0, 0, '2023-06-30'),
(183, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', 'trung hòa nhân chính', 38815000, 0, 'varuss@gmail.com', 1, NULL, 0, 0, '2023-06-30'),
(184, 'Đào Tuấn Kiệt', '0866718960', 'Hà Nội', '123', 23615000, 1, 'varuss@gmail.com', 1, NULL, 0, 1, '2023-06-30'),
(185, 'Nguyễn Van C', '0866718960', 'Hà Nội', '123', 7815000, 1, 'c@gmail.com', 0, 117, 0, 1, '2023-06-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymentsdetail`
--

CREATE TABLE `paymentsdetail` (
  `id` int(11) NOT NULL,
  `idpayment` int(11) NOT NULL,
  `idsanpham` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `paymentsdetail`
--

INSERT INTO `paymentsdetail` (`id`, `idpayment`, `idsanpham`, `soluong`) VALUES
(274, 162, 6, 2),
(275, 163, 9, 2),
(276, 163, 10, 3),
(277, 164, 6, 1),
(278, 164, 7, 1),
(279, 165, 6, 6),
(280, 165, 9, 1),
(281, 166, 8, 8),
(282, 167, 6, 1),
(283, 168, 7, 7),
(284, 169, 6, 1),
(285, 170, 6, 1),
(286, 171, 7, 5),
(287, 171, 33, 1),
(288, 171, 34, 3),
(289, 172, 7, 4),
(290, 173, 53, 6),
(291, 173, 7, 4),
(292, 174, 32, 4),
(293, 174, 13, 4),
(294, 174, 14, 5),
(295, 175, 7, 1),
(296, 175, 8, 1),
(297, 176, 6, 1),
(298, 177, 8, 3),
(299, 177, 9, 3),
(300, 178, 6, 5),
(301, 178, 7, 5),
(302, 179, 8, 2),
(303, 179, 9, 4),
(304, 180, 7, 1),
(305, 180, 8, 1),
(306, 180, 9, 1),
(307, 181, 7, 3),
(308, 182, 6, 7),
(309, 182, 7, 9),
(310, 183, 14, 4),
(311, 183, 13, 3),
(312, 184, 6, 1),
(313, 184, 7, 1),
(314, 184, 8, 1),
(315, 185, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuongthucthanhtoan`
--

CREATE TABLE `phuongthucthanhtoan` (
  `id` int(20) NOT NULL,
  `kieuthanhtoan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phuongthucthanhtoan`
--

INSERT INTO `phuongthucthanhtoan` (`id`, `kieuthanhtoan`) VALUES
(1, 'Thanh toán trực tiếp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(20) NOT NULL,
  `tensanpham` varchar(150) NOT NULL,
  `idloaisanpham` int(10) NOT NULL,
  `idnhacungcap` int(20) NOT NULL,
  `soluong` int(10) DEFAULT NULL,
  `gianhap` int(20) NOT NULL,
  `giaban` int(20) NOT NULL,
  `ngaynhap` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `anhsanpham` varchar(200) DEFAULT NULL,
  `thongtinsanpham` varchar(500) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `hotthisweek` tinyint(1) NOT NULL DEFAULT 0,
  `hotthismonth` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `idloaisanpham`, `idnhacungcap`, `soluong`, `gianhap`, `giaban`, `ngaynhap`, `status`, `anhsanpham`, `thongtinsanpham`, `featured`, `hotthisweek`, `hotthismonth`) VALUES
(6, 'NINTENDO SWITCH OLED MODEL THE LEGEND OF ZELDA TEARS OF THE KINGDOM', 4, 4, 20, 7000000, 8000000, '2023-04-02 17:28:56', 1, 'https://product.hstatic.net/1000231532/product/tch_oled_model_the_legend_of_zelda_tears_of_the_kingdom_edition_gia_re_c0cd164e973f41cc82446a064deff26c_master.jpg', 'Nintendo Switch OLED Model The Legend of Zelda Tears of the Kingdom Edition bán ở nShop thực sự đẹp xuất sắc. Từ Dock đến thân máy đều được trang trí bằng những họa tiết mang đậm dấu ấn của Zelda Tears of the Kingdom Edition. Tông màu chủ đạo vàng trắng sang trọng, mang đặc tính hoàng gia. Các mảng hoa văn sắc sảo, huyền ảo bao phủ khắp nơi. Bên trong là những đặc tính của thế hệ Switch OLED như màn hình tốt hơn, lớn hơn, chân dựng, loa mới, thêm tính năng cho Dock...\r\n\r\nTHÔNG TIN NINTENDO SWITC', 0, 1, 0),
(7, 'NINTENDO SWITCH OLED MODEL WHITE SET - NÂNG CẤP MỚI, CHƠI GAME ĐÃ HƠN', 4, 4, 20, 6800000, 7800000, '2023-04-02 17:28:56', 1, 'https://product.hstatic.net/1000231532/product/mua_ban_nintendo_switch_oled_model_white_set_o_viet_nam_9d0b23858a5b43319ee2e099470b1c22_master.jpg', 'Mua máy Nintendo Switch OLED Model White Set vừa được ra mắt với những cải tiến mới hướng đến nâng cao trải nghiệm cho người chơi. Máy game không chỉ được trang bị màn hình tốt hơn, lớn hơn, mà còn có thiết kế lại kiểu dáng chân dựng, loa, thêm tính năng cho Dock... Máy Nintendo Switch đã tốt, Nintendo Switch OLED Model còn tốt hơn.', 0, 1, 0),
(8, 'NINTENDO SWITCH OLED MODEL NEON SET - NÂNG CẤP MỚI, CHƠI GAME ĐÃ HƠN', 4, 4, 20, 6800000, 7800000, '2023-04-02 17:28:56', 1, 'https://product.hstatic.net/1000231532/product/mua_ban_nintendo_switch_oled_model_neon_set_gia_re_a247d0613b1f49938f766589500b4b25_master.jpg', 'Nintendo Switch OLED Model Neon Set trình làng với những cải tiến mới hướng đến nâng cao trải nghiệm cho người chơi. Máy không chỉ được trang bị màn hình tốt hơn, lớn hơn, mà còn có thiết kế lại kiểu dáng chân dựng, loa, thêm tính năng cho Dock... Máy Nintendo Switch đã tốt, Nintendo Switch OLED Model còn tốt hơn.', 0, 1, 0),
(9, 'NINTENDO SWITCH OLED MODEL POKEMON SCARLET & VIOLET EDITION\r\n', 4, 4, 20, 7800000, 8800000, '2023-04-02 17:32:00', 1, 'https://product.hstatic.net/1000231532/product/a_hang_ban_nintendo_switch_oled_model_pokemon_scarlet___violet_edition_1045cc0ba1ce4db588bfb1de03cf9ad3_master.jpg', 'Nintendo Switch OLED Model Pokemon Scarlet & Violet Edition bán ở nShop thực sự quá đẹp. Từ Dock đến thân máy đều được trang trí bằng những họa tiết mang đậm dấu ấn của Pokemon thế hệ mới nhất. Hai Joy-con với màu sắc đại diện cho game: Scarlet - Sắc đỏ cháy bỏng và Violet - Sắc tím huyền diệu, được trang trí logo của hai học viện tương ứng, mặt sau là hình ảnh các Pokemon tinh nghịch. Bên trong là những đặc tính của thế hệ Switch OLED như màn hình tốt hơn, lớn hơn, chân dựng, loa mới, thêm tính', 0, 1, 0),
(10, 'NINTENDO SWITCH OLED MODEL SPLATOON 3 SPECIAL EDITION - NÂNG CẤP MỚI', 4, 4, 20, 7000000, 8000000, '2023-04-02 17:32:00', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_oled_model_splatoon_3_special_edition_a10b1a2ec1c7495eae00561f1ce706b5_master.jpg', 'Nintendo Switch OLED Model Splatoon 3 Special Edition bán ở nShop thực sự quá đẹp. Từ Dock đến thân máy đều được trang trí bằng những họa tiết mang đậm phong cách Splatoon, rất trẻ trung và năng động. Hai Joy-con phối màu chuyển từ lam qua tím, xanh qua vàng ở mặt trước, và sắc trắng ở mặt sau cực kỳ nổi bật, bừng bừng sức sống. Bên trong là những đặc tính của thế hệ Switch OLED như màn hình tốt hơn, lớn hơn, chân dựng, loa mới, thêm tính năng cho Dock...\r\n\r\n', 0, 1, 0),
(13, 'NINTENDO SWITCH NEW VERSION NEON RED & BLUE (PIN LÂU HƠN) GIÁ SIÊU RẺ!', 4, 4, 20, 5800000, 6800000, '2023-06-28 11:25:44', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_2020_neon_1da7e1d5926148c08b5f480ab2a7cd2d_master.jpg', 'Phiên bản mới với thời lượng chơi lâu hơn, hoạt động liên tục được 4,5 đến 9 tiếng\r\nTrọn bộ Nintendo Switch Gray bán ra bao gồm:\r\n- Nintendo Switch Console (Thân máy Switch)\r\n- Nintendo Switch Dock (Dock sạc và xuất hình ra TV)\r\n- Joy‑Con (L) (màu Neon Blue)\r\n- Joy‑Con (R) (màu Neon Red)\r\n- 2 Joy‑Con Wrist Strap\r\n- Joy‑Con Grip\r\n- High Speed HDMI Cable\r\n- Nintendo Switch AC Adapter\r\nCó hỗ trợ Nintendo amiibo (NFC)\r\nMáy Nintendo Switch không phân vùng, chơi game của bất kỳ khu vực nào cũng được (', 0, 0, 0),
(14, 'NINTENDO SWITCH LITE CORAL - MÁY CHƠI GAME GIÁ RẺ MÀU SAN HÔ\r\n', 4, 4, 20, 3600000, 4600000, '2023-06-28 11:25:44', 1, 'https://product.hstatic.net/1000231532/product/iew_nintendo_switch_lite_coral_bf70bbaa77f4413fae3998dfd2b4f0ed_grande_57667c79652845a3952a8e6542023725_master.jpg', 'Hệ máy dành cho game thủ thích di chuyển! Nintendo Switch Lite là một thành viên nhỏ gọn, nhẹ nhàng gia nhập vào gia đình Nintendo Switch. Nó sở hữu thiết kế nguyên khối chắc chắn và đặc biệt phù hợp với kiểu chơi cầm tay, vì vậy bạn có thể ngay lập tức thưởng thức các tựa game mình thích bất kỳ lúc nào mình muốn.\r\n\r\n', 0, 1, 0),
(15, 'NINTENDO SWITCH LITE TURQUOISE - MÀU XANH NGỌC TRẺ TRUNG & THỜI TRANG\r\n', 4, 4, 20, 4600000, 5600000, '2023-06-28 11:29:44', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_lite_turquoise_chinh_hang_14f44fa6c68345ee900b6bd9dccba400_master.png', 'THÔNG SỐ KỸ THUẬT CỦA NINTENDO SWITCH LITE\r\nKích thước: 91.1mm x 208mm x 13.9mm (28,4mm là độ dày lớn nhất, tính từ đỉnh cần analog đến chân nhô ra của nút ZL/ZR)\r\nTrọng lượng: 275g\r\nMàn hình cảm ứng điện dung: 5,5 inch, độ phân giải 1280 x 720 (720p)\r\nThời lượng pin: từ 3 đến 7 tiếng tùy game\r\nKhông hỗ trợ xuất hình ảnh lên TV và không tương thích với Dock của Nintendo Switch\r\nKhông tích hợp HD Rumbe, IR Motion Camera', 1, 0, 0),
(16, 'SW380S - THE LEGEND OF ZELDA TEARS OF THE KINGDOM COLLECTOR\'S EDITION (KOREA VER.)', 5, 4, 20, 3180000, 4180000, '2023-06-28 11:31:31', 1, 'https://product.hstatic.net/1000231532/product/the_legend_of_zelda_tears_of_the_kingdom_collector_s_edition_korea_ver_06d17c85115b471c8063ea911f9acbb1_master.jpeg', 'PHIÊN BẢN THE LEGEND OF ZELDA TEARS OF THE KINGDOM COLLECTOR\'S EDITION (KOREA VER.) BAO GỒM NHIỀU VẬT PHẨM SƯU TẬP HẤP DẪN:\r\nBăng game The Legend of Zelda Tears of the Kingdom siêu hay\r\nSách artbook siêu đẹp\r\nHộp đựng game kim loại (SteelBook)\r\nPoster kim loại\r\nBộ ghim cài theo chủ đề của trò chơi\r\n\r\nThe Legend of Zelda Tears of the Kingdom - Siêu phẩm tiếp nối của Breath of the Wild đã chính thức ra mắt! Giờ đây bạn không chỉ có thể khám phá Vương quốc Hyrule rộng lớn trên mặt đất mà còn có nhữ', 0, 0, 0),
(17, 'SW345B - POKEMON VIOLET CHO NINTENDO SWITCH', 5, 4, 20, 1000000, 1380000, '2023-06-28 11:31:31', 1, 'https://product.hstatic.net/1000231532/product/pokemon_violet_nintendo_switch_nshop_52b34d7006ca497b9936f5aa7b69f7df_master.jpg', 'Pokemon Violet cho Nintendo Switch bán ở nShop đã mở ra chương mới cho series game Pokemon truyền thống. Lần đầu tiên, bạn có thể trải nghiệm một vùng đất Pokemon rộng lớn theo kiểu thế giới mở đúng nghĩa. Trò chơi có hàng loạt cơ chế gameplay và nội dung mới để bạn khám phá, hứa hẹn mang đến một cuộc phiêu lưu đầy bùng nổ. Bạn muốn thu thập hết các Pokemon? Trở thành trainer mạnh nhất? Triệt phá băng nhóm kẻ xấu? Hãy làm tất cả những điều đó cùng Pokémon Violet.', 0, 0, 0),
(18, 'SW328 - MINECRAFT LEGENDS DELUXE EDITION CHO NINTENDO SWITCH', 5, 4, 20, 900000, 1150000, '2023-06-28 11:37:36', 1, 'https://product.hstatic.net/1000231532/product/minecraft_legends_deluxe_edition_nintendo_switch_bb74585e3dcc45c5aef43c8f107fc093_master.jpg', 'Minecraft Legends Deluxe Edition cho Nintendo Switch bán tại nShop mở ra một cuộc phiêu lưu mới đầy hấp dẫn trong vũ trụ độc đáo của series Minecraft. Lên đường đánh quái thôi các bạn ơi.\r\n\r\n', 0, 0, 0),
(19, 'SW329 - MEGA MAN BATTLE NETWORK LEGACY COLLECTION CHO NINTENDO SWITCH', 5, 4, 20, 900000, 1200000, '2023-06-28 11:37:36', 1, 'https://product.hstatic.net/1000231532/product/mega_man_battle_network_legacy_collection_nintendo_switch_bc80f7df84a844d69d7c9ed5c2847e06_master.jpg', 'Ôn lại tuổi thơ cùng Mega Man Battle Network Legacy Collection cho Nintendo Switch bán tại nShop! Đây là bản tổng hợp 10 game của series Mega Man Battle Network trước đây trên GBA, nay đưa lên console hiện đại. Tất nhiên, game sẽ có nâng cấp nhẹ về đồ họa và bổ sung nội dung để tăng trải nghiệm. Ngoài ra còn có Gallery và Music mode với hơn 180 bài nhạc từng được dùng cho toàn series.\r\n\r\n', 0, 0, 0),
(20, 'SW327 - ADVANCE WARS 1+2: RE-BOOT CAMP CHO NINTENDO SWITCH', 5, 4, 20, 900000, 1300000, '2023-06-28 11:39:35', 1, 'https://product.hstatic.net/1000231532/product/advance_wars_1_2_re-boot_camp_nintendo_switch_f4e1e7cde90c41b28b69acbc115efa4d_master.jpg', 'Advance Wars 1+2: Re-Boot Camp cho Nintendo Switch bán tại nShop bao gồm toàn bộ nội dung của hai game Advance Wars và Advance Wars 2: Black Hole Rising, mang lại trải nghiệm toàn diện, đầy đủ cho người chơi. Game được làm lại với hình ảnh đẹp mắt, chắc chắn sẽ khiến cả fan cũ lẫn mới hài lòng.', 0, 0, 0),
(21, 'SW311 - SONIC FRONTIERS CHO NINTENDO SWITCH\r\n', 5, 4, 20, 900000, 1280000, '2023-06-28 11:39:35', 1, 'https://product.hstatic.net/1000231532/product/a4c1a6865ea8466fbf00823414badb7e_c55c1cb1cccd4f7aa0626f94c376f183_master.jpg', 'Không còn đóng khung trong các hình thức truyền thống nữa, series games Sonic giờ đây đã có thế giới mở đầu tiên với Sonic Frontiers cho Nintendo Switch có bán tại nShop! Bạn sẽ tha hồ chạy nhảy với tốc độ cao đến bất cứ khu vực nào tại vùng đất Starfall rộng lớn, chiến đấu với những kẻ thù bí ẩn và giải mã những câu đố đầy thú vị!', 0, 0, 0),
(22, 'SW308 - SIFU CHO NINTENDO SWITCH', 5, 4, 20, 900000, 1100000, '2023-06-28 11:41:35', 1, 'https://product.hstatic.net/1000231532/product/sifu_nintendo_switch_dc4f70973b194a93a4cb813ddbc24504_master.jpg', 'Sifu cho Nintendo Switch có bán tại nShop được đánh giá là game indie hay nhất trong thời gian gần đây! Game có những chiêu thức và đòn thế Kung Fu kết hợp hài hòa giữa tốc độ và kĩ thuật đầy uyển chuyển, mang tới cho người chơi những màn trình diễn võ thuật đẹp mắt nhất!', 0, 0, 0),
(23, 'SW305 - DRAGON BALL THE BREAKERS CHO NINTENDO SWITCH', 5, 4, 20, 700000, 900000, '2023-06-28 11:41:35', 1, 'https://product.hstatic.net/1000231532/product/d0062c7edf514451bf44762f06e0b0b1_1b7d801ef67a40f7b685e92ab9492b70_master.jpg', 'DRAGON BALL THE BREAKERS cho Nintendo Switch có bán tại nShop sẽ mang tới cho bạn một game 7 Viên Ngọc Rồng cực kì độc đáo mà bạn chưa từng thấy! Thay vì các trận chiến đối kháng quen thuộc kinh điển, giờ đây bạn sẽ phải cùng những người chơi khác chạy trốn khỏi kẻ thù dưới dạng game sinh tồn! Hoặc bạn sẽ trở thành Raider - Kẻ đi truy lùng những người chơi khác!', 0, 0, 0),
(24, 'MONSTER HUNTER RISE CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 450000, 650000, '2023-06-28 11:43:07', 1, 'https://product.hstatic.net/1000231532/product/monster_hunter_rise_cho_nintendo_switch_second-hand_6283042491e24d0eb07d7e8eeec5b40d_master.jpg', 'Monster Hunter Rise cho Nintendo Switch đang có bán ở nShop là phần mới nhất của series Monster Hunter đình đám với rất nhiều cải tiến hấp dẫn. Đây cũng là một trong những game đẹp và hoành tráng nhất trên Nintendo Switch từ trước đến giờ, chắc chắn không làm các fan thất vọng.\r\n\r\nMonster Hunter Rise là một game nhập vai hành động sẽ đưa người chơi đến với Kamura Village vui tươi, một địa phương miền núi hoàn toàn mới, thu hút nhiều khách du lịch nhờ văn hóa độc đáo và những phát kiến trong kỹ t', 0, 0, 0),
(25, 'LEGO MARVEL SUPERHEROES 2 [SECOND-HAND]\r\n', 7, 4, 20, 450000, 750000, '2023-06-28 11:43:07', 1, 'https://product.hstatic.net/1000231532/product/5188b302f1424daaeeb783daf47e18_0a7dcd2fa4854bf7acade36cbe4f471d_grande_c4ffeef3b202431e9c775eea5d332ede_master.jpg', 'LEGO Marvel Super Heroes 2 sẽ mang lại cho bạn một chuyến phiêu lưu hoàn toàn mới, nguyên bản với rất nhiều nhân vật được yêu thích qua góc nhìn hài hước của LEGO. Bạn có thể hóa thân thành các Guardians of the Galaxy, Spider-Man, Thor, Hulk, Black Panther, Captain Marvel, Doctor Strange, Carnage, Green Goblin, hay vô số nhân vật khác và chiến đấu trong thành phố Chronopolis.', 0, 0, 0),
(26, 'THE WITCHER 3 WILD HUNT CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 450000, 800000, '2023-06-28 11:46:03', 1, 'https://product.hstatic.net/1000231532/product/c2035da98740d7a5da2570898f7444_dac1bd3681354e6ea4b6bd59c14cd3e2_grande_8aaf1b97dca047dbaf80cf6caf46876f_master.jpg', 'The Witcher 3 Wild Hunt cho Nintendo Switch (Complete Edition) bao gồm toàn bộ các nội dung DLC đã phát hành trước đó và nhiều thứ khác:\r\n\r\nThe Witcher 3: Wild Hunt Game\r\nHearts of Stone & Blood and Wine expansions + 16 DLC\r\n\r\n\r\nThe Witcher 3: Wild Hunt dễ dàng mang lại cho bạn hơn 150 giờ chơi theo nhờ cốt truyện và các nhiệm vụ đa dạng. Những màn săn quái ngẹt thở, các tùy chọn khiến thế giới thay đổi, mọi nội dung của The Witcher 3 đều được gói gọn trong bản game trên Nintendo Switch.', 1, 0, 0),
(27, 'POKKEN TOURNAMENT DX​ [SECOND-HAND]', 7, 4, 20, 450000, 900000, '2023-06-28 11:46:03', 1, 'https://product.hstatic.net/1000231532/product/pokken_tournament_dx__second-hand_731375cfb6fe4f11be4e8717bd64ad86_master.jpg', 'Phiên bản game Pokken Tournament DX trên Nintendo Switch có hơn 20 đấu sĩ Pokemon của bản Wii U, và cộng thêm các nhân vật từ bản game thùng như Darkrai, Scizor, Croagunk, Empoleon, và thêm Decidueye mới. Bạn sẽ tiếp tục được đắm mình vào những màn tranh tài mãn nhãn bởi những đòn thế hoa mĩ, hoành tráng với Pokken Tournament DX. Đặc biệt, game POKKEN TOURNAMENT DX​ cho Nintendo Switch còn có các tính năng mới mà chúng ta có thể tóm tắt dưới đây:\r\n\r\n\r\n\r\nChơi mọi lúc, mọi nơi trên máy Nintendo Sw', 0, 0, 0),
(28, 'MARIO STRIKERS BATTLE LEAGUE CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 450000, 900000, '2023-06-28 11:48:17', 1, 'https://product.hstatic.net/1000231532/product/mario_strikers_battle_league_cho_nintendo_switch__second-hand__5f830f6578234f23a5067149a45f4740_master.jpg', 'Trong những trận đấu bóng của Mario Strikers Battle League cho Nintendo Switch bán tại nShop, mỗi đội sẽ có 5 thành viên (4 cầu thủ, 1 thủ môn). Luật chơi rất đơn giản, chỉ cần đưa bóng vào lưới đối phương càng nhiều càng tốt. Còn những hành động như xô người ư? Ở đây chúng tôi cực kỳ khuyến khích điều đó. Thậm chí cầu thủ còn phóng được cả sấm sét, gió lốc, và lửa để tấn công nữa cơ.', 0, 0, 0),
(29, 'SAMURAI WARRIORS 5 CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 450000, 900000, '2023-06-28 11:48:17', 1, 'https://product.hstatic.net/1000231532/product/9d278d641a7c41109b71f25d0bc45b41_739d734e5efa4deb823332f2335e3789_master.jpg', 'Trải nghiệm ngay Samurai Warriors 5 cho Nintendo Switch đang có bán tại nShop. Trò chơi là một làn gió mới, mang tới hình ảnh khác biệt cho dòng game chặt chém lâu đời của hãng Koei Tecmo.\r\nSAMURAI WARR', 0, 1, 0),
(30, 'CAPTAIN TSUBASA RISE OF NEW CHAMPIONS CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 450000, 800000, '2023-06-28 11:49:55', 1, 'https://product.hstatic.net/1000231532/product/240659647d844a1aa8ea86b3169f4c97_3e88a87b769b4f67be7fd28fee90ff2f_master.jpg', 'Captain Tsubasa Rise of New Champions là tựa game Captain Tsubasa đầu tiên sau 10 năm dài xuất hiện trên máy console, mang lại nhiều điều thú vị cho các fan. Game sở hữu đồ họa 3D đẹp mắt, hình ảnh gần với manga, anime, vô cùng rực rỡ. Đi kèm là lối chơi dễ nắm bắt nhưng có chiều sâu, và tất nhiên là tha hồ cho bạn thi triển các tuyệt kỹ ảo diệu không khác gì truyện.', 0, 0, 0),
(31, 'FIFA 22 LEGACY EDITION CHO NINTENDO SWITCH [SECOND-HAND]', 7, 4, 20, 200000, 300000, '2023-06-28 11:49:55', 1, 'https://product.hstatic.net/1000231532/product/game_cu_fifa_22_legacy_edition_cho_nintendo_switch__second-hand__13c217cd280c4201b4a0d97acc2194f5_master.jpg', 'FIFA 22 tiếp tục mang tới cho các game thủ yêu thích bộ môn bóng đá những mùa bóng và những trận banh đầy tuyệt vời. Hãy trải nghiệm ngay FIFA 22 cho Nintendo Switch đang có bán tại nShop.\r\n\r\nFIFA 22 Legacy Edition trên Nintendo Switch có các nội dung mới nhất về các câu lạc bộ, đội bóng từ một số giải đấu hàng đầu thế giới. Game cũng có thêm một số sân vận động nổi tiếng thế giới mới. Chế độ chơi FIFA Ultimate Team trên Nintendo Switch sẽ phản ánh thế giới bóng đá thực thông qua một số chiến dị', 0, 1, 0),
(32, 'TAY CẦM IINE SPLIT PAD PRO ELITE PLUS JOY-CON CHO NINTENDO SWITCH - L736', 9, 4, 20, 800000, 1080000, '2023-06-28 11:51:51', 1, 'https://product.hstatic.net/1000231532/product/edf61bba358a41628d079b879d879d71_50ddd9c009394988bac7e3f818482471_master.jpg', 'Tay cầm IINE Split Pad Pro Elite Plus Joy-con cho Nintendo Switch - L736 có bán ở nShop là một giải pháp thay thế rất kinh tế cho tay Joy-con do Nintendo sản xuất. Nó không chỉ có thể wake up máy bằng nút HOME, có rung, có cảm ứng chuyển động để chiến gần như toàn bộ game Switch mà còn có tính năng Turbo lẫn Macro. Đặc biệt với bộ vỏ trong suốt, bạn hoàn toàn có thể chiêm ngưỡng vẻ đẹp lấp lánh của đèn RGB tích hợp bên trong.\r\n\r\nTHÔNG TIN TAY CẦM IINE SPLIT PAD PRO ELITE PLUS JOY-CON CHO NINTEND', 1, 0, 0),
(33, 'TAY CẦM IINE PHANTOM ELITE PRO CONTROLLER CHO SWITCH OLED - L769', 9, 4, 20, 900000, 1280000, '2023-06-28 11:51:51', 1, 'https://product.hstatic.net/1000231532/product/885c33fa05cd4c229e53b91f2829e9be_3e90e56017d040cbbe7513f8510220b9_master.jpg', 'Tay cầm IINE Phantom ELITE PRO Controller cho Switch OLED - L769 đang có bán tại nShop không chỉ sở hữu bộ vỏ được thiết kế trong suốt cùng dải đèn LED ống đẹp mắt mà còn cực kì đa tính năng, đa kết nối khi hỗ trợ cả Switch, Điện thoại lẫn Steam PC nữa đấy!', 0, 0, 0),
(34, 'KỆ GIÁ ĐỠ TAY CẦM 3 TẦNG KIÊM TREO TAI NGHE CHO PLAYSTATION NINTENDO SWITCH PC', 9, 4, 20, 200000, 250000, '2023-06-28 11:54:38', 1, 'https://product.hstatic.net/1000231532/product/m_3_tang_kiem_treo_tai_nghe_cho_playstation_nintendo_switch_pc_mau_den_851bb7816ada4250a35a79c6532fed1a_master.jpg', 'Kệ giá đỡ tay cầm chơi game kiêm treo tai nghe 3 tầng có bán ở nShop bằng acrylic trong suốt cao cấp sẽ giúp góc chơi game của bạn trở nên gọn đẹp và phong cách. Bộ sản phẩm với 3 tầng để tay cầm phù hợp cho hầu hết các kiểu tay cầm lẫn máy Nintendo Switch OLED hay Lite, trục treo tai nghe treo vừa hầu hết các tai nghe gaming full size phổ thông, chắc chắn sẽ khiến bạn hài lòng.', 0, 0, 0),
(35, 'TÚI ĐEO CHÉO GUNDAM HÌNH KHIÊN THE 08TH MS TEAM SHIELD', 9, 4, 20, 300000, 380000, '2023-06-28 11:54:38', 1, 'https://product.hstatic.net/1000231532/product/62a99cd121794c5e96c8f56394287a80_8a93ffa28e7f42dfbf35189f5639f3bd_master.jpg', 'Túi đeo chéo Gundam hình khiên The 08th MS Team Shield có bán tại nShop tạo hình hệt như khiên của Team MS08 huyền thoại, có kích thước nhỏ gọn, giúp bạn có thể đựng các vật dụng thường xuyên mang theo bên mình như máy game Nintendo Switch, điện thoại, bút viết, ví tiền, giấy tờ...  thích hợp cho nam nữ dùng đi chơi, dạo phố... ', 0, 0, 0),
(36, 'TAY CẦM POKEMON SCARLET VIOLET KHÔNG DÂY CHO SWITCH HỖ TRỢ NFC', 9, 4, 20, 580000, 780000, '2023-06-28 11:56:26', 1, 'https://product.hstatic.net/1000231532/product/pokemon_scarlet_violet_khong_day_cho_switch_ho_tro_nfc_chinh_hang_iine_5a9ab4b45e8a437e9f761fe8d7c18b43_master.jpg', 'Tay cầm Pokemon Scarlet Violet không dây cho Switch hỗ trợ NFC IINE - L746 đang có bán tại nShop là phiên bản đặc biệt được lấy cảm hứng từ tựa game Pokemon Scarlet Violet với tone màu đen kết hợp họa tiết hình Miraidon & Koraidon cực kì cá tính,đẹp mắt. Tay cầm sở hữu thiết kế cứng cáp, thoải mái khi cầm. Bên cạnh đó có cả chức năng Turbo, Wake-up giúp chơi game tiện lợi hơn. Nó có cả cảm ứng chuyển động, rung, và thậm chí là quét amiibo.\r\n\r\n\r\n', 0, 0, 0),
(37, 'BÓP ĐỰNG NINTENDO SWITCH OLED LOẠI CỨNG IINE - WHITE SUNGLASSES', 9, 4, 20, 300000, 380000, '2023-06-28 11:56:26', 1, 'https://product.hstatic.net/1000231532/product/bop_dung_nintendo_switch_oled_loai_cung_iine_white_sunglasses_9a46f51b89dd487eaabd578d8277fcea_master.jpg', 'Bạn cần một chiếc túi đựng máy Switch OLED thật phong cách, thật năng động? Vậy thì đến ngay với Bóp đựng Nintendo Switch OLED loại cứng IINE - White Sunglasses có bán ở nShop đi thôi. Với cảm hứng từ không gian bao la, phụ kiện này được khoác lên mình màu trắng sáng và hình ảnh chiếc kính không gian như bộ đồ của các phi hành gia trong phim, game khoa học viễn tưởng.\r\n\r\n\r\n', 0, 0, 0),
(38, 'COVER ANALOG JOY-CON NINTENDO SWITCH ZELDA HYLIAN SHIELD & TRAVELER SHIELD', 9, 4, 20, 100000, 150000, '2023-06-28 11:59:03', 1, 'https://product.hstatic.net/1000231532/product/c7335dd117ca4dd9bb9cf495ad7b2cfd_fc682f60b9424e34b504882d8b93c9e8_master.jpg', 'Cover analog Joy-con Nintendo Switch Hylian Shield & Traveler Shield có bán ở nShop là bộ cover analog với hình ảnh hai chiếc khiên quen thuộc trong The Legend of Zelda Tears of Kingdom độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.', 0, 0, 0),
(39, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER LEGEND OF ZELDA TEARS OF THE KINGDOM EDITION', 9, 4, 20, 1500000, 2000000, '2023-06-28 11:59:03', 1, 'https://product.hstatic.net/1000231532/product/pro_controller_legend_of_zelda_tears_of_the_kingdom_edition_chinh_hang_4d5cc98acc1141da9556db9769f46da9_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Legend of Zelda Tears of the Kingdom Edition bán ở nShop không những chất mà còn đẹp! Trên thân tay cầm là hàng loạt hoa văn của Zelda Tears of the Kingdom vô cùng cầu kỳ và ấn tượng. Sản phẩm chắc chắc sẽ khiến các fan Zelda lẫn non-fan mê mẩn. Tay Pro Controller là một lựa chọn tuyệt vời nhất để chiến game trên Nintendo Switch, Nintendo Switch Lite và cả trên PC.', 0, 0, 0),
(40, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER (PHIÊN BẢN XÁM - TIÊU CHUẨN)', 16, 4, 20, 1500000, 1800000, '2023-06-28 12:00:43', 1, 'https://product.hstatic.net/1000231532/product/switch-pro-controller1-800x800_master.jpg', 'Bạn là một game thủ chuyên nghiệp và tay cầm Joy-con kết hợp Hand-grip không đủ với bạn? Yên tâm vì đã có giải pháp Pro Controller cực kỳ hợp lý đến từ chính hãng Nintendo. Thiết kế của tay cầm tương tự phiên bản trên Wii U nhưng tích hợp thêm nhiều tính năng đáng giá cũng như cải thiện lớn về độ bền, hiệu năng, độ thoải mái...\r\n\r\nTHÔNG TIN VỀ TAY CẦM NINTENDO SWITCH PRO CONTROLLER\r\nTay cầm Nintendo Switch Pro Controller kiểu truyền thống dành cho máy chơi game Nintendo Switch, mang lại cho bạn ', 0, 0, 0),
(41, 'TAY CẦM PRO CONTROLLER IINE CAT MINI CHO NINTENDO SWITCH', 16, 4, 20, 500000, 750000, '2023-06-28 12:00:43', 1, 'https://product.hstatic.net/1000231532/product/pro_controller_iine_cat_mini_nintendo_switch_pink_1ddd85e6c76c41b6b66562c41dd9d3b6_master.jpg', 'Tay cầm Pro Controller IINE Cat Mini cho Nintendo Switch đang có bán tại nShop khá phù hợp với dáng tay của game thủ Châu Á, đặc biệt là các bạn nữ khi được thiết kế nhỏ hơn. Nó cũng sở hữu nhiều màu sắc tươi tắn rất bắt mắt và đặc biệt là kiểu dáng đáng yêu lấy cảm hứng từ những chú mèo với đôi tai lớn. Có mẫu còn được sơn màu theo ba Pokemon khởi đầu của Pokemon Sword & Shield đấy, bạn có nhận ra không?', 0, 0, 0),
(42, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER MONSTER HUNTER RISE SUNBREAK EDITION', 16, 4, 20, 1500000, 2000000, '2023-06-28 12:08:02', 1, 'https://product.hstatic.net/1000231532/product/am_nintendo_switch_pro_controller_monster_hunter_rise_sunbreak_edition_b430f98066b844a682cd51aade6de8a6_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Monster Hunter Rise Sunbreak Edition bán ở nShop không những chất mà còn đẹp! Với tông màu đen chủ đạo quen thuộc, tô điểm bằng hình ảnh sắc trắng bạc nổi bật của Malzeno mạnh mẽ, chắc chắc sẽ khiến các fan lẫn non-fan mê mẩn. \r\n\r\nTay Pro Controller là một lựa chọn tuyệt vời nhất để chiến game trên Nintendo Switch, Nintendo Switch Lite và cả trên PC.', 0, 0, 0),
(43, 'TAY CẦM SPLATOON TÍM KHÔNG DÂY CHO SWITCH HỖ TRỢ NFC IINE - L709', 16, 4, 20, 500000, 780000, '2023-06-28 12:08:02', 1, 'https://product.hstatic.net/1000231532/product/a3bb8ac0b41c4b6db1c81928ab80c945_a9325b6b1b39463d9584d1f07a172c3d_master.jpg', 'Tay cầm Splatoon tím không dây cho Switch hỗ trợ NFC IINE - L709 đang có bán tại nShop là phiên bản đặc biệt được lấy cảm hứng từ tựa game Splatoon 3 với tone màu tím vàng cực kì cá tính,đẹp mắt. Tay cầm sở hữu thiết kế cứng cáp, thoải mái khi cầm. Bên cạnh đó có cả chức năng Turbo, Wake-up giúp chơi game tiện lợi hơn. Nó có cả cảm ứng chuyển động, rung, và thậm chí là quét amiibo.', 0, 0, 0),
(44, 'TAY CẦM 8BITDO LITE BLUETOOTH GAMEPAD YELLOW EDITION', 16, 4, 20, 400000, 480000, '2023-06-28 12:09:55', 1, 'https://product.hstatic.net/1000231532/product/tay_cam_8bitdo_lite_bluetooth_gamepad_yellow_edition_659fd9a6535a4aae8619c2ec5b6dd736_master.jpg', 'Tay cầm 8BitDo Lite Bluetooth Gamepad Yellow Edition có bán ở nShop gây ấn tượng ban đầu nhờ thiết kế khác lạ của mình. Kế đó, trong quá trình sử dụng, bạn sẽ nhận ra đây không chỉ là một chiếc tay bấm game đẹp. Nó còn rất tốt nữa. Tay cầm nhỏ gọn rất tiện để mang theo người, màu sắc tươi tắn theo phong cách của Nintendo Switch Lite.\r\n\r\n', 0, 0, 0),
(45, 'TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH TRONG SUỐT VIỀN LED - L513', 16, 4, 20, 500000, 780000, '2023-06-28 12:09:55', 1, 'https://product.hstatic.net/1000231532/product/cam_iine_pro_controller_cho_nintendo_switch_trong_suot_vien_led_-_l513_4e89a5ec4c264d43b8e6c3d7bc9533c4_master.jpg', 'Tay cầm IINE Pro Controller cho Nintendo Switch trong suốt viền LED - L513 cho Nintendo Switch đang có bán tại nShop ngay lập tức gây ấn tượng bởi vẻ ngoài độc đáo của mình. Lớp vỏ trong suốt để lộ bo mạch, linh kiện bên trong nhìn rất thú vị. Đặc biệt nó còn có hệ thống đèn LED bố trí ở nhiều vị trí, tăng thêm phần rực rỡ. Chưa hết, bạn chỉnh kiểu sáng, chớp, và màu đèn cũng được luôn, vui mắt vô cùng.', 0, 0, 0),
(46, 'SW077E - POKE BALL PLUS CHUYÊN DÙNG CHO POKEMON LET\'S GO', 16, 4, 20, 900000, 1250000, '2023-06-28 12:12:33', 1, 'https://product.hstatic.net/1000231532/product/poke_ball_plus_master.jpg', 'Sức mạnh của một Pokemon Trainer đang nằm trong tay bạn! Với Poke Ball Plus đang có bán tại nShop, bạn sẽ cảm thấy mình như một Pokemon Trainer thực thụ, du hành qua vùng đất Kanto trong game Pokemon Let\'s Go.', 0, 0, 0),
(47, 'NINTENDO SWITCH PRO CONTROLLER - SPLATOON 2 EDITION CHÍNH HÃNG', 16, 4, 20, 1500000, 2000000, '2023-06-28 12:12:33', 1, 'https://product.hstatic.net/1000231532/product/switch-pro-controller-splatoon1-800x800_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Splatoon 2 Edition chính hãng Nintendo - Phiên bản đặc biệt, phối màu và hoa văn theo hình ảnh, phong cách rất bắt mắt của tựa game Splatoon 2 nổi tiếng. Lớp vỏ ngoài trong suốt mờ để lộ “nội thất” bên trong độc đáo, đẹp mắt. Tay cầm Pro Controller cho Nintendo Switch với đầy đủ chức năng, thiết kế chắc chắn, giúp bạn có thể tận hưởng và trải nghiệm game tốt nhất!', 0, 0, 0),
(48, 'TÚI ĐỰNG TAY CẦM EVA CHỐNG SỐC BẢO VỆ CONTROLLER ĐEN L745', 17, 4, 20, 150000, 220000, '2023-06-28 12:14:47', 1, 'https://product.hstatic.net/1000231532/product/342239613c484c188df8b2c45317abb5_37dc43d99f9b43ac84afcb243528f426_master.jpg', 'Túi đựng tay cầm game đang có bán tại nShop là một món phụ kiện hữu dụng cho những game thủ hay di chuyển. Nó sẽ giúp bạn chứa gọn chiếc tay cầm game của mình một cách êm ái khi đi ra ngoài giải trí hoặc tới những giải đấu. Túi phù hợp với rất nhiều kiểu tay cầm khác nhau, từ Nintendo Switch, PlayStation 5, đến Xbox One...\r\n\r\nTHÔNG TIN TÚI ĐỰNG TAY CẦM MÁY CHƠI GAME (NINTENDO SWITCH, PS4, PS5, XBOX ONE)\r\nBóp đựng tay cầm máy chơi game chuyên dụng\r\nCó thể chứa được nhiều kiểu tay cầm khác nhau nh', 0, 0, 0),
(49, 'COVER ANALOG JOY-CON NINTENDO SWITCH PAWDIARY', 17, 4, 20, 100000, 150000, '2023-06-28 12:14:47', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_pawdiary_meo_trang_meo_xam_5094eff3990148c0a68124e18cddbc03_master.jpg', 'Cover analog Joy-con Nintendo Switch Pawdiary có bán ở nShop là những bộ cover analog với các hình ảnh đáng yêu dễ thương như phô mai, thỏ, gấu, cừu, mèo v.v... độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.', 0, 0, 0),
(50, 'COVER ANALOG JOY-CON NINTENDO SWITCH IINE - THE LEGEND OF ZELDA', 17, 4, 20, 70000, 120000, '2023-06-28 12:16:28', 1, 'https://product.hstatic.net/1000231532/product/9da50658bc8f48b1b9c83b11320a18df_fc74cb1bf8534d8ab3cc20e182451000_master.jpg', 'Cover analog Joy-con Nintendo Switch IINE - The Legend of Zelda có bán ở nShop là bộ cover analog với hình ảnh biểu tượng của The Crest of the Sheikah hay Sheikah Eye huyền bí độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.\r\n\r\n', 0, 0, 0),
(51, 'CASE SILICON JOY-CON NINTENDO SWITCH IINE - SPLATOON', 17, 4, 20, 120000, 180000, '2023-06-28 12:16:28', 1, 'https://product.hstatic.net/1000231532/product/6febad26eaaf48f7939079c1223373f3_69c38de249144f8dbf0640cdfb857ae0_master.jpg', 'Case Silicon Joy-Con Nintendo Switch IINE - Splatoon có bán ở nShop là một chiếc áo thời trang và bền chắc cho tay cầm của bạn. Chất liệu dẻo nên khi cầm rất êm tay, cũng như góp phần tăng độ bám khi chơi trong thời gian dài. Màu sắc sản phẩm tươi tắn, đường nét chuẩn đẹp. Có ốp silicon này, đỡ lo Joy-con bị bẩn, bị thấm mồ hôi nhiều như trước rồi.', 1, 0, 0),
(52, 'DÂY ĐEO JOY-CON NHẢY JUST DANCE NINTENDO SWITCH IINE', 17, 4, 20, 120000, 180000, '2023-06-28 12:17:50', 1, 'https://product.hstatic.net/1000231532/product/day_deo_joy-con_nhay_just_dance_nintendo_switch_iine_15680f1d8dea4541a390ec2af1be79ce_master.jpg', 'Phải cầm Joy-con nhiều khi chơi Just Dance khiến bạn mỏi tay? Các bài nhảy mang tính vận động cao khiến tay bạn ra mồ hôi, sợ thấm hư Joy-con? Dây đeo Joy-con nhảy Just Dance Nintendo Switch IINE có bán ở nShop sẽ giải quyết hết những vấn đề đó. Phụ kiện đơn giản mà tiện lợi này giúp cố định Joy-con trên cổ tay bạn, tha hồ nhảy Just Dance mà không còn gì lo lắng.\r\n\r\n\r\n', 0, 0, 0),
(53, 'Phải cầm Joy-con nhiều khi chơi Just Dance khiến bạn mỏi tay? Các bài nhảy mang tính vận động cao khiến tay bạn ra mồ hôi, sợ thấm hư Joy-con? Dây đeo', 17, 4, 20, 120000, 180000, '2023-06-28 12:17:50', 1, 'https://product.hstatic.net/1000231532/product/gia_do_kep_din_thoai_cho_tay_cam_8bitdo_pro_2_gamepad_923f6d4fb3f94253be11a25a7cf6eec7_master.jpg', 'Giá đỡ kẹp điện thoại cho tay cầm 8BitDo Pro 2 Gamepad có bán ở nShop sẽ giúp quá trình chơi game di động của bạn thêm sung sướng. Được thiết kế chuyên biệt cho tay cầm 8BitDo Pro 2 Gamepad, chiếc giá đỡ này sở hữu kiểu dáng hiện đại, trọng lượng nhẹ mà rất vững chắc. Phần ngàm gắn điện thoại có thể co giãn để phù hợp với nhiều mẫu điện thoại khác nhau trên thị trường. Bạn cũng có thể điều chỉnh độ nghiêng của giá đỡ sao cho tầm nhìn thoải mái nhất.\r\n\r\n ', 1, 0, 0),
(54, 'GẬY ĐÁNH GOLF DOBE GẮN JOY-CON CHO NINTENDO SWITCH - TNS-1140', 17, 4, 20, 150000, 220000, '2023-06-28 12:19:45', 1, 'https://product.hstatic.net/1000231532/product/gay_danh_golf_dobe_joy-con_nintendo_switch_tns-1140_277484587be242dfa08a445834be2d93_master.jpg', 'https://product.hstatic.net/1000231532/product/gay_danh_golf_dobe_joy-con_nintendo_switch_tns-1140_277484587be242dfa08a445834be2d93_master.jpg', 0, 0, 0),
(55, 'VỎ THAY THẾ NINTENDO SWITCH ANIMAL CROSSING LIMITED EDITION', 17, 4, 20, 690000, 990000, '2023-06-28 12:19:45', 1, 'https://product.hstatic.net/1000231532/product/vo_thay_the_nintendo_switch_animal_crossing_limited_edition_joycon_c60e1262c353439daa6f0739b0324987_master.jpg', 'Biến chiếc máy Nintendo Switch của bạn thành phiên bản đặc biệt Animal Crossing siêu đẹp cùng bộ vỏ thay thế đang có bán tại nShop. Chi tiết và chất lượng nhựa, khớp được làm rất tốt', 0, 0, 0),
(56, 'MIẾNG DÁN CHỐNG TRẦY MÀN HÌNH CHO NINTENDO SWITCH V1 V2', 40, 4, 20, 50000, 99000, '2023-06-28 12:25:40', 1, 'https://product.hstatic.net/1000231532/product/mieng_dan_chong_tray_man_hinh_cho_nintendo_switch_v1_v2_2b67edb0072a4837a003ad0b9248748e_master.jpg', 'Bảo vệ ngay màn hình máy game của bạn, tránh trầy xước trước khi quá muộn bằng Miếng dán chống trầy màn hình cho Nintendo Switch V1, V2 có bán tại nShop với chi phí tiết kiệm nhất.\r\n\r\nTHÔNG TIN VỀ MIẾNG DÁN CHỐNG TRẦY MÀN HÌNH CHO NINTENDO SWITCH V1 V2\r\nMiếng dán màn hình dành riêng cho Nintendo Switch\r\nBảo vệ màn hình máy, hạn chế trầy xước màn hình trong quá trình sử dụng\r\nĐộ trong suốt cao, không gây ảnh hưởng đến góc nhìn, chất lượng hình ảnh của máy.\r\nKhả năng dán dễ dàng, có thể tự dán.\r\nK', 0, 0, 0),
(57, 'MIẾNG DÁN CƯỜNG LỰC NINTENDO SWITCH CHÍNH HÃNG IINE', 40, 4, 20, 200000, 250000, '2023-06-28 12:25:40', 1, 'https://product.hstatic.net/1000231532/product/mua_mieng_dan_cuong_luc_gia_re_cho_nintendo_switch_v1_v2_867e29e700744fd3b55155eef79368f3_master.jpg', 'Dán màn hình là việc hầu như game thủ Nintendo Switch nào cũng thực hiện khi mới mua máy, hoặc thay mới sau một khoảng thời gian sử dụng. Với miếng dán cường lực IINE bảo vệ màn hình Nintendo Switch có bán ở nShop, bạn sẽ có được trang bị tuyệt vời cho màn hình cảm ứng nhạy cảm trên chiếc máy game của mình.', 0, 0, 0),
(58, 'SET NÚT CAO SU BỊT CHỐNG BỤI KÈM MIẾNG DÁN MÀN HÌNH DOBE CHO NINTENDO SWITCH - TNS-862', 40, 4, 20, 120000, 180000, '2023-06-28 12:29:00', 1, 'https://product.hstatic.net/1000231532/product/42af8c7b3c4143f0ba42229d866dd414_e5dc273df9764fa7af289218ef2d6df3_master.jpg', 'Bạn e ngại việc bám bụi lâu ngày sẽ ảnh hưởng đến tuổi thọ của máy Nintendo Switch? Bạn muốn bảo vệ tối đa và toàn diện nhất cho máy game yêu quý của mình? Set chống bụi kèm miếng dán màn hình DOBE cho Nintendo Switch - TNS-862 đang có bán tại nShop là lựa chọn mà bạn nên hướng tới đấy!', 0, 0, 0),
(59, 'DÁN CƯỜNG LỰC IN VIỀN CHO NINTENDO SWITCH', 40, 4, 20, 200000, 250000, '2023-06-28 12:29:00', 1, 'https://product.hstatic.net/1000231532/product/dan_cuong_luc_in_vien_cho_nintendo_switch_splatoon_master.jpg', 'Miếng dán cường lực in viền cho Nintendo Switch có bán tại nShop không chỉ bảo vệ màn hình cảm ứng, mà còn trang trí cho máy Switch của bạn thêm đẹp. Thay vì trong suốt toàn bộ, các cạnh viền của miếng dán này được in hình ảnh theo game, nhân vật, khi dán xong nhìn rất đẹp mắt. Để các cạnh đen xung quanh màn hình Switch không còn nhàm chán, chọn ngay miếng dán tại nShop', 0, 0, 0),
(60, 'ỐP LƯNG SILICON NYKO THIN CASE CHO NINTENDO SWITCH GẮN VỪA DOCK - KÈM DÁN CƯỜNG LỰC', 40, 4, 20, 350000, 480000, '2023-06-28 12:32:30', 1, 'https://product.hstatic.net/1000231532/product/_switch_vua_dock_dan_cuong_luc_2feb33015dba40f8a538c0ce7d8a2e89_grande_d4d97a8b5c4b4868be49a86bd762248c_master.jpg', 'Ốp lưng silicon Nyko Thin Case cho Nintendo Switch đang có bán tại nShop giúp bạn bảo vệ máy Nintendo Switch của mình gần như đầy đủ. Bộ sản phẩm bao gồm case cho thân máy xuyên thấu đẹp mắt, ốp cả mặt trên lẫn dưới. Tiếp đó là hai vỏ bọc silicon mềm hơn cho Joy-con. Cuối cùng còn có miếng dán cường lực cho màn hình của máy.', 0, 0, 0),
(61, 'TÚI ĐEO CHÉO MINI HÌNH TAY CẦM GAME SNES', 18, 4, 20, 350000, 480000, '2023-06-28 12:33:49', 1, 'https://product.hstatic.net/1000231532/product/tui_deo_cheo_mini_hinh_tay_cam_game_snes_fda345efb8144a368e97ba58a5800c3c_master.jpg', 'Túi đeo chéo mini hình tay cầm game SNES có bán tại nShop với tạo hình như chiếc tay cầm SNES retro cổ điển, có kích thước nhỏ gọn, giúp bạn có thể đựng các vật dụng thường xuyên mang theo bên mình như Nintendo Switch Lite, điện thoại, chìa khóa, airpod, thẻ ngân hàng...  thích hợp cho cả nam và nữ sử dụng đi chơi, hằng ngày một cách tiện dụng nhất. \r\n\r\nChất liệu bên ngoài là vải nỉ hạn chế thấm nước tiện dụng, dễ dàng giặt rửa. Dây kéo khóa chất lượng, thuận lợi khi mở hoặc đóng khóa. Nút bấm A', 0, 0, 0),
(62, 'TÚI ĐEO CHÉO DRAGON BALL MESSENGER BAG BẢY VIÊN NGỌC RỒNG', 18, 4, 20, 350000, 420000, '2023-06-28 12:33:49', 1, 'https://product.hstatic.net/1000231532/product/tui_deo_cheo_dragon_ball_bay_vien_ngoc_rong_c68c0272589c4312807b32ad1144c8e1_master.jpg', 'Túi đeo chéo Dragon Ball Messenger Bag Bảy Viên Ngọc Rồng có bán tại nShop sở hữu thiết kế năng động, gợi nhớ đến các phiên bản Pokemon đời đầu. Túi có kích thước nhỏ gọn, được chia thành nhiều ngăn nhỏ phân bổ hợp lý, giúp bạn có thể đựng các vật dụng thường xuyên mang theo bên mình như điện thoại, máy Nintendo Switch Lite, bút viết, ví tiền, giấy tờ...  thích hợp cho nam nữ dùng đi chơi, dạo phố hoặc sử dụng hằng ngày. ', 0, 0, 0),
(63, 'HYBRID COVER DA BẢO VỆ CHO MÁY NINTENDO SWITCH POWERA', 18, 4, 20, 150000, 200000, '2023-06-28 12:35:59', 1, 'https://product.hstatic.net/1000231532/product/59b3b1cd59284dcf85b517d4d39ee8a0_34699da63fae417ba2c5ca90fade9187_master.jpg', 'Hybrid Cover da bảo vệ cho máy Nintendo Switch PowerA có bán tại nShop với thiết kế cực kì trang nhã, chất liệu giả da sang trọng, giúp bạn bảo vệ thân máy Switch khỏi trầy xước, va đập nhẹ, đồng thời vẫn giữ được tính thẩm mĩ cao cho máy.', 0, 0, 0),
(64, 'CASE BẢO VỆ TỪ TÍNH IINE CHO NINTENDO SWITCH - NEON RED BLUE', 18, 4, 20, 200000, 280000, '2023-06-28 12:35:59', 1, 'https://product.hstatic.net/1000231532/product/case_bao_ve_tu_tinh_iine_nintendo_switch_neon_red_blue_92ff79f41bb64842948c156878a6c589_master.jpg', 'Có lẽ Case bảo vệ từ tính IINE cho Nintendo Switch - Neon Red Blue có bán ở nShop sẽ khiến bạn trầm trồ bởi thiết kế độc đáo sáng tạo của mình. Chiếc vỏ bảo vệ này có hai phần, một ốp lưng mặt sau, và một che màn hình, nút bấm mặt trước. \r\n\r\nĐiều đáng nói là bạn có thể gỡ mặt trước ra rồi liên kết nó với mặt sau bằng nam châm cực kỳ đơn giản. Từ đó tạo thành phần grip để cầm chắc tay hơn. Khi không chơi nữa thì mình lại gỡ ra và gắn nó lại phía trước bảo vệ màn hình, chống cấn nút như bình thườn', 0, 0, 0),
(65, 'CASE JOY-CON KÈM ỐP LƯNG TRONG SUỐT NINTENDO SWITCH IINE - ANIMAL CROSSING', 18, 4, 20, 200000, 260000, '2023-06-28 12:38:04', 1, 'https://product.hstatic.net/1000231532/product/se_joy-con_kem_op_lung_trong_suot_nintendo_switch_iine_animal_crossing_fc32d60bf85c4e88803d6ac23cb46798_master.jpg', 'Case Joy-con kèm ốp lưng trong suốt Nintendo Switch IINE - Animal Crossing là một sản phẩm rất được yêu thích tại nShop. Nó tuy đơn giản nhưng có thể bảo vệ hiệu quả máy Switch của bạn khỏi trầy sước do vô tình va chạm trong quá trình sử dụng. Bên cạnh đó, phần ốp Joy-con còn có gờ nhô lên giúp cầm nắm thoải mái hơn. Đặc biệt là khi gắn chiếc case này, bạn vẫn có thể để máy vô Dock và chơi trên TV như bình thường, vừa đẹp vừa tiện.', 0, 0, 0),
(66, 'TÚI ĐEO CHÉO GUNDAM SHIELD - KHIÊN RX-78-2 EFSF\r\n', 18, 4, 20, 300000, 380000, '2023-06-28 12:38:04', 1, 'https://product.hstatic.net/1000231532/product/tui_deo_cheo_hinh_gundam_shield_khien_cu_to_rx-78-2_efsf_03bc0fa8ac184884a6f059fbe028d4cf_master.jpg', 'Túi đeo chéo Gundam Shield - Khiên RX-78-2 EFSF có bán tại nShop tạo hình hệt như khiên của Cụ tổ RX-78-2, có kích thước nhỏ gọn, giúp bạn có thể đựng các vật dụng thường xuyên mang theo bên mình như máy game Nintendo Switch, điện thoại, bút viết, ví tiền, giấy tờ...  thích hợp cho nam nữ dùng đi chơi, dạo phố... ', 0, 0, 0),
(67, 'TÚI ĐỰNG NINTENDO SWITCH - ZELDA HYLIAN SHIELD - PHỤ KIỆN CAO CẤP', 18, 4, 20, 350000, 420000, '2023-06-28 12:40:18', 1, 'https://product.hstatic.net/1000231532/product/tui_dung_nintendo_switch_zelda_hylian_shield_e373b516f99d4f7c9096abbcf991939e_master.jpg', 'Túi đựng Nintendo Switch - Zelda Hylian Shield đang có bán tại nShop là một phụ kiện tuyệt vời dành cho bạn. Không chỉ có phom dáng cứng cáp, chắc chắn, bảo vệ tốt máy game, chiếc túi này còn sở hữu thiết kế đẹp mắt dựa trên các hoa văn của Hylian Shield cùng màu sắc vô cùng nổi bật. Những chi tiết sắc sảo bằng cao su nổi ở mặt ngoài, và lớp đệm mềm mại bên trong sẽ khiến bạn hài lòng. ', 0, 0, 0),
(68, 'TÚI ĐỰNG NINTENDO SWITCH CORAL COLOR HỒNG XÁM', 18, 4, 20, 200000, 280000, '2023-06-28 12:40:18', 1, 'https://product.hstatic.net/1000231532/product/tui_dung_nintendo_switch_coral_color_47b6343b57af40e08974812975080dd9_master.jpg', 'Túi đựng Nintendo Switch Coral Color đang có bán tại nShop mềm mềm, xinh xinh rất đáng yêu và đựng tốt máy Nintendo Switch của bạn luôn đây. Kiểu dáng đơn giản nhưng không bao giờ lỗi thời, kết hợp cùng cách phối màu hài hòa đã tạo nên vẻ đẹp tổng thể cho sản phẩm. Bên cạnh đó, chất liệu êm ái của túi cũng giúp bảo vệ an toàn cho máy Nintendo Switch Lite của bạn. Nó còn có chỗ đựng băng game nữa đấy.', 0, 0, 0),
(69, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - ZELDA', 19, 4, 20, 200000, 250000, '2023-06-28 12:42:15', 1, 'https://product.hstatic.net/1000231532/product/_game_ban_hop_dung_bang_game_nintendo_switch_16_ngan_iine_zelda_gia_re_d1dcad01dd5244c2b918e8c32bf25d0b_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Zelda có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với các biểu tượng từ ', 0, 0, 0),
(70, 'CHÂN ĐỨNG DÀNH CHO HỘP BĂNG GAME NINTENDO SWITCH', 19, 4, 20, 120000, 180000, '2023-06-28 12:42:15', 1, 'https://product.hstatic.net/1000231532/product/upload_a251111657a64f3f9521b676e776f56c_master.jpg', 'Bạn là game thủ yêu thích mua và sưu tập game Nintendo Switch nhưng quá nhiều băng game  thay vì để chồng chất lên nhau hoặc sắp dựng nghiên ngả thì giờ đây đã có sản phẩm Chân đứng hộp băng Nintendo Switch là phụ kiện bổ trợ tuyệt vời nhất.', 0, 0, 0),
(71, 'KỆ DOBE ĐỰNG BĂNG ĐĨA GAME CHO NINTENDO SWITCH PS5 XBOX 12 NGĂN - TP5-0520', 19, 4, 20, 200000, 260000, '2023-06-28 12:44:02', 1, 'https://product.hstatic.net/1000231532/product/ke_dobe_dung_game_nintendo_switch_ps5_xbox_12_ngan_ec4c6dc465cb439eb27c4752eae46b94_master.jpg', 'Góc giải trí của bạn không chỉ gọn gàng và sẽ đẹp mắt hơn với Kệ DOBE đựng băng đĩa game cho Nintendo Switch PS5 Xbox 12 ngăn đang bán tại nShop. Kệ đựng game này tương thích với nhiều loại hộp game (hoặc hộp đĩa phim...) khác nhau nên bạn có thể để chung rất tiện lợi. Thiết kế đơn giản theo hướng hiện đại giúp còn giúp nó dễ phối hợp với đồ vật xung quanh.', 0, 0, 0),
(72, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH NẮP TỪ TÍNH 12 NGĂN IINE - BLUE DUCK', 19, 4, 20, 1500000, 220000, '2023-06-28 12:44:02', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_game_nintendo_switch_nap_tu_tinh_12_ngan_iine_blue_duck_0459e3946c5d4cf6ae95781274608f5c_master.jpg', 'Với nhiều người chúng ta, hộp đựng băng game Nintendo Switch nắp từ tính 12 ngăn IINE - Blue Duck có bán ở nShop sẽ là một món phụ kiện vô cùng tuyệt vời. Chiếc hộp này giúp bạn lưu trữ tới 12 băng game Switch (hoặc thẻ nhớ MicroSD) cực kỳ gọn gàng. Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc.', 0, 0, 0),
(73, 'HỘP ĐỰNG BĂNG NINTENDO SWITCH IN HÌNH GAME', 19, 4, 20, 200000, 250000, '2023-06-28 12:45:44', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_nintendo_switch_in_hinh_super_mario_odyssey_master.jpg', 'Ngoài hộp đựng băng game Nintendo Switch dạng đơn giản, tối giản, và hộp Logo đúc nổi, nShop còn có thêm dạng hộp in hình bên ngoài rất đẹp mắt. Trên nắp hộp đựng băng loại này là hình ảnh của các tựa game, nhân vật nổi tiếng như Mario, Pokemon, Zelda, Monster Hunter, Splatoon... tha hồ cho bạn chọn lựa theo ý thích của mình. Mỗi hộp có thể chứa được 12 băng Nintendo Switch và 12 thẻ microSD, nhỏ gọn và tiện lợi mang theo bên mình, đổi game chơi nhanh chóng.', 0, 0, 0),
(74, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - MASTER SWORD', 19, 4, 20, 200000, 250000, '2023-06-28 12:45:44', 1, 'https://product.hstatic.net/1000231532/product/5b4ef10b65df4da1ab69f9f1c6d68bf7_7a8c426d647a4f7b9b1812d53785970b_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Master Sword có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với biểu tượng ', 0, 0, 0),
(75, 'KỆ GAME VÀ ĐẾ DỰNG TAY CẦM TREO TƯỜNG DOBE CHO PS5 SWITCH XBOX - TP5-1543', 19, 4, 20, 200000, 260000, '2023-06-28 12:48:43', 1, 'https://product.hstatic.net/1000231532/product/ke_game_de_dung_tay_cam_treo_tuong_dobe_ps5_switch_xbox_tp5-1543_4ca139833a974cb9832a2421150eb403_master.jpg', 'Kệ game và đế dựng tay cầm treo tường DOBE cho PS5 Switch Xbox - TP5-1543 có bán ở nShop sẽ giúp góc chơi game của bạn trở nên gọn đẹp và phong cách, đặc biệt là với các phòng game có mảng tường lớn, TV treo tường... Bộ sản phẩm thiết kế đơn giản mà hiệu quả. Các phụ kiện trong bộ cũng có thể tách riêng để dùng và sắp xếp tùy ý.', 0, 0, 0),
(76, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH NẮP TỪ TÍNH 12 NGĂN IINE - KIRBY', 19, 4, 20, 150000, 220000, '2023-06-28 12:48:43', 1, 'https://product.hstatic.net/1000231532/product/ang_game_nintendo_switch_nap_tu_tinh_12_ngan_iine_-_kirby_gia_re_tphcm_e74080f029014abda385997493b8f61b_master.jpg', 'Với nhiều người chúng ta, Hộp đựng băng game Nintendo Switch nắp từ tính 12 ngăn IINE - Kirby có bán ở nShop sẽ là một món phụ kiện vô cùng tuyệt vời. Chiếc hộp này giúp bạn lưu trữ tới 12 băng game Switch (hoặc thẻ nhớ MicroSD) cực kỳ gọn gàng. Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc.', 0, 0, 0),
(77, 'CÁP USB-C DOBE KẾT NỐI VÀ SẠC CHO NINTENDO SWITCH - TNS-868', 20, 4, 20, 100000, 150000, '2023-06-28 12:50:28', 1, 'https://product.hstatic.net/1000231532/product/cap_usb-c_dobe_ket_noi_va_sac_cho_nintendo_switch_tns-868_b2729d175c6f42c6a6ed93b24f5dff1a_master.jpg', 'TẠI SAO MỖI GAME THỦ CHƠI NINTENDO SWITCH, PS5, XBOX SERIES X | S ĐỀU NÊN MUA 1 DÂY CÁP USB C?\r\nĐơn giản vì máy Nintendo Switch, PS5, Xbox Series X | S thiết kế tương thích chuẩn USB C với công nghệ mới nhất cho phép sạc nhanh và truyền tải dữ liệu. Nếu AC Adapter Nintendo Switch (Sạc của máy Nintendo Switch) thiết kế dính liền với đầu nguồn không thể kết nối dữ liệu hay dùng chung với Pin dự phòng thì dây cáp USB Type C này sẽ giúp bạn làm điều đó:\r\n\r\n- Kết nối Pin sạc dự phòng, tiện lợi mọi lú', 0, 0, 0),
(78, 'PHÍCH CẮM CHUYỂN ĐỔI 3 CHẤU SANG 2 CHẤU', 20, 4, 20, 10000, 20000, '2023-06-28 12:50:28', 1, 'https://product.hstatic.net/1000231532/product/phich_cam_chuyen_doi_3_chau_sang_2_chau_af3a9baafffa490d89af0e42bad5f113_master.jpg', 'Thiết bị phích Cắm Chuyển Đổi 3 Chấu Sang 2 Chấu nhỏ nhưng vô cùng hữu ích, bạn sẽ có ngay 1 ổ cắm 3 chân tiêu chuẩn, phù hợp với nhiều loại phích cắm, rất tiện dụng cho các thiết bị sử dụng trong gia đình, văn phòng, du lịch.', 0, 0, 0),
(79, 'ĐẾ SẠC JOY-CON 6 TRONG 1 GẮN DOCK NINTENDO SWITCH DOBE - ĐỎ ĐEN - TNS-0122', 20, 4, 20, 250000, 300000, '2023-06-28 12:52:05', 1, 'https://product.hstatic.net/1000231532/product/de_sac_joy-con_6_trong_1_gan_dock_nintendo_switch_dobe_do_den_tns-0122_07f2a0a454d6436fa800aa5dbd2e4a7f_master.jpg', 'Đế sạc Joy-con 6 trong 1 gắn Dock Nintendo Switch DOBE Đỏ Đen TNS-0122 có bán ở nShop nhỏ bé nhưng hiệu quả lớn. Nó sẽ lập tức giúp chiếc Dock của bạn hữu dụng hơn khi tăng thêm các cổng sạc Joy-con. Nhờ thiết kế tinh tế, bạn có thể sạc cùng lúc 6 Joy-con khi sử dụng phụ kiện này (2 tay gắn thân máy và 4 tay gắn đế sạc).\r\n\r\nBên cạnh đó, nó còn có 2 vị trí gắn băng game tiện lợi, 1 cổng USB phụ phía sau để kết nối các phụ kiện khác. Sản phẩm cực kỳ phù hợp với những góc chơi game nhỏ hoặc nếu bạn', 0, 0, 0),
(80, 'LAN ADAPTER NỐI MẠNG CHO NINTENDO SWITCH IINE\r\n', 20, 4, 20, 380000, 450000, '2023-06-28 12:52:05', 1, 'https://product.hstatic.net/1000231532/product/lan_adapter_noi_mang_nintendo_switch_iine_8c7bd777e3ca4fb186ea49c6c4201d15_master.jpg', 'Bạn chơi game online bằng WIFI trên máy Nintendo Switch hay bị lag, mất kết nối do sóng wifi yếu, không ổn định. Hoặc không chơi game Switch online được do nhà không có sóng WIFI? Vậy LAN Adapter nối mạng cho Nintendo Switch IINE có bán ở nShop chính là sản phẩm cần thiết cho bạn. Nó sẽ chuyển máy Switch của bạn sang nối mạng có dây, ổn định hơn dùng WIFI nhiều, bớt đi nỗi lo đánh thua vì mạng giựt.', 0, 0, 0),
(81, 'CHARGING GRIP ĐẾ SẠC TAY CẦM CHO JOY-CON - IINE L410', 20, 4, 20, 250000, 320000, '2023-06-28 12:53:43', 1, 'https://product.hstatic.net/1000231532/product/n_charging_grip_de_sac_tay_cam_cho_joy-con_nintendo_switch_-_iine_l410_ba5335bd3fb444eebf7607826a027259_master.jpg', 'Không còn phải e ngại việc các Joy-con từ IINE như Split Pad Pro, Joy-Con Trong Suốt không gắn vừa Hand-Grip đi kèm theo máy nữa, vì đã có Charging Grip Đế sạc tay cầm cho Joy-Con - IINE L410 tại nShop! Chiếc Grip sạc này không những được thiết kế nhỏ gọn, thoải mái hơn mà còn có thể giúp bạn cắm sạc Joy-con vô cùng tiện lợi, loại bỏ nỗi lo Joy-con hết pin khi tháo rời hoặc không đủ chỗ để sạc thêm Joy-con phụ!', 0, 0, 0),
(82, 'DOCK MINI CONVERTER CHUYỂN USB-C SANG HDMI, USB3.0, USB-C - BLACK BEAR', 20, 4, 20, 400000, 520000, '2023-06-28 12:55:13', 1, 'https://product.hstatic.net/1000231532/product/l674fdsafa_copy_e859b6ec8c4646b48ea6ad29bfbbeac2_master.jpg', 'Dock Mini Converter chuyển USB-C sang HDMI, USB3.0, USB-C - Black Bear có bán tại nShop  dù có kích thước nhỏ nhắn nhưng có thể thay thế chiếc Dock cồng kềnh của Nintendo Switch, Switch OLED, loại bỏ các nguy cơ về trầy xước máy khi gắn Dock, đồng thời tăng hiệu quả tản nhiệt trong quá trình chơi. Chưa hết, bộ sản phẩm còn được tặng kèm hai vỏ silicon có tạo hình tai gấu với màu pastel vô cùng đáng yêu nữa đấy!', 1, 0, 0);
INSERT INTO `sanpham` (`id`, `tensanpham`, `idloaisanpham`, `idnhacungcap`, `soluong`, `gianhap`, `giaban`, `ngaynhap`, `status`, `anhsanpham`, `thongtinsanpham`, `featured`, `hotthisweek`, `hotthismonth`) VALUES
(83, 'ĐẾ SẠC JOY-CON MỞ RỘNG GẮN DOCK NINTENDO SWITCH OLED DOBE - ĐEN TRẮNG - TNS-0122B', 20, 4, 20, 250000, 300000, '2023-06-28 12:55:13', 1, 'https://product.hstatic.net/1000231532/product/_joy-con_mo_rong_gan_dock_nintendo_switch_oled_dobe_den_trang_tns-0122_38d5a9f5f8f540f1a2cf66c0faf9124e_master.jpg', 'Đế sạc Joy-con mở rộng gắn Dock Nintendo Switch OLED DOBE TNS-0122B có bán ở nShop nhỏ bé nhưng hiệu quả lớn. Nó sẽ lập tức giúp chiếc Dock của bạn hữu dụng hơn khi tăng thêm các cổng sạc Joy-con. Nhờ thiết kế tinh tế, bạn có thể sạc cùng lúc 6 Joy-con khi sử dụng phụ kiện này (2 tay gắn thân máy và 4 tay gắn đế sạc).', 0, 0, 0),
(84, 'CỐC SẠC NHANH 45W KÈM CÁP TYPE-C TO C 1.2M CHO NINTENDO SWITCH - DOBE ITNS-2111', 20, 4, 20, 380000, 450000, '2023-06-28 12:56:43', 1, 'https://product.hstatic.net/1000231532/product/coc_sac_nhanh_45w_kem_cap_type-c_to_c_1.2m_-_dobe_itns-2111_gia_re_48144f2ac65e4ed38f80c6ada2e8ed40_master.jpg', 'Cốc sạc nhanh 45w kèm cáp Type-C to C 1.2m - DOBE iTNS-2111 đang bán ở nShop là cốc sạc kích thước nhỏ gọn, cáp sạc có thể tháo rời, giúp bạn dễ dàng mang theo bất cứ lúc nào. Với tính năng sạc thông minh, bạn có thể nhanh chóng sạc đầy máy Nintendo Switch hoặc cả những thiết bị khác sử dụng cổng Type C với cáp đi kèm.\r\n\r\n', 0, 0, 0),
(85, 'THẺ NHỚ MICROSDXC CLASS 10 - 256GB DÀNH CHO NINTENDO SWITCH', 21, 4, 20, 700000, 990000, '2023-06-28 12:57:40', 1, 'https://product.hstatic.net/1000231532/product/microsdxc_256_gb_samsung_evo_plus_grande_1dffa0fbd1a1497f837ece40856554a3_master.jpg', 'Thẻ microSDXC 256GB chính hãng Samsung là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, Samsung Evo Plus microSDXC 256GB U3 mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà.\r\n\r\nMỞ RỘNG DUNG LƯỢNG NINTENDO SWITCH LÊN ĐẾN 256GB\r\nVới khả năng lưu trữ thêm 256GB dữ liệu cho máy game, người dùng có thể tải nhiều game hơn,  nhằm phục vụ cho việc giải trí của bạn một cách nhanh chóng. Thẻ nhớ microSDXC 256', 0, 0, 0),
(86, 'THẺ NHỚ MICROSD CLASS10 - 64GB', 21, 4, 20, 200000, 290000, '2023-06-28 12:57:40', 1, 'https://product.hstatic.net/1000231532/product/microsdxc_samsung_evo_plus_u1_64gb_f93ac70158984a19ab8af77eb8316e58_master.jpg', 'Thẻ nhớ microSD loại dung lượng 64GB phổ biến với giá cả thích hợp. Có thể chép được 30-60 game 3DS (tùy theo dung lượng game), hàng trăm bản nhạc MP3 và phim thoả thích niềm đam mê của bạn trên chiếc máy game cầm tay. Tốc độ cao tương thích Nintendo Switch.', 0, 0, 0),
(87, 'THẺ NHỚ MICROSDXC CLASS 10 - 512GB DÀNH CHO NINTENDO SWITCH', 21, 4, 20, 1300000, 1690000, '2023-06-28 13:00:05', 1, 'https://product.hstatic.net/1000231532/product/the_nho_microsdxc_class_10_512gb_nintendo_switch_d02b85a19f914b02a0090d73a22b2e7a_master.jpg', 'Thẻ microSDXC 512GB chính hãng Samsung là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, Samsung Evo Plus microSDXC 256GB U3 mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà.', 0, 0, 0),
(88, 'ĐẦU ĐỌC THẺ NHỚ USB 2.0', 21, 4, 20, 40000, 60000, '2023-06-28 13:00:05', 1, 'https://product.hstatic.net/1000231532/product/shop_ban_dau_doc_the_nho_usb_2.0_gia_re_nhat_7d0bc25c8dd347b48c499ce026819cd9_master.jpg', 'Đầu đọc thẻ nhớ đa năng dành cho máy chơi game bán tại nShop có kết nối USB 2.0 cho tốc độ truyền tải nhanh. Thiết kết bền chắc nhưng vẫn có sự nhỏ gọn mang lại sự tiện lợi cho khách hàng. ', 0, 0, 0),
(89, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 256GB (NINTENDO VERSION) CHO NINTENDO SWITCH', 21, 4, 20, 1200000, 1590000, '2023-06-28 13:01:18', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_256gb_nintendo_switch_befa1b117ee44c3ebad0fbdfc34266ed_grande_2e872fdf673b483e801b4941d2566ffb_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 256GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\n', 0, 0, 0),
(90, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 512GB NINTENDO VERSION CHO NINTENDO SWITCH', 21, 4, 20, 2600000, 3190000, '2023-06-28 13:01:18', 1, 'https://product.hstatic.net/1000231532/product/ddc7635ac16e4c76b3540f230ccda4f6_ca0b7e49805041c7abb8d0950aad3b51_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 512GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, In họa tiết Animal Crossing cực đẹp dành cho fan game mua sưu tập, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.', 0, 0, 0),
(91, 'ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 READER HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO', 21, 4, 20, 200000, 260000, '2023-06-28 13:02:48', 1, 'https://product.hstatic.net/1000231532/product/transcend-usb-card-reader1-800x800_master.jpg', 'THÔNG TIN VỀ ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO\r\nĐầu đọc thẻ đa năng thương hiệu Transcend\r\nDạng thanh nhỏ gọn, dễ sử dụng và mang theo bên người khi đi xa.\r\nHỗ trợ nhiều loại thẻ: SDHC (UHS-I), SDXC (UHS-I), microSD, microSDHC (UHS-I), và microSDXC (UHS-I)\r\nCó đèn LED báo hiệu trạng thái hoạt động\r\nChuẩn kết nối USB 3.0 tốc độ cao (lên đến 86,2 MB/giây) chép game và dữ liệu nhanh chóng.\r\nKết nối trực tiếp qua cổng USB', 0, 0, 0),
(92, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 128GB (NINTENDO VERSION) CHO NINTENDO SWITCH', 21, 4, 20, 690000, 890000, '2023-06-28 13:02:48', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_128gb_nintendo_switch_a5727dfe44364bb6b5220bf0dcfe4a01_grande_800cb4f7ede749b4a602ca44f248f173_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 128GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.', 0, 0, 0),
(93, 'TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH OLED - PANDA L703', 22, 4, 20, 500000, 750000, '2023-06-28 17:18:28', 1, 'https://product.hstatic.net/1000231532/product/pro_wireless_controller_nintendo_switch_pikachu_white_07cad6ce984943dab030ce2634773e4d_master.jpg', 'Tay cầm IINE Pro Controller cho Nintendo Switch - Panda có bán ở nShop sở hữu một thiết kế siêu đẹp với tông đen trắng đặc trưng của loài gấu trúc đáng yêu. Bên trong nó là hàng loạt tính năng hiện đại, mang lại sự tiện ích không nhỏ khi chơi game. Từ cảm ứng chuyển động, rung, NFC, đến wake up máy, turbo đều có. Kiểu dáng cầm rất vừa tay, chắc chắn, xứng đáng để bạn sử dụng mỗi khi chiến game trên Switch hoặc PC.\r\n\r\nTHÔNG TIN TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH OLED - PANDA L703\r\nTa', 0, 0, 0),
(94, 'VALI DU LỊCH DOBE CHO NINTENDO SWITCH - SWITCH OLED', 22, 4, 20, 350000, 420000, '2023-06-28 17:18:28', 1, 'https://product.hstatic.net/1000231532/product/vali_du_lich_dobe_nintendo_switch_oled_3a068860a7704d46be11ff03def3d795_master.jpg', 'Vali du lịch DOBE dành cho Nintendo Switch có bán ở nShop là sản phẩm ai cũng nên sở hữu. Tiện lợi dành cho những trường hợp mang đi chơi xa mà không muốn bỏ sót đồ ở nhà.', 0, 0, 0),
(95, 'NINTENDO SWITCH JOY-CON CONTROLLER SET (NEON GREEN + NEON PINK)', 22, 4, 20, 1500000, 1890000, '2023-06-28 17:20:59', 1, 'https://product.hstatic.net/1000231532/product/joy-con-neon-green-pink1-800x800_master.jpg', 'Sản phẩm tay cầm Joycon thêm màu NEON GREEN + NEON PINK dành cho Nintendo Switch hàng chính hãng là phụ kiện thích hợp cho những game thủ yêu thích chơi nhiều người.', 0, 0, 0),
(96, 'BỘ TRỐNG TAIKO CHO NINTENDO SWITCH', 22, 4, 20, 550000, 800000, '2023-06-28 17:20:59', 1, 'https://product.hstatic.net/1000231532/product/bo_trong_taiko_cho_nintendo_switch_master.jpg', 'Làm sao để tận hưởng và chơi game Taiko vui hơn nữa trên máy Nintendo Switch? Hãy sử dụng ngay Bộ trống chuyến dụng dành cho game Taiko Drum đang có bán tại nShop. Bạn sẽ rất hưng phấn khi chơi với một chiếc trống y như thật này đấy, quá vui, quá rộn rã luôn. Giờ đây mình đã có thể đánh trống giống như máy game trong siêu thị rồi. ', 0, 0, 0),
(97, 'THẺ NHỚ MICROSD CLASS10 - 64GB', 22, 4, 20, 200000, 290000, '2023-06-28 17:22:43', 1, 'https://product.hstatic.net/1000231532/product/microsdxc_samsung_evo_plus_u1_64gb_f93ac70158984a19ab8af77eb8316e58_master.jpg', 'Thẻ nhớ microSD loại dung lượng 64GB phổ biến với giá cả thích hợp. Có thể chép được 30-60 game 3DS (tùy theo dung lượng game), hàng trăm bản nhạc MP3 và phim thoả thích niềm đam mê của bạn trên chiếc máy game cầm tay. Tốc độ cao tương thích Nintendo Switch.', 0, 0, 0),
(98, 'TAY CẦM 8BITDO SN30 PRO BLUETOOTH GAMEPAD G CLASSIC EDITION', 22, 4, 20, 650000, 780000, '2023-06-28 17:22:43', 1, 'https://product.hstatic.net/1000231532/product/tay_cam_8bitdo_sn30_pro_bluetooth_gamepad_g_classic_edition_1bb732142c4f4ebf967a9bcf2d53d4bf_master.jpg', 'Tay cầm 8BitDo SN30 Pro Bluetooth GamePad G Classic Edition có bán ở nShop đã giành được không biết bao lời khen ngợi từ những tạp chí game, web game, reviewer danh tiếng, và cả số lượng lớn người sử dụng toàn thế giới. Nó là một trong những chiếc tay cầm tốt nhất hiện nay. Từ chất lượng hoàn thiện sản phẩm đến tính năng, trải nghiệm khi sử dụng đều hoàn toàn xứng đáng (thậm chí hơn) số tiền mà bạn bỏ ra.', 0, 0, 0),
(99, 'SW077E - POKE BALL PLUS CHUYÊN DÙNG CHO POKEMON LET\'S GO', 22, 4, 20, 900000, 1250000, '2023-06-28 17:24:16', 1, 'https://product.hstatic.net/1000231532/product/poke_ball_plus_master.jpg', 'Sức mạnh của một Pokemon Trainer đang nằm trong tay bạn! Với Poke Ball Plus đang có bán tại nShop, bạn sẽ cảm thấy mình như một Pokemon Trainer thực thụ, du hành qua vùng đất Kanto trong game Pokemon Let\'s Go.', 0, 0, 0),
(100, 'TÚI ĐEO CHÉO ĐỰNG MÁY NINTENDO SWITCH - POKEMON', 22, 4, 20, 350000, 450000, '2023-06-28 17:24:16', 1, 'https://product.hstatic.net/1000231532/product/ng_may_nintendo_switch_pokemon_a77d1cb52c6544bc9e4f069e3d637da0_grande_4a88930d73854d44953881c869353d41_master.jpg', 'Túi đeo chéo đựng máy Nintendo Switch đang có bán tại nShop là một giải pháp cho các bạn thích sự gọn gàng, tiện lợi ở mỗi chuyến ra ngoài, mà vẫn muốn đem theo bên mình những món đồ hữu dụng nhất. Điểm nổi bật của sản phẩm này là thiết kế nhỏ gọn mà hiệu quả. ', 0, 0, 0),
(101, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER LEGEND OF ZELDA TEARS OF THE KINGDOM EDITION', 23, 4, 20, 1500000, 2000000, '2023-06-28 17:25:44', 1, 'https://product.hstatic.net/1000231532/product/pro_controller_legend_of_zelda_tears_of_the_kingdom_edition_chinh_hang_4d5cc98acc1141da9556db9769f46da9_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Legend of Zelda Tears of the Kingdom Edition bán ở nShop không những chất mà còn đẹp! Trên thân tay cầm là hàng loạt hoa văn của Zelda Tears of the Kingdom vô cùng cầu kỳ và ấn tượng. Sản phẩm chắc chắc sẽ khiến các fan Zelda lẫn non-fan mê mẩn. Tay Pro Controller là một lựa chọn tuyệt vời nhất để chiến game trên Nintendo Switch, Nintendo Switch Lite và cả trên PC.\r\n\r\nTHÔNG TIN TAY CẦM NINTENDO SWITCH PRO CONTROLLER LEGEND OF ZELDA TEARS OF THE KINGDOM EDIT', 0, 0, 0),
(102, 'TAY CẦM IINE SPLIT PAD PRO ELITE PLUS JOY-CON CHO NINTENDO SWITCH - L736', 23, 4, 20, 850000, 1080000, '2023-06-28 17:25:44', 1, 'https://product.hstatic.net/1000231532/product/edf61bba358a41628d079b879d879d71_50ddd9c009394988bac7e3f818482471_master.jpg', 'Tay cầm IINE Split Pad Pro Elite Plus Joy-con cho Nintendo Switch - L736 có bán ở nShop là một giải pháp thay thế rất kinh tế cho tay Joy-con do Nintendo sản xuất. Nó không chỉ có thể wake up máy bằng nút HOME, có rung, có cảm ứng chuyển động để chiến gần như toàn bộ game Switch mà còn có tính năng Turbo lẫn Macro. Đặc biệt với bộ vỏ trong suốt, bạn hoàn toàn có thể chiêm ngưỡng vẻ đẹp lấp lánh của đèn RGB tích hợp bên trong.', 0, 0, 0),
(103, 'TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH - DRAGON BALL', 23, 4, 20, 500000, 780000, '2023-06-28 17:27:47', 1, 'https://product.hstatic.net/1000231532/product/m_controller_dragon_ball_cho_nintendo_switch_pc_chinh_hang_iine_gia_re_4be9b143bc2f4498aa48e3c99b1bf090_master.jpg', 'Tay cầm IINE Pro Controller cho Nintendo Switch - Dragon Ball (Bản mới) có bán ở nShop sở hữu một thiết kế siêu đẹp với tông màu xanh cam đặc trưng của Bảy viên ngọc rồng. Bên trong nó là hàng loạt tính năng hiện đại, mang lại sự tiện ích không nhỏ khi chơi game. Từ cảm ứng chuyển động, rung, NFC, đến wake up máy, turbo đều có. Kiểu dáng cầm rất vừa tay, chắc chắn, xứng đáng để bạn sử dụng mỗi khi chiến game trên Switch hoặc PC.\r\n\r\n', 0, 0, 0),
(104, 'TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH TRONG SUỐT VIỀN LED - L513', 23, 4, 20, 500000, 780000, '2023-06-28 17:27:47', 1, 'https://product.hstatic.net/1000231532/product/cam_iine_pro_controller_cho_nintendo_switch_trong_suot_vien_led_-_l513_4e89a5ec4c264d43b8e6c3d7bc9533c4_master.jpg', 'Tay cầm IINE Pro Controller cho Nintendo Switch trong suốt viền LED - L513 cho Nintendo Switch đang có bán tại nShop ngay lập tức gây ấn tượng bởi vẻ ngoài độc đáo của mình. Lớp vỏ trong suốt để lộ bo mạch, linh kiện bên trong nhìn rất thú vị. Đặc biệt nó còn có hệ thống đèn LED bố trí ở nhiều vị trí, tăng thêm phần rực rỡ. Chưa hết, bạn chỉnh kiểu sáng, chớp, và màu đèn cũng được luôn, vui mắt vô cùng.\r\n\r\n', 0, 0, 0),
(105, 'TAY CẦM DOBE ỐP LƯNG HAND GRIP MÁY NINTENDO SWITCH CÓ TÚI ĐỰNG - TNS-19252C1', 23, 4, 20, 500000, 6800000, '2023-06-28 17:29:08', 1, 'https://product.hstatic.net/1000231532/product/e_op_lung_hand_grip_may_nintendo_switch_co_tui_dung_tns-19252c1_gia_re_99d7d983dfcb4802b4988d97781ef4cb_master.jpg', 'Tay cầm DOBE ốp lưng hand grip máy Nintendo Switch có túi đựng - TNS-19252C1 có bán tại nShop là một bộ sản phẩm đầy đủ để bạn có trải nghiệm chơi game cầm tay tuyệt vời. Ngoài tay cầm chuyên dụng để chơi Switch ở chế độ handheld mode với sự thoải mái, thuận tay như cầm pro controller, bạn còn có thêm một túi đựng lớn để chứa tất cả mọi thứ, mang đi bất kỳ đâu.\r\n\r\n', 0, 0, 0),
(106, 'TAY CẦM PRO CONTROLLER IINE CAT MINI CHO NINTENDO SWITCH\r\n', 23, 4, 20, 0, 0, '2023-06-28 17:29:08', 1, 'https://product.hstatic.net/1000231532/product/mua_ban_pro_controller_iine_cat_mini_nintendo_switch_o_viet_nam_1d7b1019e26c441d8aa5ba8183a49408_master.jpg', 'Tay cầm Pro Controller IINE Cat Mini cho Nintendo Switch đang có bán tại nShop khá phù hợp với dáng tay của game thủ Châu Á, đặc biệt là các bạn nữ khi được thiết kế nhỏ hơn. Nó cũng sở hữu nhiều màu sắc tươi tắn rất bắt mắt và đặc biệt là kiểu dáng đáng yêu lấy cảm hứng từ những chú mèo với đôi tai lớn. Có mẫu còn được sơn màu theo ba Pokemon khởi đầu của Pokemon Sword & Shield đấy, bạn có nhận ra không?', 0, 0, 0),
(107, 'HORI D-PAD CONTROLLER (JOY-CON LEFT) CHO NINTENDO SWITCH - MARIO', 23, 4, 20, 500000, 750000, '2023-06-28 17:30:46', 1, 'https://product.hstatic.net/1000231532/product/ntendo_switch_mario_chinh_hang_4ac2ad6b0241449fb56974f9d8a30556_grande_3afa679076ef49d7baa484dd54211aa0_master.jpg', 'Tay HORI D-Pad Controller (Joy-con Left) cho Nintendo Switch đang có bán tại nShop là một giải pháp tuyệt vời cho những bạn thích sử dụng phím điều hướng chữ thập (D-Pad) kiểu truyền thống. Với nó, bạn sẽ chơi các game 2D, flatformer, gameplay retro cổ điển, đối kháng, hoặc di chuyển trên bản đồ chia ô (như các game chiến thuật theo lượt) thuận lợi hơn. Đây chính là điều còn thiếu ở Joy-con thông thường.\r\n\r\n', 0, 0, 0),
(108, 'TAY GAME THÙNG 8BITDO ARCADE STICK / FIGHT STICK CHO NINTENDO SWITCH, PC, SMARTPHONE', 23, 4, 20, 1200000, 1680000, '2023-06-28 17:30:46', 1, 'https://product.hstatic.net/1000231532/product/tay_cam_8bitdo_arcade_stick_fight_stick_nintendo_switch_pc_37e98f35db6a46fe8d69055da9ddee25_master.jpg', 'Bạn là một fan của thể loại song đấu, hành động, hay đơn giản là chưa thỏa mãn với những chiếc tay game cầm quá nhỏ bé, nhẹ nhàng bình thường. Vậy thì hãy chọn ngay 8Bitdo Arcade Stick / Fight Stick có bán tại nShop đi thôi. Phụ kiện điều khiển game mang phong cách máy game thùng này sẽ cho bạn tha hồ gạt cần, nhấp nút liên tục như ta vẫn chơi trong siêu thị, trung tâm thương mại đấy. Đánh như vậy mới đã đúng không nào.\r\n\r\n', 0, 0, 0),
(109, 'COVER ANALOG JOY-CON NINTENDO SWITCH PAWDIARY', 24, 4, 20, 100000, 150000, '2023-06-28 17:32:02', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_pawdiary_gengar_68a262817f2d4b43a1d23ae1872e0c32_master.jpg', 'Cover analog Joy-con Nintendo Switch Pawdiary có bán ở nShop là những bộ cover analog với các hình ảnh đáng yêu dễ thương như phô mai, thỏ, gấu, cừu, mèo v.v... độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.\r\n\r\nTHÔNG TIN COVER ANALOG JOY-CON NINTENDO SWITCH PAWDIARY\r\nGiúp phần cao su trên analog của Joy-Con không bị dơ, trầy xước hay ăn mòn qua quá trình sử dụng\r\nMột bộ gồm 4 cái\r\nTháo lắp dễ dàng\r\nChất liệu cao su êm ái cho tay\r\nTăng độ bám khi điều khiển cần analog\r\nLàm', 0, 0, 0),
(110, 'CASE SILICON JOY-CON NINTENDO SWITCH IINE - SPLATOON', 24, 4, 20, 120000, 180000, '2023-06-28 17:32:02', 1, 'https://product.hstatic.net/1000231532/product/6febad26eaaf48f7939079c1223373f3_69c38de249144f8dbf0640cdfb857ae0_master.jpg', 'Case Silicon Joy-Con Nintendo Switch IINE - Splatoon có bán ở nShop là một chiếc áo thời trang và bền chắc cho tay cầm của bạn. Chất liệu dẻo nên khi cầm rất êm tay, cũng như góp phần tăng độ bám khi chơi trong thời gian dài. Màu sắc sản phẩm tươi tắn, đường nét chuẩn đẹp. Có ốp silicon này, đỡ lo Joy-con bị bẩn, bị thấm mồ hôi nhiều như trước rồi.\r\n\r\n', 0, 0, 0),
(111, 'DÂY ĐEO WRIST-STRAP CHO JOY-CON NINTENDO SWITCH IINE - L575', 24, 4, 20, 120000, 180000, '2023-06-28 17:33:48', 1, 'https://product.hstatic.net/1000231532/product/day_deo_wrist-strap_cho_joy-con_nintendo_switch_iine_-_l575_444b10e4307743e49749b236f4830702_master.jpg', 'Bạn muốn dùng Joycon để chơi thành 2 người nhưng phím bấn SL-SR của Joy-con khá nhỏ gây bất tiện? Bạn sắm thêm các Joy-con của IINE và muốn mua thêm Wrist-Strap để sử dụng cho các Joy-con đó? Vậy thì chần chờ gì không trang bị thêm cặp Wrist-Strap cho Joy-con Nintendo Switch IINE - L575 có bán tại nShop nè!\r\n\r\n', 0, 0, 0),
(112, 'SET 6 COVER ANALOG JOY-CON DOBE 3 CỠ CHO NINTENDO SWITCH - TNS-877C\r\n', 24, 4, 20, 50000, 80000, '2023-06-28 17:33:48', 1, 'https://product.hstatic.net/1000231532/product/_ban_set_6_cover_analog_joy-con_dobe_3_co_cho_nintendo_switch_tns-877c_910fd2e0008d475486d8e11373257f14_master.jpg', 'Set 6 Cover Analog Joy-con DOBE 3 cỡ cho Nintendo Switch - TNS-877C bán ở nShop đặc biệt ở chỗ nó có 3 độ cao khác nhau. Nhờ đó, bạn có thể thay đổi cho phù hợp với từng game hoặc kiểu chơi mình thấy thoải mái nhất. Tất nhiên, nó cũng bảo vệ bề mặt cần analog của bạn (nơi hay tiếp xúc nhất) không bị bụi bẩn, ăn mòn do mồ hôi, trầy sước...', 0, 0, 0),
(113, 'VỎ THAY THẾ JOY-CON CỦA NINTENDO SWITCH (NHIỀU MÀU)', 24, 4, 20, 500000, 690000, '2023-06-28 17:35:32', 1, 'https://product.hstatic.net/1000231532/product/mua_ban_vo_thay_the_joy_con_nintendo_switch_gia_re_d6b00e31e0f049a78d872a80d69bddf1_master.jpg', 'Bạn lỡ làm tổn hại bề ngoài của cặp tay cầm Joy-con yêu quý (trầy sước, dơ cũ, nứt bể..), hoặc đơn giản là một con người yêu cái đẹp, bạn muốn Joy-con của mình trở nên lung linh hơn, khác biệt hơn? Vậy thì đã có ngay Vỏ thay thế Joy-Con của Nintendo Switch tại nShop đây. Với nhiều màu sắc khác nhau, bạn tha hồ lựa chọn chiếc áo mới cho tay cầm của mình. Đảm bảo, sau khi hoàn thành, máy Switch của bạn sẽ vô cùng nổi bật, ấn tượng. ', 0, 0, 0),
(114, '8BITDO WIRELESS USB ADAPTER HỖ TRỢ TAY PS4, PS5 TRÊN NINTENDO SWITCH', 24, 4, 20, 350000, 480000, '2023-06-28 17:35:32', 1, 'https://product.hstatic.net/1000231532/product/usb_8bitdo_195077b7195544c1b1b3482e0109bfbe_grande_a4c19f7b0bf14da49152bfb20fbf3ac2_master.jpg', 'Muốn chơi thêm tay cầm trên Nintendo Switch nhưng nhà bạn đã có tay cầm PS4, PS5 thì tại sao phải mua thêm một bộ Joycon hay Pro Controller? Sản phẩm 8BitDo Wireless USB Adapter chính là câu trả lời cho vấn đề trên!', 0, 0, 0),
(115, 'TAY LÁI DOBE CHO TAY CẦM JOY-CON NINTENDO SWITCH CHÍNH HÃNG', 24, 4, 20, 150000, 200000, '2023-06-28 17:36:57', 1, 'https://product.hstatic.net/1000231532/product/tay_lai_switch_1_grande_a15df8cbb3ef49cea208a4bfe908cbee_master.jpg', 'Tay lái cho Joy-con Nintendo Switch là sản phẩm phụ kiện không thể thiếu dành cho những ai đam mê thể loại game đua xe trên Nintendo Switch. Nó tạo ra cảm giác chân thật đến tuyệt vời khi kết hợp với tính năng cảm biến chuyển động có trong tay cầm Joycon của Switch.', 0, 0, 0),
(116, 'ANALOG COVER CHO TAY CẦM DUALSHOCK 4 PS4, PS5, XBOX & PRO CONTROLLER NINTENDO SWITCH', 24, 4, 20, 6000, 10000, '2023-06-28 17:36:57', 1, 'https://product.hstatic.net/1000231532/product/analog_cover_dualshock_4_ps4___pro_controller_switch_137b12d061c3477cb2766b4f92d7749b_master.jpg', 'Analog cover cho tay cầm Dualshock 4 PS4, PS5, Xbox & Pro Controller Nintendo Switch có bán tại nShop giúp bạn trang trí ngay chiếc tay cầm máy chơi game , giảm hao mòn bề mặt của analog trong quá trình sử dụng, tăng độ bám tay khi chơi game. ', 0, 0, 0),
(117, 'DÁN CƯỜNG LỰC IINE BẢO VỆ MÀN HÌNH NINTENDO SWITCH OLED', 25, 4, 20, 200000, 250000, '2023-06-28 17:38:11', 1, 'https://product.hstatic.net/1000231532/product/dan_cuong_luc_iine_bao_ve_man_hinh_nintendo_switch_oled_d65c10e507064c00a9dc160df98701f0_master.jpg', 'Dán màn hình là việc hầu như game thủ Nintendo Switch OLED nào cũng thực hiện khi mới mua máy, hoặc thay mới sau một khoảng thời gian sử dụng. Với miếng dán cường lực IINE bảo vệ màn hình Nintendo Switch OLED có bán ở nShop, bạn sẽ có được trang bị tuyệt vời cho màn hình cảm ứng nhạy cảm trên chiếc máy game của mình.\r\n\r\nCÓ NÊN DÁN MÀN HÌNH CƯỜNG LỰC CHO MÁY NINTENDO SWITCH OLED KHÔNG?\r\nKhi mua máy chơi game có cảm ứng như Nintendo Switch thì khách hàng thường phân vân giữa vấn đề có nên dán màn ', 0, 0, 0),
(118, 'MIẾNG DÁN CƯỜNG LỰC DOBE CHO NINTENDO SWITCH OLED', 25, 4, 20, 200000, 250000, '2023-06-28 17:38:11', 1, 'https://product.hstatic.net/1000231532/product/ban_mieng_dan_cuong_luc_dobe_cho_nintendo_switch_oled_nhap_khau_gia_re_977163914b2e4c7d9f17728c927c3061_master.jpg', 'Miếng dán cường lực DOBE cho Nintendo Switch OLED có bán tại nShop là một phụ kiện không thể thiếu trong quá trình sử dụng máy. Nó sẽ bảo vệ bề mặt màn hình của Nintendo OLED khỏi những tác động xấu như va đập trầy xước mà vẫn đảm bảo độ trong suốt, chân thực cho hình ảnh và không gây ảnh hưởng đến khả năng cảm ứng của máy.', 0, 0, 0),
(119, 'TÚI ĐỰNG MÁY NINTENDO SWITCH HÌNH SUPER MARIO PU 3D', 26, 4, 20, 350000, 420000, '2023-06-28 17:39:41', 1, 'https://product.hstatic.net/1000231532/product/mua_tui_dung_nintendo_switch_hinh_super_mario_bd11aa5ad80941fc97e82b6ec60efb67_master.jpg', 'Túi đựng máy Nintendo Switch hình Super Mario PU 3D đang có bán tại nShop sẽ mang lại sự an tâm cho bạn mỗi khi ra ngoài cùng máy Switch của mình. Sản phẩm không những được thiết kế đẹp mắt với nhiều kiểu hình ảnh Super Mario, mà còn rất tiện lợi với phần chứa băng game Switch bên trong (khác nhau tùy mẫu). Hãy lựa chọn mẫu bạn thích thôi nào.\r\n\r\nTHÔNG TIN TÚI ĐỰNG MÁY NINTENDO SWITCH HÌNH SUPER MARIO PU 3D\r\nTúi đựng chống sốc với lớp ngoài cứng chắc và bên trong mềm mại.\r\nThiết kế đẹp mắt với c', 0, 0, 0),
(120, 'BÓP ĐỰNG NINTENDO SWITCH - SHEIKAH SLATE ZELDA BREATH OF THE WILD', 26, 4, 20, 300000, 380000, '2023-06-28 17:39:41', 1, 'https://product.hstatic.net/1000231532/product/n_game_bop_dung_nintendo_switch_sheikah_slate_zelda_breath_of_the_wild_35a90dc4cd834fe8b49f1902537017c7_master.jpg', 'Đem máy Nintendo Switch cùng bạn đi khắp nơi, chẳng ngại gì cùng chiếc Bóp đựng Nintendo Sheikah Slate hầm hố đang có bán tại cửa hàng nShop. Mẫu túi này được tạo hình theo thiết bị Sheikah Slate trong game The Legend of Zelda: Breath of the Wild với lớp vỏ ngoài là các họa tiết bằng cao su nổi rất đẹp mắt. Nếu bạn là fan của trò chơi này thì lại càng có lý do để sở hữu nó.\r\n\r\n', 0, 0, 0),
(121, 'CASE ỐP TRONG SUỐT DOBE CÓ GRIP CHO NINTENDO SWITCH OLED - TNS-1173\r\n', 26, 4, 20, 150000, 220000, '2023-06-28 17:42:04', 1, 'https://product.hstatic.net/1000231532/product/case_op_trong_suot_dobe_co_grip__nintendo_switch_oled_tns-1173_929c56a2e1c946a18b0be226f4335864_master.jpg', 'Case ốp trong suốt DOBE có grip cho Nintendo Switch OLED - TNS-1173 bán ở nShop là phiên bản mới nên có sự cải tiến ở phần ốp Joy-con. Thay vì phẳng lì như các kiểu case trong cũ, phần case Joy-con của sản phẩm này có grip nhô ra phía sau. Nó giúp bạn cầm chắc tay hơn và cũng thoải mái hơn khi chơi.\r\n\r\nỐp lưng của thân máy có chừa chỗ để dùng chân đế của Switch OLED như bình thường. Thiết kế 3 phần tách biệt nên bạn có thể tháo Joy-con ra khỏi thân máy để chơi nhanh chóng. Hãy bảo vệ máy Switch ', 0, 0, 0),
(122, 'ỐP THÂN MÁY IINE TRONG SUỐT CHO SWITCH OLED KÈM CASE JOY-CON', 26, 4, 20, 250000, 320000, '2023-06-28 17:42:04', 1, 'https://product.hstatic.net/1000231532/product/op_than_may_trong_suot_cho_switch_oled_kem_case_joy-con_clear_b018186bd1284251bddd4b562bcb7ddb_master.jpg', 'Ốp thân máy IINE trong suốt cho Switch OLED kèm Case Joy-con có bán tại nShop là lựa chọn dành cho những bạn muốn bảo vệ tối đa mặt lưng máy và Joy-con khỏi trầy xước, va đập nhẹ. Case Joy-con đi kèm màu Neon Xanh Đỏ đặc trưng của Nintendo Switch. Mặt ốp lưng trong suốt nên bạn hoàn toàn có thể để lộ các họa tiết, hoa văn đẹp mắt của các phiên bản máy đặc biệt. Nếu thích, bạn cũng có thể tự do trang trí theo ý thích như dán thêm sticker, decal... lên ốp cho thêm phần cá tính.', 0, 0, 0),
(123, 'TÚI ĐEO CHÉO MINI HÌNH TAY CẦM GAME SNES\r\n', 26, 4, 20, 350000, 480000, '2023-06-28 17:43:25', 1, 'https://product.hstatic.net/1000231532/product/tui_deo_cheo_mini_hinh_tay_cam_game_snes_fda345efb8144a368e97ba58a5800c3c_master.jpg', 'Túi đeo chéo mini hình tay cầm game SNES có bán tại nShop với tạo hình như chiếc tay cầm SNES retro cổ điển, có kích thước nhỏ gọn, giúp bạn có thể đựng các vật dụng thường xuyên mang theo bên mình như Nintendo Switch Lite, điện thoại, chìa khóa, airpod, thẻ ngân hàng...  thích hợp cho cả nam và nữ sử dụng đi chơi, hằng ngày một cách tiện dụng nhất. ', 0, 0, 0),
(124, 'CASE ỐP IN HÌNH BẢO VỆ NINTENDO SWITCH OLED TẶNG KÈM BẢO VỆ JOY-CON', 26, 4, 20, 200000, 280000, '2023-06-28 17:43:25', 1, 'https://product.hstatic.net/1000231532/product/_hinh_bao_ve_nintendo_switch_oled_tang_kem_bao_ve_joy-con_gan_vua_dock_9d5d49217a254279b51846991e21b181_master.jpg', 'Chiếc máy Nintendo Switch OLED của bạn không những được bảo vệ tốt mà còn trở nên đẹp hơn nhờ các bộ case ốp hình ảnh có bán tại cửa hàng nShop. Hãy trang trí cho máy game quý giá của bạn với những hình ảnh đẹp từ các game mình yêu thích.', 0, 0, 0),
(125, 'SKIN DÁN IN HÌNH CHO NINTENDO SWITCH OLED', 26, 4, 20, 120000, 180000, '2023-06-28 17:44:53', 1, 'https://product.hstatic.net/1000231532/product/skin_dan_in_hinh_cho_nintendo_switch_oled_653eebaddd924903be81975e20dda6ee_master.jpg', 'Hãy làm cho máy Nintendo Switch OLED của bạn đẹp hơn, phong cách hơn cùng bộ Skin dán in hình cho Nintendo Switch OLED có bán tại nShop. Khi mua trực tiếp tại cửa hàng, bạn sẽ được nhân viên nShop dán giúp để tránh bị dán lệch và bong bóng bụi bên trong nữa đó. Hàng chục mẫu skin đang chờ bạn lựa chọn, liên hệ ngay với để chọn mẫu nhé!. ', 0, 0, 0),
(126, 'ỐP LƯNG MÁY NINTENDO SWITCH OLED KÈM CASE JOY-CON DRAGON BALL IINE - 7 VIÊN NGỌC RỒNG', 26, 4, 20, 300000, 380000, '2023-06-28 17:44:53', 1, 'https://product.hstatic.net/1000231532/product/g_may_switch_oled_kem_case_joy-con_dragon_ball_iine_-_7_vien_ngoc_rong_797eb05e7a9a4c9da5866e2343825049_master.jpg', 'Ốp lưng máy Nintendo Switch OLED kèm case Joy-con Dragon Ball - 7 Viên Ngọc Rồng là một sản phẩm rất được yêu thích tại nShop. Nó tuy đơn giản nhưng có thể bảo vệ hiệu quả máy Switch của bạn khỏi trầy xước do vô tình va chạm trong quá trình sử dụng. Bên cạnh đó, phần ốp Joy-con làm bằng chất liệu silicon dẻo mềm mại, giúp bạn thoải mái khi cầm nắm.', 0, 0, 0),
(127, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - ZELDA\r\n', 27, 4, 20, 200000, 250000, '2023-06-28 17:46:30', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_game_nintendo_switch_16_ngan_iine_zelda_738f32fd563841fc9b9c564978b35235_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Zelda có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với các biểu tượng từ ', 0, 0, 0),
(128, 'CHÂN ĐỨNG DÀNH CHO HỘP BĂNG GAME NINTENDO SWITCH\r\n', 27, 4, 20, 120000, 180000, '2023-06-28 17:46:30', 1, 'https://product.hstatic.net/1000231532/product/upload_a251111657a64f3f9521b676e776f56c_master.jpg', 'Bạn là game thủ yêu thích mua và sưu tập game Nintendo Switch nhưng quá nhiều băng game  thay vì để chồng chất lên nhau hoặc sắp dựng nghiên ngả thì giờ đây đã có sản phẩm Chân đứng hộp băng Nintendo Switch là phụ kiện bổ trợ tuyệt vời nhất.', 0, 0, 0),
(129, 'HỘP ĐỰNG BĂNG NINTENDO SWITCH IN HÌNH GAME', 27, 4, 20, 200000, 250000, '2023-06-28 17:48:04', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_nintendo_switch_in_hinh_super_mario_bros._master.jpg', 'Ngoài hộp đựng băng game Nintendo Switch dạng đơn giản, tối giản, và hộp Logo đúc nổi, nShop còn có thêm dạng hộp in hình bên ngoài rất đẹp mắt. Trên nắp hộp đựng băng loại này là hình ảnh của các tựa game, nhân vật nổi tiếng như Mario, Pokemon, Zelda, Monster Hunter, Splatoon... tha hồ cho bạn chọn lựa theo ý thích của mình. Mỗi hộp có thể chứa được 12 băng Nintendo Switch và 12 thẻ microSD, nhỏ gọn và tiện lợi mang theo bên mình, đổi game chơi nhanh chóng.', 0, 0, 0),
(130, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - VEGITO', 27, 4, 20, 200000, 250000, '2023-06-28 17:48:04', 1, 'https://product.hstatic.net/1000231532/product/d06e3ba6c456446387d117273f88d34d_49b446ba48c1426babb34f1903b4923e_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Vegito có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với hình ảnh Vegito t', 0, 0, 0),
(131, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - SPLATOON', 27, 4, 20, 200000, 250000, '2023-06-28 17:49:22', 1, 'https://product.hstatic.net/1000231532/product/612afe0e67074f46a25b6834f5c867c7_5f49c79f841f4314a41c05a372e67bdb_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Splatoon có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với hình ảnh họa ti', 0, 0, 0),
(132, 'KỆ GAME VÀ ĐẾ DỰNG TAY CẦM TREO TƯỜNG DOBE CHO PS5 SWITCH XBOX - TP5-1543', 27, 4, 20, 200000, 260000, '2023-06-28 17:49:22', 1, 'https://product.hstatic.net/1000231532/product/ke_game_de_dung_tay_cam_treo_tuong_dobe_ps5_switch_xbox_tp5-1543_4ca139833a974cb9832a2421150eb403_master.jpg', 'Kệ game và đế dựng tay cầm treo tường DOBE cho PS5 Switch Xbox - TP5-1543 có bán ở nShop sẽ giúp góc chơi game của bạn trở nên gọn đẹp và phong cách, đặc biệt là với các phòng game có mảng tường lớn, TV treo tường... Bộ sản phẩm thiết kế đơn giản mà hiệu quả. Các phụ kiện trong bộ cũng có thể tách riêng để dùng và sắp xếp tùy ý.\r\n\r\n', 0, 0, 0),
(133, 'HỘP ĐỰNG BĂNG GAME THAY THẾ CHO NINTENDO SWITCH', 27, 4, 20, 60000, 100000, '2023-06-28 17:50:49', 1, 'https://product.hstatic.net/1000231532/product/hop_game_thay_the_nintendo_switch_grande_00d857645986498da721d3badb889cab_master.jpg', 'Đối với những game thủ thích sưu tập thì việc mua băng game vật lý vẫn thích hơn cả. Tuy nhiên, đôi lúc bạn sẽ gặp phải một số vấn đề chẳng may như hộp game gốc để lâu bị cũ, dơ chùi không sạch, hay nghiêm trọng hơn là vỡ, rách, hoặc mất hộp. Điều này khiến bộ sưu tập của bạn không còn được hoàn hảo. Đó là lúc bạn cần đến biện pháp cứu nguy Hộp đựng băng game thay thế cho Nintendo Switch đang có bán tại nShop. Đây cũng là một giải pháp tuyệt vời cho các game chỉ bán digital, không phát hành vật ', 0, 0, 0),
(134, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - MARIO\r\n', 27, 4, 20, 200000, 250000, '2023-06-28 17:50:49', 1, 'https://product.hstatic.net/1000231532/product/d5358334bee24844974744a4c9facf7a_3c0535c7788747f989a9914b1a0f0089_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Mario có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với hình ảnh trang phụ', 0, 0, 0),
(135, 'CỔNG KẾT NỐI DÂY MẠNG LAN ADAPTER CHO NINTENDO SWITCH', 28, 4, 20, 300000, 400000, '2023-06-28 17:52:22', 1, 'https://product.hstatic.net/1000231532/product/lan_adapter_switch_1_grande_fe9dd36f9b894a9f97fe056af7c3b0f8_master.jpg', 'Bạn chơi game online bằng wifi trên máy Nintendo Switch hay bị lag, mất kết nối do sóng wifi yếu, không ổn định. Hoặc không chơi game Switch online được do nhà không có sóng wifi? Vậy đây là sản phẩm dành cho bạn. Tham khảo qua bài Review của nShop về Lan Adapter bạn sẽ thấy không phí chút nào tiền cho sản phẩm vô cùng hữu ích này nhé!\r\n\r\nThông Tin Sản Phẩm LAN adapter cho Nintendo Switch\r\n\r\nLAN adapter giúp bạn có thể kết nối dây mạng (RJ-45) với máy chơi game Nintendo Switch của mình thông qua', 0, 0, 0),
(136, 'PHÍCH CẮM CHUYỂN ĐỔI 3 CHẤU SANG 2 CHẤU\r\n', 28, 4, 20, 12000, 20000, '2023-06-28 17:52:22', 1, 'https://product.hstatic.net/1000231532/product/phich_cam_chuyen_doi_3_chau_sang_2_chau_af3a9baafffa490d89af0e42bad5f113_master.jpg', 'Thiết bị phích Cắm Chuyển Đổi 3 Chấu Sang 2 Chấu nhỏ nhưng vô cùng hữu ích, bạn sẽ có ngay 1 ổ cắm 3 chân tiêu chuẩn, phù hợp với nhiều loại phích cắm, rất tiện dụng cho các thiết bị sử dụng trong gia đình, văn phòng, du lịch.', 0, 0, 0),
(137, 'ĐẾ SẠC JOY-CON IINE KIÊM ĐÈN NGỦ CHO NINTENDO SWITCH', 28, 4, 20, 300000, 380000, '2023-06-28 17:56:00', 1, 'https://product.hstatic.net/1000231532/product/de_sac_joy-con_iine_den_ngu_nintendo_switch_b25835aee9944217af959437f02ff82b_master.jpg', 'https://product.hstatic.net/1000231532/product/de_sac_joy-con_iine_den_ngu_nintendo_switch_b25835aee9944217af959437f02ff82b_master.jpg', 0, 0, 0),
(138, 'ĐẾ SẠC JOY-CON MỞ RỘNG GẮN DOCK NINTENDO SWITCH OLED DOBE - ĐEN TRẮNG - TNS-0122B\r\n', 28, 4, 20, 250000, 300000, '2023-06-28 17:56:00', 1, 'https://product.hstatic.net/1000231532/product/_joy-con_mo_rong_gan_dock_nintendo_switch_oled_dobe_den_trang_tns-0122_38d5a9f5f8f540f1a2cf66c0faf9124e_master.jpg', 'Đế sạc Joy-con mở rộng gắn Dock Nintendo Switch OLED DOBE TNS-0122B có bán ở nShop nhỏ bé nhưng hiệu quả lớn. Nó sẽ lập tức giúp chiếc Dock của bạn hữu dụng hơn khi tăng thêm các cổng sạc Joy-con. Nhờ thiết kế tinh tế, bạn có thể sạc cùng lúc 6 Joy-con khi sử dụng phụ kiện này (2 tay gắn thân máy và 4 tay gắn đế sạc).\r\n\r\n ', 0, 0, 0),
(139, 'CONVERTER CHUYỂN USB-C SANG HDMI, USB3.0, USB-C - BROWN BEAR', 28, 4, 20, 450000, 520000, '2023-06-28 17:57:32', 1, 'https://product.hstatic.net/1000231532/product/d2696d2b62f1486f897d6d677380ef7b_e560abe292074ae8a4aa27f1c0db19a0_master.jpg', 'https://product.hstatic.net/1000231532/product/d2696d2b62f1486f897d6d677380ef7b_e560abe292074ae8a4aa27f1c0db19a0_master.jpg', 0, 0, 0),
(140, 'CỐC SẠC NHANH 45W KÈM CÁP TYPE-C TO C 1.2M CHO NINTENDO SWITCH - DOBE ITNS-2111\r\n', 28, 4, 20, 350000, 450000, '2023-06-28 17:57:32', 1, 'https://product.hstatic.net/1000231532/product/cuc_sac_type-c_cho_dien_thoai_samsung_ho_tro_vua_sac_vua_choi_f26ad463d8be414a83aeb4719c88da9b_master.jpg', 'Cốc sạc nhanh 45w kèm cáp Type-C to C 1.2m - DOBE iTNS-2111 đang bán ở nShop là cốc sạc kích thước nhỏ gọn, cáp sạc có thể tháo rời, giúp bạn dễ dàng mang theo bất cứ lúc nào. Với tính năng sạc thông minh, bạn có thể nhanh chóng sạc đầy máy Nintendo Switch hoặc cả những thiết bị khác sử dụng cổng Type C với cáp đi kèm', 0, 0, 0),
(141, 'DOCK MINI XUẤT TV KIÊM SẠC CHO NINTENDO SWITCH IINE\r\n', 28, 4, 20, 700000, 950000, '2023-06-28 17:59:51', 1, 'https://product.hstatic.net/1000231532/product/dock_mini_xuat_tv_kiem_sac_nintendo_switch_iine_88ad7bf009114d1cbb875625ad528aaf_master.jpg', 'Bạn nghĩ dùng Dock Mini đã là cách gọn nhẹ nhất để chơi Switch trên TV? Không đâu, còn có một giải pháp khác ấn tượng hơn nhiều là Dock Mini xuất TV kiêm sạc cho Nintendo Switch IINE có bán ở nShop. Nếu ở các loại Dock Mini hay bộ chuyển đổi hình ảnh khác, bạn phải gắn thêm nguồn sạc và dây HDMI rườm rà, thì ở sản phẩm này, bạn chỉ cần thêm dây HDMI là đủ. Bởi lẽ nó được thiết kế y như một cục sạc và cắm thẳng vào ổ điện, cực kỳ tiết kiệm không gian.\r\n\r\n', 0, 0, 0),
(142, 'ĐẾ SẠC TAY CẦM JOY-CON NINTENDO SWITCH - HỖ TRỢ SẠC NHIỀU TAY CẦM', 28, 4, 20, 250000, 300000, '2023-06-28 17:59:51', 1, 'https://product.hstatic.net/1000231532/product/joy-con_charging_dock_nintendo_switch_dobe_ea8f0cbb92434895a86e6121012fb85e_master.jpg', 'Đế sạc tay cầm Joy-con Nintendo Switch có bán tại nShop sẽ hỗ trợ sạc tối đa 4 tay cầm Joy-con cùng lúc vô cùng tiện dụng. Thiết kế với thanh ray nhựa trong suốt kèm đèn LED báo tình trạng sạc, Joy-con gắn theo chiều thẳng đứng nên cực kì gọn gàng, đẹp mắt, tinh tế.', 0, 0, 0),
(143, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 400GB NINTENDO VERSION CHO NINTENDO SWITCH', 29, 4, 20, 2200000, 2690000, '2023-06-28 18:02:43', 1, 'https://product.hstatic.net/1000231532/product/the_nho_sandisk_microsd_400gb_nintendo_version_ee81ed8ec8ed4d61a10d7515f0320bee_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 400GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\nTHÔNG TIN THẺ NHỚ SANDISK MICROSDXC UHS-I 400GB NINTENDO VERSION CHO NINTENDO SWITCH\r\nThẻ nhớ chính hãng SanDisk MicroSDXC UHS', 0, 0, 0),
(144, 'ĐẦU ĐỌC THẺ NHỚ USB 2.0\r\n', 29, 4, 20, 40000, 60000, '2023-06-28 18:02:43', 1, 'https://product.hstatic.net/1000231532/product/dau_doc_the_nho_usb_2.0_gia_re_da_nang_1968fb8ffdc14b04b8f953053bf7bd7a_master.jpg', 'Đầu đọc thẻ nhớ đa năng dành cho máy chơi game bán tại nShop có kết nối USB 2.0 cho tốc độ truyền tải nhanh. Thiết kết bền chắc nhưng vẫn có sự nhỏ gọn mang lại sự tiện lợi cho khách hàng. \r\n\r\n', 0, 0, 0),
(145, 'THẺ NHỚ MICROSDXC CLASS 10 - 256GB DÀNH CHO NINTENDO SWITCH', 29, 4, 20, 700000, 990000, '2023-06-28 18:05:03', 1, 'https://product.hstatic.net/1000231532/product/microsdxc_256_gb_samsung_evo_plus_grande_1dffa0fbd1a1497f837ece40856554a3_master.jpg', 'Thẻ microSDXC 256GB chính hãng Samsung là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, Samsung Evo Plus microSDXC 256GB U3 mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà.', 0, 0, 0),
(146, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 256GB (NINTENDO VERSION) CHO NINTENDO SWITCH', 29, 4, 20, 1200000, 1590000, '2023-06-28 18:05:03', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_256gb_nintendo_switch_befa1b117ee44c3ebad0fbdfc34266ed_grande_2e872fdf673b483e801b4941d2566ffb_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 256GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\n ', 0, 0, 0),
(147, 'THẺ NHỚ MICROSDXC CLASS 10 - 512GB DÀNH CHO NINTENDO SWITCH', 29, 4, 20, 1200000, 1690000, '2023-06-28 18:08:47', 1, 'https://product.hstatic.net/1000231532/product/the_nho_microsdxc_class_10_512gb_nintendo_switch_d02b85a19f914b02a0090d73a22b2e7a_master.jpg', 'Thẻ microSDXC 512GB chính hãng Samsung là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, Samsung Evo Plus microSDXC 256GB U3 mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà.', 0, 0, 0),
(148, 'ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 READER HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO', 29, 4, 20, 200000, 260000, '2023-06-28 18:08:47', 1, 'https://product.hstatic.net/1000231532/product/transcend-usb-card-reader1-800x800_master.jpg', 'THÔNG TIN VỀ ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO\r\nĐầu đọc thẻ đa năng thương hiệu Transcend\r\nDạng thanh nhỏ gọn, dễ sử dụng và mang theo bên người khi đi xa.\r\nHỗ trợ nhiều loại thẻ: SDHC (UHS-I), SDXC (UHS-I), microSD, microSDHC (UHS-I), và microSDXC (UHS-I)\r\nCó đèn LED báo hiệu trạng thái hoạt động\r\nChuẩn kết nối USB 3.0 tốc độ cao (lên đến 86,2 MB/giây) chép game và dữ liệu nhanh chóng.\r\nKết nối trực tiếp qua cổng USB', 0, 0, 0),
(149, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 512GB NINTENDO VERSION CHO NINTENDO SWITCH\r\n', 29, 4, 20, 2500000, 3190000, '2023-06-28 18:12:09', 1, 'https://product.hstatic.net/1000231532/product/ddc7635ac16e4c76b3540f230ccda4f6_ca0b7e49805041c7abb8d0950aad3b51_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 512GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, In họa tiết Animal Crossing cực đẹp dành cho fan game mua sưu tập, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\n', 0, 0, 0),
(150, 'Thẻ nhớ MicroSDXC UHS-I 512GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, I', 29, 4, 20, 590000, 890000, '2023-06-28 18:12:09', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_128gb_nintendo_switch_a5727dfe44364bb6b5220bf0dcfe4a01_grande_800cb4f7ede749b4a602ca44f248f173_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 128GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.', 0, 0, 0),
(151, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER SPLATOON 3 EDITION\r\n', 30, 4, 20, 1500000, 2000000, '2023-06-28 18:14:06', 1, 'https://product.hstatic.net/1000231532/product/tay_cam_nintendo_switch_pro_controller_splatoon_3_edition_6e179c68868c4dc08d38b15b900fa319_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Splatoon 3 Edition bán ở nShop không những chất mà còn đẹp! Phần giữa tông đen, ẩn hiện những hoa văn Splatoon 3 một cách độc đáo. Hai phần grip cầm màu lam, xanh vàng nổi bật. Sản phẩm chắc chắc sẽ khiến các fan Splatoon lẫn non-fan mê mẩn. Tay Pro Controller là một lựa chọn tuyệt vời nhất để chiến game trên Nintendo Switch, Nintendo Switch Lite và cả trên PC.\r\n\r\nTHÔNG TIN TAY CẦM NINTENDO SWITCH PRO CONTROLLER SPLATOON 3 EDITION\r\nTay cầm Pro Controller ki', 0, 0, 0),
(152, 'BAO ĐỰNG MÁY NINTENDO SWITCH LITE PROTECTIVE AIRFORM POUCH EEVEE / PIKACHU\r\n', 30, 4, 20, 250000, 320000, '2023-06-28 18:14:06', 1, 'https://product.hstatic.net/1000231532/product/o_dung_may_nintendo_switch_lite_protective_airform_pouch_eevee_pikachu_5e371cf7baa04ea4ba1c77136a1e7b45_master.jpg', 'Bao đựng máy Nintendo Switch Lite Protective Airform Pouch Eevee / Pikachu đang có bán tại nShop không chỉ là một chiếc túi đựng máy siêu đẹp cho fan Pokemon, nó còn đi kèm các phụ kiện nhỏ vô cùng hữu dụng. Bạn sẽ có ngay một đế dựng máy hình Pikachu hoặc Eevee cực kỳ dễ thương tương ứng với mẫu túi mình mua. Và còn nữa nhé, hai chiếc cover analog nhỏ nhỏ xinh xinh hình đuôi hai chú Pokemon đáng yêu này cũng là của bạn luôn đấy. Một combo thật tuyệt đúng không nào.\r\n\r\n', 0, 0, 0),
(153, 'TAY CẦM DOBE KHÔNG DÂY CÓ NẮP ANALOG THAY THẾ CHO NINTENDO SWITCH - TNS-1126\r\n', 30, 4, 20, 300000, 390000, '2023-06-28 18:17:29', 1, 'https://product.hstatic.net/1000231532/product/e_khong_day_co_nap_analog_thay_the_cho_nintendo_switch_tns-1126_gia_re_d48e0d4ee0764f78922b9b1e4a10c614_master.jpg', 'Tay cầm DOBE không dây có nắp analog thay thế cho Nintendo Switch - TNS-1126 có bán tại nShop ngoài những tính năng cần thiết của một chiếc pro controller thì còn một điểm rất đặc biệt. Đó chính là bộ nắp analog đi kèm, cho bạn khả năng thay đổi độ cao của cần analog theo ý thích cực kỳ nhanh chóng, tiện lợi. Cảm thấy điều khiển kiểu nào dễ chịu nhất thì đổi liền sang kiểu đó.', 0, 0, 0),
(154, 'TAY CẦM IINE PRO CONTROLLER ANIMAL CHO NINTENDO SWITCH - SIBERIAN HUSKY', 30, 4, 20, 500000, 780000, '2023-06-28 18:17:29', 1, 'https://product.hstatic.net/1000231532/product/tay_cam_iine_pro_controller_animal_nintendo_switch_siberian_husky_155d0932f1134116977a165f50c65fa3_master.jpg', 'Tay cầm IINE Pro Controller Animal cho Nintendo Switch - Siberian Husky có bán ở nShop là sản phẩm độc đáo của IINE khi kết hợp tay bấm game với hình ảnh động vật. Bên cạnh vẻ dễ thương, chiếc tay cầm này sở hữu hàng loạt tính năng hiện đại, mở rộng trải nghiệm và sự tiện lợi cho game thủ Nintendo Switch. Từ cảm ứng chuyển động, rung, NFC, đến wake up máy, turbo, macro đều có. Đẹp lạ mà chất, chọn ngay tay cầm IINE Pro Controller Animal cho Nintendo Switch nào.', 0, 0, 0),
(155, 'COVER ANALOG JOY-CON NINTENDO SWITCH IINE - ANIMAL CROSSING L387\r\n', 30, 4, 20, 70000, 120000, '2023-06-28 18:19:24', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_iine_animal_crossing_l387_d57a1809c2044720b4bf57e897be22a7_master.jpg', 'Cover analog Joy-con Nintendo Switch IINE - Animal Crossing L387 có bán ở nShop là phụ kiện cực kỳ cần thiết với các game thủ. Nó sẽ bảo vệ bề mặt cần analog của bạn (nơi hay tiếp xúc nhất) không bị bụi bẩn, ăn mòn do mồ hôi, trầy sước... Không chỉ vậy, bạn còn tha hồ làm đẹp, trang trí cho máy với các màu khác nhau rất đẹp mắt.', 0, 0, 0),
(156, 'GIÁ ĐỠ KẸP ĐIỆN THOẠI CHO TAY CẦM 8BITDO PRO 2 GAMEPAD', 30, 4, 20, 120000, 180000, '2023-06-28 18:19:24', 1, 'https://product.hstatic.net/1000231532/product/hop_phu_kien_ban_gia_do_kep_din_thoai_cho_tay_cam_8bitdo_pro_2_gamepad_ad6f0e84e7e34f75b0a985d6c45cccd2_master.jpg', 'Giá đỡ kẹp điện thoại cho tay cầm 8BitDo Pro 2 Gamepad có bán ở nShop sẽ giúp quá trình chơi game di động của bạn thêm sung sướng. Được thiết kế chuyên biệt cho tay cầm 8BitDo Pro 2 Gamepad, chiếc giá đỡ này sở hữu kiểu dáng hiện đại, trọng lượng nhẹ mà rất vững chắc. Phần ngàm gắn điện thoại có thể co giãn để phù hợp với nhiều mẫu điện thoại khác nhau trên thị trường. Bạn cũng có thể điều chỉnh độ nghiêng của giá đỡ sao cho tầm nhìn thoải mái nhất.\r\n\r\n', 0, 0, 0),
(157, 'COVER ANALOG JOY-CON NINTENDO SWITCH IINE - CHÂN MÈO L422', 30, 4, 20, 70000, 120000, '2023-06-28 18:21:02', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_iine_chan_meo_l422_006963aa0a2642ce8a8c4a314d87676f_master.jpg', 'Cover analog Joy-con Nintendo Switch IINE - Chân Mèo L422 có bán ở nShop là phụ kiện cực kỳ cần thiết với các game thủ. Nó sẽ bảo vệ bề mặt cần analog của bạn (nơi hay tiếp xúc nhất) không bị bụi bẩn, ăn mòn do mồ hôi, trầy sước... Không chỉ vậy, bạn còn tha hồ làm đẹp, trang trí cho máy với các màu khác nhau rất đẹp mắt.', 0, 0, 0),
(158, 'TAY CẦM IINE PRO CONTROLLER ANIMAL CHO NINTENDO SWITCH - BERNESE MOUNTAIN DOG', 30, 4, 20, 500000, 780000, '2023-06-28 18:21:02', 1, 'https://product.hstatic.net/1000231532/product/ontroller_animal_cho_nintendo_switch_-_bernese_mountain_dog_chinh_hang_5bd705818dd441c3876b8de412f495e6_master.jpg', 'Tay cầm IINE Pro Controller Animal cho Nintendo Switch - Bernese Mountain Dog có bán ở nShop là sản phẩm độc đáo của IINE khi kết hợp tay bấm game với hình ảnh động vật. Bên cạnh vẻ dễ thương, chiếc tay cầm này sở hữu hàng loạt tính năng hiện đại, mở rộng trải nghiệm và sự tiện lợi cho game thủ Nintendo Switch. Từ cảm ứng chuyển động, rung, NFC, đến wake up máy, turbo, macro đều có. Đẹp lạ mà chất, chọn ngay tay cầm IINE Pro Controller Animal cho Nintendo Switch nào.', 0, 0, 0);
INSERT INTO `sanpham` (`id`, `tensanpham`, `idloaisanpham`, `idnhacungcap`, `soluong`, `gianhap`, `giaban`, `ngaynhap`, `status`, `anhsanpham`, `thongtinsanpham`, `featured`, `hotthisweek`, `hotthismonth`) VALUES
(159, 'TAY CẦM IINE PHANTOM ELITE PRO CONTROLLER CHO SWITCH OLED - L769\r\n', 31, 4, 20, 800000, 1280000, '2023-06-28 18:22:40', 1, 'https://product.hstatic.net/1000231532/product/885c33fa05cd4c229e53b91f2829e9be_3e90e56017d040cbbe7513f8510220b9_master.jpg', 'Tay cầm IINE Phantom ELITE PRO Controller cho Switch OLED - L769 đang có bán tại nShop không chỉ sở hữu bộ vỏ được thiết kế trong suốt cùng dải đèn LED ống đẹp mắt mà còn cực kì đa tính năng, đa kết nối khi hỗ trợ cả Switch, Điện thoại lẫn Steam PC nữa đấy!\r\n\r\nTHÔNG TIN TAY CẦM IINE PHANTOM ELITE PRO CONTROLLER CHO SWITCH OLED - L769\r\nTay cầm tương tự Pro Controller dành cho máy Nintendo Switch, mang lại cho bạn những trải nghiệm chơi game tuyệt vời\r\nĐầy đủ các phím bấm, tính năng cần thiết cơ b', 0, 0, 0),
(160, 'TAY CẦM NINTENDO SWITCH PRO CONTROLLER LEGEND OF ZELDA TEARS OF THE KINGDOM EDITION', 31, 4, 20, 1500000, 2000000, '2023-06-28 18:22:40', 1, 'https://product.hstatic.net/1000231532/product/tch_pro_controller_legend_of_zelda_tears_of_the_kingdom_edition_gia_re_8224c98bbaf74a41ac1e7706d09bb70a_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Legend of Zelda Tears of the Kingdom Edition bán ở nShop không những chất mà còn đẹp! Trên thân tay cầm là hàng loạt hoa văn của Zelda Tears of the Kingdom vô cùng cầu kỳ và ấn tượng. Sản phẩm chắc chắc sẽ khiến các fan Zelda lẫn non-fan mê mẩn. Tay Pro Controller là một lựa chọn tuyệt vời nhất để chiến game trên Nintendo Switch, Nintendo Switch Lite và cả trên PC.', 0, 0, 0),
(161, 'TAY CẦM IINE PRO CONTROLLER CHO NINTENDO SWITCH - PIKACHU L702\r\n', 31, 4, 20, 500000, 750000, '2023-06-28 18:25:01', 1, 'https://product.hstatic.net/1000231532/product/a228ee2ecad242eda8f84c69bd7088ec_d7e2489aae834735af859f1cac6ec93e_master.jpg', 'Tay cầm Nintendo Switch phiên bản Pikachu là phương án \"mềm mại\" hơn cho bạn khi muốn chiến game trên Switch kiểu truyền thống, mà không cần đầu tư Pro Controller quá hoành tráng. Mẫu tay cầm này được thiết kế kiểu dáng tương tự và cũng có đầy đủ các tính năng của Pro Controller, thậm chí là cả khả năng nhận diện NFC. Tất nhiên về chất lượng phím bấm thì không thể nào bì được với Pro Controller, nhưng đây là một lựa chọn mang tính kinh tế hơn. Tay cầm có màu vàng đặc trưng của Pikachu, kết nối đ', 0, 0, 0),
(162, 'NINTENDO SWITCH PRO CONTROLLER - SPLATOON 2 EDITION CHÍNH HÃNG', 31, 4, 20, 1500000, 2000000, '2023-06-28 18:25:01', 1, 'https://product.hstatic.net/1000231532/product/switch-pro-controller-splatoon1-800x800_master.jpg', 'Tay cầm Nintendo Switch Pro Controller Splatoon 2 Edition chính hãng Nintendo - Phiên bản đặc biệt, phối màu và hoa văn theo hình ảnh, phong cách rất bắt mắt của tựa game Splatoon 2 nổi tiếng. Lớp vỏ ngoài trong suốt mờ để lộ “nội thất” bên trong độc đáo, đẹp mắt. Tay cầm Pro Controller cho Nintendo Switch với đầy đủ chức năng, thiết kế chắc chắn, giúp bạn có thể tận hưởng và trải nghiệm game tốt nhất!', 0, 0, 0),
(163, 'GBROS. WIRELESS ADAPTER 8BITDO CHƠI TAY GAMECUBE CHO NINTENDO SWITCH', 31, 4, 20, 350000, 540000, '2023-06-28 18:26:37', 1, 'https://product.hstatic.net/1000231532/product/gbros._wireless_adapter_8bitdo_choi_tay_gamecube_cho_nintendo_switch_6c2bef1f49ae4e729e29dc7a2c91f8f2_master.jpg', 'Bạn là một fan cứng của Super Smash Bros. và nhận ra rằng chỉ có dùng tay GameCube mới đúng chuẩn. Vậy thì hãy sắm ngay chiếc Adapter này để chiến Super Smash Bros. Ultimate trên Nintendo Switch cùng tay cầm GameCube nhé. Nó còn dùng được cho cả PC, vô cùng thuận tiện.', 0, 0, 0),
(164, 'HORI D-PAD CONTROLLER (JOY-CON LEFT) CHO NINTENDO SWITCH - MARIO', 31, 4, 20, 500000, 750000, '2023-06-28 18:26:37', 1, 'https://product.hstatic.net/1000231532/product/ntendo_switch_mario_chinh_hang_4ac2ad6b0241449fb56974f9d8a30556_grande_3afa679076ef49d7baa484dd54211aa0_master.jpg', 'Tay HORI D-Pad Controller (Joy-con Left) cho Nintendo Switch đang có bán tại nShop là một giải pháp tuyệt vời cho những bạn thích sử dụng phím điều hướng chữ thập (D-Pad) kiểu truyền thống. Với nó, bạn sẽ chơi các game 2D, flatformer, gameplay retro cổ điển, đối kháng, hoặc di chuyển trên bản đồ chia ô (như các game chiến thuật theo lượt) thuận lợi hơn. Đây chính là điều còn thiếu ở Joy-con thông thường.\r\n\r\n', 0, 0, 0),
(165, 'NINTENDO SWITCH JOY-CON CONTROLLER SET (NEON GREEN + NEON PINK)\r\n', 31, 4, 20, 1300000, 1890000, '2023-06-28 18:28:08', 1, 'https://product.hstatic.net/1000231532/product/joy-con-neon-green-pink1-800x800_master.jpg', 'Sản phẩm tay cầm Joycon thêm màu NEON GREEN + NEON PINK dành cho Nintendo Switch hàng chính hãng là phụ kiện thích hợp cho những game thủ yêu thích chơi nhiều người.', 0, 0, 0),
(166, 'TAY CẦM KHÔNG DÂY DOBE CHO NINTENDO SWITCH PC ĐIỆN THOẠI ANDROID - TY-1793\r\n', 31, 4, 20, 300000, 390000, '2023-06-28 18:28:08', 1, 'https://product.hstatic.net/1000231532/product/ay_cam_dobe_mau_xanh_cho_nintendo_switch_pc_android_ty-1793_chinh_hang_e095aff1ea384862b0e7ceea4a053f62_master.jpg', 'Tay cầm không dây DOBE cho Nintendo Switch, PC, điện thoại Android đang bán tại nShop có màu đen khỏe khoắn và sắc cam lộ ra từ chân đế 2 cần analog làm điểm nhấn nổi bật. Nó sở hữu thiết kế đơn giản nhưng thoải mái khi cầm và chơi game trong thời gian dài. Dàn nút bấm bố trí dễ nhấn giúp thao tác linh hoạt và cũng đủ hết những tính năng cần có của một tay bấm game chuyên dụng.\r\n\r\nBên cạnh đó, chức năng turbo cũng là một điểm cộng đáng giá để phòng khi bạn cần trợ sức thực hiện các chuỗi combo d', 0, 0, 0),
(167, 'COVER ANALOG JOY-CON NINTENDO SWITCH PAWDIARY', 32, 4, 20, 100000, 150000, '2023-06-28 18:30:00', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_pawdiary_meo_trang_meo_xam_5094eff3990148c0a68124e18cddbc03_master.jpg', 'Cover analog Joy-con Nintendo Switch Pawdiary có bán ở nShop là những bộ cover analog với các hình ảnh đáng yêu dễ thương như phô mai, thỏ, gấu, cừu, mèo v.v... độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.\r\n\r\nTHÔNG TIN COVER ANALOG JOY-CON NINTENDO SWITCH PAWDIARY\r\nGiúp phần cao su trên analog của Joy-Con không bị dơ, trầy xước hay ăn mòn qua quá trình sử dụng\r\nMột bộ gồm 4 cái\r\nTháo lắp dễ dàng\r\nChất liệu cao su êm ái cho tay\r\nTăng độ bám khi điều khiển cần analog\r\nLàm', 0, 0, 0),
(168, 'COVER ANALOG JOY-CON NINTENDO SWITCH ZELDA HYLIAN SHIELD & TRAVELER SHIELD\r\n', 32, 4, 20, 10000, 150000, '2023-06-28 18:30:00', 1, 'https://product.hstatic.net/1000231532/product/c7335dd117ca4dd9bb9cf495ad7b2cfd_fc682f60b9424e34b504882d8b93c9e8_master.jpg', 'Cover analog Joy-con Nintendo Switch Hylian Shield & Traveler Shield có bán ở nShop là bộ cover analog với hình ảnh hai chiếc khiên quen thuộc trong The Legend of Zelda Tears of Kingdom độc đáo, giúp bảo vệ bề mặt analog, hạn chế trơn trượt khi điều khiển.\r\n\r\n', 0, 0, 0),
(169, 'COVER ANALOG JOY-CON NINTENDO SWITCH IINE - CHÂN MÈO L422\r\n', 32, 4, 20, 70000, 120000, '2023-06-28 18:31:42', 1, 'https://product.hstatic.net/1000231532/product/cover_analog_joy-con_nintendo_switch_iine_chan_meo_l422_006963aa0a2642ce8a8c4a314d87676f_master.jpg', 'Cover analog Joy-con Nintendo Switch IINE - Chân Mèo L422 có bán ở nShop là phụ kiện cực kỳ cần thiết với các game thủ. Nó sẽ bảo vệ bề mặt cần analog của bạn (nơi hay tiếp xúc nhất) không bị bụi bẩn, ăn mòn do mồ hôi, trầy sước... Không chỉ vậy, bạn còn tha hồ làm đẹp, trang trí cho máy với các màu khác nhau rất đẹp mắt.\r\n\r\n', 0, 0, 0),
(170, 'VỎ ỐP TRONG SUỐT BẢO VỆ TAY CẦM PRO CONTROLLER NINTENDO SWITCH - TNS-0128\r\n', 32, 4, 20, 700000, 1200000, '2023-06-28 18:31:42', 1, 'https://product.hstatic.net/1000231532/product/o_op_trong_suot_bao_ve_tay_cam_pro_controller_nintendo_switch_tns-0128_cb49deb983e843bdab955badd0ca1875_master.jpg', 'Vỏ ốp trong suốt bảo vệ tay cầm Pro Controller Nintendo Switch TNS-0128 bán ở nShop có thiết kế khá lạ mắt với hai mảng khoét lớn ở mặt trước. Nhưng chính nhờ vậy mà nó không gây vướng, hay bất kỳ khó khăn gì với những thao tác bấm nút của bạn. Những điểm dễ trầy xước, ảnh hưởng bởi mồ hôi, bụi bẩn như phần grip vẫn được che chắn hiệu quả.\r\n\r\n', 0, 0, 0),
(171, 'TÚI ĐỰNG TAY CẦM EVA CHỐNG SỐC BẢO VỆ CONTROLLER ĐEN L745\r\n', 32, 4, 20, 150000, 220000, '2023-06-28 18:33:36', 1, 'https://product.hstatic.net/1000231532/product/342239613c484c188df8b2c45317abb5_37dc43d99f9b43ac84afcb243528f426_master.jpg', 'Túi đựng tay cầm game đang có bán tại nShop là một món phụ kiện hữu dụng cho những game thủ hay di chuyển. Nó sẽ giúp bạn chứa gọn chiếc tay cầm game của mình một cách êm ái khi đi ra ngoài giải trí hoặc tới những giải đấu. Túi phù hợp với rất nhiều kiểu tay cầm khác nhau, từ Nintendo Switch, PlayStation 5, đến Xbox One...\r\n\r\n', 0, 0, 0),
(172, 'VỢT TENNIS JOY-CON DÀNH CHO NINTENDO SWITCH CHÍNH HÃNG DOBE\r\n', 32, 4, 20, 150000, 220000, '2023-06-28 18:33:36', 1, 'https://product.hstatic.net/1000231532/product/vot_tennis_switch_1_master.jpg', 'Bạn đam mê thể thao, chơi game Mario Tennis nhưng không thích bấm nút truyền thống nhàm chán thì đây là một trong những phụ kiện không thể bỏ qua.\r\n\r\n', 0, 0, 0),
(173, 'COVER D-PAD VÀ NÚT BẤM CHO JOY-CON NINTENDO SWITCH SKULL & CO CAO CẤP\r\n', 32, 4, 20, 120000, 190000, '2023-06-28 18:35:20', 1, 'https://product.hstatic.net/1000231532/product/set_cover_d-pad_nut_bam_cho_joy-con_nintendo_switch_super_famicom_8b82780465024a628d38f0b5e8662a12_master.jpg', 'Cover D-Pad và nút bấm cho Joy-con Nintendo Switch có bán tại nShop đến từ nhà sản xuất phụ kiện nổi tiếng Skull & Co cao cấp, giúp bạn bảo vệ bề mặt nút bấm trên tay cầm Joy-con. Đặc biệt là cover D-Pad sẽ khiến các game thủ thích mê vì dê dàng sử dụng hơn so với 4 phím tách rời của Nintendo, giúp bạn thoải mái chiến các tựa game cần chính xác và tốc độ nhanh!\r\n\r\n', 0, 0, 0),
(174, 'COVER ANALOG CHO JOY-CON\r\n', 32, 4, 20, 6000, 10000, '2023-06-28 18:35:20', 1, 'https://product.hstatic.net/1000231532/product/upload_4318af78a5dd41518e0ee5022042f03c_grande_c8594e8a03954895831094562c053bf2_master.jpg', 'Sản phẩm cover analog dành cho Joycon của Nintendo Switch với giá thật rẻ nhưng tác dụng trang trí tay cầm thật lớn là một trong top sản phẩm thường mua nhất của khách hàng ưa thích trang trí làm đẹp máy chơi game Switch.', 0, 0, 0),
(175, 'DÁN CƯỜNG LỰC SKULL & CO CHO NINTENDO SWITCH LITE - PHỤ KIỆN THIẾT YẾU\r\n', 33, 4, 20, 150000, 200000, '2023-06-28 18:37:06', 1, 'https://product.hstatic.net/1000231532/product/dan_cuong_luc_skull_co_cho_nintendo_switch_lite_ea67210a7d4243938036a388029d627e_master.jpg', 'Dán màn hình là việc hầu như game thủ Nintendo Switch Lite nào cũng thực hiện khi mới mua máy, hoặc thay mới sau một khoảng thời gian sử dụng. Với miếng dán cường lực Skull & Co cho Nintendo Switch Lite đang bán ở nShop, bạn sẽ có được sự bảo vệ tuyệt vời cho màn hình cảm ứng nhạy cảm trên chiếc máy game của mình. Đây cũng là phụ kiện vô cùng cần thiết nếu bạn hay bỏ máy Nintendo Switch Lite trong túi và di chuyển.\r\n\r\nTHÔNG TIN DÁN CƯỜNG LỰC SKULL & CO CHO NINTENDO SWITCH LITE - PHỤ KIỆN THIẾT Y', 0, 0, 0),
(176, 'DÁN MÀN HÌNH CƯỜNG LỰC NINTENDO SWITCH LITE - PHỤ KIỆN CAO CẤP\r\n', 33, 4, 20, 150000, 200000, '2023-06-28 18:37:06', 1, 'https://product.hstatic.net/1000231532/product/dan_man_hinh_cuong_luc_nintendo_switch_lite_chinh_hang_4ac89f7a3109401b907c49109383cbdf_master.jpg', 'Miếng dán cường lực cho Nintendo Switch Lite có bán tại nShop là một phụ kiện không thể thiếu trong quá trình sử dụng máy. Nó sẽ bảo vệ bề mặt màn hình của Nintendo Lite khỏi những tác động xấu như va đập trầy sước mà vẫn đảm bảo độ trong suốt, chân thực cho hình ảnh và không gây ảnh hưởng đến khả năng cảm ứng của máy.\r\n\r\n', 0, 0, 0),
(177, 'ỐP LƯNG NHỰA DẺO CÓ GRIP CHO NINTENDO SWITCH LITE - DOBE TNS-19112\r\n', 34, 4, 20, 120000, 180000, '2023-06-28 18:38:48', 1, 'https://product.hstatic.net/1000231532/product/op_lung_nhua_deo_grip_nintendo_switch_lite_dobe_tns-19112_daf2d1545348442bbe758d51acc84da8_master.jpg', 'Nhẹ nhàng và tăng độ bám tay, tăng sự thoải mái trong quá trình chơi game nhờ Ốp lưng nhựa dẻo có grip cho Nintendo Switch Lite - DOBE TNS-19112 đang có bán tại nShop. Chất liệu nhựa dẻo siêu bền giúp bảo vệ thân máy khỏi trầy sước, có thể tháo lắp case thuận tiện khi cần. Thiết kế đơn giản, siêu gọn. Lựa màu mình thích đi nào.\r\n\r\n', 0, 0, 0),
(178, 'TÚI ĐỰNG NINTENDO SWITCH LITE DOBE KIỂU ĐƠN GIẢN - TNS-19091\r\n', 34, 4, 20, 150000, 220000, '2023-06-28 18:38:48', 1, 'https://product.hstatic.net/1000231532/product/tui_dung_nintendo_switch_lite_dobe_kieu_don_gian_-_tns-19091_gia_re_f551703c6f894afba323bca2c2be7c31_master.jpg', 'Túi đựng Nintendo Switch Lite DOBE kiểu đơn giản - TNS-19091 có bán tại nShop nhẹ nhàng và bền chắc. Không chỉ bảo vệ an toàn cho máy trên đường di chuyển, chiếc túi này còn có đủ các tiện nghi cơ bản như ngăn lưới chứa phụ kiện, tấm ngăn chứa băng game. Phối màu đỏ đen nổi bật, đỡ dơ, và cũng không sợ lỗi thời. Đơn giản mà tốt chính là đây.', 0, 0, 0),
(179, 'BÓP ĐỰNG NINTENDO SWITCH LITE CHỦ ĐỀ MARIO\r\n', 34, 4, 20, 200000, 290000, '2023-06-28 18:40:47', 1, 'https://product.hstatic.net/1000231532/product/bop_dung_nintendo_switch_lite_chu_de_mario_caa183de7c8c41b7877e9395d4db04f5_master.jpg', 'Bóp đựng Nintendo Switch Lite chủ đề Mario đang có bán tại nShop với sự kết hợp của ba màu đỏ, xanh, vàng vô cùng nổi bật. Chất liệu mềm mại cầm êm tay, và bên trong cũng rất êm ái cho máy Nintendo Switch Lite của bạn. Sản phẩm còn có cả đai giữa máy, chỗ đựng băng game, phụ kiện nhỏ, và dây đeo tay tiện lợi nữa đấy. Một lựa chọn tốt cho bạn nào hay di chuyển, đặc biệt là fan của Mario.\r\n\r\n', 0, 0, 0),
(180, 'COMBO SKULL & CO TÚI ĐỰNG SWITCH LITE KÈM CASE GRIP CAO CẤP\r\n', 34, 4, 20, 600000, 880000, '2023-06-28 18:40:47', 1, 'https://product.hstatic.net/1000231532/product/combo_skull___co_tui_dung_switch_lite_kem_case_grip_cao_cap_turquoise_bcb4c20751ef4e6a97e3e242564e90bc_master.jpg', 'Bộ Combo Skull & Co túi đựng Switch Lite kèm Case Grip cao cấp giúp bạn trải nghiệm thoải mái hơn khi sử dụng máy Switch Lite. Bộ Case Grip ngoài bảo vệ máy khỏi bị trầy xước còn đi kèm theo 3 loại grip khác nhau, phù hợp đa dạng kích cỡ tay, dễ dàng thay đổi nhanh chóng. Bóp đựng đi kèm trong combo làm bằng chất liệu foam cứng, bảo vệ tối đa và hạn chế va đập khi di chuyển.\r\n\r\n', 0, 0, 0),
(181, 'TÚI MỀM ĐỰNG MÁY NINTENDO SWITCH LITE (NHIỀU MẪU)\r\n', 34, 4, 20, 150000, 220000, '2023-06-28 18:42:29', 1, 'https://product.hstatic.net/1000231532/product/tui_mem_dung_may_nintendo_switch_grande_9c3731f650c241eea93106d082762516_master.jpg', 'Những chiếc túi đựng máy Nintendo Switch Lite rực rỡ, đủ màu sắc đang có bán tại nShop sẽ mang lại sự tươi mới cho bạn mỗi ngày. Chất liệu túi siêu êm ái và siêu nhẹ, thuận tiện đem theo bên mình mà chẳng tốn chút sức nào. Phần hình ảnh được in ấn vô cùng sắc nét, lên màu đều. Nó vừa có thể bảo vệ cho máy Nintendo Switch Lite khi ra ngoài, vừa đẹp mắt với những hình ảnh nhân vật game nổi tiếng. \r\n\r\n', 0, 0, 0),
(182, 'CASE ỐP HANDGRIP CHO NINTENDO SWITCH LITE - PHỤ KIỆN CAO CẤP\r\n', 34, 4, 20, 200000, 250000, '2023-06-28 18:42:29', 1, 'https://product.hstatic.net/1000231532/product/case_op_handgrip_cho_nintendo_switch_lite_261ba9ad3c284b94a8a39b4b986b03dd_master.jpg', 'Nintendo Switch Lite đã trở lại với phong cách máy game cầm tay chuyên dụng. Và để tăng sự thoải mái trong quá trình chơi game, tại sao bạn lại không sử dụng thêm một chiếc case ốp có thiết kế tốt như thế này? Với phần gờ nổi hai bên Case ốp handgrip cho Nintendo Switch Lite đang có bán tại nShop, tay bạn vừa đỡ mỏi hơn, vừa bám chắc chắn hơn. Chất liệu nhựa bền chắc và trọng lượng nhẹ cũng là một điểm cộng nữa cho sản phẩm này.\r\n\r\n', 0, 0, 0),
(183, 'ỐP LƯNG NINTENDO SWITCH LITE IN HÌNH GAME ANIME - PHỤ KIỆN BẢO VỆ CHO MÁY\r\n', 34, 4, 20, 250000, 300000, '2023-06-28 18:43:56', 1, 'https://product.hstatic.net/1000231532/product/op_lung_nintendo_switch_lite_in_hinh_game_chinh_hang_0e7776cdb38349e09d9092dbf48cc8bd_master.jpg', 'Tha hồ thay đổi phong cách với Ốp lưng Nintendo Switch Lite in hình game đang có bán tại nShop. Rất nhiều bộ case đẹp mắt, in ấn sắc nét hình ảnh game nổi tiếng để bạn lựa chọn. Vừa bảo vệ máy, vừa cầm thoải mái, mà lại còn đẹp nữa. Mẫu mới cập nhật liên tục.', 0, 0, 0),
(184, 'CASE BẢO VỆ ALUMINUM CHO NINTENDO SWITCH LITE - PHỤ KIỆN CAO CẤP\r\n', 34, 4, 20, 200000, 250000, '2023-06-28 18:43:56', 1, 'https://product.hstatic.net/1000231532/product/game_shop_ban_case_bao_ve_aluminum_cho_nintendo_switch_lite_c3b89d4bb847481cb380e21571470825_master.jpg', 'Case bảo vệ Aluminum cho Nintendo Switch Lite đang có bán tại nShop mang tới một vẻ đẹp hiện đại cho máy của bạn với những phần ốp kim loại nổi bật, bắt ánh sáng. Nó cũng giúp bảo vệ Nintendo Switch Lite khỏi những trầy sước bởi vô ý va đập trong quá trình sử dụng hàng ngày. Phía sau có cả phần gờ nổi lên để tạo thêm sự thoải mái cho tay bạn khi chơi game.\r\n\r\n', 0, 0, 0),
(185, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - VEGITO\r\n', 35, 4, 20, 200000, 250000, '2023-06-28 18:45:17', 1, 'https://product.hstatic.net/1000231532/product/d06e3ba6c456446387d117273f88d34d_49b446ba48c1426babb34f1903b4923e_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Vegito có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với hình ảnh Vegito t', 0, 0, 0),
(186, 'KỆ GIÁ ĐỠ TAY CẦM 3 TẦNG KIÊM TREO TAI NGHE CHO PLAYSTATION NINTENDO SWITCH PC\r\n', 35, 4, 20, 200000, 250000, '2023-06-28 18:45:18', 1, 'https://product.hstatic.net/1000231532/product/phu_kien_gia_do_tay_cam_3_tang_co_do_treo_tai_nghe_03804ddd11e24930a93a99eca89503e5_master.jpg', 'Kệ giá đỡ tay cầm chơi game kiêm treo tai nghe 3 tầng có bán ở nShop bằng acrylic trong suốt cao cấp sẽ giúp góc chơi game của bạn trở nên gọn đẹp và phong cách. Bộ sản phẩm với 3 tầng để tay cầm phù hợp cho hầu hết các kiểu tay cầm lẫn máy Nintendo Switch OLED hay Lite, trục treo tai nghe treo vừa hầu hết các tai nghe gaming full size phổ thông, chắc chắn sẽ khiến bạn hài lòng.', 0, 0, 0),
(187, 'KỆ DOBE ĐỰNG BĂNG ĐĨA GAME CHO NINTENDO SWITCH PS5 XBOX 12 NGĂN - TP5-0520\r\n', 35, 4, 20, 200000, 260000, '2023-06-28 18:47:02', 1, 'https://product.hstatic.net/1000231532/product/ke_dobe_dung_game_nintendo_switch_ps5_xbox_12_ngan_ec4c6dc465cb439eb27c4752eae46b94_master.jpg', 'Góc giải trí của bạn không chỉ gọn gàng và sẽ đẹp mắt hơn với Kệ DOBE đựng băng đĩa game cho Nintendo Switch PS5 Xbox 12 ngăn đang bán tại nShop. Kệ đựng game này tương thích với nhiều loại hộp game (hoặc hộp đĩa phim...) khác nhau nên bạn có thể để chung rất tiện lợi. Thiết kế đơn giản theo hướng hiện đại giúp còn giúp nó dễ phối hợp với đồ vật xung quanh.', 0, 0, 0),
(188, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH NẮP TỪ TÍNH 12 NGĂN IINE - BLACK DUCK\r\n', 35, 4, 20, 150000, 220000, '2023-06-28 18:47:02', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_game_nintendo_switch_nap_tu_tinh_12_ngan_iine_black_duck_284407ce72ee464489883f34c7489895_master.jpg', 'Với nhiều người chúng ta, hộp đựng băng game Nintendo Switch nắp từ tính 12 ngăn IINE - Black Duck có bán ở nShop sẽ là một món phụ kiện vô cùng tuyệt vời. Chiếc hộp này giúp bạn lưu trữ tới 12 băng game Switch (hoặc thẻ nhớ MicroSD) cực kỳ gọn gàng. Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc.', 0, 0, 0),
(189, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH NẮP TỪ TÍNH 12 NGĂN IINE - SPLATOON BLUE\r\n', 35, 4, 20, 150000, 220000, '2023-06-28 18:48:10', 1, 'https://product.hstatic.net/1000231532/product/endo_switch_nap_tu_tinh_12_ngan_iine_-_splatoon_blue_gia_re_chinh_hang_4b373292bf88412ab432c555d174a6a5_master.jpg', 'Với nhiều người chúng ta, Hộp đựng băng game Nintendo Switch nắp từ tính 12 ngăn IINE - Splatoon Blue có bán ở nShop sẽ là một món phụ kiện vô cùng tuyệt vời. Chiếc hộp này giúp bạn lưu trữ tới 12 băng game Switch (hoặc thẻ nhớ MicroSD) cực kỳ gọn gàng. Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc.\r\n\r\n', 0, 0, 0),
(190, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH 16 NGĂN IINE - MASTER SWORD\r\n', 35, 4, 20, 200000, 250000, '2023-06-28 18:48:10', 1, 'https://product.hstatic.net/1000231532/product/5b4ef10b65df4da1ab69f9f1c6d68bf7_7a8c426d647a4f7b9b1812d53785970b_master.jpg', 'Hộp đựng băng game Nintendo Switch 16 ngăn IINE - Master Sword có bán ở nShop không chỉ đẹp mà còn có sức chứa lớn. Với kích thước chỉ 15,2  x 7,2 x 1,6 cm, nó có thể chứa tới 16 game Switch (hoặc 15 game Switch và 2 thẻ MicroSD). Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc. Bên cạnh đó, mặt ngoài được thiết kế cực kỳ đẹp mắt với biểu tượng ', 0, 0, 0),
(191, 'HỘP ĐỰNG BĂNG GAME NINTENDO SWITCH NẮP TỪ TÍNH 12 NGĂN IINE - POKEMON LEGEND ARCEUS\r\n', 35, 4, 20, 150000, 220000, '2023-06-28 18:49:51', 1, 'https://product.hstatic.net/1000231532/product/p_dung_bang_game_nintendo_switch_hinh_pokemon_legend_arceus_chinh_hang_dcf8ef24556c4802862d7ec46acab7fd_master.jpg', 'Với nhiều người chúng ta, Hộp đựng băng game Nintendo Switch nắp từ tính 12 ngăn IINE - Pokemon Legend Arceus có bán ở nShop sẽ là một món phụ kiện vô cùng tuyệt vời. Chiếc hộp này giúp bạn lưu trữ tới 12 băng game Switch (hoặc thẻ nhớ MicroSD) cực kỳ gọn gàng. Nhờ đó mà bạn có thể mang theo bên người rất nhiều game mình thích để đổi qua lại bất cứ khi nào. Hoặc làm cho góc chơi game của mình ngăn nắp hơn khi sử dụng loại hộp này thay cho hộp game nguyên gốc.\r\n\r\n', 0, 0, 0),
(192, 'HỘP ĐỰNG BĂNG NINTENDO SWITCH IN HÌNH GAME\r\n', 35, 4, 20, 200000, 250000, '2023-06-28 18:49:51', 1, 'https://product.hstatic.net/1000231532/product/hop_dung_bang_nintendo_switch_in_hinh_super_mario_bros._master.jpg', 'Ngoài hộp đựng băng game Nintendo Switch dạng đơn giản, tối giản, và hộp Logo đúc nổi, nShop còn có thêm dạng hộp in hình bên ngoài rất đẹp mắt. Trên nắp hộp đựng băng loại này là hình ảnh của các tựa game, nhân vật nổi tiếng như Mario, Pokemon, Zelda, Monster Hunter, Splatoon... tha hồ cho bạn chọn lựa theo ý thích của mình. Mỗi hộp có thể chứa được 12 băng Nintendo Switch và 12 thẻ microSD, nhỏ gọn và tiện lợi mang theo bên mình, đổi game chơi nhanh chóng.\r\n\r\n', 0, 0, 0),
(193, 'ĐẾ SẠC TAY CẦM NINTENDO SWITCH 6 TRONG 1 ĐA NĂNG DOBE - TRẮNG - TNS-19035\r\n', 36, 4, 20, 300000, 380000, '2023-06-28 18:51:19', 1, 'https://product.hstatic.net/1000231532/product/de_sac_tay_cam_nintendo_switch_6_trong_1_da_nang_dobe_trang_tns-19035_59fb9b755637448ca83d079c94bfa80f_master.jpg', 'Sự tiện lợi mà đế sạc tay cầm Nintendo Switch 6 trong 1 đa năng DOBE - Trắng - TNS-19035 có bán ở nShop mang lại quả thực không nhỏ, đặc biệt với ai nhiều tay cầm đủ loại. Chỉ với một thiết bị nhỏ gọn, bạn có thể sạc tới tối đa 6 tay cầm khác nhau cùng lúc. Chưa kể, chỗ gắn Joy-con phía sau khá rộng, sạc được cả loại Joy-con có phần grip nhô ra. Hai vị trí sạc tay Pro Controller thiết kế tinh tế nên có thể dùng chung để sạc Poke Ball Plus. Sản phẩm cũng có đèn báo hiệu riêng cho mỗi cổng sạc để ', 0, 0, 0),
(194, 'CỐC SẠC NHANH 45W KÈM CÁP TYPE-C TO C 1.2M CHO NINTENDO SWITCH - DOBE ITNS-2111\r\n', 36, 4, 20, 350000, 450000, '2023-06-28 18:51:19', 1, 'https://product.hstatic.net/1000231532/product/coc_sac_45w_cho_nintendo_switch_ho_tro_xuat_hinh_tren_dock_e34b1dc916884de1b86bc050a2b1eb95_master.jpg', 'Cốc sạc nhanh 45w kèm cáp Type-C to C 1.2m - DOBE iTNS-2111 đang bán ở nShop là cốc sạc kích thước nhỏ gọn, cáp sạc có thể tháo rời, giúp bạn dễ dàng mang theo bất cứ lúc nào. Với tính năng sạc thông minh, bạn có thể nhanh chóng sạc đầy máy Nintendo Switch hoặc cả những thiết bị khác sử dụng cổng Type C với cáp đi kèm.\r\n\r\n', 0, 0, 0),
(195, 'CÁP SẠC TAY CẦM PS5 DUALSENSE USB-C IINE - 3M\r\n', 36, 4, 20, 200000, 280000, '2023-06-28 18:52:51', 1, 'https://product.hstatic.net/1000231532/product/cap_sac_tay_cam_ps5_dualsense_usb-c_iine_3m_7e6119e9aa9244ad94ae3e4a6b7ee822_master.jpg', 'TẠI SAO MỖI GAME THỦ CHƠI NINTENDO SWITCH, PS5, XBOX SERIES X | S ĐỀU NÊN MUA 1 DÂY CÁP USB-C CHẤT LƯỢNG CAO?\r\nĐơn giản vì máy Nintendo Switch, PS5, Xbox Series X | S thiết kế tương thích chuẩn USB-C với công nghệ mới nhất cho phép sạc nhanh và truyền tải dữ liệu. Nếu AC Adapter Nintendo Switch (Sạc của máy Nintendo Switch) thiết kế dính liền với đầu nguồn không thể kết nối dữ liệu hay dùng chung với Pin dự phòng thì dây cáp USB Type C này sẽ giúp bạn làm điều đó:\r\n\r\n- Kết nối Pin sạc dự phòng, ', 0, 0, 0),
(196, 'PHÍCH CẮM CHUYỂN ĐỔI 3 CHẤU SANG 2 CHẤU\r\n', 36, 4, 20, 12000, 20000, '2023-06-28 18:52:51', 1, 'https://product.hstatic.net/1000231532/product/phich_cam_chuyen_doi_3_chau_sang_2_chau_af3a9baafffa490d89af0e42bad5f113_master.jpg', 'Thiết bị phích Cắm Chuyển Đổi 3 Chấu Sang 2 Chấu nhỏ nhưng vô cùng hữu ích, bạn sẽ có ngay 1 ổ cắm 3 chân tiêu chuẩn, phù hợp với nhiều loại phích cắm, rất tiện dụng cho các thiết bị sử dụng trong gia đình, văn phòng, du lịch.\r\n\r\n', 0, 0, 0),
(197, 'CỐC SẠC USB-C TỐC ĐỘ CAO CHO IPHONE, IPAD, LAPTOP ANKER POWERPORT ATOM PD 1 - 30W - BLACK - A2017J11\r\n', 36, 4, 20, 600000, 800000, '2023-06-28 18:54:22', 1, 'https://product.hstatic.net/1000231532/product/_sac_anker_powerport_atom_pd_1__30w_bao_hanh_chinh_hang_gia_re_-_a2017_9ac3b33733354dacb6ed14f6fe12f708_master.jpg', 'Cốc sạc USB-C tốc độ cao cho iPhone, iPad, Laptop Anker PowerPort Atom PD 1 - 30w - BLACK - A2017J11 đang bán ở nShop là cốc sạc cao cấp dành cho người dùng iPhone, iPad, MacBoo và những thiết bị khác, tương thích cổng USB-C.\r\n\r\n', 0, 0, 0),
(198, 'CÁP SẠC ANDROID FAST CHARGING MULTI-PLUG CABLE 200CM FEELTEK USB-C MICROUSB - MÀU ĐEN\r\n', 36, 4, 20, 150000, 230000, '2023-06-28 18:54:22', 1, 'https://product.hstatic.net/1000231532/product/ndroid_fast_charging_multi-plug_cable_200cm_feeltek_usb-c_microusb_den_e649ea32a0274f968b8e3502a0eb5344_master.jpg', 'Cáp sạc Android Fast Charging Multi-Plug Cable 200cm Feeltek USB-C MicroUSB - màu đen đang bán ở nShop vô cùng tiện lợi cho người dùng thiết bị công nghệ, đặc biệt là những bạn ưa thích sự gọn gàng. Cáp có thể chuyển đổi qua nhiều kiểu đầu kết nối khác nhau, bao gồm: USB-C, USB-A và Micro-USB để phù hợp với điện thoại, laptop, máy tính, tablet, hay thậm chí là Nintendo Switch của bạn. Sản phẩm nhỏ gọn có độ bền cao, cáp chịu uốn, kéo căng tốt nhờ lớp vỏ bện dây chắc chắn. Cáp dài tới 2m.', 0, 0, 0),
(199, 'CÁP SẠC TAY CẦM PS5 DUALSENSE USB-C IINE - 3M\r\n', 36, 4, 20, 200000, 280000, '2023-06-28 18:55:47', 1, 'https://product.hstatic.net/1000231532/product/shop_game_ban_cap_sac_tay_cam_ps5_dualsense_usb-c_iine_3m_e66a510849ff47dc9ff62701b695b019_master.jpg', 'TẠI SAO MỖI GAME THỦ CHƠI NINTENDO SWITCH, PS5, XBOX SERIES X | S ĐỀU NÊN MUA 1 DÂY CÁP USB-C CHẤT LƯỢNG CAO?\r\nĐơn giản vì máy Nintendo Switch, PS5, Xbox Series X | S thiết kế tương thích chuẩn USB-C với công nghệ mới nhất cho phép sạc nhanh và truyền tải dữ liệu. Nếu AC Adapter Nintendo Switch (Sạc của máy Nintendo Switch) thiết kế dính liền với đầu nguồn không thể kết nối dữ liệu hay dùng chung với Pin dự phòng thì dây cáp USB Type C này sẽ giúp bạn làm điều đó:\r\n\r\n- Kết nối Pin sạc dự phòng, ', 0, 0, 0),
(200, 'ĐẦU CHUYỂN ĐỔI OTG USB 3.0 SANG USB TYPE-C - IINE L630\r\n', 36, 4, 20, 40000, 59000, '2023-06-28 18:55:47', 1, 'https://product.hstatic.net/1000231532/product/mua_phu_kien_dau_chuyen_doi_tu_otg_usb_3.0_sang_usb_type-c_-_iine_l630_1b187b4baae141b4b90ba16887de6307_master.jpg', 'Đầu chuyển đổi từ OTG USB 3.0 sang USB Type-C - IINE L630 có bán tại nShop sẽ rất hữu ích cho bạn để kết nối nhiều phụ kiện trực tiếp với máy Switch của mình. Chẳng hạn như dùng chung với 8BitDo Wireless USB Adapter để dùng tay cầm PS4, Xbox với máy Switch mà không thông qua Dock, chơi ở chế độ chơi cầm tay, table top, dùng trống Taiko... Thích hợp để trang bị cho cả Nintendo Switch Lite.\r\n\r\n', 0, 0, 0),
(201, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 512GB NINTENDO VERSION CHO NINTENDO SWITCH\r\n', 37, 4, 20, 2500000, 3190000, '2023-06-28 18:57:26', 1, 'https://product.hstatic.net/1000231532/product/ddc7635ac16e4c76b3540f230ccda4f6_ca0b7e49805041c7abb8d0950aad3b51_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 512GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, In họa tiết Animal Crossing cực đẹp dành cho fan game mua sưu tập, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\nTHÔNG TIN THẺ NHỚ SANDISK MICROSDXC UHS-I 512GB NINTENDO VE', 0, 0, 0),
(202, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 256GB (NINTENDO VERSION) CHO NINTENDO SWITCH\r\n', 37, 4, 20, 1200000, 1590000, '2023-06-28 18:57:26', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_256gb_nintendo_switch_befa1b117ee44c3ebad0fbdfc34266ed_grande_2e872fdf673b483e801b4941d2566ffb_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 256GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.', 0, 0, 0),
(203, 'ĐẦU ĐỌC THẺ NHỚ USB 2.0\r\n', 37, 4, 20, 40000, 60000, '2023-06-28 18:59:03', 1, 'https://product.hstatic.net/1000231532/product/dau_doc_the_nho_usb_2.0_gia_re_da_nang_1968fb8ffdc14b04b8f953053bf7bd7a_master.jpg', 'Đầu đọc thẻ nhớ đa năng dành cho máy chơi game bán tại nShop có kết nối USB 2.0 cho tốc độ truyền tải nhanh. Thiết kết bền chắc nhưng vẫn có sự nhỏ gọn mang lại sự tiện lợi cho khách hàng. \r\n\r\n', 0, 0, 0),
(204, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 400GB NINTENDO VERSION CHO NINTENDO SWITCH\r\n', 37, 4, 20, 2200000, 2690000, '2023-06-28 18:59:03', 1, 'https://product.hstatic.net/1000231532/product/phan_phoi_the_nho_sandisk_microsd_400gb_nintendo_version_652c4cbdccd74dba9d97d5739995f700_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 400GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\n', 0, 0, 0),
(205, 'THẺ NHỚ MICROSDXC CLASS 10 - 512GB DÀNH CHO NINTENDO SWITCH\r\n', 37, 4, 20, 1200000, 1690000, '2023-06-28 19:00:34', 1, 'https://product.hstatic.net/1000231532/product/the_nho_microsdxc_class_10_512gb_nintendo_switch_d02b85a19f914b02a0090d73a22b2e7a_master.jpg', 'Thẻ microSDXC 512GB chính hãng Samsung là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, Samsung Evo Plus microSDXC 256GB U3 mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà.\r\n\r\n', 0, 0, 0),
(206, 'THẺ NHỚ MICROSD CLASS10 - 64GB\r\n', 37, 4, 20, 200000, 290000, '2023-06-28 19:00:34', 1, 'https://product.hstatic.net/1000231532/product/the_nho_nintendo_switch_microsdxc_samsung_evo_plus_u1_64gb_b0e63555e8f84e57ab73a6f1bb2f3f15_master.jpg', 'Thẻ nhớ microSD loại dung lượng 64GB phổ biến với giá cả thích hợp. Có thể chép được 30-60 game 3DS (tùy theo dung lượng game), hàng trăm bản nhạc MP3 và phim thoả thích niềm đam mê của bạn trên chiếc máy game cầm tay. Tốc độ cao tương thích Nintendo Switch.', 0, 0, 0),
(207, 'ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 READER HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO\r\n', 37, 4, 20, 200000, 260000, '2023-06-28 19:01:47', 1, 'https://product.hstatic.net/1000231532/product/transcend-usb-card-reader1-800x800_master.jpg', 'THÔNG TIN VỀ ĐẦU ĐỌC THẺ NHỚ TRANSCEND USB 3.0 HỖ TRỢ MICROSD - SD TỐC ĐỘ CAO\r\nĐầu đọc thẻ đa năng thương hiệu Transcend\r\nDạng thanh nhỏ gọn, dễ sử dụng và mang theo bên người khi đi xa.\r\nHỗ trợ nhiều loại thẻ: SDHC (UHS-I), SDXC (UHS-I), microSD, microSDHC (UHS-I), và microSDXC (UHS-I)\r\nCó đèn LED báo hiệu trạng thái hoạt động\r\nChuẩn kết nối USB 3.0 tốc độ cao (lên đến 86,2 MB/giây) chép game và dữ liệu nhanh chóng.\r\nKết nối trực tiếp qua cổng USB', 0, 0, 0),
(208, 'THẺ NHỚ SANDISK MICROSDXC UHS-I 128GB (NINTENDO VERSION) CHO NINTENDO SWITCH\r\n', 37, 4, 20, 600000, 890000, '2023-06-28 19:01:47', 1, 'https://product.hstatic.net/1000231532/product/xc_uhs-i_128gb_nintendo_switch_a5727dfe44364bb6b5220bf0dcfe4a01_grande_800cb4f7ede749b4a602ca44f248f173_master.jpg', 'Thẻ nhớ MicroSDXC UHS-I 128GB chính hãng SanDisk là giải pháp lưu trữ tuyệt vời cho máy Nintendo Switch của bạn. Đến từ một nhà sản xuất danh tiếng, nó sẽ mang lại sự an toàn cho dữ liệu, đồng thời đảm bảo tốc độ đọc ghi nhanh, giúp chơi game mượt mà. Không chỉ vậy, chiếc thẻ nhớ này còn sở hữu thiết kế siêu đẹp nhờ có hợp tác với Nintendo, tối ưu cho Nintendo Switch.\r\n\r\n', 0, 0, 0),
(209, 'TSUKINO AMIIBO - MONSTER HUNTER STORIES 2\r\n', 38, 4, 20, 400000, 680000, '2023-06-28 19:03:00', 1, 'https://product.hstatic.net/1000231532/product/mo_hinh_amiibo_tsukino_monster_hunter_stories_2_chinh_hang_3460ebe8ba5a46fa9474ac1d5700615d_master.jpg', 'Tsukino amiibo - Monster Hunter Stories 2 ngoài tác dụng trưng bày, sưu tầm ra còn có thể mở khóa trang phục đặc biệt cho bạn trong MonHun Stories 2 Wings of Ruin. Sản phẩm hiện đang có bán tại nShop, hãy thêm ngay trong bộ sưu tập mô hình game nhé!\r\n\r\nTHÔNG TIN TSUKINO AMIIBO - MONSTER HUNTER STORIES 2\r\namiibo Tsukino trong game Monster Hunter Stories 2\r\nChi tiết, đẹp mắt\r\nTương thích với hầu hết tất cả game hỗ trợ amiibo của Nintendo trên 3DS, Wii U, Nintendo Switch, Nintendo Switch Lite\r\nThíc', 0, 0, 0),
(210, 'THẺ BÀI AMIIBO MARIO KART 8 DELUXE CHO NINTENDO SWITCH\r\n', 38, 4, 20, 200000, 280000, '2023-06-28 19:03:00', 1, 'https://product.hstatic.net/1000231532/product/huong_dan_su_dung_the_bai_amiibo_mario_kart_8_deluxe_nintendo_switch_24462ba5a0cc4e3ba46cdef08c712d3f_master.jpg', 'Bạn thường xuyên sử dụng amiibo để nhận các nội dung trong game, nhưng mỗi lần chơi game phải lấy hàng loạt amiibo ra thật lỉnh kỉnh và tốn thời gian. Hoặc bạn muốn bộ sưu tập figure amiibo của mình được bảo vệ tốt nhất, tránh bị tác động, thậm chí bạn còn chưa mở hộp chúng! Hay không có ý định sưu tập tượng amiibo mà chỉ cần nội dung thêm trong game.\r\n\r\n', 0, 0, 0),
(211, 'THẺ BÀI AMIIBO SUPER SMASH BROS.\r\n', 38, 4, 20, 250000, 340000, '2023-06-28 19:06:12', 1, 'https://product.hstatic.net/1000231532/product/the_amiibo_super_smash_bros_cho_may_nintendo_switch_3ds_grande_59a446d84413494c8769c506765c9a4a_master.jpg', 'Bạn thường xuyên sử dụng amiibo để nhận các nội dung trong game, nhưng mỗi lần chơi game phải lấy hàng loạt amiibo ra thật lỉnh kỉnh và tốn thời gian. Hoặc bạn muốn bộ sưu tập figure amiibo của mình được bảo vệ tốt nhất, tránh bị tác động, thậm chí bạn còn chưa mở hộp chúng! Hay không có ý định sưu tập tượng amiibo mà chỉ cần nội dung thêm trong game.\r\n\r\n', 0, 0, 0),
(212, 'WOLF LINK AMIIBO (TWILIGHT PRINCESS)\r\n', 38, 4, 20, 500000, 780000, '2023-06-28 19:06:12', 1, 'https://product.hstatic.net/1000231532/product/wolf_link_amiibo1_grande_c362abbc72a74a7ea128eeb6a0dcb3d5_master.jpg', 'Thông tin sản phẩm\r\n\r\namiibo nhân vật Wolf Link trong game Zelda: Twilight Princess\r\nChi tiết, đẹp mắt\r\nTương thích với hầu hết tất cả game hỗ trợ amiibo của Nintendo trên 3DS, Wii U, Switch\r\nThích hợp trưng bày & sưu tầm\r\nSản phẩm đóng gói nguyên hộp & mới 100%', 0, 0, 0),
(213, 'DARUK AMIIBO (ZELDA BREATH OF THE WILD)\r\n', 38, 4, 20, 350000, 480000, '2023-06-28 19:07:45', 1, 'https://product.hstatic.net/1000231532/product/amiibo_daruk_zelda_breath_of_the_wild_master.jpg', '\r\n\r\nThông tin sản phẩm\r\n\r\namiibo nhân vật Daruk trong game Zelda: Breath of the Wild\r\nTương thích với hầu hết tất cả game hỗ trợ amiibo của Nintendo trên 3DS, Switch\r\nThích hợp trưng bày & sưu tầm\r\nSản phẩm đóng gói nguyên hộp & mới 100%', 0, 0, 0),
(214, 'SSB PIKACHU\r\n', 38, 4, 20, 350000, 460000, '2023-06-28 19:07:45', 1, 'https://product.hstatic.net/1000231532/product/14094144440035-800x800_master.jpg', '\r\n\r\n  \r\nThông Tin Sản Phẩm\r\n\r\namiibo nhân vật Pikachu trong game Super Smash Bros 3DS & Wii U\r\nTương thích với hầu hết tất cả game hỗ trợ amiibo của Nintendo\r\nThích hợp trưng bày & sưu tầm\r\nSản phẩm đóng gói nguyên hộp & mới 100%', 0, 0, 0),
(215, 'GUARDIAN AMIIBO (BREATH OF THE WILD)\r\n', 38, 4, 20, 500000, 720000, '2023-06-28 19:09:08', 1, 'https://product.hstatic.net/1000231532/product/upload_b2fa1d4caed4463384c6f7c62b48d835_master.jpg', 'Thông tin sản phẩm\r\n\r\namiibo nhân vật Guardian trong game The Legend of Zelda: Breath of the Wild\r\nLớn, chi tiết, đẹp mắt\r\nCó thể dùng để nhận thêm các nội dung bonus đặc biệt trong game của 3DS, Wii U, Switch (tùy game)\r\nThích hợp trưng bày & sưu tầm\r\nSản phẩm đóng gói nguyên hộp & mới 100%', 0, 0, 0),
(216, 'ONE-EYED RATHALOS & RIDER BOY AMIIBO (MONSTER HUNTER STORIES)\r\n', 38, 4, 20, 400000, 520000, '2023-06-28 19:09:08', 1, 'https://product.hstatic.net/1000231532/product/rathalos_rider_boy_amiibo1_grande_df5c2ae688104be5a91a952b546b5b20_master.jpg', 'Thông tin sản phẩm\r\n\r\namiibo nhân vật nam cưỡi One-Eyed Rathalos trong game Moster Hunter Stories\r\nKích thước lớn, độ chi tiết cao\r\nCó thể tháo nhân vật nam ra để đổi thú cưỡi với các amiibo cùng dòng\r\nTương thích với hầu hết tất cả game hỗ trợ amiibo của Nintendo\r\nThích hợp trưng bày & sưu tầm\r\nSản phẩm đóng gói nguyên hộp & mới 100%', 0, 0, 0),
(217, 'NINTENDO SWITCH OLED MODEL SPLATOON 3 SPECIAL EDITION - MÁY CŨ GIÁ RẺ\r\n', 39, 4, 20, 5800000, 6800000, '2023-06-28 19:11:07', 1, 'https://product.hstatic.net/1000231532/product/7035032f28fe4213b770fe9cea53acc1_b5bea0227ee44cc2aef9ef42488387ed_master.jpg', 'Nintendo Switch OLED Model Splatoon 3 Special Edition - Máy cũ giá rẻ bán ở nShop thực sự quá đẹp. Từ Dock đến thân máy đều được trang trí bằng những họa tiết mang đậm phong cách Splatoon, rất trẻ trung và năng động. Hai Joy-con phối màu chuyển từ lam qua tím, xanh qua vàng ở mặt trước, và sắc trắng ở mặt sau cực kỳ nổi bật, bừng bừng sức sống. Bên trong là những đặc tính của thế hệ Switch OLED như màn hình tốt hơn, lớn hơn, chân dựng, loa mới, thêm tính năng cho Dock...\r\n\r\nMÀN HÌNH OLED 7 INCH ', 0, 0, 0),
(218, 'MÁY NINTENDO SWITCH CŨ GIÁ TỐT - BẢO HÀNH 1 THÁNG\r\n', 39, 4, 20, 3200000, 4200000, '2023-06-28 19:11:07', 1, 'https://product.hstatic.net/1000231532/product/may_nintendo_switch_cu_grande_fdc2829367e54d178af89da5b9c1f420_master.jpg', 'MUA MÁY NINTENDO SWITCH CŨ GIÁ TỐT TẠI CỬA HÀNG GAME NSHOP GIÚP BẠN TIẾT KIỆM TIỀN HƠN BAO GIỜ HẾT BỞI NHIỀU LÝ DO:\r\n✔ Máy Nintendo Switch cũ luôn đảm bảo chưa qua sửa chữa\r\n\r\n✔ Máy Nintendo Switch cũ được bảo hành 1 tháng nghiêm túc như máy Nintendo Switch mới\r\n\r\n✔ Tình trạng máy được kiểm tra kỹ đạt chuẩn!\r\n\r\n✔ Không phải lo ngại vấn đề kiểm tra máy Switch cũ có bị hư gì không vì tất cả đều được nhân viên shop làm giúp từ A-Z đảm bảo máy tốt!\r\n\r\n', 0, 0, 0),
(219, 'NINTENDO SWITCH V2 FORTNITE EDITION SECOND-HAND\r\n', 39, 4, 20, 4500000, 5200000, '2023-06-28 19:13:03', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_v2_fortnite_edition_second-hand_c879889f39ff4dda84e84013b240d872_master.jpg', 'Nếu bạn đang tìm chiếc máy Nintendo Switch tốt và có chính sách bảo hành hợp lý thì phiên bản Nintendo Switch Fortnite Special Edition đang có bán tại nShop chính là sự lựa chọn vô cùng phù hợp:', 0, 0, 0),
(220, 'NINTENDO 3DS [SECOND-HAND]\r\n', 39, 4, 20, 1000000, 1500000, '2023-06-28 19:13:03', 1, 'https://product.hstatic.net/1000231532/product/3a9d29ae58354caf8dd8a6ac1d8af913_89a9a0e9319b42789acc8996632f1fea_master.jpg', 'Máy Nintendo 3DS đã hack sẵn kèm theo thẻ nhớ 2GB. Có thể chơi game copy Nintendo 3DS. Sản phẩm chưa qua sửa chữa, còn sử dụng tốt và bảo hành 1 tháng.\r\n\r\n', 0, 0, 0),
(221, 'NINTENDO 2DS - BLUE HACKED [SECOND-HAND]\r\n', 39, 4, 20, 1000000, 1400000, '2023-06-28 19:14:39', 1, 'https://product.hstatic.net/1000231532/product/2ds_blue_master.jpeg', 'Bạn đang phân vân muốn mua máy chơi game Nintendo để chơi các game nổi tiếng như Mario, Kirby, Pokemon, Zelda, Fire Emblem… nhưng bạn muốn tiết kiệm ngân sách nhất có thể. Nhìn vào chi phí cho việc đầu tư máy rồi đầu tư thêm game gốc (game bản quyền) đã đẩy mức giá lên khá cao ngoài khả năng của mình. Bạn tìm hiểu sản phẩm máy game Nintendo 2DS cũ đã qua sử dụng, tìm hiểu về các dịch vụ hack máy, giãi mã máy game Nintendo 2DS bên ngoài nhưng không an tâm về uy tín cũng như chất lượng sản phẩm bá', 0, 0, 0),
(222, 'NINTENDO SWITCH NEON V2 SECOND-HAND [PIN TRÂU] - MÁY CŨ GIÁ RẺ\r\n', 39, 4, 20, 4000000, 4900000, '2023-06-28 19:14:39', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_neon_version_v2_2019_pin_trau_second_hand_f26dc6c7d2d640bba8ec1136ba3e4a65_master.jpg', 'Nếu bạn đang tìm chiếc máy Nintendo Switch tốt và có chính sách bảo hành hợp lý thì phiên bản Nintendo Switch New Version Neon Red & Blue cũ giá rẻ đang có bán tại nShop chính là sự lựa chọn vô cùng phù hợp:\r\n\r\n', 0, 0, 0),
(223, 'NEW NINTENDO 3DS XL [SECOND-HAND]\r\n', 39, 4, 20, 2800000, 3200000, '2023-06-28 19:16:19', 1, 'https://product.hstatic.net/1000231532/product/w_nintendo_3dxl_galaxy_750x422_040013fcc2d64a54a977b36c453c1f87_grande_73622b6bd4ec48caa0e970d6261c745e_master.jpg', 'Mua ngay máy game cũ mà chất, cũ người mới ta: Máy New Nintendo 3DS XL bán tại cửa hàng nShop với chất lượng đảm bảo mà giá rẻ, lại có bảo hành (Lên đến 1 tháng) an tâm xài. Miễn phí bẻ khóa và chép game cho khách khi mua máy lần đầu...\r\n\r\n\r\n\r\n', 0, 0, 0),
(224, 'NINTENDO SWITCH LITE CŨ GIÁ RẺ [SECOND-HAND]\r\n', 39, 4, 20, 3000000, 3400000, '2023-06-28 19:16:19', 1, 'https://product.hstatic.net/1000231532/product/nintendo_switch_lite_second_hand_coral_0c604c098c65458f90f863eeb5b1a592_master.png', 'Hệ máy dành cho game thủ thích di chuyển! Nintendo Switch Lite là một thành viên nhỏ gọn, nhẹ nhàng gia nhập vào gia đình Nintendo Switch. Nó sở hữu thiết kế nguyên khối chắc chắn và đặc biệt phù hợp với kiểu chơi cầm tay, vì vậy bạn có thể ngay lập tức thưởng thức các tựa game mình thích bất kỳ lúc nào mình muốn.\r\n\r\n', 0, 0, 0),
(225, 'PS5 STANDARD EDITION - MÁY PS5 GIÁ RẺ CHÍNH HÃNG SONY VIỆT NAM\r\n', 41, 5, 20, 11000000, 15990000, '2023-06-28 19:19:57', 1, 'https://product.hstatic.net/1000231532/product/ps5_chinh_hang_sony_viet_nam_gia_re_nhat_7b455075768c43debc82553a454783af_master.jpg', 'CHƠI GAME KHÔNG GIỚI HẠN VỚI MÁY PS5 GIÁ RẺ\r\nTrải nghiệm khả năng load game siêu nhanh với ở cứng SSD tốc độ cực cao. Đắm mình sâu hơn vào thế giới game nhờ sự hỗ trợ của hệ thống rung phản hồi, cò trợ lực, và âm thanh 3D. Một thế hệ game hoàn toàn mới, chân thực đến kinh ngạc đang chờ bạn cùng máy PS5 chính hãng.\r\n\r\nTỐC ĐỘ SIÊU NHANH CỦA MÁY PS5 CHÍNH HÃNG\r\nTổ hợp sức mạnh của CPU tự chế, GPU, và SSD thế hệ mới để định nghĩa lại thế nào là game trên PlayStation 5.\r\n\r\nNHỮNG TỰA GAME HOÀNH TRÁNG\r', 0, 0, 0),
(226, 'PLAYSTATION 5 DIGITAL EDITION GIÁ SIÊU RẺ - MÁY PS5 NHẬP KHẨU MỚI NHẤT\r\n', 41, 5, 20, 8000000, 10990000, '2023-06-28 19:19:57', 1, 'https://product.hstatic.net/1000231532/product/playstation_5_digital_edition_ps5_gia_re_ee6da9ca683f4a66bfce07ee526df3db_master.jpg', 'Việc sở hữu một chiếc máy PlayStation 5 (PS5) sẽ không còn khó khăn nữa khi bạn lựa chọn đến với nShop. Sản phẩm PlayStation 5 Digital Edition có bán tại nShop là phiên bản mới máy chơi game mới nhất của Sony với hàng loạt công nghệ hiện đại được tích hơp bên trong. Chắc chắn nó sẽ mang lại cho bạn một trải nghiệm game đỉnh cao. Bên cạnh đó nShop cũng có đầy đủ dịch vụ liên quan đến PS5 để bạn có thể tận hưởng trọn vẹn nhất.', 0, 0, 0),
(227, '0002 SPIDER MAN MILES MORALES CHO PS5\r\n', 42, 5, 20, 900000, 1280000, '2023-06-28 19:22:52', 1, 'https://product.hstatic.net/1000231532/product/396dc5e563d44bfc8c84f539e588b1bb_80173703822844f5be64b8be5fd26b3e_master.jpg', 'Nối tiếp sự thành công của bản trước, Marvel\'s Spider-Man Miles Morales đang có bán tại nShop tiếp tục mang lại cho người chơi trải nghiệm sự tự do bay nhảy, đu dây, trừ gian diệt bạo vô cùng ấn tượng của chàng người nhện. Lối chơi nhanh, linh hoạt, và đồ họa đẹp mắt sẽ thỏa mãn bạn cho mà xem.\r\n\r\nHãy là một người hùng đúng nghĩa.\r\nTrải nghiệm câu chuyện của Miles Morales, một trong những Người Nhện nổi tiếng nhất, khi anh khám phá ra được sức mạnh của mình. Cậu thiếu niên này sẽ mang lại một gó', 0, 0, 0),
(228, '0015 DEATHLOOP CHO PS5\r\n', 42, 5, 20, 900000, 1150000, '2023-06-28 19:22:52', 1, 'https://product.hstatic.net/1000231532/product/deathloop_ps5_b927cd3245f44e77ab1439e1d73db261_master.jpg', 'Deathloop cho PS5 đang bán ở nShop cho bạn trải nghiệm chiến đấu để sinh tồn đầy kịch tính, giằng co giữa vai trò kẻ đi săn và người bị săn. Trò chơi mang tới nhiều sự tự do trong phong cách chiến đấu, từ bắn xa đến cận chiến, hành động lén lút... Chủ đề vòng lặp thời gian đã được game vận dụng và xây dựng rất hay.', 0, 0, 0),
(229, '032 FIFA 23 CHO PS5\r\n', 42, 5, 20, 1000000, 1350000, '2023-06-28 19:26:11', 1, 'https://product.hstatic.net/1000231532/product/ban_fifa_23_cho_playstation_5_9b57b09effb7446bb93d02fabe4f1b90_master.jpg', 'FIFA 23 cho PS5 có bán ở nShop mang tới sự đổi mới đầy táo bạo cho tựa game bóng đá đình đám nhất mọi thời đại! Lần đầu tiên, bạn sẽ được điều khiển đội bóng đá nữ trong khuôn khổ FIFA World Cup! Các công nghệ tân tiến, tối tân cũng được áp dụng vào phiên bản game đá banh mới nhất này, mang tới trải nghiệm hoàn toàn khác biệt cho game thủ!\r\n\r\n', 0, 0, 0),
(230, '0040 THE KING OF FIGHTERS XV CHO PS5\r\n', 42, 5, 20, 700000, 990000, '2023-06-28 19:26:11', 1, 'https://product.hstatic.net/1000231532/product/the_king_of_fighters_xv_ps5_90894fca61e84ef884198ec4e3ef53fe_master.jpg', 'Từ khi ra mắt lần đầu tiên năm 1994 đến nay, series game song đấu The King of Fighters đã trở thành một trong những cái tên vô cùng quen thuộc khi nhắc đến thể loại này. The King of Fighters XV cho PS5 bán tại nShop tiếp tục đẩy dòng game lên một tầm cao mới, vượt qua tất cả những phiên bản KOF trước đó về đồ họa, hệ thống gameplay, cũng như trải nghiệm online.\r\n\r\n', 0, 0, 0),
(231, '0026 GRAND THEFT AUTO V - GTA 5 CHO PS5\r\n', 42, 5, 20, 600000, 800000, '2023-06-28 19:27:12', 1, 'https://product.hstatic.net/1000231532/product/grand_theft_auto_v_gta_5_ps5_1fd755272afe4c0dad9aa4c293de9d69_master.jpg', 'Rockstar Games đã giữ đúng lời hứa, trình làng một Grand Theft Auto V (GTA 5) cho PS5 có bán tại nShop với nhiều cải tiến kỹ thuật, nâng cấp hình ảnh, và cải thiện hiệu suất, tận dụng hết những gì mà phần cứng mạnh mẽ có thể mạng lại, tạo ra một tựa game đẹp và tương tác tốt hơn hẳn trước đây.\r\n\r\n', 0, 0, 0),
(232, '0022 BATTLEFIELD 2042 CHO PS5\r\n', 42, 5, 20, 900000, 1350000, '2023-06-28 19:27:12', 1, 'https://product.hstatic.net/1000231532/product/battlefield_2042_ps5_0133dbc9f44643de9189cfdeea334d12_master.jpg', 'Battlefield 2042 cho PS5 đang bán ở nShop là tựa game bắn súng góc nhìn người thứ nhất (FPS - First-Person Shooter) đánh dấu sự trở lại của thương hiệu game chiến tranh lừng danh với đồ họa đỉnh cao và gameplay lôi cuốn, đa dạng.\r\n\r\n', 0, 0, 0),
(233, '051 STREET FIGHTER 6 CHO PS5\r\n', 42, 5, 20, 900000, 1350000, '2023-06-28 19:28:23', 1, 'https://product.hstatic.net/1000231532/product/a0bed98fa72346488091d496cb4f7df3_eeee56ee08df4ecca1c0d36fa102b249_master.jpg', 'Được xây dựng bằng RE Engine riêng của Capcom, Street Fighter 6 bán ở nShop đã mở rộng hơn cùng ba chế độ chơi hấp dẫn gồm Fighting Ground, World Tour, và Battle Hub. Bạn sẽ được trải nghiệm những tính năng gameplay đột phá, đồ họa cao cấp ở mọi khía cạnh của trò chơi.\r\n\r\n', 0, 0, 0),
(234, 'PS4160 - ASSASSIN\'S CREED THE EZIO COLLECTION CHO PS4, PS5\r\n', 42, 5, 20, 400000, 590000, '2023-06-28 19:28:23', 1, 'https://product.hstatic.net/1000231532/product/assassins-creed-ezio-collection-ps4-1-800x800_master.jpg', 'Tự tay tạo nên lịch sử trong vai Bậc Thầy Sát Thủ Huyền Thoại, Ezio Auditore da Firenze, cùng bản game Assassin’s Creed The Ezio Collection. Trò chơi là một tập hợp bao gồm những phần cốt truyện chơi đơn cũng như các gói nội dung tải về từ Assassin’s Creed II, Assassin’s Creed Brotherhood, và Assassin’s Creed Revelations.\r\n\r\n', 0, 0, 0),
(235, 'PS4296 - MARVEL’S SPIDER-MAN - GAME OF THE YEAR EDITION CHO PS4 PS5\r\n', 42, 5, 20, 600000, 850000, '2023-06-28 19:29:53', 1, 'https://product.hstatic.net/1000231532/product/game-spider-man-game-of-the-year-edition-cho-may-ps4_036a4895e11149c5b0f1a90b4aeeaec6_master.jpg', 'Đã lâu rồi chúng ta không được gặp lại Người Nhện trong mảng video game. Điều này sẽ kết thúc cùng tựa game Spider-Man mới độc quyền cho hệ máy PS4 PS5. Marvel’s Spider-Man là game lớn, độc quyền do Insomniac Games phát triển cho máy PS4 PS5 nên được Sony chăm sóc rất tận tình và đặt nhiều kỳ vọng.\r\n\r\nMarvel\'s Spider-Man: Game of the Year Edition cho PS4 là phiên bản đầy đủ nhất hiện tại, bao gồm DLC The City That Never Sleeps, 3 chap Story mới: The Heist, Turf Wars, Silver Lining với nhiều nhiệ', 0, 0, 0);
INSERT INTO `sanpham` (`id`, `tensanpham`, `idloaisanpham`, `idnhacungcap`, `soluong`, `gianhap`, `giaban`, `ngaynhap`, `status`, `anhsanpham`, `thongtinsanpham`, `featured`, `hotthisweek`, `hotthismonth`) VALUES
(236, 'PS4350 - NEED FOR SPEED HEAT CHO PS4 PS5\r\n', 42, 5, 20, 600000, 890000, '2023-06-28 19:29:53', 1, 'https://product.hstatic.net/1000231532/product/need_for_speed_heat_cho_ps4_6832aaee70ff4a60ac340e0c44976420_master.jpg', 'Need for Speed: Heat sẽ đưa bạn đến Palm City, một thế giới mở mới toanh nơi các tay đua đường phố tụ hội để xây dựng tên tuổi cho mình. Ban ngày, người chơi cạnh tranh ở Speedhunters Showdown, một cuộc thi mà bạn có thể kiếm tiền để nâng cấp dàn xe của mình. Còn khi đêm về, bạn sẽ đánh cược tất cả để tạo ra danh tiếng cho mình trên các đường đua ở thế giới ngầm. Một thành phố không ngừng tiếng động cơ siêu xe.\r\n\r\n', 0, 0, 0),
(237, 'PS4395 - FIFA 23 CHO PS4\r\n', 43, 5, 20, 900000, 1350000, '2023-06-28 19:31:27', 1, 'https://product.hstatic.net/1000231532/product/fifa_23_ps4_51b28a8fa81a45f5b941494649057510_master.jpg', 'FIFA 23 cho PS4 có bán ở nShop mang tới sự đổi mới đầy táo bạo cho tựa game bóng đá đình đám nhất mọi thời đại! Lần đầu tiên, bạn sẽ được điều khiển đội bóng đá nữ trong khuôn khổ FIFA World Cup! Các công nghệ tân tiến, tối tân cũng được áp dụng vào phiên bản game đá banh mới nhất này, mang tới trải nghiệm hoàn toàn khác biệt cho game thủ!\r\n\r\nLần đầu tiên xuất hiện bóng đã nữ\r\nĐiều quan trọng nhất trong phiên bản FIFA 23 chính là lần đầu tiên có giải bóng nữ và được đánh dấu bằng việc cầu thủ Sa', 0, 0, 0),
(238, 'PS4405 - LIKE A DRAGON ISHIN CHO PS4\r\n', 43, 5, 20, 900000, 1250000, '2023-06-28 19:31:27', 1, 'https://product.hstatic.net/1000231532/product/1700c4b5b6524dcda9178b64d4188510_51c0b63c904847498d8eb1fd167fc5db_master.jpg', 'Là bản game mới được mong đợi nhất của Ryu Ga Gotoku Studio, Like a Dragon Ishin cho PS4 có bán tại nShop sẽ đưa bạn trở lại thành phố Kyo năm 1860 đầy loạn lạc, theo bước chân Sakamoto Ryoma trên con đường đi tìm công lý. Sự kết hợp độc đáo của đa dạng cách chiến đấu cùng với lối dẫn chuyện nổi tiếng của Studio làm nên series Yakuza lừng lẫy, chắc chắn sẽ không khiến bạn thất vọng! \r\n\r\n', 0, 0, 0),
(239, 'PS4259 - DRAGON BALL FIGHTERZ CHO PS4 PS5\r\n', 43, 5, 20, 500000, 750000, '2023-06-28 19:33:20', 1, 'https://product.hstatic.net/1000231532/product/ps4259_-_dragon_ball_fighterz_ps5_ps4_5d9a8af2848c48faac2cfbc6d412bcfb_master.jpg', 'Dragon Ball là một thương hiệu cực kỳ đắt hàng ở nhiều lĩnh vực, cả trong mảng game cũng vậy, các phiên bản trò chơi mới cứ liên tục được tung ra, không có dấu hiệu chậm lại. Phần mới nhất hiện nay là Dragon Ball FighterZ được phát hành máy PS4 PS5. Trò chơi thuộc dạng song đấu 2.5D, do Arc System Works phát triển, và Bandai Namco phát hành.\r\n\r\n', 0, 0, 0),
(240, 'PS4196 - RESIDENT EVIL 7: BIOHAZARD\r\n', 43, 5, 20, 500000, 790000, '2023-06-28 19:33:20', 1, 'https://product.hstatic.net/1000231532/product/ps4196_-_resident_evil_7_biohazard_bb9517724379458a854515fa4f4fc7d2_master.jpg', 'Lấy bối cảnh tại một biệt thự ở vùng nông thôn Hoa Kỳ đầy vẻ ký bí, rùng rợn, Resident Evil 7 : Biohazard sẽ đưa người chơi tới với những trải nghiệm kinh hãi qua góc nhìn người thứ nhất. Tựa game đã có những thay đổi lớn so với các phần gần đây để tìm lại chất kinh dị nguyên gốc mà series Resident Evil từng rất tự hào. Và Capcom lần này đã thành công. \r\n\r\n', 0, 0, 0),
(241, 'PS4331A - DAYS GONE CHO PS4 PS5\r\n', 43, 5, 20, 500000, 780000, '2023-06-28 19:34:43', 1, 'https://product.hstatic.net/1000231532/product/game_days_gone_cho_ps4_ca2b110bce9d418f87f639a0a22a6aab_master.jpg', 'Days Gone độc quyền cho PS4 PS5 đang có bán tại nShop là một tựa game phiêu lưu hành động thế giới mở diễn ra trong thiên nhiên hoang dã, ở thời điểm 2 năm sau một đại dịch khủng khiếp tàn phá toàn cầu. Bạn sẽ vào vai Deacon St. John, một kẻ du mục kiêm sợ săn tiền thưởng, rong ruổi đó đây trên chiếc mô tô hoành tráng của mình, chiến đấu để sinh tồn trong lúc tìm kiếm một lý do để tồn tại.\r\n\r\n', 0, 0, 0),
(242, 'PS4217 - CRASH BANDICOOT N-SANE TRILOGY\r\n', 43, 5, 20, 600000, 900000, '2023-06-28 19:34:43', 1, 'https://product.hstatic.net/1000231532/product/crash-bandicoot-trilogy1-800x800_master.jpg', 'Sony Interactive Entertainment đang hợp tác với Activision, Vicarious Visions để remaster lại cả ba phần game Crash Bandicoot cho máy PlayStation 4. Theo đó, chỉ với một đĩa Crash Bandicoot N-Sane duy nhất, bạn sẽ có được tận 3 game là Crash Bandicoot, Crash Bandicoot 2: Cortex Strikes Back, và Crash Bandicoot: Warped.\r\n\r\n', 0, 0, 0),
(243, 'PS4380 - EA SPORTS UFC 4 CHO PS4 PS5\r\n', 43, 5, 20, 600000, 880000, '2023-06-28 19:36:38', 1, 'https://product.hstatic.net/1000231532/product/ea_sports_ufc_4_ps4_869ea565829845bfb4e5ea2c1482e6b1_master.jpg', 'Trong tựa game EA SPORTS UFC 4 cho PS4 đang có bán ở nShop, đấu sĩ của bạn được định hình bởi phong cách chiến đấu, những thành tích và cả tính cách riêng của người chơi. Những trận chiến mãnh liệt và nóng rực đang chờ bạn.\r\n\r\n', 0, 0, 0),
(244, 'PS4353 - DRAGON BALL Z: KAKAROT CHO PS4 PS5\r\n', 43, 5, 20, 600000, 900000, '2023-06-28 19:36:38', 1, 'https://product.hstatic.net/1000231532/product/dragon_ball_z_kakarot_cho_ps4_e3b7d08596574bca9882058639650931_master.jpg', 'Sống lại câu chuyện của Goku cùng tựa game DRAGON BALL Z: KAKAROT trên máy PS4 PS5 đang có bán tại nShop. Trò chơi sẽ mang lại cho bạn những trận thư hùng mãn nhãn không kém gì trên truyện, trên phim mà chúng ta từng hào hứng theo dõi. Ngoài ra còn nhiều việc khác như luyện tập, câu cá, ăn uống với Goku.\r\n\r\n', 0, 0, 0),
(245, 'BAO SILICON DOBE BẢO VỆ TAY CẦM PS5 DUALSENSE CHỐNG MỒ HÔI\r\n', 44, 4, 20, 60000, 100000, '2023-06-28 19:38:20', 1, 'https://product.hstatic.net/1000231532/product/hu_kien_ps5_gia_re_bao_boc_tay_cam_ps5_chong_mo_hoi_chong_truot_gia_re_fa54fe165a784a908b36fee06edca439_master.jpg', 'Bao Silicon bảo vệ tay cầm PS5 DualSense có bán tại nShop là phụ kiện cần thiết giúp chống mồ hôi tay trơn trượt, tăng độ bám tay cho game thủ khi sử dụng tay cầm trong thời gian dài. Chất liệu cao su ôm sát tay cầm, hạn chế tình trạng lỏng lẻo, không gây trầy xước, bảo vệ bề mặt tay cầm.\r\n\r\n\r\nTHÔNG TIN BAO SILICON BẢO VỆ TAY CẦM PS5 DUALSENSE\r\nBao Silicon chất liệu cao su đàn hồi, giúp tăng độ bám tay, chống mồ hôi trơn trượt, thoải mái hơn khi chơi game trong thời gian dài.\r\nBảo vệ bề mặt tay ', 0, 0, 0),
(246, 'BỘ CHUYỂN ĐỔI HDMI 4K 3 PORT - 3 ĐẦU VÀO 1 ĐẦU RA TẶNG KÈM REMOTE\r\n', 44, 4, 20, 200000, 280000, '2023-06-28 19:38:20', 1, 'https://product.hstatic.net/1000231532/product/bo_chuyen_doi_hdmi_4k_3_port_-_3_dau_vao_1_dau_ra_tang_kem_remote_263db3ad103b43d58a7033d3e96f40e0_master.jpg', 'Nếu TV, màn hình (màn laptop, man pc, màn hình rời...) của bạn đang phải kết nối với quá nhiều thiết bị bằng cổng HDMI, và thường xuyên phải rút cái này ra để cắm cái kia vào gây bất tiện, thì Bộ chuyển đổi HDMI 4K 3 Port - 3 đầu vào 1 đầu ra tặng kèm remote đang bán ở nShop là một giải pháp tuyệt vời. \r\n\r\n', 0, 0, 0),
(247, 'ĐẾ SẠC TAY CẦM PS5 DUALSENSE CHARGING DOCK DOBE RED - TP5-0515R\r\n', 44, 4, 20, 250000, 320000, '2023-06-28 19:40:21', 1, 'https://product.hstatic.net/1000231532/product/de_sac_tay_cam_ps5_dualsense_charging_dock_dobe_red_tp5-0515r_31ab19dce0364ab1943e2ce1ca439b65_master.jpg', 'Đế sạc tay cầm PS5 DualSense Charging Dock DOBE Red - TP5-0515R có bán ở nShop nhỏ gọn mà tiện lợi. Thay vì gắn dây rườm rà và để tay cầm PS5 lộn xộn khắp nơi mỗi lần sạc, sản phẩm này sẽ giúp góc chơi game của bạn gọn và đẹp hơn nhiều. Màu sắc thiết kế đỏ đen rực rỡ theo phong cách của PlayStation 5 thực sự nổi bật. Khi không sạc, bạn dùng nó làm một chiếc đế dựng tay cầm cũng rất đẹp.\r\n\r\n', 0, 0, 0),
(248, 'GIÁ GẮN TAY CẦM PS4 HỖ TRỢ CHƠI GAME MOBILE\r\n', 44, 4, 20, 70000, 120000, '2023-06-28 19:40:22', 1, 'https://product.hstatic.net/1000231532/product/gia_gan_tay_c_m_ps4_ch_i_mobile_master.jpg', 'Hiện nay nhiều smartphone android đã hỗ trợ khả năng sử dụng tay cầm DualShock 4 của máy PlayStation 4 để chơi game. Nhờ đó mà việc điều khiển game vô cùng thoải mái, không khác gì máy chơi game thực thụ. Để cho việc trải nghiệm chơi game di động với tay cầm PS4 tiện lợi hơn, các bạn có thể lựa chọn sản phẩm GIÁ GẮN TAY CẦM PS4 HỖ TRỢ CHƠI GAME MOBILE đang có bán tại cửa hàng nShop. Sản phẩm này sẽ biến tay cầm PS4 và điện thoại của bạn thành một liên kết thống nhất, như một máy chơi game cầm ta', 0, 0, 0),
(249, 'PLAYSTATION NEW GOLD WIRELESS HEADSET\r\n', 44, 4, 20, 1800000, 2500000, '2023-06-28 19:44:20', 1, 'https://product.hstatic.net/1000231532/product/playstation_new_gold_wireless_headset_chinh_hang_sony_model_cuhya-0080_260f6ea6da7840f1ac3d04fafe70f8b5_master.jpg', 'THÔNG TIN PLAYSTATION GOLD WIRELESS HEADSET\r\nTai nghe không dây dành cho PlayStation\r\nHỗ trợ PlayStation 4, PC và Mac\r\nÂm thanh giả lập 7.1\r\nTích hợp 2 micro hỗ trợ tính năng trò chuyện trên PlayStation 4\r\nCông nghệ chống ồn khi trò chuyện\r\nCác thiết lập âm thanh khác nhau bằng phần mềm trên PlayStation 4\r\nDung lượng pin: 570mAh\r\nKhoảng cách tối đa: 10m (không vật cản)\r\nThời gian sử dụng: 7 tiếng (ở mức âm lượng trung bình)\r\nHàng chính hãng Sony Vietnam\r\nBảo hành 1 năm', 0, 0, 0),
(250, 'QUẠT TẢN NHIỆT CHO PS5 IINE CHẤT LƯỢNG CAO\r\n', 44, 4, 20, 450000, 580000, '2023-06-28 19:44:21', 1, 'https://product.hstatic.net/1000231532/product/quat_tan_nhiet_ps5_iine_f540ecf4752343a8b52a56907a63bf52_master.jpg', 'Bạn đang lo lắng máy PS5 của mình chơi game lâu sẽ quá nhiệt? Đừng lo, với phụ kiện Quạt tản nhiệt cho PS5 IINE có bán ở nShop, vấn đề này sẽ được giải quyết gọn gàng ngay lập tức. Thiết kế hiện đại và hữu dụng. Quạt tản nhiệt cho PS5 IINE làm mát máy hiệu quả, nhờ đó tăng tuổi thọ PS5. Đồng thời nó cũng chạy rất êm, không sợ phiền đến bạn chơi game.\r\n\r\n', 0, 0, 0),
(251, 'VỎ BỌC SILICON BẢO VỆ TAY CẦM PS4 - CHỐNG MỒ HÔI TRƠN TRƯỢT\r\n', 44, 4, 20, 60000, 100000, '2023-06-28 19:45:47', 1, 'https://product.hstatic.net/1000231532/product/bao_silicon_cho_tay_cam_ps4_ee5fd5f1e10d4df3898e749b84d537f1_master.jpg', 'Bảo vệ và làm đẹp cho chiếc tay cầm chơi game - thiết bị mình tiếp xúc thường xuyên là nhu cầu tất yếu của game thủ. Với sản phẩm VỎ SILICON CHO TAY CẦM DUALSHOCK 4 đang có bán tại cửa hàng nShop, chiếc tay cầm PS4 thân yêu của bạn sẽ có thêm lớp áo bên ngoài mềm mại, che bụi, chống xước, chống dính mồ hôi, và cũng thật cá tính với những hình ảnh trang trí cá tính mạnh mẽ.\r\n\r\n', 0, 0, 0),
(252, 'TÚI ĐỰNG TAY CẦM MÁY CHƠI GAME (NINTENDO SWITCH, PS4, XBOX ONE)\r\n', 44, 4, 20, 150000, 220000, '2023-06-28 19:45:47', 1, 'https://product.hstatic.net/1000231532/product/tui_dung_tay_cam_may_choi_game_mario_7c3e929479224d4a872a716f2657b854_master.jpg', 'Túi đựng tay cầm game đang có bán tại nShop là một món phụ kiện hữu dụng cho những game thủ hay di chuyển. Nó sẽ giúp bạn chứa gọn chiếc tay cầm game của mình một cách êm ái khi đi ra ngoài giải trí hoặc tới những giải đấu. Túi phù hợp với rất nhiều kiểu tay cầm khác nhau, từ Nintendo Switch, PlayStation 4, đến Xbox One...', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(20) NOT NULL,
  `idkhachhang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `idkhachhang`) VALUES
(3, 2),
(2, 3),
(1, 4),
(4, 110),
(5, 111),
(6, 112),
(7, 113),
(8, 114),
(9, 115),
(10, 116),
(11, 117);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`idhoadon`,`idsanpham`),
  ADD KEY `idsanpham` (`idsanpham`);

--
-- Chỉ mục cho bảng `chitietwishlist`
--
ALTER TABLE `chitietwishlist`
  ADD KEY `idsanpham` (`idsanpham`),
  ADD KEY `idwishlist` (`idwishlist`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkhachhang` (`idkhachhang`),
  ADD KEY `idsanpham` (`idsanpham`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkhachhang` (`idkhachhang`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkhachhang` (`idkhachhang`),
  ADD KEY `idkieuthanhtoan` (`idkieuthanhtoan`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `paymentsdetail`
--
ALTER TABLE `paymentsdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpayment` (`idpayment`),
  ADD KEY `idsanpham` (`idsanpham`);

--
-- Chỉ mục cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idloasanpham` (`idloaisanpham`),
  ADD KEY `idnhacungcap` (`idnhacungcap`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkhachhang` (`idkhachhang`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT cho bảng `paymentsdetail`
--
ALTER TABLE `paymentsdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`idhoadon`) REFERENCES `hoadon` (`id`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `chitietwishlist`
--
ALTER TABLE `chitietwishlist`
  ADD CONSTRAINT `chitietwishlist_ibfk_1` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `chitietwishlist_ibfk_2` FOREIGN KEY (`idwishlist`) REFERENCES `wishlist` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`idkieuthanhtoan`) REFERENCES `phuongthucthanhtoan` (`id`);

--
-- Các ràng buộc cho bảng `paymentsdetail`
--
ALTER TABLE `paymentsdetail`
  ADD CONSTRAINT `paymentsdetail_ibfk_1` FOREIGN KEY (`idpayment`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `paymentsdetail_ibfk_2` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`idloaisanpham`) REFERENCES `loaisanpham` (`id`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`idnhacungcap`) REFERENCES `nhacungcap` (`id`);

--
-- Các ràng buộc cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`idkhachhang`) REFERENCES `khachhang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
