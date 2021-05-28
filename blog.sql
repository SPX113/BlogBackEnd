-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-07-23 16:04:40
-- 服务器版本： 10.4.11-MariaDB
-- PHP 版本： 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(10) NOT NULL,
  `recommend` int(11) DEFAULT 0,
  `title` text NOT NULL,
  `photo` text NOT NULL,
  `article` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `describe` tinytext DEFAULT NULL,
  `stars` int(11) DEFAULT 0,
  `comments` int(11) DEFAULT 0,
  `watches` int(11) DEFAULT 0,
  `createtime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `recommend`, `title`, `photo`, `article`, `tags`, `describe`, `stars`, `comments`, `watches`, `createtime`) VALUES
(1, 1, 'Vue 引用 md 文件，解析 markdown 语法', 'http://localhost:3000/img/sanzhi.jpg', 'example1', 'Vue,js,md语法', '将md语法解析为html语法，并展示给访问者', 35, 18, 431, '2020-07-18 13:42:22'),
(2, 1, 'node笔记', 'http://localhost:3000/img/1017409835.jpg', 'example2', 'Node.js', NULL, 0, 1, 13, '2020-07-18 13:42:22'),
(3, 1, 'Node.js跨域问题', 'http://localhost:3000/img/1002955602.jpg', 'Node.js跨域问题', 'Node.js', NULL, 4, 2, 42, '2020-07-18 13:41:19');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `articleid` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`articleid`, `name`, `comment`, `author`, `createtime`) VALUES
(1, '阿三大苏打', '案发时发生发生大', '手动阀手动阀手动阀手动阀撒旦', '2020-07-19 07:06:11'),
(1, '大撒大撒', '阿三大苏打', NULL, '2020-07-19 07:26:35'),
(1, '阿大撒', '啊沙发上', NULL, '2020-07-19 07:40:46'),
(1, '啊发生的', '啊实打实', NULL, '2020-07-19 07:42:36'),
(3, '吴亦凡', '加拿大电鳗感觉很赞', NULL, '2020-07-19 07:44:29'),
(2, '蔡徐坤', '蔡徐坤看了想打篮球', NULL, '2020-07-19 07:46:50'),
(1, '啊实打实', '啊实打实', NULL, '2020-07-19 09:47:26'),
(1, '手动阀手动阀', '阿三大苏打', NULL, '2020-07-19 09:47:32'),
(3, '阿大撒', '撒发生', NULL, '2020-07-19 10:28:11');

-- --------------------------------------------------------

--
-- 表的结构 `messagebord`
--

CREATE TABLE `messagebord` (
  `name` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `messagebord`
--

INSERT INTO `messagebord` (`name`, `comment`, `author`, `createtime`) VALUES
('啊实打实', '案发时', NULL, '2020-07-20 07:34:14'),
('阿大撒', '案发时', NULL, '2020-07-20 07:36:48'),
('发发是', '啊沙发上', NULL, '2020-07-20 07:37:10'),
('啊沙发沙发是', '山豆根山豆根', NULL, '2020-07-20 07:37:16'),
('吴亦凡', '啊发发是', NULL, '2020-07-20 07:39:16'),
('吴亦凡', '爱发呆复苏的速度广东省', NULL, '2020-07-20 07:39:19'),
('吴亦凡', '发生发生的观点是根深蒂固山豆根山豆根是', NULL, '2020-07-20 07:39:23'),
('吴亦凡', '啊沙发沙发沙发沙发沙发的高度融合几个月', NULL, '2020-07-20 07:39:29'),
('吴亦凡', '士大夫是绝对不敢靠近士大夫骨科大夫说了受到更好的看是否经过不可见的发表', NULL, '2020-07-20 07:39:38'),
('啊打发设计风格看到了', '大苏打实打实的高浮雕鬼地方', NULL, '2020-07-20 07:39:45'),
('辅导功课的就发给本科', '打扫打扫房间是地方和高科技地方', NULL, '2020-07-20 07:39:51'),
('阿萨的就是看了发货的', '梵蒂冈地方经过了疯狂的', NULL, '2020-07-20 07:39:56'),
('大师傅士大夫是', '司法考试简单方便考生的部分\n', NULL, '2020-07-20 07:41:12'),
('大师傅士大夫', '大撒大撒撒旦发生六点\n', NULL, '2020-07-20 07:41:39'),
('蔡徐坤', '蔡徐坤觉得鸡你太美', NULL, '2020-07-20 08:25:58'),
('蔡徐坤', '鸡你太美', NULL, '2020-07-20 08:26:20'),
('吴亦凡', '啊啊啊啊啊', NULL, '2020-07-20 08:54:06'),
('阿三大撒反对法国', '但是公司的', NULL, '2020-07-20 08:58:32'),
('发生发生', '是公司的公司的', NULL, '2020-07-20 09:05:20'),
('撒发射点发射点', '阿三大苏打', NULL, '2020-07-20 09:05:50'),
('十分士大夫', '是根深蒂固', '真的假的', '2020-07-20 09:05:55');

-- --------------------------------------------------------

--
-- 表的结构 `timeline`
--

CREATE TABLE `timeline` (
  `title` text DEFAULT NULL,
  `describe` text DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `timeline`
--

INSERT INTO `timeline` (`title`, `describe`, `createtime`) VALUES
('测试1', '我叫蔡徐坤', '2020-07-20 13:34:31'),
('测试2', '我是加拿大电鳗', '2020-07-20 13:34:31'),
('测试3', '？？？？？？？？？？？？？？？？？？？？？？？？你真的很机车啊啊打发士大夫你所看见的风暴开始大幅扩建哈桑阿斗卡巴舒服就好说不定就会发表后就开始地方收到南开精神的那边反馈技术部的海景房v不是简单v会及时答复', '2020-07-20 13:34:31'),
('我真不叫蔡徐坤', '我喜欢打篮球', '2020-07-20 13:40:09'),
('菜菜子', '唱 跳 rap 篮球', '2020-07-20 13:52:23');

--
-- 转储表的索引
--

--
-- 表的索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
