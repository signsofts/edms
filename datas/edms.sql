-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 10:56 PM
-- Server version: 11.4.0-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edms`
--

-- --------------------------------------------------------

--
-- Table structure for table `edms_category`
--

CREATE TABLE `edms_category` (
  `type` varchar(20) NOT NULL,
  `category_id` varchar(10) DEFAULT '0',
  `topic` varchar(150) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edms_category`
--

INSERT INTO `edms_category` (`type`, `category_id`, `topic`, `color`, `published`) VALUES
('cabinet', '1', 'คำสั่ง', NULL, 1),
('cabinet', '2', 'คู่มือ', NULL, 1),
('cabinet', '3', 'ทรัพย์สิน', NULL, 1),
('department', '1', 'บริหาร', NULL, 1),
('department', '2', 'จัดซื้อจัดจ้าง', NULL, 1),
('department', '3', 'บุคคล', NULL, 1),
('department', '4', 'ผลิต', NULL, 1),
('department', '5', 'วิศวกรรม', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `edms_dms`
--

CREATE TABLE `edms_dms` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `document_no` varchar(20) NOT NULL,
  `detail` text NOT NULL,
  `topic` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edms_dms_download`
--

CREATE TABLE `edms_dms_download` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `dms_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edms_dms_files`
--

CREATE TABLE `edms_dms_files` (
  `id` int(11) NOT NULL,
  `dms_id` int(11) NOT NULL,
  `topic` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `ext` varchar(4) NOT NULL,
  `size` int(11) NOT NULL,
  `file` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edms_dms_meta`
--

CREATE TABLE `edms_dms_meta` (
  `dms_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edms_language`
--

CREATE TABLE `edms_language` (
  `id` int(11) NOT NULL,
  `key` text NOT NULL,
  `type` varchar(5) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text DEFAULT NULL,
  `en` text DEFAULT NULL,
  `la` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edms_language`
--

INSERT INTO `edms_language` (`id`, `key`, `type`, `owner`, `js`, `th`, `en`, `la`) VALUES
(1, 'ACCEPT_ALL', 'text', 'index', 1, 'ยอมรับทั้งหมด', 'Accept all', 'ຍອມຮັບທັງຫມົດ'),
(2, 'CANCEL', 'text', 'index', 1, 'ยกเลิก', 'Cancel', 'ຍົກເລີກ'),
(3, 'CHANGE_COLOR', 'text', 'index', 1, 'เปลี่ยนสี', 'change color', 'ປ່ຽນສີ'),
(4, 'CHECK', 'text', 'index', 1, 'เลือก', 'check', 'ເລືອກ'),
(5, 'CHECKBOX', 'text', 'index', 1, 'ตัวเลือก', 'Checkbox', 'ກ່ອງກາເຄື່ອງໝາຍ'),
(6, 'COOKIES_SETTINGS', 'text', 'index', 1, 'ตั้งค่าคุกกี้', 'Cookies settings', 'ຕັ້ງຄ່າຄຸກກີ'),
(7, 'DELETE', 'text', 'index', 1, 'ลบ', 'delete', 'ລຶບ'),
(8, 'DISABLE', 'text', 'index', 1, 'ปิดใช้งาน', 'Disable', 'ປິດໃຊ້ການ'),
(9, 'ENABLE', 'text', 'index', 1, 'เปิดใช้งาน', 'Enable', 'ເປີດໃຊ້ການ'),
(10, 'INVALID_DATA', 'text', 'index', 1, 'ข้อมูล XXX ไม่ถูกต้อง', 'XXX Invalid data', 'ຂໍ້ມູນ XXX ບໍ່ຖືກຕ້ອງ'),
(11, 'ITEM', 'text', 'index', 1, 'รายการ', 'item', 'ລາຍການ'),
(12, 'ITEMS', 'text', 'index', 1, 'รายการ', 'items', 'ລາຍການ'),
(13, 'NEXT_MONTH', 'text', 'index', 1, 'เดือนถัดไป', 'Next Month', 'ເດືອນຕໍ່ໄປ'),
(14, 'PLEASE_BROWSE_FILE', 'text', 'index', 1, 'กรุณาเลือกไฟล์', 'Please browse file', 'ກະລຸນາເລືອກແຟ້ມຂໍ້ມູນ'),
(15, 'PLEASE_FILL_IN', 'text', 'index', 1, 'กรุณากรอก', 'Please fill in', 'ກະລຸນາພີ່ມ'),
(16, 'PLEASE_SAVE_BEFORE_CONTINUING', 'text', 'index', 1, 'กรุณาบันทึก ก่อนดำเนินการต่อ', 'Please save before continuing', 'ກະລຸນາບັນທຶກກ່ອນດຳເນີນການຕໍ່'),
(17, 'PLEASE_SELECT', 'text', 'index', 1, 'กรุณาเลือก', 'Please select', 'ກະລຸນາເລືອກ'),
(18, 'PLEASE_SELECT_AT_LEAST_ONE_ITEM', 'text', 'index', 1, 'กรุณาเลือก XXX อย่างน้อย 1 รายการ', 'Please select XXX at least one item', 'ກະລຸນາເລືອກ XXX ຢ່າງໜ້ອຍໜຶ່ງລາຍການ'),
(19, 'PREV_MONTH', 'text', 'index', 1, 'เดือนก่อนหน้า', 'Prev Month', 'ເດືອນທີ່ຜ່ານມາ'),
(20, 'SELECT_ALL', 'text', 'index', 1, 'เลือกทั้งหมด', 'select all', 'ເລືອກທັງໝົດ'),
(21, 'SELECT_NONE', 'text', 'index', 1, 'ไม่เลือกรายการใดเลย', 'select none', 'ບໍ່ເລືອກລາຍການໃດເລີຍ'),
(22, 'SORRY_XXX_NOT_FOUND', 'text', 'index', 1, 'ขออภัย ไม่พบ XXX ที่ต้องการ', 'Sorry XXX not found', 'ຂໍອະໄພບໍ່ພົບ XXX ທີ່ຕ້ອງການ'),
(23, 'SUCCESSFULLY_COPIED_TO_CLIPBOARD', 'text', 'index', 1, 'สำเนาไปยังคลิปบอร์ดเรียบร้อย', 'Successfully copied to clipboard', 'ສຳເນົາໄປຍັງຄິບບອດຮຽບຮ້ອຍ'),
(24, 'SUCCESSFULLY_UPLOADED_XXX_FILES', 'text', 'index', 1, 'อัปโหลดเรียบร้อย XXX ไฟล์', 'Successfully uploaded XXX files', 'ອັບໂຫຼດຮຽບຮ້ອຍ XXX ແຟ້ມ'),
(25, 'THE_TYPE_OF_FILE_IS_INVALID', 'text', 'index', 1, 'ชนิดของไฟล์ไม่ถูกต้อง', 'The type of file is invalid', 'ຊະນິດຂອງແຟ້ມບໍ່ຖືກຕ້ອງ'),
(26, 'UNCHECK', 'text', 'index', 1, 'ไม่เลือก', 'uncheck', 'ບໍ່ເລືອກ'),
(27, 'YOU_WANT_TO_XXX', 'text', 'index', 1, 'คุณต้องการ XXX ?', 'You want to XXX ?', 'ທ່ານບໍ່ຕ້ອງການ XXX ?'),
(28, 'YOU_WANT_TO_XXX_THE_SELECTED_ITEMS', 'text', 'index', 1, 'คุณต้องการ XXX รายการที่เลือก ?', 'You want to XXX the selected items ?', 'ທ່ານຕ້ອງການ XXX ລາຍການທີ່ເລືອກ?'),
(29, 'BOOLEANS', 'array', 'index', 0, 'a:2:{i:0;s:27:\"ปิดใช้งาน\";i:1;s:30:\"เปิดใช้งาน\";}', 'a:2:{i:0;s:7:\"Disable\";i:1;s:7:\"Enabled\";}', 'a:2:{i:0;s:27:\"ປິດໃຊ້ວຽກ\";i:1;s:30:\"ເປີດໃຊ້ວຽກ\";}'),
(30, 'CATEGORIES', 'array', 'index', 0, 'a:1:{s:10:\"department\";s:12:\"แผนก\";}', 'a:1:{s:10:\"department\";s:10:\"Department\";}', 'a:1:{s:10:\"department\";s:15:\"ພະແນກ\";}'),
(31, 'CSV_ENCODING', 'array', 'index', 0, 'a:2:{s:5:\"UTF-8\";s:19:\"UTF-8 (without BOM)\";s:7:\"TIS-620\";s:7:\"TIS-620\";}', 'a:2:{s:5:\"UTF-8\";s:19:\"UTF-8 (without BOM)\";s:7:\"TIS-620\";s:7:\"TIS-620\";}', 'a:2:{s:5:\"UTF-8\";s:19:\"UTF-8 (without BOM)\";s:7:\"TIS-620\";s:7:\"TIS-620\";}'),
(32, 'CURRENCY_UNITS', 'array', 'index', 0, 'a:2:{s:3:\"THB\";s:9:\"บาท\";s:3:\"USD\";s:24:\"ดอลล่าร์\";}', 'a:2:{s:3:\"THB\";s:4:\"Baht\";s:3:\"USD\";s:6:\"Dollar\";}', 'a:3:{s:3:\"THB\";s:9:\"ບາດ\";s:3:\"USD\";s:15:\"ດໍລ່າ\";s:3:\"LAK\";s:9:\"ກີບ\";}'),
(33, 'DATE_FORMAT', 'text', 'index', 0, 'd M Y เวลา H:i น.', 'd M Y, H:i', 'd M Y ເວລາ H:i'),
(34, 'DATE_LONG', 'array', 'index', 0, 'a:7:{i:0;s:21:\"อาทิตย์\";i:1;s:18:\"จันทร์\";i:2;s:18:\"อังคาร\";i:3;s:9:\"พุธ\";i:4;s:24:\"พฤหัสบดี\";i:5;s:15:\"ศุกร์\";i:6;s:15:\"เสาร์\";}', 'a:7:{i:0;s:6:\"Sunday\";i:1;s:6:\"Monday\";i:2;s:7:\"Tuesday\";i:3;s:9:\"Wednesday\";i:4;s:8:\"Thursday\";i:5;s:6:\"Friday\";i:6;s:8:\"Saturday\";}', 'a:7:{i:0;s:15:\"ອາທິດ\";i:1;s:9:\"ຈັນ\";i:2;s:18:\"ອັງຄານ\";i:3;s:9:\"ພຸດ\";i:4;s:15:\"ພະຫັດ\";i:5;s:9:\"ສຸກ\";i:6;s:12:\"ເສົາ\";}'),
(35, 'DATE_SHORT', 'array', 'index', 0, 'a:7:{i:0;s:7:\"อา.\";i:1;s:4:\"จ.\";i:2;s:4:\"อ.\";i:3;s:4:\"พ.\";i:4;s:7:\"พฤ.\";i:5;s:4:\"ศ.\";i:6;s:4:\"ส.\";}', 'a:7:{i:0;s:2:\"Su\";i:1;s:2:\"Mo\";i:2;s:2:\"Tu\";i:3;s:2:\"We\";i:4;s:2:\"Th\";i:5;s:2:\"Fr\";i:6;s:2:\"Sa\";}', 'a:7:{i:0;s:4:\"ທ.\";i:1;s:4:\"ຈ.\";i:2;s:4:\"ຄ.\";i:3;s:4:\"ພ.\";i:4;s:4:\"ພ.\";i:5;s:4:\"ສ.\";i:6;s:4:\"ສ.\";}'),
(36, 'DMS_CATEGORIES', 'array', 'index', 0, 'a:2:{s:10:\"department\";s:12:\"แผนก\";s:7:\"cabinet\";s:39:\"ตู้เก็บเอกสาร\";}', 'a:2:{s:10:\"department\";s:10:\"Department\";s:7:\"cabinet\";s:14:\"Filing cabinet\";}', 'a:2:{s:10:\"department\";s:15:\"ພະແນກ\";s:7:\"cabinet\";s:39:\"ຕູ້ໃສ່ເອກະສານ\";}'),
(37, 'DMS_UPLOAD_OPTIONS', 'array', 'index', 0, 'a:2:{i:0;s:69:\"สามารถอัปโหลดได้ทุกแผนก\";i:1;s:111:\"สามารถอัปโหลดได้แผนกของตัวเองเท่านั้น\";}', 'a:2:{i:0;s:33:\"Can be uploaded by any department\";i:1;s:36:\"Can only upload their own department\";}', 'a:2:{i:0;s:93:\"ສາມາດອັບໂຫລດໄດ້ໂດຍພະແນກໃດກໍ່ຕາມ\";i:1;s:105:\"ສາມາດອັບໂຫລດພະແນກຂອງຕົນເອງເທົ່ານັ້ນ\";}'),
(38, 'DMS_WANT', 'array', 'index', 0, 'a:2:{s:4:\"file\";s:21:\"แนบไฟล์\";s:3:\"url\";s:13:\"ส่ง URL\";}', 'a:2:{s:4:\"file\";s:11:\"Attach file\";s:3:\"url\";s:8:\"Send URL\";}', 'a:2:{s:4:\"file\";s:21:\"ແນບໄຟລ໌\";s:3:\"url\";s:16:\"ສົ່ງ URL\";}'),
(39, 'DOWNLOAD_ACTIONS', 'array', 'index', 0, 'a:2:{i:0;s:39:\"ดาวน์โหลดไฟล์\";i:1;s:54:\"เปิดไฟล์ (ที่รู้จัก)\";}', 'a:2:{i:0;s:8:\"Download\";i:1;s:26:\"Open file (know file type)\";}', 'a:2:{i:0;s:33:\"ດາວໂຫຼດແຟ້ມ\";i:1;s:53:\"ເປີດແຟ້ມ(ທີ່ຮູ້ຈັກ)\";}'),
(40, 'LINE_FOLLOW_MESSAGE', 'text', 'index', 0, 'สวัสดี คุณ :name นี่คือบัญชีทางการของ :title เราจะส่งข่าวสารถึงคุณผ่านช่องทางนี้', 'Hello, :name This is :title official account. We will send you news via this channel.', 'ສະບາຍດີ, :name ນີ້ແມ່ນບັນຊີທາງການຂອງ :title ພວກເຮົາຈະສົ່ງຂ່າວໃຫ້ທ່ານຜ່ານຊ່ອງທາງນີ້.'),
(41, 'LINE_REPLY_MESSAGE', 'text', 'index', 0, 'ขออภัยไม่สามารถตอบกลับข้อความนี้ได้', 'Sorry, can&#039;t reply to this message.', 'ຂໍອະໄພ, ບໍ່ສາມາດຕອບກັບຂໍ້ຄວາມນີ້ໄດ້.'),
(42, 'LOGIN_FIELDS', 'array', 'index', 0, 'a:4:{s:8:\"username\";s:30:\"ชื่อผู้ใช้\";s:5:\"email\";s:15:\"อีเมล\";s:5:\"phone\";s:39:\"เบอร์โทรศัพท์\";s:7:\"id_card\";s:30:\"เลขประชาชน\";}', 'a:4:{s:8:\"username\";s:8:\"Username\";s:5:\"email\";s:5:\"Email\";s:5:\"phone\";s:5:\"Phone\";s:7:\"id_card\";s:18:\"Identification No.\";}', 'a:4:{s:8:\"username\";s:27:\"ຊື່ຜູ້ໃຊ້\";s:5:\"email\";s:15:\"ອີເມວ\";s:5:\"phone\";s:30:\"ເບີໂທລະສັບ\";s:7:\"id_card\";s:39:\"ເລກບັດປະຈຳຕົວ\";}'),
(43, 'MAIL_PROGRAMS', 'array', 'index', 0, 'a:3:{i:0;s:43:\"ส่งจดหมายด้วย PHP\";i:1;s:72:\"ส่งจดหมายด้วย PHPMailer+SMTP (แนะนำ)\";i:2;s:58:\"ส่งจดหมายด้วย PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:13:\"Send with PHP\";i:1;s:38:\"Send with PHPMailer+SMTP (recommended)\";i:2;s:28:\"Send with PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:46:\"ສົ່ງຈົດໝາຍດ້ວຍ PHP\";i:1;s:75:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+SMTP (ແນະນຳ)\";i:2;s:61:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+PHP Mail\";}'),
(44, 'MONTH_LONG', 'array', 'index', 0, 'a:12:{i:1;s:18:\"มกราคม\";i:2;s:30:\"กุมภาพันธ์\";i:3;s:18:\"มีนาคม\";i:4;s:18:\"เมษายน\";i:5;s:21:\"พฤษภาคม\";i:6;s:24:\"มิถุนายน\";i:7;s:21:\"กรกฎาคม\";i:8;s:21:\"สิงหาคม\";i:9;s:21:\"กันยายน\";i:10;s:18:\"ตุลาคม\";i:11;s:27:\"พฤศจิกายน\";i:12;s:21:\"ธันวาคม\";}', 'a:12:{i:1;s:7:\"January\";i:2;s:8:\"February\";i:3;s:5:\"March\";i:4;s:5:\"April\";i:5;s:3:\"May\";i:6;s:4:\"June\";i:7;s:4:\"July\";i:8;s:6:\"August\";i:9;s:9:\"September\";i:10;s:7:\"October\";i:11;s:8:\"November\";i:12;s:8:\"December\";}', 'a:12:{i:1;s:18:\"ມັງກອນ\";i:2;s:15:\"ກຸມພາ\";i:3;s:12:\"ມີນາ\";i:4;s:12:\"ເມສາ\";i:5;s:21:\"ພຶດສະພາ\";i:6;s:18:\"ມິຖຸນາ\";i:7;s:21:\"ກໍລະກົດ\";i:8;s:15:\"ສິງຫາ\";i:9;s:15:\"ກັນຍາ\";i:10;s:12:\"ຕຸລາ\";i:11;s:15:\"ພະຈິກ\";i:12;s:15:\"ທັນວາ\";}'),
(45, 'MONTH_SHORT', 'array', 'index', 0, 'a:12:{i:1;s:8:\"ม.ค.\";i:2;s:8:\"ก.พ.\";i:3;s:11:\"มี.ค.\";i:4;s:11:\"เม.ย.\";i:5;s:8:\"พ.ค.\";i:6;s:11:\"มิ.ย.\";i:7;s:8:\"ก.ค.\";i:8;s:8:\"ส.ค.\";i:9;s:8:\"ก.ย.\";i:10;s:8:\"ต.ค.\";i:11;s:8:\"พ.ย.\";i:12;s:8:\"ธ.ค.\";}', 'a:12:{i:1;s:3:\"Jan\";i:2;s:3:\"Feb\";i:3;s:3:\"Mar\";i:4;s:3:\"Apr\";i:5;s:3:\"May\";i:6;s:3:\"Jun\";i:7;s:3:\"Jul\";i:8;s:3:\"Aug\";i:9;s:3:\"Sep\";i:10;s:3:\"Oct\";i:11;s:3:\"Nov\";i:12;s:3:\"Dec\";}', 'a:12:{i:1;s:8:\"ມ.ກ.\";i:2;s:8:\"ກ.ພ.\";i:3;s:11:\"ມີ.ນ.\";i:4;s:11:\"ເມ.ສ.\";i:5;s:8:\"ພ.ພ.\";i:6;s:11:\"ມິ.ນ.\";i:7;s:8:\"ກ.ກ.\";i:8;s:8:\"ສ.ຫ.\";i:9;s:8:\"ກ.ຍ.\";i:10;s:8:\"ຕ.ລ.\";i:11;s:8:\"ພ.ຈ.\";i:12;s:8:\"ທ.ວ.\";}'),
(46, 'Name', 'text', 'index', 0, 'ชื่อ นามสกุล', 'Name Surname', 'ຊື່ ນາມສະກຸນ'),
(47, 'PERMISSIONS', 'array', 'index', 0, 'a:2:{s:10:\"can_config\";s:60:\"สามารถตั้งค่าระบบได้\";s:22:\"can_view_usage_history\";s:93:\"สามารถดูประวัติการใช้งานระบบได้\";}', 'a:2:{s:10:\"can_config\";s:24:\"Can configure the system\";s:22:\"can_view_usage_history\";s:33:\"Able to view system usage history\";}', 'a:2:{s:10:\"can_config\";s:60:\"ສາມາດຕັ້ງຄ່າລະບົບໄດ້\";s:22:\"can_view_usage_history\";s:90:\"ສາມາດເບິ່ງປະຫວັດການນໍາໃຊ້ລະບົບ\";}'),
(48, 'PUBLISHEDS', 'array', 'index', 0, 'a:2:{i:0;s:45:\"ระงับการเผยแพร่\";i:1;s:21:\"เผยแพร่\";}', 'a:2:{i:0;s:11:\"Unpublished\";i:1;s:9:\"Published\";}', 'a:2:{i:0;s:45:\"ລະງັບການເຜີຍແຜ່\";i:1;s:21:\"ເຜີຍແຜ່\";}'),
(49, 'RECEIVE_TYPIES', 'array', 'index', 0, 'a:6:{i:1;s:39:\"หนังสือภายนอก\";i:2;s:36:\"หนังสือภายใน\";i:3;s:48:\"หนังสือประทับตรา\";i:4;s:42:\"หนังสือสั่งการ\";i:5;s:60:\"หนังสือประชาสัมพันธ์\";i:6;s:168:\"หนังสือที่เจ้าหน้าที่ทำขึ้นหรือรับไว้เป็นหลักฐานในราชการ\";}', 'a:6:{i:1;s:39:\"หนังสือภายนอก\";i:2;s:36:\"หนังสือภายใน\";i:3;s:48:\"หนังสือประทับตรา\";i:4;s:42:\"หนังสือสั่งการ\";i:5;s:60:\"หนังสือประชาสัมพันธ์\";i:6;s:168:\"หนังสือที่เจ้าหน้าที่ทำขึ้นหรือรับไว้เป็นหลักฐานในราชการ\";}', 'a:6:{i:1;s:39:\"หนังสือภายนอก\";i:2;s:36:\"หนังสือภายใน\";i:3;s:48:\"หนังสือประทับตรา\";i:4;s:42:\"หนังสือสั่งการ\";i:5;s:60:\"หนังสือประชาสัมพันธ์\";i:6;s:168:\"หนังสือที่เจ้าหน้าที่ทำขึ้นหรือรับไว้เป็นหลักฐานในราชการ\";}'),
(50, 'SEXES', 'array', 'index', 0, 'a:3:{s:1:\"u\";s:21:\"ไม่ระบุ\";s:1:\"f\";s:12:\"หญิง\";s:1:\"m\";s:9:\"ชาย\";}', 'a:3:{s:1:\"u\";s:13:\"Not specified\";s:1:\"f\";s:6:\"Female\";s:1:\"m\";s:4:\"Male\";}', 'a:3:{s:1:\"u\";s:30:\"ບໍ່ໄດ້ລະບຸ\";s:1:\"f\";s:9:\"ຍິງ\";s:1:\"m\";s:9:\"ຊາຍ\";}'),
(51, 'SMTPSECURIES', 'array', 'index', 0, 'a:2:{s:0:\"\";s:57:\"การเชื่อมต่อแบบปกติ\";s:3:\"ssl\";s:72:\"การเชื่อมต่อที่ปลอดภัย (SSL)\";}', 'a:2:{s:0:\"\";s:10:\"Clear Text\";s:3:\"ssl\";s:38:\"Server using a secure connection (SSL)\";}', 'a:2:{s:0:\"\";s:66:\"ການເຊື່ອມຕໍ່ແບບປົກກະຕິ\";s:3:\"ssl\";s:66:\"ການເຊື່ອມຕໍ່ທີ່ປອດໄຟ (SSL)\";}'),
(52, 'THEME_WIDTH', 'array', 'index', 0, 'a:3:{s:7:\"default\";s:33:\"ค่าเริ่มต้น\";s:4:\"wide\";s:15:\"กว้าง\";s:9:\"fullwidth\";s:30:\"กว้างพิเศษ\";}', 'a:3:{s:7:\"default\";s:7:\"Default\";s:4:\"wide\";s:4:\"Wide\";s:9:\"fullwidth\";s:10:\"Extra wide\";}', 'a:3:{s:7:\"default\";s:36:\"ຄ່າເລີ່ມຕົ້ນ\";s:4:\"wide\";s:15:\"ກວ້າງ\";s:9:\"fullwidth\";s:30:\"ກວ້າງພິເສດ\";}'),
(53, 'TIME_FORMAT', 'text', 'index', 0, 'H:i น.', 'H:i', 'H:i'),
(54, 'YEAR_OFFSET', 'int', 'index', 0, '543', '0', '0'),
(55, ':name for new members Used when members need to specify', 'text', 'index', 0, ':name เริ่มต้นสำหรับสมาชิกใหม่ ใช้ในกรณีที่สมาชิกจำเป็นต้องระบุ', NULL, ':name ສໍາລັບສະມາຊິກໃຫມ່ ໃຊ້ໃນເວລາທີ່ສະມາຊິກຕ້ອງການກໍານົດ'),
(56, '0.0.0.0 mean all IP addresses', 'text', 'index', 0, '0.0.0.0 หมายถึงอนุญาตทั้งหมด', NULL, '0.0.0.0 ຫມາຍຄວາມວ່າອະນຸຍາດໃຫ້ທັງຫມົດ'),
(57, 'A new document has been sent to you. Please check back.', 'text', 'index', 0, 'มีเอกสารใหม่ส่งถึงคุณ กรุณากลับไปตรวจสอบ', NULL, 'ເອກະສານໃໝ່ໄດ້ຖືກສົ່ງໄປຫາເຈົ້າແລ້ວ. ກະລຸນາກວດເບິ່ງຄືນ'),
(58, 'Accept all', 'text', 'index', 0, 'ยอมรับทั้งหมด', NULL, 'ຍອມຮັບທັງຫມົດ'),
(59, 'Accept this agreement', 'text', 'index', 0, 'ยอมรับข้อตกลง', NULL, 'ຍອມຮັບຂໍ້ຕົກລົງ'),
(60, 'Add', 'text', 'index', 0, 'เพิ่ม', NULL, 'ເພີ່ມ'),
(61, 'Add friend', 'text', 'index', 0, 'เพิ่มเพื่อน', NULL, 'ເພີ່ມເພື່ອນ'),
(62, 'Address', 'text', 'index', 0, 'ที่อยู่', NULL, 'ທີ່ຢູ່'),
(63, 'Address details', 'text', 'index', 0, 'รายละเอียดที่อยู่', NULL, 'ລາຍລະອຽດທີ່ຢູ່'),
(64, 'Administrator status It is of utmost importance to do everything', 'text', 'index', 0, 'สถานะผู้ดูแลระบบ มีความสำคัญสูงสุดสามารถทำได้ทุกอย่าง', NULL, 'ສະຖານະຜູ້ເບິ່ງແຍງລະບົບມີຄວາມສຳຄັນສຸງທີ່ສຸດສາມາດເຮັດໄດ້ທຸກຢ່າງ'),
(65, 'All :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ทั้งหมด :count รายการ, แสดง :start ถึง :end, หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ທັງໝົດ :count ລາຍການ, ສະແດງ :start ເຖິງ :end, ໜ້າທີ່ :page ຈາກທັງໝົດ:total ໜ້າ'),
(66, 'all items', 'text', 'index', 0, 'ทั้งหมด', NULL, 'ທັງໝົດ'),
(67, 'Always enabled', 'text', 'index', 0, 'เปิดใช้งานตลอดเวลา', NULL, 'ເປີດສະເໝີ'),
(68, 'API settings', 'text', 'index', 0, 'ตั้งค่า API', NULL, 'ຕັ້ງຄ່າ API'),
(69, 'Appraiser', 'text', 'index', 0, 'ประเมินราคา', NULL, 'ປະເມີນລາຄາ'),
(70, 'Authentication require', 'text', 'index', 0, 'การตรวจสอบความถูกต้อง', NULL, 'ການກວດກາຄວາມຖືກຕ້ອງ'),
(71, 'Avatar', 'text', 'index', 0, 'รูปสมาชิก', NULL, 'ຮູບແທນຕົວ'),
(72, 'Background color', 'text', 'index', 0, 'สีพื้นหลัง', NULL, 'ສີພື້ນຫລັງ'),
(73, 'Background image', 'text', 'index', 0, 'รูปภาพพื้นหลัง', NULL, 'ພາບພື້ນຫລັງ'),
(74, 'Browse file', 'text', 'index', 0, 'เลือกไฟล์', NULL, 'ເລືອກໄຟລ໌'),
(75, 'Browse image uploaded, type :type', 'text', 'index', 0, 'เลือกรูปภาพอัปโหลด ชนิด :type', NULL, 'ເລືອກຮູບພາບອັບໂຫຼດຊະນິດ :type'),
(76, 'Can handle all documents', 'text', 'index', 0, 'สามารถจัดการเอกสารทั้งหมดได้', NULL, 'ສາມາດຈັດການເອກະສານທັງໝົດໄດ້'),
(77, 'Can login', 'text', 'index', 0, 'สามารถเข้าระบบได้', NULL, 'ສາມາດເຂົ້າສູ່ລະບົບ'),
(78, 'Can manage the', 'text', 'index', 0, 'สามารถจัดการ', NULL, 'ສາມາດຈັດການ'),
(79, 'Can not be performed this request. Because they do not find the information you need or you are not allowed', 'text', 'index', 0, 'ไม่สามารถดำเนินการตามที่ร้องขอได้ เนื่องจากไม่พบข้อมูลที่ต้องการ หรือ คุณไม่มีสิทธิ์', NULL, 'ບໍ່ສາມາດດຳເນີນການຕາມທີ່ຮ້ອງຂໍໄດ້ເນື່ອງຈາກບໍ່ພົບຂໍ້ມູນທີ່ຕ້ອງການ ຫຼື ທ່ານບໍ່ມີສິດ'),
(80, 'Can select multiple files', 'text', 'index', 0, 'สามารถเลือกได้หลายไฟล์', NULL, 'ສາມາດເລືອກເອກະສານໄດ້ຫຼາຍແບບ'),
(81, 'Can set the module', 'text', 'index', 0, 'สามารถตั้งค่าโมดูลได้', NULL, 'ສາມາດຕັ້ງໂມດູນໄດ້'),
(82, 'Can upload file', 'text', 'index', 0, 'สามารถอัปโหลดไฟล์ได้', NULL, 'ສາມາດອັບໂຫຼດແຟ້ມໄດ້'),
(83, 'Can upload your document file', 'text', 'index', 0, 'สามารถอัปโหลดไฟล์เอกสารได้', NULL, 'ສາມາດອັບໂຫຼດແຟ້ມເອກະສານໄດ້'),
(84, 'Can view or download file', 'text', 'index', 0, 'สามารถดูหรือดาวน์โหลดเอกสารได้', NULL, 'ສາມາດເບິ່ງຫລືດາວໂຫລດເອກະສານໄດ້'),
(85, 'Can&#039;t login', 'text', 'index', 0, 'ไม่สามารถเข้าระบบได้', NULL, 'ບໍ່ສາມາດເຂົ້າສູ່ລະບົບໄດ້'),
(86, 'Change language', 'text', 'index', 0, 'สลับภาษา', NULL, 'ປ່ຽນພາສາ'),
(87, 'Choose from a list of members (can choose multiple people)', 'text', 'index', 0, 'เลือกจากรายชื่อสมาชิก (สามารถเลือกได้หลายคน)', NULL, 'ເລືອກຈາກລາຍຊື່ສະມາຊິກ (ຈື່ໄດ້ທຸກ)'),
(88, 'Clear selected', 'text', 'index', 0, 'ไม่เลือก', NULL, 'ບໍ່ເລືອກ'),
(89, 'Click to edit', 'text', 'index', 0, 'คลิกเพื่อแก้ไข', NULL, 'ກົດເພື່ອແກ້ໄຂ'),
(90, 'Comment', 'text', 'index', 0, 'หมายเหตุ', NULL, 'ຫມາຍເຫດ'),
(91, 'Company', 'text', 'index', 0, 'บริษัท', NULL, 'ບໍລິສັດ'),
(92, 'Confirm password', 'text', 'index', 0, 'ยืนยันรหัสผ่าน', NULL, 'ຢືນຢັນລະຫັດຜ່ານ'),
(93, 'Congratulations, your email address has been verified. please login', 'text', 'index', 0, 'ยินดีด้วย ที่อยู่อีเมลของคุณได้รับการยืนยันเรียบร้อยแล้ว กรุณาเข้าสู่ระบบ', NULL, 'ຂໍສະແດງຄວາມຍິນດີ, ທີ່ຢູ່ອີເມວຂອງທ່ານໄດ້ຮັບການຢັ້ງຢືນແລ້ວ. ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(94, 'Cookie Policy', 'text', 'index', 0, 'นโยบายคุกกี้', NULL, 'ນະໂຍບາຍຄຸກກີ'),
(95, 'COOKIE_NECESSARY_DETAILS', 'text', 'index', 0, 'คุกกี้พื้นฐาน จำเป็นต่อการใช้งานเว็บไซต์ ใช้เพื่อการรักษาความปลอดภัยและให้เว็บไซต์สามารถทำงานได้อย่างถูกต้อง', NULL, 'ຄຸກກີພື້ນຖານ ມີຄວາມຈໍາເປັນໃນການນໍາໃຊ້ເວັບໄຊທ໌ ມັນຖືກນໍາໃຊ້ເພື່ອຈຸດປະສົງຄວາມປອດໄພແລະເພື່ອໃຫ້ເວັບໄຊທ໌ເຮັດວຽກຢ່າງຖືກຕ້ອງ.'),
(96, 'COOKIE_POLICY_DETAILS', 'text', 'index', 0, 'เราใช้คุกกี้ (Cookies) หรือเทคโนโลยีที่คล้ายคลึงกันเท่าที่จำเป็น เพื่อใช้ในการเข้าถึงสินค้าหรือบริการ และติดตามการใช้งานของคุณเท่านั้น หากคุณไม่ต้องการให้มีคุกกี้ไว้ในคอมพิวเตอร์ของคุณ คุณสามารถตั้งค่าบราวเซอร์เพื่อปฏิเสธการจัดเก็บคุกกี้ก่อนที่จะใช้งานเว็บไซต์ หรือใช้โหมดไม่ระบุตัวตนเพื่อเข้าใช้งานเว็บไซต์ก็ได้', NULL, 'ພວກເຮົາໃຊ້ຄຸກກີ (Cookies) ຫຼືເຕັກໂນໂລຢີທີ່ຄ້າຍຄືກັນໃນຂອບເຂດທີ່ຈໍາເປັນ. ສໍາລັບການນໍາໃຊ້ໃນການເຂົ້າເຖິງສິນຄ້າຫຼືການບໍລິການ ແລະພຽງແຕ່ຕິດຕາມການນໍາໃຊ້ຂອງທ່ານ ຖ້າ​ຫາກ​ວ່າ​ທ່ານ​ບໍ່​ຕ້ອງ​ການ cookies ໃນ​ຄອມ​ພິວ​ເຕີ​ຂອງ​ທ່ານ​ ທ່ານສາມາດຕັ້ງຕົວທ່ອງເວັບຂອງທ່ານເພື່ອປະຕິເສດການເກັບຮັກສາ cookies. ກ່ອນທີ່ຈະນໍາໃຊ້ເວັບໄຊທ໌ ທ່ານຍັງສາມາດໃຊ້ໂໝດບໍ່ເປີດເຜີຍຕົວຕົນເພື່ອເຂົ້າຫາເວັບໄຊທ໌ໄດ້.'),
(97, 'Cost', 'text', 'index', 0, 'ค่าใช้จ่าย', NULL, 'ຄ່າໃຊ້ຈ່າຍ'),
(98, 'Country', 'text', 'index', 0, 'ประเทศ', NULL, 'ປະເທດ'),
(99, 'Create', 'text', 'index', 0, 'สร้าง', NULL, 'ສ້າງ'),
(100, 'Create new account', 'text', 'index', 0, 'สร้างบัญชีใหม่', NULL, 'ສ້າງບັນຊີໃໝ່'),
(101, 'Created', 'text', 'index', 0, 'สร้างเมื่อ', NULL, 'ສ້າງເມື່ອ'),
(102, 'Currency unit', 'text', 'index', 0, 'สกุลเงิน', NULL, 'ສະກຸນເງິນ'),
(103, 'Customer', 'text', 'index', 0, 'ลูกค้า', NULL, 'ລູກຄ້າ'),
(104, 'Customer Name', 'text', 'index', 0, 'ชื่อลูกค้า', NULL, 'ຊື່ລູກຄ້າ'),
(105, 'Dark mode', 'text', 'index', 0, 'โหมดมืด', NULL, 'ໂໝດມືດ'),
(106, 'Data controller', 'text', 'index', 0, 'ผู้ควบคุม/ใช้ ข้อมูล', NULL, 'ຜູ້​ຄວບ​ຄຸມຂໍ້ມູນ'),
(107, 'Date', 'text', 'index', 0, 'วันที่', NULL, 'ວັນທີ'),
(108, 'days', 'text', 'index', 0, 'วัน', NULL, 'ມື້'),
(109, 'Default license When member registration', 'text', 'index', 0, 'สิทธิ์การใช้งานเริ่มต้นเมื่อมีการสมัครสมาชิก', NULL, 'ໃບອະນຸຍາດເລີ່ມຕົ້ນເມື່ອລົງທະບຽນສະມາຊິກ'),
(110, 'Delete', 'text', 'index', 0, 'ลบ', NULL, 'ລືບ'),
(111, 'Demo Mode', 'text', 'index', 0, 'โหมดตัวอย่าง', NULL, 'ຕົວຢ່າງ'),
(112, 'Department', 'text', 'index', 0, 'แผนก', NULL, 'ຜະແນກ'),
(113, 'Description', 'text', 'index', 0, 'คำอธิบาย', NULL, 'ຄຳອະທິບາຍ'),
(114, 'Detail', 'text', 'index', 0, 'รายละเอียด', NULL, 'ລາຍະລະອຽດ'),
(115, 'Details of', 'text', 'index', 0, 'รายละเอียดของ', NULL, 'ລາຍລະອຽດຂອງ'),
(116, 'Director', 'text', 'index', 0, 'ผู้อำนวยการ', NULL, 'ຜູ້ອຳນວຍການ'),
(117, 'Document', 'text', 'index', 0, 'เอกสาร', NULL, 'ເອກະສານ'),
(118, 'Document management system', 'text', 'index', 0, 'ระบบจัดเก็บเอกสาร', NULL, 'ລະບົບການເກັບຮັກສາເອກະສານ'),
(119, 'Document No.', 'text', 'index', 0, 'เลขที่เอกสาร', NULL, 'ເລກທີເອກະສານ'),
(120, 'Document number', 'text', 'index', 0, 'เลขที่เอกสาร', NULL, 'ເລກທີເອກະສານ'),
(121, 'Document title', 'text', 'index', 0, 'หัวข้อเอกสาร', NULL, 'ຫົວຂໍ້ເອກະສານ'),
(122, 'Download', 'text', 'index', 0, 'ดาวน์โหลด', NULL, 'ດາວໂຫຼດ'),
(123, 'Download history', 'text', 'index', 0, 'ประวัติการดาวน์โหลด', NULL, 'ປະຫວັດການດາວໂຫຼດ'),
(124, 'Downloading is a signed document', 'text', 'index', 0, 'การดาวน์โหลดถือเป็นการลงชื่อรับเอกสาร', NULL, 'ການດາວໂຫຼດຖືວ່າເປັນການລົງຊື່ຮັບເອກະສານ'),
(125, 'Drag and drop to reorder', 'text', 'index', 0, 'ลากและวางเพื่อจัดลำดับใหม่', NULL, 'ລາກແລ້ວວາງລົງເພື່ອຈັດຮຽງໃໝ່'),
(126, 'E-Receive', 'text', 'index', 0, 'ทะเบียนหนังสือรับ', NULL, 'ທະບຽນຮັບເອກະສານ'),
(127, 'Edit', 'text', 'index', 0, 'แก้ไข', NULL, 'ແກ້ໄຂ'),
(128, 'Editing your account', 'text', 'index', 0, 'แก้ไขข้อมูลส่วนตัว', NULL, 'ແກ້ໄຂຂໍ້ມູນສ່ວນຕົວສະມາຊິກ'),
(129, 'Email', 'text', 'index', 0, 'อีเมล', NULL, 'ອີເມວ'),
(130, 'Email address used for login or request a new password', 'text', 'index', 0, 'ที่อยู่อีเมล ใช้สำหรับการเข้าระบบหรือการขอรหัสผ่านใหม่', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ສຳລັບການເຂົ້າລະບົບຫຼືການຂໍລະຫັດໃໝ່'),
(131, 'Email address verification', 'text', 'index', 0, 'ยืนยันที่อยู่อีเมล', NULL, 'ຢືນຢັນທີ່ຢູ່ອີເມວ'),
(132, 'Email addresses for sender and do not reply such as no-reply@domain.tld', 'text', 'index', 0, 'ทีอยู่อีเมลใช้เป็นผู้ส่งจดหมาย สำหรับจดหมายที่ไม่ต้องการตอบกลับ เช่น no-reply@domain.tld', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ເປັນຜູ້ສົ່ງຈົດໝາຍ ສຳລັບຈົດໝາຍທີ່ບໍ່ຕ້ອງການຕອບກັບເຊັ່ນ no-reply@domain.tld'),
(133, 'Email encoding', 'text', 'index', 0, 'รหัสภาษาของจดหมาย', NULL, 'ລະຫັດພາສາຂອງຈົດໝາຍ'),
(134, 'Email settings', 'text', 'index', 0, 'ตั้งค่าอีเมล', NULL, 'ຕັ້ງຄ່າອີເມວ'),
(135, 'Email was not verified', 'text', 'index', 0, 'ยังไม่ได้ยืนยันอีเมล', NULL, 'ອີເມວບໍ່ໄດ້ຖືກຢືນຢັນ'),
(136, 'Emailing', 'text', 'index', 0, 'การส่งอีเมล', NULL, 'ສົ່ງອີເມວ'),
(137, 'Enable SSL encryption for sending email', 'text', 'index', 0, 'เปิดใช้งานการเข้ารหัส SSL สำหรับการส่งอีเมล', NULL, 'ເປີດໃຊ້ການເຂົ້າລະຫັດ SSL ສຳລັບການສົ່ງອີເມວ'),
(138, 'English lowercase letters and numbers, not less than 6 digits', 'text', 'index', 0, 'ภาษาอังกฤษตัวพิมพ์เล็กและตัวเลข ไม่น้อยกว่า 6 หลัก', NULL, 'ໂຕພິມນ້ອຍພາສາອັງກິດ ແລະຕົວເລກ, ບໍ່ຕໍ່າກວ່າ 6 ຕົວເລກ'),
(139, 'Enter the domain name you want to allow or enter * for all domains. or leave it blank if you want to use it on this domain only', 'text', 'index', 0, 'กรอกชื่อโดเมนที่ต้องการอนุญาต หรือกรอก * สำหรับทุกโดเมน หรือเว้นว่างไว้ถ้าต้องการให้ใช้งานได้บนโดเมนนี้เท่านั้น', NULL, 'ໃສ່ຊື່ໂດເມນທີ່ທ່ານຕ້ອງການທີ່ຈະອະນຸຍາດໃຫ້ຫຼືໃສ່ * ສໍາລັບໂດເມນທັງຫມົດ. ຫຼືປ່ອຍໃຫ້ມັນຫວ່າງຖ້າທ່ານຕ້ອງການໃຊ້ມັນຢູ່ໃນໂດເມນນີ້ເທົ່ານັ້ນ'),
(140, 'Enter the email address registered. A new password will be sent to this email address.', 'text', 'index', 0, 'กรอกที่อยู่อีเมลที่ลงทะเบียนไว้ ระบบจะส่งรหัสผ่านใหม่ไปยังที่อยู่อีเมลนี้', NULL, 'ເພີ່ມທີ່ຢູ່ອີເມວທີ່ລົງທະບຽນໄວ້ ລະບົບຈະສົ່ງລະຫັດຜ່ານໃໝ່ໄປຍັງທີ່ຢູ່ອີເມວນີ້'),
(141, 'Enter the LINE user ID you received when adding friends. Or type userId sent to the official account to request a new user ID. This information is used for receiving private messages from the system via LINE.', 'text', 'index', 0, 'กรอก user ID ของไลน์ที่ได้ตอนเพิ่มเพื่อน หรือพิมพ์คำว่า userId ส่งไปยังบัญชีทางการเพื่อขอ user ID ใหม่ ข้อมูลนี้ใช้สำหรับการรับข้อความส่วนตัวที่มาจากระบบผ่านไลน์', NULL, 'ໃສ່ user ID ຂອງ LINE ທີ່ທ່ານໄດ້ຮັບໃນເວລາເພີ່ມເພື່ອນ. ຫຼືພິມ userId ທີ່ຖືກສົ່ງໄປຫາບັນຊີທາງການເພື່ອຮ້ອງຂໍ user ID ໃຫມ່. ຂໍ້ມູນນີ້ແມ່ນໃຊ້ສໍາລັບການຮັບຂໍ້ຄວາມສ່ວນຕົວຈາກລະບົບຜ່ານ LINE.'),
(142, 'Enter your password again', 'text', 'index', 0, 'กรอกรหัสผ่านของคุณอีกครั้ง', NULL, 'ໃສ່ລະຫັດຜ່ານຂອງທ່ານອີກຄັ້ງ'),
(143, 'entries', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(144, 'Equipment', 'text', 'index', 0, 'อุปกรณ์', NULL, 'ອຸປະກອນ'),
(145, 'Expiration date', 'text', 'index', 0, 'วันหมดอายุ', NULL, 'ວັນໝົດອາຍຸ'),
(146, 'Export', 'text', 'index', 0, 'ส่งออก', NULL, 'ສົ່ງອອກ'),
(147, 'Fax', 'text', 'index', 0, 'โทรสาร', NULL, 'ແຟັກ'),
(148, 'File', 'text', 'index', 0, 'ไฟล์', NULL, 'ແຟ້ມ'),
(149, 'File name', 'text', 'index', 0, 'ชื่อไฟล์', NULL, 'ຊື່ແຟ້ມຂໍ້ມູນ'),
(150, 'File not found', 'text', 'index', 0, 'ไม่พบไฟล์ที่ต้องการ', NULL, 'ບໍ່ພົບແຟ້ມທີ່ຕ້ອງການ'),
(151, 'File size is less than :size', 'text', 'index', 0, 'ขนาดของไฟล์ไม่เกิน :size', NULL, 'ຂະໜາດຂອງແຟ້ມບໍ່ເກີນ:size'),
(152, 'Find your transaction history by', 'text', 'index', 0, 'ค้นหาประวัติการทำรายการได้จาก', NULL, 'ຄົ້ນຫາປະວັດການເຮັດລາຍະການໄດ້ຈາກ'),
(153, 'Footer', 'text', 'index', 0, 'ส่วนท้าย', NULL, 'ສ່ວນທ້າຍ'),
(154, 'for login by LINE account', 'text', 'index', 0, 'สำหรับการเข้าระบบโดยบัญชีไลน์', NULL, 'ສໍາລັບການເຂົ້າສູ່ລະບົບດ້ວຍບັນຊີ LINE'),
(155, 'Forgot', 'text', 'index', 0, 'ลืมรหัสผ่าน', NULL, 'ລືມລະຫັດຜ່ານ'),
(156, 'from', 'text', 'index', 0, 'จาก', NULL, 'ຈາກ'),
(157, 'General', 'text', 'index', 0, 'ทั่วไป', NULL, 'ທົ່ວໄປ'),
(158, 'General site settings', 'text', 'index', 0, 'ตั้งค่าพื้นฐานของเว็บไซต์', NULL, 'ຕັ້ງຄ່າພື້ນຖານຂອງເວັບໄຊ'),
(159, 'Get new password', 'text', 'index', 0, 'ขอรหัสผ่าน', NULL, 'ຂໍລະຫັດຜ່ານ'),
(160, 'go to page', 'text', 'index', 0, 'ไปหน้าที่', NULL, 'ໄປທີ່ໜ້າ'),
(161, 'Header', 'text', 'index', 0, 'ส่วนหัว', NULL, 'ສ່ວນຫົວ'),
(162, 'Height', 'text', 'index', 0, 'สูง', NULL, 'ສູງ'),
(163, 'Home', 'text', 'index', 0, 'หน้าหลัก', NULL, 'ໜ້າຫຼັກ'),
(164, 'How to define user authentication for mail servers. If you enable it, you must configure below correctly.', 'text', 'index', 0, 'กำหนดวิธีการตรวจสอบผู้ใช้สำหรับเมล์เซิร์ฟเวอร์ หากคุณเปิดใช้งานคุณต้องกำหนดค่าต่างๆด้านล่างถูกต้อง', NULL, 'ກຳນົດວິທີການກວດສອບຜູ້ໃຊ້ສຳລັບເມນເຊິບເວີຫາກທ່ານເປີດໃຊ້ການທ່ານຕ້ອງກຳນົດຄ່າຕ່າງໆດ້ານລຸ່ມຖືກຕ້ອງ'),
(165, 'Identification No.', 'text', 'index', 0, 'เลขประชาชน', NULL, 'ເລກບັດປະຈຳຕົວ'),
(166, 'Image', 'text', 'index', 0, 'รูปภาพ', NULL, 'ຮູບພາບ'),
(167, 'Image size is in pixels', 'text', 'index', 0, 'ขนาดของรูปภาพเป็นพิกเซล', NULL, 'ຂະໜາດຂອງຮູບພາບເປັນພິກເຊວ'),
(168, 'Import', 'text', 'index', 0, 'นำเข้า', NULL, 'ນຳເຂົ້າ'),
(169, 'Installed modules', 'text', 'index', 0, 'โมดูลที่ติดตั้งแล้ว', NULL, 'ໂມດູນທີ່ຕິດຕັ້ງ'),
(170, 'Invalid :name', 'text', 'index', 0, ':name ไม่ถูกต้อง', NULL, ':name ບໍ່ຖືກຕ້ອງ'),
(171, 'Job today', 'text', 'index', 0, 'งานซ่อมวันนี้', NULL, 'ວຽກຊ່ອມວັນນີ້'),
(172, 'Key', 'text', 'index', 0, 'คีย์', NULL, 'ແປ້ນພີມ'),
(173, 'Language', 'text', 'index', 0, 'ภาษา', NULL, 'ພາສາ'),
(174, 'Leave empty for generate auto', 'text', 'index', 0, 'เว้นว่างไว้เพื่อสร้างโดยอัตโนมัติ', NULL, 'ປ່ອຍຫວ່າງໄວ້ເພື່ອສ້າງອັດໂນມັດ'),
(175, 'LINE official account (with @ prefix, e.g. @xxxx)', 'text', 'index', 0, 'บัญชีทางการของไลน์ (มี @ นำหน้า เช่น @xxxx)', NULL, 'ບັນຊີທາງການຂອງ LINE (ມີ @ ຄໍານໍາຫນ້າ, ເຊັ່ນ: @xxxx)'),
(176, 'LINE settings', 'text', 'index', 0, 'ตั้งค่าไลน์', NULL, 'ຕັ້ງ​ຄ່າ LINE'),
(177, 'List of', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(178, 'List of IPs that allow connection 1 line per 1 IP', 'text', 'index', 0, 'รายการไอพีแอดเดรสทั้งหมดที่อนุญาต 1 บรรทัดต่อ 1 ไอพี', NULL, 'ລາຍຊື່ IP ທີ່ອະນຸຍາດໃຫ້ເຊື່ອມຕໍ່ 1 ເສັ້ນຕໍ່ 1 IP'),
(179, 'Local time', 'text', 'index', 0, 'เวลาท้องถิ่น', NULL, 'ເວລາທ້ອງຖິ່ນ'),
(180, 'Login', 'text', 'index', 0, 'เข้าสู่ระบบ', NULL, 'ເຂົ້າສູ່ລະບົບ'),
(181, 'Login as', 'text', 'index', 0, 'เข้าระบบเป็น', NULL, 'ເຂົ້າ​ສູ່​ລະ​ບົບ​ເປັນ'),
(182, 'Login by', 'text', 'index', 0, 'เข้าระบบโดย', NULL, 'ເຂົ້າສູ່ລະບົບໂດຍ'),
(183, 'Login information', 'text', 'index', 0, 'ข้อมูลการเข้าระบบ', NULL, 'ຂໍ້ມູນການເຂົ້າລະບົບ'),
(184, 'Login page', 'text', 'index', 0, 'หน้าเข้าสู่ระบบ', NULL, 'ໜ້າເຂົ້າສູ່ລະບົບ'),
(185, 'Login with an existing account', 'text', 'index', 0, 'เข้าระบบด้วยบัญชีสมาชิกที่มีอยู่แล้ว', NULL, 'ເຂົ້າລະບົບດ້ວຍບັນຊີສະມາຊິກທີ່ມີຢູ່ແລ້ວ'),
(186, 'Logo', 'text', 'index', 0, 'โลโก', NULL, 'ໂລໂກ'),
(187, 'Logout', 'text', 'index', 0, 'ออกจากระบบ', NULL, 'ອອກຈາກລະບົບ'),
(188, 'Logout successful', 'text', 'index', 0, 'ออกจากระบบเรียบร้อย', NULL, 'ອອກຈາກລະບົບຮຽບຮ້ອຍ'),
(189, 'Mail program', 'text', 'index', 0, 'โปรแกรมส่งอีเมล', NULL, 'ໂປຮແກຮມສົ່ງອີເມວ'),
(190, 'Mail server', 'text', 'index', 0, 'เซิร์ฟเวอร์อีเมล', NULL, 'ເຊີບເວີອີເມວ'),
(191, 'Mail server port number (default is 25, for GMail used 465, 587 for DirectAdmin).', 'text', 'index', 0, 'หมายเลขพอร์ตของเมล์เซิร์ฟเวอร์ (ค่าปกติคือ 25, สำหรับ gmail ใช้ 465, 587 สำหรับ DirectAdmin)', NULL, 'ໝາຍເລກພອດຂອງເມວເຊີບເວີ(ຄ່າປົກກະຕິຄື 25, ສຳລັບ gmail ໃຊ້ 465, 587 ສຳລັບ DirectAdmin)'),
(192, 'Mail server settings', 'text', 'index', 0, 'ค่ากำหนดของเมล์เซิร์ฟเวอร์', NULL, 'ຄ່າກຳນົດຂອງເມວເຊີບເວີ'),
(193, 'Manage languages', 'text', 'index', 0, 'จัดการภาษา', NULL, 'ຈັດການພາສາ'),
(194, 'Member list', 'text', 'index', 0, 'รายชื่อสมาชิก', NULL, 'ລາຍຊື່ສະມາຊິກ'),
(195, 'Member status', 'text', 'index', 0, 'สถานะสมาชิก', NULL, 'ສະຖານະສະມາຊິກ'),
(196, 'Message', 'text', 'index', 0, 'ข้อความ', NULL, 'ຂໍ້ຄວາມ'),
(197, 'Message displayed on login page', 'text', 'index', 0, 'ข้อความแสดงในหน้าเข้าสู่ระบบ', NULL, 'ຂໍ້ຄວາມສະແດງຢູ່ໃນຫນ້າເຂົ້າສູ່ລະບົບ'),
(198, 'Module', 'text', 'index', 0, 'โมดูล', NULL, 'ໂມດູນ'),
(199, 'Module settings', 'text', 'index', 0, 'ตั้งค่าโมดูล', NULL, 'ຕັ້ງຄ່າໂມດູນ'),
(200, 'Necessary cookies', 'text', 'index', 0, 'คุกกี้พื้นฐานที่จำเป็น', NULL, 'ຄຸກກີພື້ນຖານທີ່ຈໍາເປັນ'),
(201, 'New', 'text', 'index', 0, 'ใหม่', NULL, 'ໃໝ່'),
(202, 'New document', 'text', 'index', 0, 'เอกสารใหม่', NULL, 'ເອກະສານໃໝ່'),
(203, 'New members', 'text', 'index', 0, 'สมาชิกใหม่', NULL, 'ສະມາຊິກໃໝ່'),
(204, 'no larger than :size', 'text', 'index', 0, 'ขนาดไม่เกิน :size', NULL, 'ຂະໜາດບໍ່ເກີນ :size'),
(205, 'No need to fill in English text. If the English text matches the Key', 'text', 'index', 0, 'ไม่จำเป็นต้องกรอกข้อความในภาษาอังกฤษ หากข้อความในภาษาอังกฤษตรงกับคีย์', NULL, 'ບໍ່ຈຳເປັນເພີ່ມຂໍ້ຄວາມໃນພາສາອັງກິດຫາກຂໍ້ຄວາມໃນພາສານອັງກົງກັບແປ້ນພີມ'),
(206, 'not a registered user', 'text', 'index', 0, 'ไม่พบสมาชิกนี้ลงทะเบียนไว้', NULL, 'ບໍ່ພົບສະມາຊິກນີ້ລົງທະບຽນໄວ້'),
(207, 'Not specified', 'text', 'index', 0, 'ไม่ระบุ', NULL, 'ບໍ່ໄດ້ກໍານົດ'),
(208, 'Note or additional notes', 'text', 'index', 0, 'คำอธิบายหรือหมายเหตุเพิ่มเติม', NULL, 'ຄໍາອະທິບາຍຫລືຫມາຍເຫດເພີ່ມເຕີມ'),
(209, 'Number such as %04d (%04d means 4 digits, maximum 11 digits)', 'text', 'index', 0, 'เลขที่ เช่น %04d (%04d หมายถึง ตัวเลข 4 หลัก สูงสุด 11 หลัก)', NULL, 'ຕົວເລກເຊັ່ນ %04d (%04d ຫມາຍຄວາມວ່າ 4 ຕົວເລກ, ສູງສຸດ 11 ຕົວເລກ)'),
(210, 'Order', 'text', 'index', 0, 'ลำดับ', NULL, 'ລຳດັບ'),
(211, 'Order of persons in positions', 'text', 'index', 0, 'ลำดับบุคคลในตำแหน่ง', NULL, 'ລຳດັບບຸກຄົນໃນຕຳແໜ່ງ'),
(212, 'Other', 'text', 'index', 0, 'อื่นๆ', NULL, 'ອື່ນໆ'),
(213, 'Page details', 'text', 'index', 0, 'รายละเอียดของหน้า', NULL, 'ລາຍລະອຽດຂອງໜ້າ'),
(214, 'Password', 'text', 'index', 0, 'รหัสผ่าน', NULL, 'ລະຫັດຜ່ານ'),
(215, 'Password of the mail server. (To change the fill.)', 'text', 'index', 0, 'รหัสผ่านของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ລະຫັດຜ່ານຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(216, 'Passwords must be at least four characters', 'text', 'index', 0, 'รหัสผ่านต้องไม่น้อยกว่า 4 ตัวอักษร', NULL, 'ລະຫັດຜ່ານຕ້ອງບໍ່ຕ່ຳກວ່າ 4 ຕົວອັກສອນ'),
(217, 'Permission', 'text', 'index', 0, 'สิทธิ์การใช้งาน', NULL, 'ສິດໃນການໃຊ້ວຽກ'),
(218, 'Phone', 'text', 'index', 0, 'โทรศัพท์', NULL, 'ເບີໂທລະສັບ'),
(219, 'Please check the new member registration.', 'text', 'index', 0, 'กรุณาตรวจสอบการลงทะเบียนสมาชิกใหม่', NULL, 'ກະລຸນາກວດສອບການລົງທະບຽນສະມາຊິກໃໝ່.'),
(220, 'Please click the link to verify your email address.', 'text', 'index', 0, 'กรุณาคลิกลิงค์เพื่อยืนยันที่อยู่อีเมล', NULL, 'ກະລຸນາຄລິກທີ່ລິ້ງເພື່ອຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ'),
(221, 'Please fill in', 'text', 'index', 0, 'กรุณากรอก', NULL, 'ກະລຸນາຕື່ມຂໍ້ມູນໃສ່'),
(222, 'Please fill up this form', 'text', 'index', 0, 'กรุณากรอกแบบฟอร์มนี้', NULL, 'ກະລຸນາຕື່ມແບບຟອມນີ້'),
(223, 'Please login', 'text', 'index', 0, 'กรุณาเข้าระบบ', NULL, 'ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(224, 'Please select', 'text', 'index', 0, 'กรุณาเลือก', NULL, 'ກະລຸນາເລືອກ'),
(225, 'Please select :name at least one item', 'text', 'index', 0, 'กรุณาเลือก :name อย่างน้อย 1 รายการ', NULL, 'ກະລຸນາເລືອກ :name ຢ່າງໜ້ອຍ 1 ລາຍການ'),
(226, 'Port', 'text', 'index', 0, 'พอร์ต', NULL, 'ພອດ'),
(227, 'Prefix', 'text', 'index', 0, 'คำนำหน้า', NULL, 'ຄຳນຳໜ້າ'),
(228, 'Prefix, if changed The number will be counted again. You can enter %Y%M (year, month).', 'text', 'index', 0, 'คำนำหน้า ถ้ามีการเปลี่ยนแปลง เลขที่จะนับหนึ่งใหม่ สามารถใส่ %Y%M (ปี, เดือน) ได้', NULL, 'ຄໍານໍາຫນ້າ, ຖ້າມີການປ່ຽນແປງ ຕົວເລກທີ່ຈະນັບອີກຄັ້ງສາມາດໃສ່ເປັນ %Y%M (ປີ, ເດືອນ).'),
(229, 'Privacy Policy', 'text', 'index', 0, 'นโยบายความเป็นส่วนตัว', NULL, 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ'),
(230, 'Profile', 'text', 'index', 0, 'ข้อมูลส่วนตัว', NULL, 'ຂໍ້ມູນສ່ວນຕົວ'),
(231, 'Province', 'text', 'index', 0, 'จังหวัด', NULL, 'ແຂວງ'),
(232, 'Receipt No.', 'text', 'index', 0, 'เลขที่ใบรับ', NULL, 'ເລກທີ່ໃບຮັບ'),
(233, 'Receive', 'text', 'index', 0, 'ลงชื่อรับเอกสาร', NULL, 'ເຊັນເພື່ອຮັບເອກະສານ'),
(234, 'Receive Document', 'text', 'index', 0, 'รับเอกสารเข้าระบบ', NULL, 'ຮັບເອກະສານເຂົ້າໃນລະບົບ'),
(235, 'Received', 'text', 'index', 0, 'รับแล้ว', NULL, 'ຮັບແລ້ວ'),
(236, 'Received date', 'text', 'index', 0, 'วันที่รับซ่อม', NULL, 'ວັນທີ່ແຈ້ງຊ່ອມ'),
(237, 'Received document', 'text', 'index', 0, 'เอกสารขาเข้า', NULL, 'ເອກະສານຂາເຂົ້າ'),
(238, 'Receiver', 'text', 'index', 0, 'ผู้รับ', NULL, 'ຜູ້ຮັບ'),
(239, 'Recipient', 'text', 'index', 0, 'ผู้รับเอกสาร', NULL, 'ຜູ້ຮັບເອກະສານ'),
(240, 'Register', 'text', 'index', 0, 'สมัครสมาชิก', NULL, 'ສະໝັກສະມາຊິກ'),
(241, 'Register successfully Please log in', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อยแล้วกรุณาเข้าสู่ระบบ', NULL, 'ລົງທະບຽນຢ່າງສຳເລັດຜົນກະລຸນາເຂົ້າສູ່ລະບົບ'),
(242, 'Register successfully, We have sent complete registration information to :email', 'text', 'index', 0, 'ลงทะเบียนสมาชิกใหม่เรียบร้อย เราได้ส่งข้อมูลการลงทะเบียนไปยัง :email', NULL, 'ລົງທະບຽນສຳເລັດແລ້ວ ເຮົາໄດ້ສົ່ງຂໍ້ມູນການລົງທະບຽນໄປທີ່ :email'),
(243, 'Register to receive documents', 'text', 'index', 0, 'ลงทะเบียนเอกสาร', NULL, 'ລົງທະບຽນເອກະສານ'),
(244, 'Registered successfully Please check your email :email and click the link to verify your email.', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อย กรุณาตรวจสอบอีเมล์ :email และคลิงลิงค์ยืนยันอีเมล', NULL, 'ລົງທະບຽນສົບຜົນສໍາເລັດ ກະ​ລຸ​ນາ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ :email ແລະ​ຄລິກ​ໃສ່​ການ​ເຊື່ອມ​ຕໍ່​ເພື່ອ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ​.'),
(245, 'Registration number of the document', 'text', 'index', 0, 'เลขทะเบียนของเอกสาร', NULL, 'ເລກທະບຽນຂອງເອກະສານ'),
(246, 'Remember me', 'text', 'index', 0, 'จำการเข้าระบบ', NULL, 'ຈົດຈຳການເຂົ້າລະບົບ'),
(247, 'Remove', 'text', 'index', 0, 'ลบ', NULL, 'ລຶບ'),
(248, 'Report', 'text', 'index', 0, 'รายงาน', NULL, 'ລາຍງານ'),
(249, 'resized automatically', 'text', 'index', 0, 'ปรับขนาดอัตโนมัติ', NULL, 'ປັບຂະໜາດອັດຕະໂນມັດ'),
(250, 'Save', 'text', 'index', 0, 'บันทึก', NULL, 'ບັນທຶກ'),
(251, 'Save and email completed', 'text', 'index', 0, 'บันทึกและส่งอีเมลเรียบร้อย', NULL, 'ບັນທຶກແລະສົ່ງອີເມວຮຽນຮ້ອຍ'),
(252, 'Saved successfully', 'text', 'index', 0, 'บันทึกเรียบร้อย', NULL, 'ບັນທຶກຮຽບຮ້ອຍ'),
(253, 'scroll to top', 'text', 'index', 0, 'เลื่อนขึ้นด้านบน', NULL, 'ເລື່ອນຂື້ນດ້ານເທິງ'),
(254, 'Search', 'text', 'index', 0, 'ค้นหา', NULL, 'ຄົ້ນຫາ'),
(255, 'Search <strong>:search</strong> found :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ค้นหา <strong>:search</strong> พบ :count รายการ แสดงรายการที่ :start - :end หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ຄົ້ນຫາ <strong>:search</strong> ພົບ :count ລາຍການ ສະແດງລາຍການທີ່:start - :end ໜ້າທີ່:page ຈາກທັງໝົດ :total ໜ້າ'),
(256, 'select all', 'text', 'index', 0, 'เลือกทั้งหมด', NULL, 'ເລືອກທັງໝົດ'),
(257, 'Select the file or specify the URL of the document', 'text', 'index', 0, 'เลือกไฟล์ หรือระบุ URL ของเอกสาร', NULL, 'ເລືອກເອກະສານຫຼືລະບຸ URL ຂອງເອກະສານ'),
(258, 'Send a welcome email to new members', 'text', 'index', 0, 'ส่งข้อความต้อนรับสมาชิกใหม่', NULL, 'ສົ່ງອີເມວຕ້ອນຮັບກັບສະມາຊິກໃຫມ່'),
(259, 'Send an email notification to the recipient', 'text', 'index', 0, 'ส่งอีเมลแจ้งไปยังผู้รับ', NULL, 'ສົ່ງອີເມວແຈ້ງເຕືອນໃຫ້ຜູ້ຮັບ'),
(260, 'Send an email to members', 'text', 'index', 0, 'ส่งอีเมลแจ้งสมาชิก', NULL, 'ສົ່ງອີເມວແຈ້ງສະມາຊິກ'),
(261, 'Send Document', 'text', 'index', 0, 'ส่งเอกสาร', NULL, 'ສົ່ງເອກະສານ'),
(262, 'Send login authorization email', 'text', 'index', 0, 'ส่งอีเมลอนุมัติการเข้าระบบ', NULL, 'ສົ່ງອີເມວການອະນຸຍາດເຂົ້າສູ່ລະບົບ'),
(263, 'Send member confirmation email', 'text', 'index', 0, 'ส่งอีเมลยืนยันสมาชิก', NULL, 'ສົ່ງອີເມລ໌ຢືນຢັນສະມາຊິກ'),
(264, 'send message to user When a user adds LINE&#039;s official account as a friend', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ใช้ เมื่อผู้ใช้เพิ่มบัญชีทางการของไลน์เป็นเพื่อน', NULL, 'ສົ່ງຂໍ້ຄວາມຫາຜູ້ໃຊ້ ເມື່ອຜູ້ໃຊ້ເພີ່ມບັນຊີທາງການຂອງ LINE ເປັນໝູ່'),
(265, 'Send notification messages When making a transaction', 'text', 'index', 0, 'ส่งข้อความแจ้งเตือนเมื่อมีการทำรายการ', NULL, 'ສົ່ງຂໍ້ຄວາມແຈ້ງເຕືອນເມື່ອມີການເຮັດທຸລະກຳ'),
(266, 'Sender', 'text', 'index', 0, 'ผู้ส่ง', NULL, 'ຜູ້ສົ່ງ'),
(267, 'Sent document', 'text', 'index', 0, 'เอกสารขาออก', NULL, 'ເອກະສານຂາອອກ'),
(268, 'Sent from', 'text', 'index', 0, 'ส่งมาจาก', NULL, 'ສົ່ງມາຈາກ'),
(269, 'Serial/Registration number', 'text', 'index', 0, 'หมายเลขเครื่อง/เลขทะเบียน', NULL, 'ຫມາຍເລກເຄື່ອງ/ເລກທະບຽນ'),
(270, 'Server time', 'text', 'index', 0, 'เวลาเซิร์ฟเวอร์', NULL, 'ເວລາຂອງເຊີບເວີ'),
(271, 'Set the application for send an email', 'text', 'index', 0, 'เลือกโปรแกรมที่ใช้ในการส่งอีเมล', NULL, 'ເລືອກໂປຮແກຮມທີ່ໃຊ້ໃນການສົ່ງອີເມວ'),
(272, 'Setting up the email system', 'text', 'index', 0, 'การตั้งค่าเกี่ยวกับระบบอีเมล', NULL, 'ການຕັ້ງຄ່າກ່ຽວກັບລະບົບອີເມວ'),
(273, 'Settings', 'text', 'index', 0, 'ตั้งค่า', NULL, 'ຕັ້ງຄ່າ'),
(274, 'Settings the conditions for member login', 'text', 'index', 0, 'ตั้งค่าเงื่อนไขในการตรวจสอบการเข้าสู่ระบบ', NULL, 'ຕັ້ງເງື່ອນໄຂການກວດສອບການເຂົ້າລະບົບ'),
(275, 'Settings the timing of the server to match the local time', 'text', 'index', 0, 'ตั้งค่าเขตเวลาของเซิร์ฟเวอร์ ให้ตรงกันกับเวลาท้องถิ่น', NULL, 'ຕັ້ງຄ່າເຂດເວລາຂອງເຊີບເວີ ໃຫ້ກົງກັບເວລາທ້ອງຖີ່ນ'),
(276, 'Sex', 'text', 'index', 0, 'เพศ', NULL, 'ເພດ'),
(277, 'Short description about your website', 'text', 'index', 0, 'ข้อความสั้นๆอธิบายว่าเป็นเว็บไซต์เกี่ยวกับอะไร', NULL, 'ຂໍ້ຄວາມສັ້ນໆ ອະທິບາຍວ່າເປັນເວັບໄຊກ່ຽວກັບຫຍັງ'),
(278, 'Show', 'text', 'index', 0, 'แสดง', NULL, 'ສະແດງ'),
(279, 'Show web title with logo', 'text', 'index', 0, 'แสดงชื่อเว็บและโลโก', NULL, 'ສະແດງຊື່ເວັບແລະໂລໂກ້'),
(280, 'Site Name', 'text', 'index', 0, 'ชื่อของเว็บไซต์', NULL, 'ຊື່ຂອງເວັບໄຊ'),
(281, 'Site settings', 'text', 'index', 0, 'ตั้งค่าเว็บไซต์', NULL, 'ຕັ້ງຄ່າເວັບໄຊ'),
(282, 'size :width*:height pixel', 'text', 'index', 0, 'ขนาด :width*:height พิกเซล', NULL, 'ຂະໜາດ :width*:height ຟິດເຊວล'),
(283, 'Size of', 'text', 'index', 0, 'ขนาดของ', NULL, 'ຂະໜາດຂອງ'),
(284, 'Size of the file upload', 'text', 'index', 0, 'ขนาดของไฟล์อัปโหลด', NULL, 'ຂະໜາດຂອງແຟ້ມອັບໂຫຼດ'),
(285, 'skip to content', 'text', 'index', 0, 'ข้ามไปยังเนื้อหา', NULL, 'ຂ້າມໄປຍັງເນື້ອຫາ'),
(286, 'Sorry', 'text', 'index', 0, 'ขออภัย', NULL, 'ຂໍໂທດ'),
(287, 'Sorry, cannot find a page called Please check the URL or try the call again.', 'text', 'index', 0, 'ขออภัย ไม่พบหน้าที่เรียก โปรดตรวจสอบ URL หรือลองเรียกอีกครั้ง', NULL, 'ຂໍ​ອະ​ໄພ, ບໍ່​ສາ​ມາດ​ຊອກ​ຫາ​ຫນ້າ​ທີ່​ຮ້ອງ​ຂໍ. ກະ​ລຸ​ນາ​ກວດ​ສອບ URL ຫຼື​ພະ​ຍາ​ຍາມ​ດຶງ​ຂໍ້​ມູນ​ອີກ​ເທື່ອ​ຫນຶ່ງ.'),
(288, 'Sorry, Item not found It&#39;s may be deleted', 'text', 'index', 0, 'ขออภัย ไม่พบรายการที่เลือก รายการนี้อาจถูกลบไปแล้ว', NULL, 'ຂໍໂທດ ບໍ່ພົບລາຍການທີ່ເລືອກ ລາຍການນີ້ອາດຖືກລຶບໄປແລ້ວ'),
(289, 'Specify the file extension that allows uploading. English lowercase letters and numbers 2-4 characters to separate each type with a comma (,) and without spaces. eg zip,rar,doc,docx', 'text', 'index', 0, 'ระบุนามสกุลของไฟล์ที่สามารถอัปโหลดได้ ภาษาอังกฤษตัวพิมพ์เล็กและตัวเลขสองถึงสี่ตัวอักษร คั่นแต่ละรายการด้วยลูกน้ำ (,)', NULL, 'ລະບົບນາມສະກຸນຂອງແຟ້ມທີ່ສາມາດອັບໂຫຼດໄດ້ ພາສາອັງກິດຕົວພີມນ້ອຍແລະຕົວເລກສອງເຖິງສີ່ຕົວອັກສອນ ຄັ່ນແຕ່ລະລາຍການດ້ວຍເຄື່ອງໝາຍຈຸດ(,)'),
(290, 'Specify the language code of the email, as utf-8', 'text', 'index', 0, 'ระบุรหัสภาษาของอีเมลที่ส่ง เช่น utf-8', NULL, 'ລະບຸລະຫັດພາສາຂອງອີເມວທີ່ສົ່ງເຊັ່ນ utf-8'),
(291, 'Start a new line with the web name', 'text', 'index', 0, 'ขึ้นบรรทัดใหม่ชื่อเว็บ', NULL, 'ເລີ່ມແຖວໃໝ່ຊື່ເວັບ'),
(292, 'Status', 'text', 'index', 0, 'สถานะ', NULL, 'ສະຖານະ'),
(293, 'Status for general members', 'text', 'index', 0, 'สถานะสำหรับสมาชิกทั่วไป', NULL, 'ສະຖານະສຳລັບສະມາຊິກທົ່ວໄປ'),
(294, 'Style', 'text', 'index', 0, 'รูปแบบ', NULL, 'ຮູບແບບ'),
(295, 'Successfully imported :count items', 'text', 'index', 0, 'นำเข้าสำเร็จ :count รายการ', NULL, 'ນຳເຂົ້າສຳເລັດ:count ລາຍການ'),
(296, 'Text color', 'text', 'index', 0, 'สีตัวอักษร', NULL, 'ສີຕົວອັກສອນ'),
(297, 'The e-mail address of the person or entity that has the authority to make decisions about the collection, use or dissemination of personal data.', 'text', 'index', 0, 'ที่อยู่อีเมลของบุคคลหรือนิติบุคคลที่มีอำนาจตัดสินใจเกี่ยวกับการเก็บรวบรวม ใช้ หรือเผยแพร่ข้อมูลส่วนบุคคล', NULL, 'ທີ່ຢູ່ອີເມລ໌ຂອງບຸກຄົນຫຼືຫນ່ວຍງານທີ່ມີອໍານາດໃນການຕັດສິນໃຈກ່ຽວກັບການລວບລວມ, ການນໍາໃຊ້ຫຼືການເຜີຍແຜ່ຂໍ້ມູນສ່ວນບຸກຄົນ.'),
(298, 'The file size larger than the limit', 'text', 'index', 0, 'ขนาดของไฟล์ใหญ่กว่าที่กำหนด', NULL, 'ຂະຫນາດຂອງໄຟໃຫຍ່ກວ່າທີ່ກໍາຫນົດ'),
(299, 'The members status of the site', 'text', 'index', 0, 'สถานะของสมาชิกของเว็บไซต์', NULL, 'ສະຖານະຂອງສະມາຂິກຂອງເວັບໄຊ'),
(300, 'The message has been sent to the admin successfully. Please wait a moment for the admin to approve the registration. You can log back in later if approved.', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ดูแลระบบเรียบร้อยแล้ว กรุณารอสักครู่เพื่อให้ผู้ดูแลระบบอนุมัติการลงทะเบียน คุณสามารถกลับมาเข้าระบบได้ในภายหลังหากได้รับการอนุมัติแล้ว', NULL, 'ຂໍ້ຄວາມດັ່ງກ່າວໄດ້ຖືກສົ່ງໄປຫາຜູ້ເບິ່ງແຍງຢ່າງສໍາເລັດຜົນ. ກະລຸນາລໍຖ້າໃຫ້ຜູ້ເບິ່ງແຍງລະບົບອະນຸມັດການລົງທະບຽນ. ທ່ານສາມາດເຂົ້າສູ່ລະບົບຄືນໄດ້ໃນພາຍຫຼັງຖ້າໄດ້ຮັບການອະນຸມັດ.'),
(301, 'The name of the document when downloaded. If empty, use the name of the uploaded file. (Thai language available)', 'text', 'index', 0, 'ชื่อของเอกสารเมื่อดาวน์โหลด ถ้าไม่ระบุช่องนี้ จะใช้ชื่อของไฟล์ที่อัปโหลด (สามารถใช้ภาษาไทยได้)', NULL, 'ຊື່ຂອງເອກະສານເມື່ອດາວໂຫຼດ ຖ້າບໍ່ລະບຸຊ່ອງນີ້ ຈະໃຊ້ຊື່ຂອງແຟ້ມທີ່ອັບໂຫຼດ(ສາມາດໃຊ້ພາສາລາວໄດ້)'),
(302, 'The name of the mail server as localhost or smtp.gmail.com (To change the settings of your email is the default. To remove this box entirely.)', 'text', 'index', 0, 'ชื่อของเมล์เซิร์ฟเวอร์ เช่น localhost หรือ smtp.gmail.com (ต้องการเปลี่ยนค่ากำหนดของอีเมลทั้งหมดเป็นค่าเริ่มต้น ให้ลบข้อความในช่องนี้ออกทั้งหมด)', NULL, 'ຊື່ຂອງເມວເຊີບເວີເຊັ່ນ localhost หรือ chitdpt@gmail.com (ຕ້ອງປ່ຽນຄ່າກຳນົດຂອງອີເມວທັງໝົດເປັນຄ່າເລີ່ມຕົ້ນ ໃຫ້ລຶບຂໍ້ຄວາມໃນຊ່ອງນີ້ອອກທັງໝົດ)'),
(303, 'The recipient is listed in the selected group can be downloaded (You can select multiple groups)', 'text', 'index', 0, 'ผู้รับในกลุ่มที่เลือกสามารถดาวน์โหลดเอกสารได้ (สามารถเลือกได้หลายกลุ่ม)', NULL, 'ຜຸ້ຮັບໃນກຸ່ມທີ່ເລືອກສາມາດດາວໂຫຼດເອກະສານໄດ້ (ສາມາດເລືອກໄດ້ຫຼາຍກຸ່ມ)'),
(304, 'The recipient was not found. or no recipients found in the selected department.', 'text', 'index', 0, 'ไม่พบผู้รับ หรือไม่พบผู้รับในแผนกที่เลือก', NULL, 'ບໍ່ພົບຜູ້ຮັບ. ຫຼືບໍ່ພົບຜູ້ຮັບໃນພະແນກທີ່ເລືອກ.'),
(305, 'The size of the files can be uploaded. (Should not exceed the value of the Server :upload_max_filesize.)', 'text', 'index', 0, 'ขนาดของไฟล์ที่สามารถอัปโหลดได้ (ไม่ควรเกินค่ากำหนดของเซิร์ฟเวอร์ :upload_max_filesize)', NULL, 'ຂະໜາດຂອງແຟ້ມທີ່ສາມາດອັບໂຫຼດໄດ້(ບໍ່ຄວນເກີນຄ່າກຳນົດຂອງເຊີບເວີ :upload_max_filesize)'),
(306, 'The type of file is invalid', 'text', 'index', 0, 'ชนิดของไฟล์ไม่รองรับ', NULL, 'ຊະນິດຂອງແຟ້ມບໍ່ຮອງຮັບ'),
(307, 'Theme', 'text', 'index', 0, 'ธีม', NULL, 'ຮູບແບບສີສັນ'),
(308, 'There are new documents sent to you at %WEBTITLE%', 'text', 'index', 0, 'มีเอกสารใหม่ส่งถึงคุณที่ %WEBTITLE%', NULL, 'ມີເອກະສານໃໝ່ສົ່ງເຖິ່ງທ່ານທີ່ %WEBTITLE%'),
(309, 'There are new documents sent to you.', 'text', 'index', 0, 'มีเอกสารใหม่ส่งถึงคุณ', NULL, 'ເອກະສານໃໝ່ໄດ້ຖືກສົ່ງໄປຫາເຈົ້າແລ້ວ.'),
(310, 'There is no need to attach files', 'text', 'index', 0, 'ไม่จำเป็นต้องแนบไฟล์', NULL, 'ບໍ່ຈໍາເປັນຕ້ອງແນບໄຟລ໌'),
(311, 'This :name already exist', 'text', 'index', 0, 'มี :name นี้อยู่ก่อนแล้ว', NULL, 'ມີ :name ນີ້ຢູ່ກ່ອນແລ້ວ'),
(312, 'This website uses cookies to provide our services. To find out more about our use of cookies, please see our :privacy.', 'text', 'index', 0, 'เว็บไซต์นี้มีการใช้คุกกี้เพื่อปรับปรุงการให้บริการ หากต้องการข้อมูลเพิ่มเติมเกี่ยวกับการใช้คุกกี้ของเรา โปรดดู :privacy', NULL, 'ເວັບໄຊທ໌ນີ້ໃຊ້ຄຸກກີເພື່ອປັບປຸງການບໍລິການ. ສໍາລັບຂໍ້ມູນເພີ່ມເຕີມກ່ຽວກັບການນໍາໃຊ້ຄຸກກີຂອງພວກເຮົາ, ເບິ່ງ :privacy'),
(313, 'Time zone', 'text', 'index', 0, 'เขตเวลา', NULL, 'ເຂດເວລາ'),
(314, 'times', 'text', 'index', 0, 'ครั้ง', NULL, 'ຄັ້ງ'),
(315, 'to', 'text', 'index', 0, 'ถึง', NULL, 'ເຖິງ'),
(316, 'To change your password, enter your password to match the two inputs', 'text', 'index', 0, 'ถ้าต้องการเปลี่ยนรหัสผ่าน กรุณากรอกรหัสผ่านสองช่องให้ตรงกัน', NULL, 'ຖ້າຕ້ອງການປ່ຽນລະຫັດຜ່ານກະລຸນາເພີ່ມລະຫັດຜ່ານສອງຊ່ອງໃຫ້ກົງກັນ'),
(317, 'Transaction date', 'text', 'index', 0, 'วันที่ทำรายการ', NULL, 'ວັນທີການເຮັດທຸລະກໍາ'),
(318, 'Transaction history', 'text', 'index', 0, 'ประวัติการทำรายการ', NULL, 'ປະວັດການເຮັດທຸລະກໍາ'),
(319, 'Type', 'text', 'index', 0, 'ประเภท', NULL, 'ປະເພດ'),
(320, 'Type of file uploads', 'text', 'index', 0, 'ชนิดของไฟล์อัปโหลด', NULL, 'ຊະນິດຂອງແຟ້ມອັບໂຫຼດ'),
(321, 'Unable to complete the transaction', 'text', 'index', 0, 'ไม่สามารถทำรายการนี้ได้', NULL, 'ບໍ່ສາມາດເຮັດລາຍການນີ້ໄດ້'),
(322, 'Upload', 'text', 'index', 0, 'อัปโหลด', NULL, 'ອັບໂຫຼດ'),
(323, 'Upload :type files', 'text', 'index', 0, 'อัปโหลดไฟล์ :type', NULL, 'ອັບໂຫຼດແຟ້ມຂໍ້ມູນ :type'),
(324, 'Uploaded by', 'text', 'index', 0, 'อัปโหลดโดย', NULL, 'ອັບໂຫຼດໂດຍ'),
(325, 'Uploaded images are resized automatically', 'text', 'index', 0, 'รูปภาพอัปโหลดปรับขนาดอัตโนมัติ', NULL, 'ຮູບພາບທີ່ອັບໂຫຼດຈະຖືກປັບຂະໜາດໂດຍອັດຕະໂນມັດ'),
(326, 'URL must begin with http:// or https://', 'text', 'index', 0, 'URL ต้องขึ้นต้นด้วย http:// หรือ https://', NULL, 'URL ຕ້ອງເລີ່ມຕົ້ນດ້ວຍ http:// ຫຼື https://'),
(327, 'Usage history', 'text', 'index', 0, 'ประวัติการใช้งาน', NULL, 'ປະ​ຫວັດ​ການ​ນໍາ​ໃຊ້​'),
(328, 'Use the theme&#039;s default settings.', 'text', 'index', 0, 'ใช้การตั้งค่าเริ่มต้นของธีม', NULL, 'ໃຊ້ການຕັ້ງຄ່າເລີ່ມຕົ້ນຂອງຮູບແບບສີສັນ.'),
(329, 'User', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(330, 'Username', 'text', 'index', 0, 'ชื่อผู้ใช้', NULL, 'ຊື່ຜູ້ໃຊ້'),
(331, 'Username for the mail server. (To change, enter a new value.)', 'text', 'index', 0, 'ชื่อผู้ใช้ของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ຊື່ຜູ້ໃຊ້ຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(332, 'Users', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(333, 'Version', 'text', 'index', 0, 'รุ่น', NULL, 'ຮຸ່ນ'),
(334, 'View', 'text', 'index', 0, 'ดู', NULL, 'ເບິ່ງ'),
(335, 'Waiting list', 'text', 'index', 0, 'รายการรอตรวจสอบ', NULL, 'ລາຍຊື່ລໍຖ້າ'),
(336, 'Waiting to check from the staff', 'text', 'index', 0, 'รอตรวจสอบจากเจ้าหน้าที่', NULL, 'ລໍຖ້າການກວດສອບຈາກພະນັກງານ'),
(337, 'Website template', 'text', 'index', 0, 'แม่แบบเว็บไซต์', NULL, 'ແມ່ແບບເວັບໄຊທ໌'),
(338, 'Website title', 'text', 'index', 0, 'ชื่อเว็บ', NULL, 'ຊື່ເວັບ'),
(339, 'Welcome', 'text', 'index', 0, 'สวัสดี', NULL, 'ສະບາຍດີ'),
(340, 'Welcome %s, login complete', 'text', 'index', 0, 'สวัสดี คุณ %s ยินดีต้อนรับเข้าสู่ระบบ', NULL, 'ສະບາຍດີທ່ານ %s ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບ'),
(341, 'Welcome new members', 'text', 'index', 0, 'ยินดีต้อนรับสมาชิกใหม่', NULL, 'ຍິນດີຕ້ອນຮັບສະມາຊິກໃໝ່'),
(342, 'When download', 'text', 'index', 0, 'เมื่อคลิกดาวน์โหลด', NULL, 'ເມື່ອກົດດາວໂຫຼດ'),
(343, 'When enabled Social accounts can be logged in as an administrator. (Some abilities will not be available)', 'text', 'index', 0, 'เมื่อเปิดใช้งาน บัญชีโซเชียลจะสามารถเข้าระบบเป็นผู้ดูแลได้ (ความสามารถบางอย่างจะไม่สามารถใช้งานได้)', NULL, 'ເມື່ອເປີດໃຊ້ງານ ບັນຊີສັງຄົມສາມາດເຂົ້າສູ່ລະບົບເປັນຜູ້ບໍລິຫານ. (ຄວາມສາມາດບາງຢ່າງຈະບໍ່ມີ)'),
(344, 'When enabled, a cookies consent banner will be displayed.', 'text', 'index', 0, 'เมื่อเปิดใช้งานระบบจะแสดงแบนเนอร์ขออนุญาตใช้งานคุ้กกี้', NULL, 'ເມື່ອເປີດໃຊ້ງານແລ້ວ, ປ້າຍໂຄສະນາການຍິນຍອມຂອງ cookies ຈະສະແດງຂຶ້ນ.'),
(345, 'When enabled, Members registered with email must also verify their email address. It is not recommended to use in conjunction with other login methods.', 'text', 'index', 0, 'เมื่อเปิดใช้งาน สมาชิกที่ลงทะเบียนด้วยอีเมลจะต้องยืนยันที่อยู่อีเมลด้วย ไม่แนะนำให้ใช้ร่วมกับการเข้าระบบด้วยช่องทางอื่นๆ', NULL, 'ເມື່ອເປີດໃຊ້ ສະມາຊິກທີ່ລົງທະບຽນກັບອີເມລ໌ຈະຕ້ອງຢືນຢັນທີ່ຢູ່ອີເມວຂອງເຂົາເຈົ້າ. ມັນບໍ່ໄດ້ຖືກແນະນໍາໃຫ້ໃຊ້ຮ່ວມກັບວິທີການເຂົ້າສູ່ລະບົບອື່ນໆ.'),
(346, 'Width', 'text', 'index', 0, 'กว้าง', NULL, 'ກວ້າງ'),
(347, 'With selected', 'text', 'index', 0, 'ทำกับที่เลือก', NULL, 'ເຮັດກັບທີ່ເລືອກ'),
(348, 'You can enter your LINE user ID below on your personal information page. to link your account to this official account', 'text', 'index', 0, 'คุณสามารถกรอก LINE user ID ด้านล่างในหน้าข้อมูลส่วนตัวของคุณ เพื่อผูกบัญชีของคุณเข้ากับบัญชีทางการนี้ได้', NULL, 'ທ່ານສາມາດໃສ່ LINE user ID ຂອງທ່ານຂ້າງລຸ່ມນີ້ຢູ່ໃນຫນ້າຂໍ້ມູນສ່ວນຕົວຂອງທ່ານ. ເພື່ອເຊື່ອມຕໍ່ບັນຊີຂອງທ່ານກັບບັນຊີທາງການນີ້'),
(349, 'You can login at', 'text', 'index', 0, 'คุณสามารถเข้าระบบได้ที่', NULL, 'ທ່ານສາມາດເຂົ້າສູ່ລະບົບໄດ້ທີ່'),
(350, 'You haven&#039;t verified your email address. Please check your email. and click the link in the email', 'text', 'index', 0, 'คุณยังไม่ได้ยืนยันที่อยู่อีเมล กรุณาตรวจสอบอีเมลของคุณ และคลิกลิงค์ในอีเมล', NULL, 'ທ່ານຍັງບໍ່ໄດ້ຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ. ກະລຸນາກວດເບິ່ງອີເມວຂອງທ່ານ. ແລະຄລິກໃສ່ການເຊື່ອມຕໍ່ໃນອີເມລ໌'),
(351, 'You want to', 'text', 'index', 0, 'คุณต้องการ', NULL, 'ທ່ານຕ້ອງການ'),
(352, 'Your account has been approved.', 'text', 'index', 0, 'บัญชีของท่านได้รับการอนุมัติเรียบร้อยแล้ว', NULL, 'ບັນຊີຂອງທ່ານໄດ້ຮັບການອະນຸມັດແລ້ວ.'),
(353, 'Your account has not been approved, please wait or contact the administrator.', 'text', 'index', 0, 'บัญชีของท่านยังไม่ได้รับการอนุมัติ กรุณารอ หรือติดต่อสอบถามไปยังผู้ดูแล', NULL, 'ບັນຊີຂອງທ່ານບໍ່ໄດ້ຮັບການອະນຸມັດ, ກະລຸນາລໍຖ້າ ຫຼືຕິດຕໍ່ຜູ້ເບິ່ງແຍງລະບົບ.'),
(354, 'Your message was sent successfully', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ที่เกี่ยวข้องเรียบร้อยแล้ว', NULL, 'ສົ່ງຂໍ້ຄວາມໄປຍັງຜູ້ຮັບຮຽບຮ້ອຍແລ້ວ'),
(355, 'Your new password is', 'text', 'index', 0, 'รหัสผ่านใหม่ของคุณคือ', NULL, 'ລະຫັດຜ່ານໃໝ່ຂອງທ່ານຄື'),
(356, 'Your registration information', 'text', 'index', 0, 'ข้อมูลการลงทะเบียนของคุณ', NULL, 'ຂໍ້ມູນການລົງທະບຽນຂອງທ່ານ'),
(357, 'Zipcode', 'text', 'index', 0, 'รหัสไปรษณีย์', NULL, 'ລະຫັດໄປສະນີ');

-- --------------------------------------------------------

--
-- Table structure for table `edms_logs`
--

CREATE TABLE `edms_logs` (
  `id` int(11) NOT NULL,
  `src_id` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `reason` text DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `topic` text NOT NULL,
  `datas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edms_logs`
--

INSERT INTO `edms_logs` (`id`, `src_id`, `module`, `action`, `create_date`, `reason`, `member_id`, `topic`, `datas`) VALUES
(1, 1, 'index', 'User', '2024-03-08 03:57:13', NULL, 1, '{LNG_Login} IP ::1', NULL),
(2, 0, 'index', 'Save', '2024-03-08 03:58:12', NULL, 1, '{LNG_General site settings}', NULL),
(3, 0, 'index', 'Save', '2024-03-08 03:59:01', NULL, 1, 'แผนก', NULL),
(4, 0, 'index', 'Save', '2024-03-08 03:59:50', NULL, 1, '{LNG_General site settings}', NULL),
(5, 0, 'index', 'Save', '2024-03-08 04:00:27', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(6, 1, 'index', 'User', '2024-03-08 04:00:40', NULL, 1, '{LNG_Login} IP ::1', NULL),
(7, 0, 'index', 'Save', '2024-03-08 04:00:51', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(8, 3, 'index', 'User', '2024-03-08 04:01:55', NULL, 3, '{LNG_Create new account} ID : 3', NULL),
(9, 3, 'index', 'User', '2024-03-08 04:02:00', NULL, 3, '{LNG_Login} IP ::1', NULL),
(10, 1, 'index', 'User', '2024-03-08 04:07:57', NULL, 1, '{LNG_Login} IP ::1', NULL),
(11, 1, 'index', 'User', '2024-03-08 04:13:57', NULL, 1, '{LNG_Login} IP ::1', NULL),
(12, 0, 'index', 'Save', '2024-03-08 04:16:07', NULL, 1, '{LNG_General site settings}', NULL),
(13, 1, 'index', 'User', '2024-03-08 04:16:47', NULL, 1, '{LNG_Login} IP ::1', NULL),
(14, 0, 'index', 'Save', '2024-03-08 04:16:58', NULL, 1, '{LNG_General site settings}', NULL),
(15, 1, 'index', 'User', '2024-03-08 04:26:58', NULL, 1, '{LNG_Login} IP ::1', NULL),
(16, 0, 'dms', 'Save', '2024-03-08 04:30:40', NULL, 1, '{LNG_Module settings} {LNG_Document management system}', NULL),
(17, 0, 'index', 'Save', '2024-03-08 04:36:57', NULL, 1, '{LNG_The members status of the site}', NULL),
(18, 0, 'index', 'Save', '2024-03-08 04:41:55', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(19, 1, 'index', 'User', '2024-03-08 04:42:07', NULL, 1, '{LNG_Login} IP ::1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `edms_number`
--

CREATE TABLE `edms_number` (
  `type` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `auto_increment` int(11) NOT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edms_user`
--

CREATE TABLE `edms_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `salt` varchar(32) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `permission` text NOT NULL,
  `name` varchar(150) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `id_card` varchar(13) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `provinceID` varchar(3) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT 'TH',
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `social` tinyint(1) DEFAULT 0,
  `line_uid` varchar(33) DEFAULT NULL,
  `activatecode` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edms_user`
--

INSERT INTO `edms_user` (`id`, `username`, `salt`, `password`, `token`, `status`, `permission`, `name`, `sex`, `id_card`, `address`, `phone`, `provinceID`, `province`, `zipcode`, `country`, `create_date`, `active`, `social`, `line_uid`, `activatecode`) VALUES
(1, 'admin', '65ea29cf2481a', '02c11b9522b7cabab92f4884a3a6ea8d2d6728a7', '73e873b8aa7ef6db1881571df4bd44e93589cafc', 1, '', 'แอดมิน', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-03-07 21:55:43', 1, 0, NULL, ''),
(2, 'demo', '65ea29cf2481a', '495f2f0e7accf950f76b03aa8ca00f2d24db7578', NULL, 0, '', 'ตัวอย่าง', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-03-07 21:55:43', 1, 0, NULL, ''),
(3, 'user', '099778cf1a3a1', '931d340f13fafcaedf86af0aca02c1b74ff48b10', '07c6a813ff9553e97bbb2d5414d4f9d10b7536c3', 0, ',can_download_dms,', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-03-08 04:01:55', 1, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `edms_user_meta`
--

CREATE TABLE `edms_user_meta` (
  `value` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edms_category`
--
ALTER TABLE `edms_category`
  ADD KEY `type` (`type`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `edms_dms`
--
ALTER TABLE `edms_dms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edms_dms_download`
--
ALTER TABLE `edms_dms_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dms_id` (`dms_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `edms_dms_files`
--
ALTER TABLE `edms_dms_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dms_id` (`dms_id`);

--
-- Indexes for table `edms_dms_meta`
--
ALTER TABLE `edms_dms_meta`
  ADD KEY `dms_id` (`dms_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `edms_language`
--
ALTER TABLE `edms_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edms_logs`
--
ALTER TABLE `edms_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `src_id` (`src_id`),
  ADD KEY `module` (`module`),
  ADD KEY `action` (`action`);

--
-- Indexes for table `edms_number`
--
ALTER TABLE `edms_number`
  ADD PRIMARY KEY (`type`,`prefix`);

--
-- Indexes for table `edms_user`
--
ALTER TABLE `edms_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `line_uid` (`line_uid`),
  ADD KEY `username` (`username`),
  ADD KEY `token` (`token`),
  ADD KEY `phone` (`phone`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `activatecode` (`activatecode`);

--
-- Indexes for table `edms_user_meta`
--
ALTER TABLE `edms_user_meta`
  ADD KEY `member_id` (`member_id`,`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `edms_dms`
--
ALTER TABLE `edms_dms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edms_dms_download`
--
ALTER TABLE `edms_dms_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edms_dms_files`
--
ALTER TABLE `edms_dms_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edms_language`
--
ALTER TABLE `edms_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `edms_logs`
--
ALTER TABLE `edms_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `edms_user`
--
ALTER TABLE `edms_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
