-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2022 a las 23:30:04
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `token` varchar(1000) NOT NULL,
  `id_token` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `can_cierre` float(11,2) NOT NULL,
  `fec_cierre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id_cuenta` int(11) NOT NULL,
  `nom_cuenta` varchar(50) NOT NULL,
  `des_cuenta` varchar(100) NOT NULL,
  `sal_cuenta` float(11,2) NOT NULL DEFAULT '0.00',
  `id_divisa` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `id_divisa` int(11) NOT NULL,
  `cod_divisa` varchar(3) NOT NULL,
  `com_divisa` float NOT NULL,
  `ven_divisa` float NOT NULL,
  `nom_divisa` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id_divisa`, `cod_divisa`, `com_divisa`, `ven_divisa`, `nom_divisa`) VALUES
(2, 'EUR', 4.35, 4.45, 'euro'),
(3, 'CLP', 0.0038, 0.0044, 'pesos chilenos'),
(4, 'COP', 0.0008, 0.001075, 'pesos colombianos'),
(9, 'USD', 3.85, 3.89, 'dolares'),
(10, 'PEN', 1, 1, 'Soles Peruanos'),
(11, 'BRL', 0.68, 0.75, 'reales brasil'),
(12, 'GBP', 4.1, 4.7, 'libra esterlina'),
(14, 'BOB', 0.295, 0.3, 'pesos bolivianos'),
(15, 'MXN', 0.15, 0.2, 'peso mexicano'),
(16, 'CAD', 2.5, 3, 'dolar canadiense'),
(17, 'AUD', 2.38, 2.5, 'dolar australiano'),
(18, 'ARG', 0.011, 0.04, 'peso argentino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ent_sal`
--

CREATE TABLE `ent_sal` (
  `id_ent_sal` int(11) NOT NULL,
  `fec_ent_sal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  `tip_ent_sal` varchar(10) NOT NULL,
  `can_ent_sal` varchar(8) NOT NULL,
  `id_divisa` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `des_ent_sal` varchar(100) NOT NULL,
  `sta_ent_sal` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganancia`
--

CREATE TABLE `ganancia` (
  `id_ganancia` int(11) NOT NULL,
  `can_ganancia` varchar(50) NOT NULL,
  `fec_ganancia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `id_operacion` int(11) NOT NULL,
  `fec_operacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  `tip_operacion` varchar(10) NOT NULL,
  `mon_operacion` float NOT NULL,
  `div_operacion` varchar(5) NOT NULL,
  `cot_operacion` float NOT NULL,
  `rec_operacion` float NOT NULL,
  `mon_rec_operacion` varchar(3) NOT NULL,
  `cli_operacion` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `report` int(11) NOT NULL,
  `correlative_sunat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'kaltre10@gmail.com', '1234', 0, 1),
(9, 'NATHALIE', '2021', 0, 1),
(10, 'fernando', 'ewcambios2020', 0, 1);

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
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id_cierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2088;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `id_divisa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ent_sal`
--
ALTER TABLE `ent_sal`
  MODIFY `id_ent_sal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1214;

--
-- AUTO_INCREMENT de la tabla `ganancia`
--
ALTER TABLE `ganancia`
  MODIFY `id_ganancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16417;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
