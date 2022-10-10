-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2022 a las 19:59:39
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crypto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `token` varchar(1000) NOT NULL,
  `id_token` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`token`, `id_token`) VALUES
('bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NDI5NTExODIsImV4cCI6NDc5NjU1MTE4MiwidXNlcm5hbWUiOiJKYXNvbiIsImNvbXBhbnkiOiIxMDAxMjM0NTY3OCJ9.pyC-AashL_VczRTbRxMedZtDs-KapgBnSMIa-EE4Y3aZ9YiMz1S3eaE2CmnvwlkbCiCIJ7trUEEaW17-GGd4WDSf3dEPZF8ZJiiLDJc6Weuzxo0lebyLdXA2HX5bvteHMVpcKV1mXmudMDwAe9rdGm0oQNrAG30oJTZOYNRYeBkzSdtXmKAxQcqSecq-_nDzIVe-1taeB2LFi7r15zg9zMD5X64_72lK4LLSYZFFYCB6t6YZeOyGP66OJqEQBda0_sZkkidX54T0oZdv5EULpM8s_tBeewCsb4859z1MZCcUjxZ8YN2qRH7pznLM74fpPc55ECEDfr9AzvSAGNDCmAdiWJDCMFgrkpgjyv9FdO8TBm6TgXwcsBsqKUrTHm4Bga-H_EtzKTJ9Ze2c0_dOKF6YZz2SdJzkuu-cJvKDHU6Xs94sCL23_xtVxN_hFbOwaC8kJxdQWqxOWhv2ZLUWDV6tjaKUzijxwGvS1mDkrXGqccGqOADnJVg7mNx1gRLFZmCg-t4FWPawB8VjZnJaEOiYwWEyBRMQpPc0q_JQFZG1M2QN0cbfkmM7m-o7vuet1erPruuXmLh31JVNldIXcV_l9HomEHvk167yFn-kgbyy-rkueMIUWQ11GokpXssJbdZKQLo-bZvpbpa1NmTSCp-kFXd8Tt4OuD06f5Nuy3o', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL,
  `nom_caja` varchar(50) NOT NULL,
  `des_caja` varchar(100) NOT NULL,
  `sal_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id_caja`, `nom_caja`, `des_caja`, `sal_caja`) VALUES
(1, 'principal', 'principal', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nom_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nom_categoria`) VALUES
(6, 'PAPELERIA'),
(7, 'ALQUILER DEL LOCAL'),
(8, 'CAPITAL'),
(9, 'ESTACIONAMIENTO'),
(10, 'AGUA'),
(11, 'UTILIDAD FERNANDO'),
(13, 'CAFE'),
(14, 'MEDICINA'),
(15, 'OTROS'),
(17, 'AGENTE INTERBANK'),
(18, 'MANTENIMIENTO DE CUENTAS DEL BANCO'),
(19, 'ITF BANCOS'),
(22, 'CARRO'),
(23, 'SUELDOS'),
(24, 'LUZ DEL SUR'),
(25, 'SEDAPAL'),
(26, 'TELEFONO FIJO Y INTERNET'),
(27, 'CELULAR FERNANDO'),
(28, 'UTILIDADES DE LIMPIEZA'),
(29, 'PRECIO DEL DOLAR'),
(30, 'ALMUERZO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre`
--

CREATE TABLE `cierre` (
  `id_cierre` int(11) NOT NULL,
  `cod_divisa_cierre` varchar(10) NOT NULL,
  `nom_divisa_cierre` varchar(50) NOT NULL,
  `cot_cierre` varchar(100) NOT NULL,
  `can_cierre` float NOT NULL,
  `fec_cierre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cierre`
--

INSERT INTO `cierre` (`id_cierre`, `cod_divisa_cierre`, `nom_divisa_cierre`, `cot_cierre`, `can_cierre`, `fec_cierre`) VALUES
(1, 'USD', 'dolares', '3.87', 28173.5, '2022-08-24'),
(2, 'PEN', 'Soles Peruanos', '1', 25895.5, '2022-08-24'),
(3, 'USDT', 'Theter', '3.773', 13282.8, '2022-08-24'),
(4, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-08-24'),
(5, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-08-24'),
(6, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-08-24'),
(7, 'USD', 'dolares', '3.9541429575151', 25574.5, '2022-08-25'),
(8, 'PEN', 'Soles Peruanos', '1', 27728.9, '2022-08-25'),
(9, 'USDT', 'Theter', '3.7213662537173', 15488.6, '2022-08-25'),
(10, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-08-25'),
(11, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-08-25'),
(12, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-08-25'),
(13, 'USD', 'dolares', '3.9541429575151', 23614.5, '2022-08-26'),
(14, 'PEN', 'Soles Peruanos', '1', 39662.3, '2022-08-26'),
(15, 'USDT', 'Theter', '3.7588920639683', 14382.5, '2022-08-26'),
(16, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-08-26'),
(17, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-08-26'),
(18, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-08-26'),
(19, 'USD', 'dolares', '3.9541429575151', 7495.5, '2022-08-29'),
(20, 'PEN', 'Soles Peruanos', '1', 96767.6, '2022-08-29'),
(21, 'USDT', 'Theter', '3.807289078954', 16099.9, '2022-08-29'),
(22, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-08-29'),
(23, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-08-29'),
(24, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-08-29'),
(25, 'USD', 'dolares', '3.9541429575151', 6.5, '2022-08-31'),
(26, 'PEN', 'Soles Peruanos', '1', 114095, '2022-08-31'),
(27, 'USDT', 'Theter', '3.8204473895926', 19449.9, '2022-08-31'),
(28, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-08-31'),
(29, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-08-31'),
(30, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-08-31'),
(31, 'USD', 'dolares', '3.9541429575151', 6.45, '2022-09-01'),
(32, 'PEN', 'Soles Peruanos', '1', 151301, '2022-09-01'),
(33, 'USDT', 'Theter', '3.8156832962396', 10426.9, '2022-09-01'),
(34, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-09-01'),
(35, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-01'),
(36, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-01'),
(37, 'USD', 'dolares', '3.9541429575151', 320.45, '2022-09-02'),
(38, 'PEN', 'Soles Peruanos', '1', 163897, '2022-09-02'),
(39, 'USDT', 'Theter', '3.8156832962396', 6961.9, '2022-09-02'),
(40, 'BUSD', 'Binance USD', '3.6931', 167.27, '2022-09-02'),
(41, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-02'),
(42, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-02'),
(43, 'PEN', 'Soles Peruanos', '1', 149734, '2022-09-03'),
(44, 'USDT', 'Theter', '3.85', 11171.1, '2022-09-03'),
(45, 'BUSD', 'Binance USD', '3.5', 507.27, '2022-09-03'),
(46, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-03'),
(47, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-03'),
(48, 'PEN', 'Soles Peruanos', '1', 144842, '2022-09-05'),
(49, 'USDT', 'Theter', '4.1558572160628', 12528.3, '2022-09-05'),
(50, 'BUSD', 'Binance USD', '3.5', 507.27, '2022-09-05'),
(51, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-05'),
(52, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-05'),
(53, 'USD', 'dolares', '3.85', 2664, '2022-09-06'),
(54, 'PEN', 'Soles Peruanos', '1', 145507, '2022-09-06'),
(55, 'USDT', 'Theter', '3.85', 9776.42, '2022-09-06'),
(56, 'BUSD', 'Binance USD', '3.5', 507.27, '2022-09-06'),
(57, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-06'),
(58, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-06'),
(59, 'PEN', 'Soles Peruanos', '1', 138626, '2022-09-07'),
(60, 'USDT', 'Theter', '3.85', 14403.4, '2022-09-07'),
(61, 'BUSD', 'Binance USD', '3.5', 507.27, '2022-09-07'),
(62, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-07'),
(63, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-07'),
(64, 'PEN', 'Soles Peruanos', '1', 136568, '2022-09-08'),
(65, 'USDT', 'Theter', '3.85', 14403.4, '2022-09-08'),
(66, 'BUSD', 'Binance USD', '3.6463816893235', 1051.19, '2022-09-08'),
(67, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-08'),
(68, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-08'),
(69, 'PEN', 'Soles Peruanos', '1', 156172, '2022-09-09'),
(70, 'USDT', 'Theter', '4.6410916725412', 9535.11, '2022-09-09'),
(71, 'BUSD', 'Binance USD', '3.6444727131711', 1076.6, '2022-09-09'),
(72, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-09'),
(73, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-09'),
(74, 'USD', 'dolares', '3.85', 600, '2022-09-10'),
(75, 'PEN', 'Soles Peruanos', '1', 156172, '2022-09-10'),
(76, 'USDT', 'Theter', '3.85', 8953.11, '2022-09-10'),
(77, 'BUSD', 'Binance USD', '3.5', 1076.6, '2022-09-10'),
(78, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-10'),
(79, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-10'),
(80, 'PEN', 'Soles Peruanos', '1', 148844, '2022-09-12'),
(81, 'USDT', 'Theter', '3.85', 11753.1, '2022-09-12'),
(82, 'BUSD', 'Binance USD', '3.5', 1076.6, '2022-09-12'),
(83, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-12'),
(84, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-12'),
(85, 'USD', 'dolares', '3.85', 365, '2022-09-13'),
(86, 'PEN', 'Soles Peruanos', '1', 148844, '2022-09-13'),
(87, 'USDT', 'Theter', '3.85', 11398.1, '2022-09-13'),
(88, 'BUSD', 'Binance USD', '3.5', 1076.6, '2022-09-13'),
(89, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-13'),
(90, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-13'),
(91, 'USD', 'dolares', '3.85', 235, '2022-09-14'),
(92, 'PEN', 'Soles Peruanos', '1', 154873, '2022-09-14'),
(93, 'USDT', 'Theter', '3.85', 9893.1, '2022-09-14'),
(94, 'BUSD', 'Binance USD', '3.5', 1209.3, '2022-09-14'),
(95, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-14'),
(96, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-14'),
(97, 'PEN', 'Soles Peruanos', '1', 143301, '2022-09-15'),
(98, 'USDT', 'Theter', '3.85', 13200.6, '2022-09-15'),
(99, 'BUSD', 'Binance USD', '3.5', 1209.3, '2022-09-15'),
(100, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-15'),
(101, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-15'),
(102, 'PEN', 'Soles Peruanos', '1', 149496, '2022-09-16'),
(103, 'USDT', 'Theter', '3.849375162968', 10847.1, '2022-09-16'),
(104, 'BUSD', 'Binance USD', '3.5', 2114.3, '2022-09-16'),
(105, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-16'),
(106, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-16'),
(107, 'PEN', 'Soles Peruanos', '1', 149496, '2022-09-17'),
(108, 'USDT', 'Theter', '3.849375162968', 10847.1, '2022-09-17'),
(109, 'BUSD', 'Binance USD', '3.5', 2114.3, '2022-09-17'),
(110, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-17'),
(111, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-17'),
(112, 'USD', 'dolares', '3.85', 2515, '2022-09-19'),
(113, 'PEN', 'Soles Peruanos', '1', 148645, '2022-09-19'),
(114, 'USDT', 'Theter', '3.85', 8631.21, '2022-09-19'),
(115, 'BUSD', 'Binance USD', '3.5', 2114.3, '2022-09-19'),
(116, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-19'),
(117, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-19'),
(118, 'USD', 'dolares', '3.85', 6442, '2022-09-20'),
(119, 'PEN', 'Soles Peruanos', '1', 148645, '2022-09-20'),
(120, 'USDT', 'Theter', '3.85', 4873.61, '2022-09-20'),
(121, 'BUSD', 'Binance USD', '3.5', 2114.3, '2022-09-20'),
(122, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-20'),
(123, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-20'),
(124, 'USD', 'dolares', '3.85', 7306, '2022-09-21'),
(125, 'PEN', 'Soles Peruanos', '1', 148267, '2022-09-21'),
(126, 'USDT', 'Theter', '5.230830784193', 4174.61, '2022-09-21'),
(127, 'BUSD', 'Binance USD', '3.5', 2114.3, '2022-09-21'),
(128, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-21'),
(129, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-21'),
(130, 'USD', 'dolares', '4.303370087799', 6606, '2022-09-22'),
(131, 'PEN', 'Soles Peruanos', '1', 131075, '2022-09-22'),
(132, 'USDT', 'Theter', '4.2473177537849', 9118.45, '2022-09-22'),
(133, 'BUSD', 'Binance USD', '3.5', 2414.3, '2022-09-22'),
(134, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-22'),
(135, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-22'),
(136, 'USD', 'dolares', '4.303370087799', 6606, '2022-09-23'),
(137, 'PEN', 'Soles Peruanos', '1', 127695, '2022-09-23'),
(138, 'USDT', 'Theter', '4.1672854194604', 10041.5, '2022-09-23'),
(139, 'BUSD', 'Binance USD', '3.5', 2414.3, '2022-09-23'),
(140, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-23'),
(141, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-23'),
(142, 'USD', 'dolares', '4.303370087799', 6606, '2022-09-24'),
(143, 'PEN', 'Soles Peruanos', '1', 127695, '2022-09-24'),
(144, 'USDT', 'Theter', '4.1672854194604', 10041.5, '2022-09-24'),
(145, 'BUSD', 'Binance USD', '3.5', 2414.3, '2022-09-24'),
(146, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-24'),
(147, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-24'),
(148, 'USD', 'dolares', '4.3356972923148', 6558, '2022-09-26'),
(149, 'PEN', 'Soles Peruanos', '1', 126943, '2022-09-26'),
(150, 'USDT', 'Theter', '4.0513903961904', 10382.2, '2022-09-26'),
(151, 'BUSD', 'Binance USD', '3.5', 2414.3, '2022-09-26'),
(152, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-26'),
(153, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-26'),
(154, 'USD', 'dolares', '4.3356972923148', 6267, '2022-09-27'),
(155, 'PEN', 'Soles Peruanos', '1', 123160, '2022-09-27'),
(156, 'USDT', 'Theter', '4.0319131091385', 11370.5, '2022-09-27'),
(157, 'BUSD', 'Binance USD', '3.5', 2714.3, '2022-09-27'),
(158, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-27'),
(159, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-27'),
(160, 'USD', 'dolares', '4.3356972923148', 6267, '2022-09-28'),
(161, 'PEN', 'Soles Peruanos', '1', 123138, '2022-09-28'),
(162, 'USDT', 'Theter', '3.8646536417547', 11476.3, '2022-09-28'),
(163, 'BUSD', 'Binance USD', '3.5', 2714.3, '2022-09-28'),
(164, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-28'),
(165, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-28'),
(166, 'USD', 'dolares', '4.3356972923148', 6267, '2022-09-29'),
(167, 'PEN', 'Soles Peruanos', '1', 123095, '2022-09-29'),
(168, 'USDT', 'Theter', '3.8637133224432', 11490.3, '2022-09-29'),
(169, 'BUSD', 'Binance USD', '3.5', 2714.3, '2022-09-29'),
(170, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-29'),
(171, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-29'),
(172, 'USD', 'dolares', '6.2798717219637', 4327, '2022-09-30'),
(173, 'PEN', 'Soles Peruanos', '1', 130862, '2022-09-30'),
(174, 'USDT', 'Theter', '3.817890823371', 11545.3, '2022-09-30'),
(175, 'BUSD', 'Binance USD', '3.5', 2714.3, '2022-09-30'),
(176, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-09-30'),
(177, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-09-30'),
(178, 'USD', 'dolares', '6.2798717219637', 4327, '2022-10-01'),
(179, 'PEN', 'Soles Peruanos', '1', 131702, '2022-10-01'),
(180, 'USDT', 'Theter', '3.817890823371', 11340.3, '2022-10-01'),
(181, 'BUSD', 'Binance USD', '3.5', 2714.3, '2022-10-01'),
(182, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-10-01'),
(183, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-10-01'),
(184, 'USD', 'dolares', '6.2798717219637', 3327, '2022-10-03'),
(185, 'PEN', 'Soles Peruanos', '1', 130572, '2022-10-03'),
(186, 'BTC', 'Bitcoins', '44000', 0.00146628, '2022-10-03'),
(187, 'USDT', 'Theter', '3.85', 14637.6, '2022-10-03'),
(188, 'BUSD', 'Binance USD', '3.5', 754.8, '2022-10-03'),
(189, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-10-03'),
(190, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-10-03'),
(191, 'USD', 'dolares', '6.2798717219637', 4627, '2022-10-04'),
(192, 'PEN', 'Soles Peruanos', '1', 130655, '2022-10-04'),
(193, 'BTC', 'Bitcoins', '44000.136032391', 6.50521e-18, '2022-10-04'),
(194, 'USDT', 'Theter', '4.2707429619761', 13395.5, '2022-10-04'),
(195, 'BUSD', 'Binance USD', '3.5', 754.8, '2022-10-04'),
(196, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-10-04'),
(197, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-10-04'),
(198, 'USD', 'dolares', '6.2798717219637', 5136, '2022-10-05'),
(199, 'PEN', 'Soles Peruanos', '1', 129921, '2022-10-05'),
(200, 'BTC', 'Bitcoins', '44000', 6.50521e-18, '2022-10-05'),
(201, 'USDT', 'Theter', '4.358476181783', 13097.7, '2022-10-05'),
(202, 'BUSD', 'Binance USD', '3.5', 754.8, '2022-10-05'),
(203, 'ETH', 'Ethereum', '6960.4', 0.3156, '2022-10-05'),
(204, 'XRP', 'RIPPLE', '2.0219', 3746.7, '2022-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `doc_cliente` varchar(10) NOT NULL,
  `n_cliente` varchar(50) NOT NULL,
  `nom_cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `doc_cliente`, `n_cliente`, `nom_cliente`) VALUES
(0, '', '0', 'REGULAR'),
(2, 'PAS', '149889214', 'Jason Hernandez'),
(9, 'DNI', '002066886', 'EMILY MCDERMOTT'),
(11, 'RUC', '10092383658', 'CASA DE CAMBIOS SANTA ROSA DE LIMA'),
(12, 'DNI', '74063949', 'JEREMY SERVANTES'),
(13, 'DNI', '40692123', 'DANITZA CARDENAS SIFUENTES'),
(14, 'DNI', '44588600', 'KATTY MAURICIO GARCIA'),
(15, 'DNI', '41055235', 'EDISON PACHECO'),
(16, 'CE', '002958156', 'FRANCISCO MING'),
(17, 'DNI', '40609728', 'MANUEL CERNA ROJAS'),
(18, 'CE', '002348473', 'RAFAEL CARLOS ALONSO TAPIA'),
(19, 'DNI', '10480934', 'ANDRES HUAMANI ACHO'),
(20, 'CE', '000284851', 'D ANS ALLEMAN BARTHELEMY '),
(21, 'DNI', '00820443', 'JUANA CUMADA TRAUCO DE OSHIRO'),
(22, 'RUC', '20511017743', 'MAC DOLAR CAMBIOS DE DIVISAS S.A.C.'),
(23, 'DNI', '40484279', 'CLEIRA TORRES LIZANA'),
(24, 'DNI', '09390644', 'MIGUEL RONCEROS NECIOSUP'),
(25, 'DNI', '70745454', 'SERGIO ALONSO URBINA ESPINOZA'),
(26, 'DNI', '45864591', 'ROSA RIVAS RAMIREZ'),
(27, 'DNI', '09403276', 'JESUS CASTILLO'),
(28, 'RUC', '20451601491', 'MANZANA VERDE'),
(29, 'DNI', '40195103', 'MARIELA HUANGAL LEGUIA'),
(30, 'CE', '00196684', 'HILDA NATERA PONTE'),
(31, 'DNI', '04748858', 'EDGAR CCOLLA VARGAS'),
(32, 'DNI', '10803558', 'CESAR AUGUSTO OJEDA ZEGARRA'),
(33, 'DNI', '09674501', 'JACQUELINE PEREZ CASTAÑEDA'),
(34, 'DNI', '45675455', 'JAIRO MANRIQUE'),
(35, 'DNI', '42968850', 'LUIS RODOLFO RIOS DUMET'),
(37, 'RUC', '20602431216', 'GRUPO SECUREX SAC'),
(38, 'DNI', '42734382', 'ALEXANDER MARQUEZ URCIA'),
(39, 'DNI', '001324967', 'MANUEL VILLAR RODRIGUEZ'),
(40, 'DNI', '18138465', 'JUAN MANUEL CHAN'),
(41, 'DNI', '45657141', 'EDUARDO LA RIVA'),
(42, 'DNI', '09350147', 'ELIAS BALVIN'),
(43, 'DNI', '06008558', 'PEDRO GIL CASTAÑEDA '),
(44, 'DNI', '40023084', 'VICTOR PABLO MELT CAMPOS'),
(45, 'DNI', '00802487', 'HILMER GUZMAN DE REATEGUI'),
(46, 'DNI', '07232832', 'CARLOS BAGAZO'),
(47, 'RUC', '20517430596', 'ECOPROJET SAC'),
(48, 'DNI', '41715166', 'MANUEL FUERTES'),
(49, 'DNI', '10735509', 'GONZALO FALLA CARILLO'),
(50, 'DNI', '42411571', 'FREDDY TTITO THUPA'),
(51, 'RUC', '20602492541', 'FRIGOINCA SAC'),
(52, 'DNI', '08230054', 'ALFREDO FERRERO'),
(53, 'RUC', '2012108443', 'INDUSTRIAS TRIVECA S.A.C.'),
(54, 'DNI', '19937768', 'DIANA MARICELA VELIZ CALDERON'),
(55, 'RUC', '20604004251', 'INVERSIONES DIVISAS SAC'),
(56, 'DNI', '48506372', 'HORACIO BENINCASA'),
(57, 'RUC', '10435895234', 'CAMBIOS EVELYN'),
(58, 'DNI', '76327397', 'YOSELIN HUAMANI FLORES'),
(59, 'DNI', '07957502', 'VIDAL GALINDO VERASTEGUI'),
(60, 'RUC', '20606640758', 'VIAJES VAN PERU EIRL'),
(61, 'DNI', '06486871', 'HECTOR JONE HUACCHO NAVARRO'),
(62, 'DNI', '07861015', 'JORGE CARHUANCO ESCOBAR'),
(63, 'DNI', '40974776', 'KARLA LANDA CHANGANA'),
(64, 'DNI', '40497920', 'DAMIAN VILLANUEVA OLANO'),
(65, 'DNI', '09344677', 'JOSE ANTONIO MARQUINA GANOZA'),
(66, 'CE', '001464228', 'JOHNNY DUQUE'),
(67, 'DNI', '06765380', 'MANUEL ROLANDO NIETO CERDA'),
(68, 'DNI', '06509117', 'CARMEN ACOSTA DE HELM'),
(69, 'DNI', '70189576', 'JOSE LOYOLA YLLESCAS'),
(70, 'DNI', '07878881', 'XIMENA FRANCO CALLE'),
(71, 'DNI', '41166743', 'CARLOS ZUÑIGA GOGNY'),
(72, 'RUC', '20492058646', 'INVERSIONES VIRGEN DEL PERPETUO SOCORRO SAC'),
(73, 'DNI', '20607149837', 'DIVISAS ANGEL S.A.C.'),
(74, 'DNI', '43904851', 'ERICK ALBINO CAQUI'),
(76, 'DNI', '06104670', 'FLAVIANO HUAMAN MACEDO'),
(77, 'DNI', '07538346', 'LUIS LUQUE TEJADA'),
(78, 'DNI', '07966235', 'LUIS SANGUINETTI DIAZ'),
(79, 'CE', '001989558', 'FERNANDO JACOME'),
(80, 'RUC', '20606849681', 'CONSORCIO CIRCUITO'),
(82, 'DNI', '08810566', 'BASILIO FLORES ESTRADA'),
(83, 'RUC', '20602851894', 'NEGOCIACIONES LIMA SANTA ROSA'),
(84, 'RUC', '10435895234', 'KAMBIO$ VIP'),
(85, 'DNI', '41771590', 'WILLIAMS AZA ASTUCURI'),
(86, 'DNI', '09087013', 'YNES GLADYS ALARCON GARCIA'),
(87, 'DNI', '40389007', 'ROBERTO CARLO MATOS CALDAS'),
(88, 'DNI', '46492329', 'CAROLINA CHU GONZALES'),
(89, 'DNI', '44833043', 'ALEXANDER VARGAS MORVELI'),
(90, 'DNI', '43698238', 'VICTOR TRELLES CARRILLO'),
(91, 'DNI', '08720298', 'FELIX VILCHEZ HORNA'),
(92, 'DNI', '73786622', 'MATHIAS MINCHAN WOLSTROHN'),
(93, 'DNI', '40749327', 'NANCI MENDOZA PAREDES'),
(94, 'DNI', '07742867', 'JAVIER BARCO'),
(95, 'DNI', '40189497', 'ADA MENDOZA PALOMINO'),
(96, 'CE', '001404590', 'LAO LI'),
(97, 'DNI', '07863635', 'GROVER MORALES HUALPA'),
(98, 'RUC', '20512791825', 'GLASS IMPORT AUTOMOTRIZ'),
(99, 'DNI', '08961960', 'GONZALO NICANOR NIETO SALCEDO'),
(100, 'DNI', '08808900', 'JORGE WONG WONG '),
(101, 'DNI', '40384225', 'CARLOS RAMOS ABENSUR'),
(102, 'RUC', '20607077607', 'PERUVIAN ALIMENT COMPANY SOCIEDAD ANONIMA CERRADA'),
(103, 'DNI', '07877161', 'ELSA HUAMAN YLLESCA'),
(104, 'DNI', '46892849', 'VICTOR CASAVILCA QUICHCA'),
(105, 'DNI', '46791113', 'RAUL ESPINOZA MESTANZA'),
(106, 'RUC', '10157028907', 'CAMBIOS EFRAIN'),
(107, 'DNI', '07828226', 'TEOFILO JESUS PEREZ CHAVAYA'),
(108, 'DNI', '46380779', 'RICHARD ESPINOZA'),
(109, 'DNI', '08944091', 'DELIA MESA ROMERO'),
(110, 'DNI', '07796040', 'IDA RODRIGUEZ NUÑEZ DE RAMIREZ'),
(111, 'DNI', '09584938', 'EUGENIO MEJIA RIVERA'),
(112, 'PAS', '42651463', 'CRISTIAN FAUNDES SANCHEZ'),
(114, 'DNI', '06310543', 'FERNANDO REAÑO IBAÑEZ'),
(115, 'DNI', '28977234', 'NIEVES DAISY CARHUAS GUTIERREZ'),
(116, 'CE', '001335996', 'ENRIQUE MARTINEZ GARCIA'),
(117, 'DNI', '07568792', 'JORGE REYES RAMO'),
(118, 'DNI', '10492316', 'CARLOS EDUARDO DEL SOLAR SEGURA'),
(119, 'RUC', '20521377136', 'HL REPRESENTACIONES GENERALES S.R.L.'),
(120, 'CE', '000497161', 'CARMEN LIU'),
(121, 'RUC', '20606964341', 'J & N GLOBAL SERVICES PERU SAC'),
(122, 'RUC', '20451760883', 'SIGI PERUANA EIRL'),
(123, 'DNI', '74720221', 'MARCO MONTENEGRO'),
(124, 'DNI', '07845451', 'MARIA ESTER ARAUJO '),
(125, 'DNI', '08211502', 'CESAR ALEJANDRO ACUÑA FOPPIANO'),
(126, 'DNI', '05224185', 'NICOLOSA GONZALES LA TORRE DE SIFUENTES'),
(127, 'DNI', '43601417', 'FERNANDO RENGIFO CHAVEZ'),
(128, 'DNI', '18197947', 'PEDRO HOYOS PARDO'),
(129, 'DNI', '00240497', 'FERNANDO ATOCHE TOVAR'),
(130, 'CE', '003626783', 'DIEGO EMILIO VICKE MENDOZA'),
(131, 'DNI', '47506556', 'BETEL PERALTA GALVEZ'),
(132, 'DNI', '78113237', 'STEFANO ALEXANDER VALLADARES PRE'),
(133, 'DNI', '16581559', 'MARIA MANUELA BARRETO VDA DE DAVILA'),
(134, 'DNI', '07866938', 'MARIA GOMEZ PAICO'),
(135, 'DNI', '21867691', 'TANIA JESUS PACHECO ENRIQUEZ DE TRISCHMAN'),
(136, 'DNI', '76220697', 'BRAYAN JIMY RAMOS QUISPE'),
(137, 'DNI', '09759458', 'JULIA MABEL NUÑEZ VARGAS'),
(138, 'DNI', '09871853', 'FLOR SARAI AVELLANEDA CHAVEZ'),
(139, 'DNI', '10080161', 'MICHAEL RIOS GUARDIA'),
(140, 'DNI', '06442053', 'DANIEL ROBERTO VASQUEZ CARDOZA'),
(141, 'DNI', '75210604', 'MARKO ALEXANDER LA TORRE VASQUEZ'),
(142, 'DNI', '10713930', 'FIDEL GONZALO HUERTA ZEGARRA'),
(143, 'DNI', '77670085', 'JEAN PIERRE ALI HERRERA'),
(144, 'CE', '000540893', 'KARINA CASTRO SANCHEZ'),
(145, 'DNI', '08171024', 'ANA MARIA MALDONADO CASAS'),
(146, 'DNI', '77421907', 'JEAN POOL GABRIEL GARCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id_cuenta` int(11) NOT NULL,
  `nom_cuenta` varchar(50) NOT NULL,
  `des_cuenta` varchar(100) NOT NULL,
  `sal_cuenta` float(11,2) NOT NULL DEFAULT 0.00,
  `id_divisa` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `id_divisa` int(11) NOT NULL,
  `cod_divisa` varchar(25) NOT NULL,
  `com_divisa` float NOT NULL,
  `ven_divisa` float NOT NULL,
  `nom_divisa` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id_divisa`, `cod_divisa`, `com_divisa`, `ven_divisa`, `nom_divisa`) VALUES
(2, 'EUR', 4.05, 4.17, 'euro'),
(9, 'USD', 3.85, 3.87, 'dolares'),
(10, 'PEN', 1, 1, 'Soles Peruanos'),
(11, 'BRL', 0.68, 0.75, 'reales brasil'),
(19, 'BTC', 44000, 47000, 'Bitcoins'),
(20, 'USDT', 3.85, 3.9655, 'Theter'),
(21, 'DOGE', 1, 1.5, 'Dogecoin'),
(22, 'SHIBA', 1, 1.5, 'Shiba Inu'),
(23, 'BUSD', 3.5, 4, 'Binance USD'),
(24, 'ETH', 6960.4, 7169.2, 'Ethereum'),
(25, 'BNB', 1, 1.5, 'Binance Chain'),
(26, 'XRP', 2.0219, 2.082, 'RIPPLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ent_sal`
--

CREATE TABLE `ent_sal` (
  `id_ent_sal` int(11) NOT NULL,
  `fec_ent_sal` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `tip_ent_sal` varchar(10) NOT NULL,
  `can_ent_sal` float NOT NULL,
  `id_divisa` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `des_ent_sal` varchar(100) NOT NULL,
  `sta_ent_sal` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ent_sal`
--

INSERT INTO `ent_sal` (`id_ent_sal`, `fec_ent_sal`, `id_usuario`, `tip_ent_sal`, `can_ent_sal`, `id_divisa`, `id_categoria`, `des_ent_sal`, `sta_ent_sal`) VALUES
(1, '2022-08-24 09:04:21', 9, 'Entrada', 3746.7, 26, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL', 1),
(2, '2022-08-24 09:15:49', 9, 'Entrada', 11480.4, 20, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL', 0),
(3, '2022-08-24 09:32:02', 9, 'Entrada', 27858, 9, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL EFECTIVO', 1),
(4, '2022-08-24 09:49:58', 9, 'Entrada', 759.1, 10, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL EFECTIVO', 1),
(5, '2022-08-24 09:51:14', 9, 'Entrada', 5000, 10, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL INTERBANK SAC', 1),
(6, '2022-08-24 09:52:24', 9, 'Entrada', 382.2, 10, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (INTERBANK)', 1),
(7, '2022-08-24 09:53:11', 9, 'Entrada', 6.5, 9, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (INTERBANK)', 1),
(8, '2022-08-24 09:54:58', 9, 'Entrada', 7111.24, 10, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (SCOTIABANK)', 1),
(9, '2022-08-24 10:05:09', 9, 'Entrada', 8040.4, 10, 8, 'PRÉSTAMO A NEPTALI CUOTAS DE 979.8 SOLES \r\n10CUOTAS', 1),
(10, '2022-08-24 10:28:20', 9, 'Entrada', 4000, 10, 8, 'PRESTAMO A PATY CUOTAS DE 1063.3 SOLES (4 CUOTAS)', 1),
(11, '2022-08-24 10:41:19', 9, 'Entrada', 8324.8, 10, 8, 'PRESTAMO A MAURICIO PAGAR 2355.5 SOLES (4 CUOTAS)', 1),
(12, '2022-08-24 10:54:25', 9, 'Entrada', 221.9, 20, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (BITFINEX)', 1),
(13, '2022-08-24 12:25:23', 9, 'Entrada', 5000, 10, 8, 'ERROR BINANCE', 1),
(14, '2022-08-24 12:26:06', 9, 'Entrada', 5000, 10, 8, 'ERROR BINANCE P2P', 0),
(15, '2022-08-24 13:45:45', 9, 'Salida', 5000, 10, 8, 'ERROR BINANCE P2P', 1),
(16, '2022-08-24 16:47:16', 9, 'Entrada', 0.3156, 24, 8, 'METAMASK', 1),
(17, '2022-08-24 17:00:29', 9, 'Entrada', 118.53, 23, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (BINANCE)', 1),
(18, '2022-08-24 17:01:54', 9, 'Entrada', 11361.9, 20, 8, 'INICIO DE SISTEMA ENTRADA DE CAPITAL (BINANCE)', 1),
(19, '2022-08-29 17:49:31', 9, 'Salida', 2.25, 10, 19, 'INTERBANK', 1),
(22, '2022-08-31 18:42:10', 9, 'Salida', 1.78, 10, 19, 'INTERBANK', 1),
(25, '2022-09-01 18:21:22', 9, 'Salida', 0.05, 9, 19, 'INTERBANK', 1),
(26, '2022-09-01 18:21:46', 9, 'Salida', 1.2, 10, 19, 'BCP', 1),
(27, '2022-09-01 18:22:05', 9, 'Salida', 3, 10, 19, 'INTERBANK', 1),
(28, '2022-09-03 13:26:35', 9, 'Salida', 4, 10, 19, 'INTERBANK', 1),
(29, '2022-09-03 13:26:53', 9, 'Salida', 4.8, 10, 19, 'BCP A INTERBANK TRANSFERENCIA', 1),
(30, '2022-09-07 17:19:32', 9, 'Salida', 0.2, 10, 19, 'INTERBANK SAC', 1),
(31, '2022-09-09 17:48:17', 9, 'Salida', 4.8, 10, 19, 'COMISIÓN TRANSFERENCIA DE BCP A INTERBANK', 1),
(32, '2022-09-14 17:29:20', 9, 'Salida', 0.3, 10, 19, 'INTERBANK SAC', 1),
(33, '2022-09-16 17:38:27', 9, 'Salida', 1.55, 10, 19, 'INTERBANK', 1),
(34, '2022-09-20 18:00:50', 9, 'Salida', 1.6, 20, 15, 'COMISION DE ENVIO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganancia`
--

CREATE TABLE `ganancia` (
  `id_ganancia` int(11) NOT NULL,
  `can_ganancia` varchar(50) NOT NULL,
  `fec_ganancia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ganancia`
--

INSERT INTO `ganancia` (`id_ganancia`, `can_ganancia`, `fec_ganancia`) VALUES
(1, '63.96', '2022-08-24'),
(2, '1449.75', '2022-08-25'),
(3, '606.61', '2022-08-26'),
(4, '605.24', '2022-08-29'),
(5, '257.49', '2022-08-31'),
(6, '771.23', '2022-09-01'),
(7, '616.36', '2022-09-02'),
(8, '2181.2', '2022-09-03'),
(9, '4165.52', '2022-09-05'),
(10, '3505.51', '2022-09-06'),
(11, '676.55', '2022-09-07'),
(12, '0.01', '2022-09-08'),
(13, '8499.67', '2022-09-09'),
(14, '7629.39', '2022-09-10'),
(15, '1141.88', '2022-09-12'),
(16, '38.5', '2022-09-13'),
(17, '199.2', '2022-09-14'),
(18, '257.46', '2022-09-15'),
(19, '296.59', '2022-09-16'),
(20, '0', '2022-09-17'),
(21, '307.45', '2022-09-19'),
(22, '658.35', '2022-09-20'),
(23, '6021.38', '2022-09-21'),
(24, '1049.98', '2022-09-22'),
(25, '263.1', '2022-09-23'),
(26, '0', '2022-09-24'),
(27, '530.13', '2022-09-26'),
(28, '211.71', '2022-09-27'),
(29, '1515', '2022-09-28'),
(30, '0 ', '2022-09-29'),
(31, '7452.08', '2022-09-30'),
(32, '57.23', '2022-10-01'),
(33, '1144.93', '2022-10-03'),
(34, '9036.24', '2022-10-04'),
(35, '2340.04', '2022-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `id_operacion` int(11) NOT NULL,
  `fec_operacion` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `tip_operacion` varchar(10) NOT NULL,
  `mon_operacion` float NOT NULL,
  `div_operacion` varchar(20) NOT NULL,
  `cot_operacion` float NOT NULL,
  `rec_operacion` float NOT NULL,
  `mon_rec_operacion` varchar(20) NOT NULL,
  `cli_operacion` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `report` int(11) NOT NULL,
  `correlative_sunat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`id_operacion`, `fec_operacion`, `id_usuario`, `tip_operacion`, `mon_operacion`, `div_operacion`, `cot_operacion`, `rec_operacion`, `mon_rec_operacion`, `cli_operacion`, `status`, `report`, `correlative_sunat`) VALUES
(1, '2022-08-24 10:05:34', 9, 'COMPRA', 1999, 'USDT', 3.77299, 7542.2, 'PEN', 0, 1, 1, 1),
(2, '2022-08-24 12:13:55', 9, 'COMPRA', 48.74, 'BUSD', 3.69307, 180, 'PEN', 0, 1, 1, 2),
(3, '2022-08-24 13:11:11', 9, 'VENTA', 300, 'USDT', 1.03, 309, 'USD', 0, 1, 1, 3),
(4, '2022-08-25 11:07:32', 9, 'COMPRA', 1999, 'USD', 3.76318, 7522.6, 'PEN', 0, 0, 1, 4),
(5, '2022-08-25 11:09:17', 9, 'COMPRA', 1999, 'USDT', 3.76318, 7522.6, 'PEN', 0, 1, 1, 5),
(6, '2022-08-25 12:48:56', 9, 'COMPRA', 0.02837, 'BTC', 21132.9, 599.54, 'USD', 0, 1, 1, 6),
(7, '2022-08-25 12:49:12', 9, 'COMPRA', 0.54, 'USD', 3.84, 2.07, 'PEN', 0, 1, 1, 7),
(8, '2022-08-25 12:53:31', 9, 'VENTA', 0.02837, 'BTC', 21564, 611.77, 'USDT', 0, 1, 1, 8),
(9, '2022-08-25 15:58:43', 9, 'COMPRA', 0.01869, 'BTC', 21669.3, 405, 'USDT', 0, 1, 0, 9),
(10, '2022-08-25 16:00:03', 9, 'VENTA', 0.01869, 'BTC', 86570.4, 1618, 'PEN', 127, 0, 1, 10),
(11, '2022-08-25 16:01:17', 9, 'VENTA', 0.01869, 'USD', 86570.4, 1618, 'PEN', 127, 0, 1, 11),
(12, '2022-08-25 16:05:31', 9, 'VENTA', 0.01869, 'BTC', 86570.4, 1618, 'PEN', 127, 1, 1, 12),
(13, '2022-08-25 16:44:02', 9, 'VENTA', 2000, 'USD', 3.87, 7740, 'PEN', 0, 1, 0, 13),
(14, '2022-08-26 10:17:54', 9, 'COMPRA', 3000, 'USDT', 3.837, 11511, 'PEN', 0, 0, 1, 14),
(15, '2022-08-26 11:16:01', 9, 'COMPRA', 2000, 'USDT', 0.98, 1960, 'USD', 0, 0, 1, 15),
(16, '2022-08-26 16:53:44', 9, 'COMPRA', 0.00514, 'BTC', 20651.8, 106.15, 'USDT', 0, 1, 1, 16),
(17, '2022-08-26 16:55:28', 9, 'VENTA', 0.00514, 'BTC', 82180.9, 422.41, 'PEN', 127, 1, 1, 17),
(18, '2022-08-26 17:23:16', 9, 'COMPRA', 2000, 'USDT', 0.98, 1960, 'USD', 0, 1, 1, 18),
(19, '2022-08-26 17:23:49', 9, 'VENTA', 3000, 'USDT', 3.837, 11511, 'PEN', 0, 1, 0, 19),
(20, '2022-08-29 09:09:42', 9, 'VENTA', 1200, 'USDT', 3.85, 4620, 'PEN', 0, 1, 1, 20),
(21, '2022-08-29 09:21:08', 9, 'VENTA', 1290, 'USDT', 3.84722, 4962.92, 'PEN', 0, 1, 1, 21),
(22, '2022-08-29 09:36:28', 9, 'VENTA', 1300, 'USDT', 3.846, 4999.8, 'PEN', 0, 1, 1, 22),
(23, '2022-08-29 10:08:46', 9, 'VENTA', 1836, 'USDT', 3.845, 7059.42, 'PEN', 0, 1, 1, 23),
(24, '2022-08-29 10:58:33', 9, 'VENTA', 3120, 'USDT', 3.846, 11999.5, 'PEN', 0, 1, 0, 24),
(25, '2022-08-29 12:02:02', 9, 'VENTA', 2000, 'USDT', 3.83802, 7676.03, 'PEN', 0, 1, 1, 25),
(26, '2022-08-29 13:28:13', 9, 'VENTA', 500, 'USDT', 3.83, 1915, 'PEN', 0, 1, 1, 26),
(27, '2022-08-29 13:49:24', 9, 'VENTA', 1200, 'USDT', 3.828, 4593.6, 'PEN', 0, 1, 1, 27),
(28, '2022-08-29 13:58:36', 9, 'VENTA', 1305, 'USDT', 3.829, 4996.84, 'PEN', 0, 1, 1, 28),
(29, '2022-08-29 14:05:09', 9, 'VENTA', 1300, 'USDT', 3.829, 4977.7, 'PEN', 0, 1, 0, 29),
(30, '2022-08-29 14:20:01', 9, 'COMPRA', 14420, 'USDT', 0.970874, 14000, 'USD', 128, 0, 1, 30),
(31, '2022-08-29 14:21:01', 9, 'COMPRA', 14420, 'USDT', 0.970874, 14000, 'USD', 128, 0, 1, 31),
(32, '2022-08-29 15:20:35', 9, 'COMPRA', 14420, 'USDT', 0.970874, 14000, 'USD', 128, 1, 1, 32),
(33, '2022-08-29 16:58:08', 9, 'COMPRA', 185.2, 'USDT', 3.74352, 693.3, 'PEN', 0, 1, 1, 33),
(34, '2022-08-29 16:58:32', 9, 'COMPRA', 163.16, 'USDT', 0.974504, 159, 'USD', 0, 1, 1, 34),
(35, '2022-08-29 16:59:17', 9, 'COMPRA', 2000, 'USDT', 0.98, 1960, 'USD', 0, 1, 1, 35),
(36, '2022-08-31 09:25:21', 9, 'COMPRA', 2000, 'USDT', 3.7436, 7487.2, 'PEN', 0, 1, 0, 36),
(37, '2022-08-31 16:55:24', 9, 'COMPRA', 12360, 'USDT', 0.970874, 12000, 'USD', 128, 1, 1, 37),
(38, '2022-08-31 17:00:32', 9, 'VENTA', 470, 'USDT', 3.844, 1806.68, 'PEN', 0, 1, 1, 38),
(39, '2022-08-31 17:00:54', 9, 'VENTA', 1530, 'USDT', 3.836, 5869.08, 'PEN', 0, 1, 1, 39),
(40, '2022-08-31 17:01:35', 9, 'VENTA', 4160, 'USDT', 3.83, 15932.8, 'PEN', 0, 1, 1, 40),
(41, '2022-08-31 17:01:50', 9, 'VENTA', 4850, 'USDT', 3.83, 18575.5, 'PEN', 0, 1, 1, 41),
(42, '2022-09-01 16:04:57', 9, 'COMPRA', 3000, 'USDT', 3.85, 11550, 'PEN', 0, 0, 1, 42),
(43, '2022-09-01 16:05:33', 9, 'VENTA', 3000, 'USDT', 3.85, 11550, 'PEN', 0, 1, 1, 43),
(44, '2022-09-01 16:06:05', 9, 'VENTA', 1290, 'USDT', 3.852, 4969.08, 'PEN', 0, 1, 1, 44),
(45, '2022-09-01 16:06:23', 9, 'VENTA', 1320, 'USDT', 3.853, 5085.96, 'PEN', 0, 1, 1, 45),
(46, '2022-09-01 16:06:47', 9, 'VENTA', 1550, 'USDT', 3.861, 5984.55, 'PEN', 0, 1, 1, 46),
(47, '2022-09-01 16:06:58', 9, 'VENTA', 2000, 'USDT', 3.85, 7700, 'PEN', 0, 1, 1, 47),
(48, '2022-09-01 16:08:16', 9, 'VENTA', 1850, 'USDT', 3.864, 7148.4, 'PEN', 0, 1, 1, 48),
(49, '2022-09-01 16:08:38', 9, 'VENTA', 3890, 'USDT', 3.85, 14976.5, 'PEN', 0, 1, 1, 49),
(50, '2022-09-01 16:08:58', 9, 'VENTA', 1260, 'USDT', 3.875, 4882.5, 'PEN', 0, 1, 1, 50),
(51, '2022-09-01 16:09:07', 9, 'VENTA', 2000, 'USDT', 3.85, 7700, 'PEN', 0, 1, 1, 51),
(52, '2022-09-01 16:09:56', 9, 'VENTA', 1290, 'USDT', 3.872, 4994.88, 'PEN', 0, 1, 1, 52),
(53, '2022-09-01 16:10:16', 9, 'VENTA', 2700, 'USDT', 3.872, 10454.4, 'PEN', 0, 1, 1, 53),
(54, '2022-09-01 16:10:34', 9, 'VENTA', 2830, 'USDT', 3.85, 10895.5, 'PEN', 0, 1, 1, 54),
(55, '2022-09-01 16:10:50', 9, 'VENTA', 1180, 'USDT', 3.871, 4567.78, 'PEN', 0, 1, 0, 55),
(56, '2022-09-01 16:11:11', 9, 'VENTA', 3000, 'USD', 3.85, 11550, 'PEN', 0, 0, 1, 56),
(57, '2022-09-01 16:47:51', 9, 'VENTA', 3000, 'USDT', 3.85, 11550, 'PEN', 0, 1, 1, 57),
(58, '2022-09-01 16:52:45', 9, 'COMPRA', 21000, 'USDT', 0.97, 20370, 'USD', 128, 1, 1, 58),
(59, '2022-09-01 16:55:03', 9, 'COMPRA', 158.71, 'USDT', 3.76347, 597.3, 'PEN', 0, 1, 1, 59),
(60, '2022-09-01 16:55:38', 9, 'VENTA', 233, 'USDT', 3.95536, 921.6, 'PEN', 0, 1, 1, 60),
(61, '2022-09-01 18:20:30', 9, 'COMPRA', 0.01049, 'BTC', 75786.5, 795, 'PEN', 0, 1, 1, 61),
(62, '2022-09-01 18:20:57', 9, 'VENTA', 0.01049, 'BTC', 20138.2, 211.25, 'USDT', 0, 1, 1, 62),
(63, '2022-09-01 18:26:51', 9, 'VENTA', 1000, 'USDT', 3.85, 3850, 'PEN', 0, 1, 1, 63),
(64, '2022-09-02 11:03:18', 9, 'VENTA', 3160, 'USDT', 3.98611, 12596.1, 'PEN', 129, 1, 1, 64),
(65, '2022-09-02 11:42:45', 9, 'VENTA', 0.01509, 'BTC', 20808.5, 314, 'USD', 125, 1, 1, 65),
(66, '2022-09-02 12:19:57', 9, 'COMPRA', 0.01509, 'BTC', 20212.1, 305, 'USDT', 0, 1, 1, 66),
(67, '2022-09-03 11:06:55', 9, 'COMPRA', 340, 'BUSD', 0.979412, 333, 'USD', 0, 1, 1, 67),
(68, '2022-09-03 11:12:43', 9, 'COMPRA', 12.55, 'USD', 3.88, 48.69, 'PEN', 0, 1, 1, 68),
(69, '2022-09-03 12:20:47', 9, 'COMPRA', 119.2, 'USDT', 3.77349, 449.8, 'PEN', 0, 1, 1, 69),
(70, '2022-09-03 12:44:52', 9, 'COMPRA', 18061, 'USD', 3.88, 70076.7, 'PEN', 128, 0, 1, 70),
(71, '2022-09-03 12:46:11', 9, 'VENTA', 18620, 'USDT', 0.969979, 18061, 'USD', 128, 0, 1, 71),
(72, '2022-09-03 12:52:51', 9, 'COMPRA', 1310, 'USDT', 3.887, 5091.97, 'PEN', 0, 0, 1, 72),
(73, '2022-09-03 12:53:35', 9, 'COMPRA', 3210, 'USDT', 3.888, 12480.5, 'PEN', 0, 0, 1, 73),
(74, '2022-09-03 12:54:14', 9, 'COMPRA', 5000, 'USDT', 3.886, 19430, 'PEN', 0, 0, 1, 74),
(75, '2022-09-03 12:54:44', 9, 'COMPRA', 1670, 'USDT', 3.84, 6412.8, 'PEN', 0, 0, 1, 75),
(76, '2022-09-03 12:58:30', 9, 'VENTA', 3340, 'USDT', 3.84, 12825.6, 'PEN', 0, 1, 1, 76),
(77, '2022-09-03 12:58:54', 9, 'VENTA', 1670, 'USD', 3.84, 6412.8, 'PEN', 0, 0, 1, 77),
(78, '2022-09-03 13:01:47', 9, 'VENTA', 1670, 'USDT', 3.84, 6412.8, 'PEN', 0, 1, 1, 78),
(79, '2022-09-03 13:02:13', 9, 'VENTA', 3000, 'USDT', 3.886, 11658, 'PEN', 0, 1, 1, 79),
(80, '2022-09-03 13:02:40', 9, 'VENTA', 1310, 'USDT', 3.887, 5091.97, 'PEN', 0, 1, 1, 80),
(81, '2022-09-03 13:02:58', 9, 'VENTA', 3210, 'USDT', 3.888, 12480.5, 'PEN', 0, 1, 1, 81),
(82, '2022-09-03 13:03:33', 9, 'COMPRA', 2000, 'USDT', 3.886, 7772, 'PEN', 0, 0, 1, 82),
(83, '2022-09-03 13:29:41', 9, 'COMPRA', 18620, 'USDT', 0.969979, 18061, 'USD', 128, 1, 1, 83),
(84, '2022-09-03 13:42:57', 9, 'VENTA', 2000, 'USDT', 3.886, 7772, 'PEN', 0, 1, 0, 84),
(85, '2022-09-03 13:45:22', 9, 'COMPRA', 18061, 'USD', 3.87, 69896.1, 'PEN', 128, 1, 1, 85),
(86, '2022-09-05 12:26:24', 9, 'VENTA', 0.05068, 'BTC', 20402.5, 1034, 'USD', 126, 1, 1, 86),
(87, '2022-09-05 12:50:20', 9, 'COMPRA', 498.2, 'USDT', 3.78282, 1884.6, 'PEN', 0, 1, 1, 87),
(88, '2022-09-05 12:54:37', 9, 'COMPRA', 0.05068, 'BTC', 19810.6, 1004, 'USDT', 0, 1, 1, 88),
(89, '2022-09-05 13:49:12', 9, 'COMPRA', 1863, 'USDT', 0.969941, 1807, 'USD', 128, 1, 1, 89),
(90, '2022-09-05 18:13:01', 9, 'VENTA', 773, 'USD', 3.89, 3006.97, 'PEN', 0, 0, 1, 90),
(91, '2022-09-05 18:13:52', 9, 'COMPRA', 773, 'USD', 3.89, 3006.97, 'PEN', 0, 1, 1, 91),
(92, '2022-09-06 11:47:39', 9, 'VENTA', 0.10138, 'BTC', 20359, 2064, 'USD', 126, 1, 1, 92),
(93, '2022-09-06 12:06:13', 9, 'COMPRA', 0.10138, 'BTC', 19767.2, 2004, 'USDT', 0, 1, 1, 93),
(94, '2022-09-06 13:27:01', 9, 'VENTA', 0.03048, 'BTC', 19685, 600, 'USD', 130, 0, 1, 94),
(95, '2022-09-06 13:27:58', 9, 'VENTA', 0.03048, 'BTC', 19685, 600, 'USD', 130, 1, 1, 95),
(96, '2022-09-06 14:01:11', 9, 'COMPRA', 0.03048, 'BTC', 19094.5, 582, 'USDT', 0, 1, 0, 96),
(97, '2022-09-06 17:36:09', 9, 'VENTA', 165.88, 'USDT', 4.00711, 664.7, 'PEN', 0, 0, 1, 97),
(98, '2022-09-06 17:37:49', 9, 'VENTA', 165.88, 'USDT', 4.00711, 664.7, 'PEN', 0, 1, 1, 98),
(99, '2022-09-07 09:31:33', 9, 'VENTA', 1000, 'USDT', 4.0078, 4007.8, 'PEN', 131, 1, 1, 99),
(100, '2022-09-07 10:24:43', 9, 'COMPRA', 5637, 'USDT', 0.97002, 5468, 'USD', 128, 1, 1, 100),
(101, '2022-09-07 16:19:14', 9, 'VENTA', 10, 'USDT', 4.68, 46.8, 'PEN', 131, 1, 1, 101),
(102, '2022-09-07 16:56:53', 9, 'COMPRA', 2804, 'USD', 3.9, 10935.6, 'PEN', 0, 1, 1, 102),
(103, '2022-09-08 11:26:05', 9, 'COMPRA', 543.92, 'BUSD', 3.78291, 2057.6, 'PEN', 132, 0, 1, 103),
(104, '2022-09-08 11:27:20', 9, 'COMPRA', 543.92, 'BUSD', 3.78291, 2057.6, 'PEN', 132, 1, 1, 104),
(105, '2022-09-09 12:04:34', 9, 'VENTA', 0.04722, 'BTC', 21918.7, 1035, 'USD', 126, 1, 1, 105),
(106, '2022-09-09 12:09:02', 9, 'COMPRA', 0.04722, 'BTC', 21283.4, 1005, 'USDT', 0, 1, 0, 106),
(107, '2022-09-09 12:10:41', 9, 'COMPRA', 5871, 'USDT', 0.970874, 5700, 'USD', 128, 1, 1, 107),
(108, '2022-09-09 13:39:00', 9, 'COMPRA', 301.71, 'USDT', 3.79305, 1144.4, 'PEN', 133, 0, 1, 108),
(109, '2022-09-09 13:39:51', 9, 'COMPRA', 301.71, 'USDT', 3.79305, 1144.4, 'PEN', 133, 0, 1, 109),
(110, '2022-09-09 13:48:21', 9, 'COMPRA', 301.71, 'USDT', 3.79305, 1144.4, 'PEN', 133, 1, 1, 110),
(111, '2022-09-09 16:27:00', 9, 'COMPRA', 25.41, 'BUSD', 3.56553, 90.6, 'PEN', 132, 0, 1, 111),
(112, '2022-09-09 16:27:49', 9, 'COMPRA', 25.41, 'BUSD', 3.56553, 90.6, 'PEN', 132, 1, 1, 112),
(113, '2022-09-09 17:04:48', 9, 'VENTA', 2500, 'USDT', 3.831, 9577.5, 'PEN', 0, 1, 1, 113),
(114, '2022-09-09 17:06:06', 9, 'VENTA', 1400, 'USDT', 3.837, 5371.8, 'PEN', 0, 1, 1, 114),
(115, '2022-09-09 17:16:19', 9, 'VENTA', 1290, 'USDT', 3.832, 4943.28, 'PEN', 0, 1, 1, 115),
(116, '2022-09-09 17:16:56', 9, 'VENTA', 1110, 'USDT', 3.872, 4297.92, 'PEN', 0, 1, 1, 116),
(117, '2022-09-09 17:17:18', 9, 'VENTA', 1230, 'USDT', 3.87, 4760.1, 'PEN', 0, 1, 1, 117),
(118, '2022-09-09 18:02:42', 9, 'COMPRA', 0.11719, 'BTC', 22024.1, 2581, 'USD', 134, 0, 1, 118),
(119, '2022-09-09 18:05:40', 9, 'VENTA', 0.11719, 'BTC', 22024.1, 2581, 'USD', 0, 0, 1, 119),
(120, '2022-09-09 18:06:16', 9, 'VENTA', 0.11719, 'BTC', 22024.1, 2581, 'USD', 134, 1, 1, 120),
(121, '2022-09-09 18:06:44', 9, 'COMPRA', 0.11719, 'BTC', 21384.1, 2506, 'USDT', 0, 1, 1, 121),
(122, '2022-09-09 18:09:44', 9, 'COMPRA', 2084, 'USD', 3.89, 8106.76, 'PEN', 0, 1, 1, 122),
(123, '2022-09-10 12:13:00', 9, 'VENTA', 0.02715, 'BTC', 22099.4, 600, 'USD', 135, 0, 1, 123),
(124, '2022-09-10 12:14:02', 9, 'VENTA', 0.02715, 'BTC', 22099.4, 600, 'USD', 135, 0, 1, 124),
(125, '2022-09-10 12:14:42', 9, 'VENTA', 0.02715, 'BTC', 22099.4, 600, 'USD', 135, 1, 1, 125),
(126, '2022-09-10 12:17:42', 9, 'COMPRA', 0.02715, 'BTC', 21436.5, 582, 'USDT', 0, 1, 1, 126),
(127, '2022-09-12 09:47:30', 9, 'COMPRA', 10300, 'USDT', 0.970874, 10000, 'USD', 128, 1, 1, 127),
(128, '2022-09-12 15:41:26', 9, 'COMPRA', 1500, 'USDT', 3.82987, 5744.8, 'PEN', 0, 1, 1, 128),
(129, '2022-09-12 16:36:30', 9, 'VENTA', 1500, 'USDT', 3.85267, 5779, 'PEN', 0, 1, 1, 129),
(130, '2022-09-12 16:37:23', 9, 'VENTA', 1020, 'USDT', 3.83198, 3908.62, 'PEN', 0, 1, 1, 130),
(131, '2022-09-12 16:37:47', 9, 'VENTA', 1340, 'USDT', 3.882, 5201.88, 'PEN', 0, 1, 1, 131),
(132, '2022-09-12 16:38:12', 9, 'VENTA', 1290, 'USDT', 3.875, 4998.75, 'PEN', 0, 1, 1, 132),
(133, '2022-09-12 16:38:32', 9, 'VENTA', 1540, 'USDT', 3.873, 5964.42, 'PEN', 0, 1, 1, 133),
(134, '2022-09-12 16:38:46', 9, 'VENTA', 1500, 'USDT', 3.872, 5808, 'PEN', 0, 0, 1, 134),
(135, '2022-09-12 16:39:04', 9, 'VENTA', 2310, 'USDT', 3.871, 8942.01, 'PEN', 0, 1, 1, 135),
(136, '2022-09-12 17:07:44', 9, 'COMPRA', 9400, 'USD', 3.87, 36378, 'PEN', 128, 1, 1, 136),
(137, '2022-09-13 12:10:27', 9, 'VENTA', 0.01708, 'BTC', 21370, 365, 'USD', 125, 1, 1, 137),
(138, '2022-09-13 16:52:18', 9, 'COMPRA', 0.01708, 'BTC', 20784.5, 355, 'USDT', 0, 1, 1, 138),
(139, '2022-09-14 15:05:38', 9, 'COMPRA', 132.7, 'BUSD', 0.979653, 130, 'USD', 0, 1, 1, 139),
(140, '2022-09-14 16:04:56', 9, 'VENTA', 0.07546, 'BTC', 79903.3, 6029.5, 'PEN', 127, 1, 1, 140),
(141, '2022-09-14 16:08:26', 9, 'COMPRA', 0.07546, 'BTC', 19944.3, 1505, 'USDT', 0, 1, 1, 141),
(142, '2022-09-15 16:12:34', 9, 'COMPRA', 500, 'USDT', 3.7828, 1891.4, 'PEN', 0, 1, 1, 142),
(143, '2022-09-15 17:30:02', 9, 'COMPRA', 2807.51, 'USDT', 0.97008, 2723.51, 'USD', 0, 1, 1, 143),
(144, '2022-09-15 17:30:27', 9, 'COMPRA', 2488.51, 'USD', 3.89, 9680.3, 'PEN', 0, 1, 1, 144),
(145, '2022-09-16 12:27:29', 9, 'COMPRA', 4500.71, 'USDT', 0.980003, 4410.71, 'USD', 0, 1, 1, 145),
(146, '2022-09-16 13:58:39', 9, 'COMPRA', 1440, 'USDT', 3.908, 5627.52, 'PEN', 0, 0, 1, 146),
(147, '2022-09-16 13:59:03', 9, 'VENTA', 1440, 'USDT', 3.908, 5627.52, 'PEN', 0, 1, 1, 147),
(148, '2022-09-16 14:05:25', 9, 'VENTA', 2000, 'USDT', 3.907, 7814, 'PEN', 0, 1, 1, 148),
(149, '2022-09-16 14:27:34', 9, 'VENTA', 1030, 'USDT', 3.909, 4026.27, 'PEN', 0, 1, 1, 149),
(150, '2022-09-16 14:45:57', 9, 'VENTA', 2530, 'USDT', 3.908, 9887.24, 'PEN', 0, 1, 1, 150),
(151, '2022-09-16 16:17:06', 9, 'COMPRA', 905, 'BUSD', 0.980111, 887, 'USD', 136, 0, 1, 151),
(152, '2022-09-16 16:21:27', 9, 'COMPRA', 905, 'BUSD', 0.980111, 887, 'USD', 136, 0, 0, 152),
(153, '2022-09-16 16:23:59', 9, 'COMPRA', 905, 'BUSD', 0.980111, 887, 'USD', 136, 1, 1, 153),
(154, '2022-09-16 17:37:38', 9, 'COMPRA', 887, 'USD', 3.89, 3450.43, 'PEN', 0, 1, 0, 154),
(155, '2022-09-16 17:37:57', 9, 'COMPRA', 4410.71, 'USD', 3.89, 17157.7, 'PEN', 0, 1, 0, 155),
(156, '2022-09-16 17:49:36', 9, 'COMPRA', 145.75, 'USDT', 3.7729, 549.9, 'PEN', 133, 1, 1, 156),
(157, '2022-09-19 14:32:08', 9, 'COMPRA', 226.11, 'USDT', 3.76321, 850.9, 'PEN', 137, 0, 1, 157),
(158, '2022-09-19 14:33:05', 9, 'COMPRA', 226.11, 'USDT', 3.76321, 850.9, 'PEN', 137, 0, 1, 158),
(159, '2022-09-19 14:33:59', 9, 'COMPRA', 226.11, 'USDT', 3.76321, 850.9, 'PEN', 137, 1, 1, 159),
(160, '2022-09-19 15:19:58', 9, 'COMPRA', 0.02247, 'BTC', 19448.2, 437, 'USDT', 0, 1, 1, 160),
(161, '2022-09-19 15:20:55', 9, 'VENTA', 0.02247, 'BTC', 20026.7, 450, 'USD', 130, 1, 1, 161),
(162, '2022-09-19 15:48:09', 9, 'COMPRA', 0.10266, 'BTC', 19530.5, 2005, 'USDT', 0, 1, 1, 162),
(163, '2022-09-19 15:49:09', 9, 'VENTA', 0.10266, 'BTC', 20114.9, 2065, 'USD', 134, 0, 1, 163),
(164, '2022-09-19 15:50:10', 9, 'VENTA', 0.10266, 'BTC', 20114.9, 2065, 'USD', 134, 0, 1, 164),
(165, '2022-09-19 15:51:54', 9, 'VENTA', 0.10266, 'BTC', 20114.9, 2065, 'USD', 134, 1, 1, 165),
(166, '2022-09-20 13:55:12', 9, 'COMPRA', 915, 'USDT', 0.970492, 888, 'USD', 0, 1, 1, 166),
(167, '2022-09-20 17:41:30', 9, 'VENTA', 4671, 'USDT', 1.03083, 4815, 'USD', 138, 1, 1, 167),
(168, '2022-09-21 09:25:29', 9, 'COMPRA', 100, 'USDT', 3.783, 378.3, 'PEN', 0, 1, 1, 168),
(169, '2022-09-21 09:26:05', 9, 'COMPRA', 400, 'USDT', 0.97, 388, 'USD', 0, 0, 1, 169),
(170, '2022-09-21 09:27:18', 9, 'COMPRA', 400, 'USDT', 0.97, 388, 'USD', 0, 1, 1, 170),
(171, '2022-09-21 11:04:55', 9, 'COMPRA', 0.05236, 'BTC', 19194, 1005, 'USDT', 0, 1, 1, 171),
(172, '2022-09-21 11:13:09', 9, 'VENTA', 0.05236, 'BTC', 19767, 1035, 'USD', 126, 0, 1, 172),
(173, '2022-09-21 11:14:04', 9, 'VENTA', 0.05236, 'BTC', 19767, 1035, 'USD', 126, 0, 1, 173),
(174, '2022-09-21 11:14:39', 9, 'VENTA', 0.05236, 'BTC', 19767, 1035, 'USD', 126, 1, 1, 174),
(175, '2022-09-21 13:53:49', 9, 'VENTA', 0.02515, 'BTC', 20198.8, 508, 'USD', 139, 1, 1, 175),
(176, '2022-09-21 14:01:31', 9, 'COMPRA', 0.02515, 'BTC', 19642.1, 494, 'USDT', 0, 1, 1, 176),
(177, '2022-09-21 17:53:22', 9, 'COMPRA', 300, 'USDT', 0.97, 291, 'USD', 0, 1, 1, 177),
(178, '2022-09-22 12:41:26', 9, 'COMPRA', 0.04201, 'BTC', 18503, 777.31, 'USD', 140, 1, 1, 178),
(179, '2022-09-22 13:09:28', 9, 'VENTA', 0.04201, 'BTC', 19074.3, 801.31, 'USDT', 0, 1, 1, 179),
(180, '2022-09-22 14:39:20', 9, 'COMPRA', 300, 'BUSD', 1, 300, 'USDT', 0, 1, 1, 180),
(181, '2022-09-22 17:34:30', 9, 'COMPRA', 4442.53, 'USDT', 3.80241, 16892.3, 'PEN', 141, 1, 1, 181),
(182, '2022-09-22 17:45:49', 9, 'COMPRA', 77.31, 'USD', 3.88, 299.96, 'PEN', 0, 1, 1, 182),
(183, '2022-09-23 15:09:23', 9, 'COMPRA', 2000, 'USDT', 3.8024, 7604.8, 'PEN', 0, 1, 1, 183),
(184, '2022-09-23 15:57:38', 9, 'VENTA', 1077, 'USDT', 3.923, 4225.07, 'PEN', 0, 1, 1, 184),
(185, '2022-09-26 12:02:11', 9, 'COMPRA', 0.01052, 'BTC', 18505.7, 194.68, 'USD', 0, 1, 1, 185),
(186, '2022-09-26 12:54:50', 9, 'VENTA', 1556, 'USDT', 1.02828, 1600, 'USD', 0, 1, 0, 186),
(187, '2022-09-26 13:20:48', 9, 'VENTA', 0.01052, 'BTC', 19076, 200.68, 'USDT', 0, 1, 1, 187),
(188, '2022-09-26 13:23:31', 9, 'COMPRA', 47.63, 'USDT', 3.74554, 178.4, 'PEN', 0, 1, 0, 188),
(189, '2022-09-26 14:19:39', 9, 'COMPRA', 148.71, 'USDT', 3.8222, 568.4, 'PEN', 133, 1, 1, 189),
(190, '2022-09-26 16:16:49', 9, 'COMPRA', 1499.71, 'USDT', 0.969994, 1454.71, 'USD', 141, 0, 0, 190),
(191, '2022-09-26 16:20:29', 9, 'COMPRA', 1499.71, 'USDT', 0.969994, 1454.71, 'USD', 141, 1, 1, 191),
(192, '2022-09-26 16:22:38', 9, 'COMPRA', 0.68, 'USD', 3.91, 2.66, 'PEN', 0, 1, 1, 192),
(193, '2022-09-26 16:23:43', 9, 'COMPRA', 0.71, 'USD', 3.91, 2.78, 'PEN', 0, 1, 1, 193),
(194, '2022-09-27 10:09:23', 9, 'COMPRA', 49, 'USDT', 3.74082, 183.3, 'PEN', 0, 1, 1, 194),
(195, '2022-09-27 10:12:01', 9, 'COMPRA', 939.29, 'USDT', 3.83183, 3599.2, 'PEN', 0, 1, 1, 195),
(196, '2022-09-27 14:07:20', 9, 'COMPRA', 300, 'BUSD', 0.97, 291, 'USD', 0, 1, 1, 196),
(197, '2022-09-28 09:12:49', 9, 'COMPRA', 1179.72, 'USDT', 3.83184, 4520.5, 'PEN', 142, 1, 1, 197),
(198, '2022-09-28 14:30:04', 9, 'COMPRA', 1905.42, 'USDT', 3.84157, 7319.8, 'PEN', 143, 0, 1, 198),
(199, '2022-09-28 14:30:48', 9, 'COMPRA', 1905.42, 'USDT', 3.84157, 7319.8, 'PEN', 143, 1, 1, 199),
(200, '2022-09-28 14:56:46', 9, 'VENTA', 3450, 'USDT', 3.951, 13631, 'PEN', 0, 1, 1, 200),
(201, '2022-09-28 15:26:01', 9, 'COMPRA', 0.02407, 'BTC', 75313.7, 1812.8, 'PEN', 140, 0, 1, 201),
(202, '2022-09-28 15:27:25', 9, 'COMPRA', 0.02407, 'BTC', 75313.7, 1812.8, 'PEN', 140, 1, 1, 202),
(203, '2022-09-28 15:48:18', 9, 'VENTA', 0.02407, 'BTC', 19554.2, 470.67, 'USDT', 0, 1, 1, 203),
(204, '2022-09-29 17:09:35', 9, 'COMPRA', 14, 'USDT', 3.09286, 43.3, 'PEN', 142, 1, 1, 204),
(205, '2022-09-30 11:26:27', 9, 'COMPRA', 2000.3, 'USDT', 0.970004, 1940.3, 'USD', 0, 1, 1, 205),
(206, '2022-09-30 13:13:14', 9, 'COMPRA', 0.00785, 'BTC', 76433.1, 600, 'PEN', 0, 1, 1, 206),
(207, '2022-09-30 15:09:59', 9, 'COMPRA', 0.3, 'USD', 3.95, 1.19, 'PEN', 0, 1, 1, 207),
(208, '2022-09-30 15:10:29', 9, 'VENTA', 0.00785, 'BTC', 19710.8, 154.73, 'USDT', 0, 1, 1, 208),
(209, '2022-09-30 16:31:31', 9, 'VENTA', 2100, 'USDT', 3.985, 8368.5, 'PEN', 0, 1, 1, 209),
(210, '2022-10-01 11:27:04', 9, 'VENTA', 0.01063, 'BTC', 79012.2, 839.9, 'PEN', 144, 0, 1, 210),
(211, '2022-10-01 11:27:45', 9, 'VENTA', 0.01063, 'BTC', 79012.2, 839.9, 'PEN', 144, 1, 1, 211),
(212, '2022-10-01 11:39:22', 9, 'COMPRA', 0.01063, 'BTC', 19285, 205, 'USDT', 0, 1, 0, 212),
(213, '2022-10-03 09:40:40', 9, 'COMPRA', 2040.5, 'USDT', 0.980152, 2000, 'USD', 136, 1, 1, 213),
(214, '2022-10-03 10:45:26', 9, 'COMPRA', 0.01282, 'BTC', 74992.2, 961.4, 'PEN', 145, 1, 1, 214),
(215, '2022-10-03 10:50:28', 9, 'VENTA', 0.01282, 'BTC', 19424.3, 249.02, 'USDT', 0, 1, 1, 215),
(216, '2022-10-03 15:26:40', 9, 'COMPRA', 0.00073314, 'BTC', 65881, 48.3, 'PEN', 0, 1, 1, 216),
(217, '2022-10-03 15:27:19', 9, 'COMPRA', 0.00073314, 'BTC', 19464.2, 14.27, 'USDT', 0, 1, 1, 217),
(218, '2022-10-03 16:13:12', 9, 'VENTA', 0.0496, 'BTC', 20161.3, 1000, 'USD', 135, 1, 1, 218),
(219, '2022-10-03 16:28:47', 9, 'COMPRA', 0.0496, 'BTC', 19556.5, 970, 'USDT', 0, 1, 1, 219),
(220, '2022-10-03 16:31:30', 9, 'VENTA', 1959.5, 'BUSD', 1, 1959.5, 'USDT', 0, 1, 1, 220),
(221, '2022-10-03 16:54:49', 9, 'COMPRA', 32.51, 'USDT', 3.69732, 120.2, 'PEN', 0, 1, 1, 221),
(222, '2022-10-04 10:59:44', 9, 'COMPRA', 0.0102, 'BTC', 82343.1, 839.9, 'PEN', 144, 0, 1, 222),
(223, '2022-10-04 11:05:33', 9, 'COMPRA', 0.0102, 'BTC', 20098, 205, 'USDT', 0, 1, 1, 223),
(224, '2022-10-04 13:25:04', 9, 'VENTA', 25.8, 'USDT', 4.15504, 107.2, 'PEN', 146, 0, 1, 224),
(225, '2022-10-04 13:26:16', 9, 'VENTA', 25.8, 'USDT', 4.15504, 107.2, 'PEN', 146, 1, 1, 225),
(226, '2022-10-04 15:53:13', 9, 'VENTA', 0.0102, 'BTC', 82343.1, 839.9, 'PEN', 144, 1, 1, 226),
(227, '2022-10-04 16:14:53', 9, 'COMPRA', 0.06187, 'BTC', 20381.4, 1261, 'USDT', 0, 1, 1, 227),
(228, '2022-10-04 16:15:52', 9, 'VENTA', 0.06187, 'BTC', 21011.8, 1300, 'USD', 130, 1, 1, 228),
(229, '2022-10-04 16:31:27', 9, 'COMPRA', 249.71, 'USDT', 3.86128, 964.2, 'PEN', 0, 1, 1, 229),
(230, '2022-10-04 16:39:44', 9, 'COMPRA', 0.00146628, 'BTC', 68199.8, 100, 'PEN', 0, 0, 0, 230),
(231, '2022-10-04 16:40:13', 9, 'VENTA', 0.00146628, 'BTC', 68199.8, 100, 'PEN', 0, 0, 0, 231),
(232, '2022-10-04 16:41:16', 9, 'VENTA', 0.00146628, 'BTC', 68199.8, 100, 'PEN', 0, 1, 1, 232),
(233, '2022-10-05 09:41:23', 9, 'COMPRA', 117.18, 'USDT', 0.972862, 114, 'USD', 131, 1, 1, 233),
(234, '2022-10-05 11:09:55', 9, 'VENTA', 300, 'USDT', 1.03, 309, 'USD', 0, 1, 1, 234),
(235, '2022-10-05 12:34:43', 9, 'COMPRA', 0.01509, 'BTC', 20212.1, 305, 'USDT', 0, 1, 1, 235),
(236, '2022-10-05 12:37:57', 9, 'VENTA', 0.01509, 'BTC', 20808.5, 314, 'USD', 125, 1, 1, 236),
(237, '2022-10-05 14:54:07', 9, 'COMPRA', 190, 'USDT', 3.86105, 733.6, 'PEN', 0, 0, 1, 237),
(238, '2022-10-05 14:54:53', 9, 'COMPRA', 190, 'USDT', 3.86105, 733.6, 'PEN', 0, 1, 1, 238),
(239, '2022-10-06 10:29:46', 9, 'COMPRA', 15656, 'USDT', 0.970874, 15200, 'USD', 128, 1, 1, 239),
(240, '2022-10-06 10:35:06', 9, 'COMPRA', 309, 'BUSD', 0.970874, 300, 'USD', 0, 0, 1, 240),
(241, '2022-10-06 10:35:30', 9, 'COMPRA', 91, 'BUSD', 3.87143, 352.3, 'PEN', 0, 1, 1, 241),
(242, '2022-10-06 10:36:27', 9, 'COMPRA', 309, 'BUSD', 0.970874, 300, 'USD', 0, 1, 1, 242),
(243, '2022-10-06 13:17:28', 9, 'COMPRA', 0.01449, 'BTC', 20082.8, 291, 'USDT', 0, 1, 1, 243),
(244, '2022-10-06 13:18:43', 9, 'VENTA', 0.01449, 'BTC', 20703.9, 300, 'USD', 130, 1, 1, 244),
(245, '2022-10-06 15:21:10', 9, 'VENTA', 3000, 'USDT', 0.001305, 3.915, 'PEN', 0, 0, 1, 245),
(246, '2022-10-06 15:24:26', 9, 'VENTA', 2850, 'USDT', 3.91, 11143.5, 'PEN', 0, 1, 1, 246),
(247, '2022-10-06 15:26:25', 9, 'VENTA', 2000, 'USDT', 3.9, 7800, 'PEN', 0, 1, 1, 247),
(248, '2022-10-06 15:27:14', 9, 'VENTA', 1990, 'USDT', 3.948, 7856.52, 'PEN', 0, 1, 1, 248),
(249, '2022-10-06 15:27:37', 9, 'VENTA', 2140, 'USDT', 3.947, 8446.58, 'PEN', 0, 1, 1, 249),
(250, '2022-10-06 15:27:55', 9, 'VENTA', 1120, 'USDT', 3.947, 4420.64, 'PEN', 0, 1, 1, 250),
(251, '2022-10-06 15:28:17', 9, 'VENTA', 1900, 'USDT', 3.945, 7495.5, 'PEN', 0, 1, 1, 251),
(252, '2022-10-06 15:52:00', 9, 'VENTA', 0.05011, 'BTC', 20654.6, 1035, 'USD', 126, 0, 1, 252),
(253, '2022-10-06 15:52:41', 9, 'VENTA', 0.05011, 'BTC', 20654.6, 1035, 'USD', 126, 1, 1, 253),
(254, '2022-10-06 16:00:14', 9, 'COMPRA', 0.05011, 'BTC', 20055.9, 1005, 'USDT', 0, 1, 1, 254),
(255, '2022-10-06 16:02:19', 9, 'VENTA', 10064, 'USD', 3.97, 39954.1, 'PEN', 128, 0, 1, 255),
(256, '2022-10-06 16:03:51', 9, 'COMPRA', 10064, 'USD', 3.97, 39954.1, 'PEN', 128, 1, 1, 256),
(257, '2022-10-06 11:37:26', 0, 'COMPRA', 3000, 'USDT', 3.85, 11550, 'PEN', 0, 1, 1, 257),
(258, '2022-10-10 10:54:41', 0, 'COMPRA', 0.005, 'BTC', 44000, 220, 'PEN', 0, 1, 1, 258),
(259, '2022-10-10 10:55:13', 0, 'COMPRA', 0.02, 'BTC', 11370, 227.4, 'USD', 0, 1, 1, 259),
(260, '2022-10-10 10:55:40', 0, 'VENTA', 0.05, 'BTC', 12208, 610.4, 'USD', 0, 1, 1, 260),
(261, '2022-10-10 12:43:00', 0, 'VENTA', 100, 'BTC', 12208, 1220800, 'USD', 0, 1, 1, 261);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nom_usuario` varchar(50) NOT NULL,
  `pas_usuario` varchar(50) NOT NULL,
  `niv_usuario` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nom_usuario`, `pas_usuario`, `niv_usuario`, `id_caja`) VALUES
(0, 'master', 'master2020', 0, 0),
(9, 'NATHALIE', '2021', 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id_token`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cierre`
--
ALTER TABLE `cierre`
  ADD PRIMARY KEY (`id_cierre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `divisas`
--
ALTER TABLE `divisas`
  ADD PRIMARY KEY (`id_divisa`);

--
-- Indices de la tabla `ent_sal`
--
ALTER TABLE `ent_sal`
  ADD PRIMARY KEY (`id_ent_sal`);

--
-- Indices de la tabla `ganancia`
--
ALTER TABLE `ganancia`
  ADD PRIMARY KEY (`id_ganancia`);

--
-- Indices de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`id_operacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `cierre`
--
ALTER TABLE `cierre`
  MODIFY `id_cierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `id_divisa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ent_sal`
--
ALTER TABLE `ent_sal`
  MODIFY `id_ent_sal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ganancia`
--
ALTER TABLE `ganancia`
  MODIFY `id_ganancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
