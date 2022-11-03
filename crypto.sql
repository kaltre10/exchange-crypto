-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2022 a las 03:32:37
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
  `compra_cierre` varchar(100) DEFAULT NULL,
  `venta_cierre` varchar(100) DEFAULT NULL,
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
  `nom_cliente` varchar(100) NOT NULL,
  `pais_cliente` varchar(50) DEFAULT NULL,
  `ocu_cliente` varchar(50) DEFAULT NULL,
  `po_cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `doc_cliente`, `n_cliente`, `nom_cliente`, `pais_cliente`, `ocu_cliente`, `po_cliente`) VALUES
(0, '', '0', 'REGULAR', NULL, NULL, ''),
(2, 'PAS', '149889214', 'Jason Hernandez', 'Venezuela', '010', 'NO'),
(9, 'DNI', '002066886', 'EMILY MCDERMOTT', 'Perú', '004', 'SI'),
(11, 'RUC', '10092383658', 'CASA DE CAMBIOS SANTA ROSA DE LIMA', NULL, NULL, ''),
(12, 'DNI', '74063949', 'JEREMY SERVANTES', NULL, NULL, ''),
(13, 'DNI', '40692123', 'DANITZA CARDENAS SIFUENTES', NULL, NULL, ''),
(14, 'DNI', '44588600', 'KATTY MAURICIO GARCIA', NULL, NULL, ''),
(15, 'DNI', '41055235', 'EDISON PACHECO', NULL, NULL, ''),
(16, 'CE', '002958156', 'FRANCISCO MING', NULL, NULL, ''),
(17, 'DNI', '40609728', 'MANUEL CERNA ROJAS', NULL, NULL, ''),
(18, 'CE', '002348473', 'RAFAEL CARLOS ALONSO TAPIA', NULL, NULL, ''),
(19, 'DNI', '10480934', 'ANDRES HUAMANI ACHO', NULL, NULL, ''),
(20, 'CE', '000284851', 'D ANS ALLEMAN BARTHELEMY ', NULL, NULL, ''),
(21, 'DNI', '00820443', 'JUANA CUMADA TRAUCO DE OSHIRO', NULL, NULL, ''),
(22, 'RUC', '20511017743', 'MAC DOLAR CAMBIOS DE DIVISAS S.A.C.', NULL, NULL, ''),
(23, 'DNI', '40484279', 'CLEIRA TORRES LIZANA', NULL, NULL, ''),
(24, 'DNI', '09390644', 'MIGUEL RONCEROS NECIOSUP', NULL, NULL, ''),
(25, 'DNI', '70745454', 'SERGIO ALONSO URBINA ESPINOZA', NULL, NULL, ''),
(26, 'DNI', '45864591', 'ROSA RIVAS RAMIREZ', NULL, NULL, ''),
(27, 'DNI', '09403276', 'JESUS CASTILLO', NULL, NULL, ''),
(28, 'RUC', '20451601491', 'MANZANA VERDE', NULL, NULL, ''),
(29, 'DNI', '40195103', 'MARIELA HUANGAL LEGUIA', NULL, NULL, ''),
(30, 'CE', '00196684', 'HILDA NATERA PONTE', NULL, NULL, ''),
(31, 'DNI', '04748858', 'EDGAR CCOLLA VARGAS', NULL, NULL, ''),
(32, 'DNI', '10803558', 'CESAR AUGUSTO OJEDA ZEGARRA', NULL, NULL, ''),
(33, 'DNI', '09674501', 'JACQUELINE PEREZ CASTAÑEDA', NULL, NULL, ''),
(34, 'DNI', '45675455', 'JAIRO MANRIQUE', NULL, NULL, ''),
(35, 'DNI', '42968850', 'LUIS RODOLFO RIOS DUMET', NULL, NULL, ''),
(37, 'RUC', '20602431216', 'GRUPO SECUREX SAC', NULL, NULL, ''),
(38, 'DNI', '42734382', 'ALEXANDER MARQUEZ URCIA', NULL, NULL, ''),
(39, 'DNI', '001324967', 'MANUEL VILLAR RODRIGUEZ', NULL, NULL, ''),
(40, 'DNI', '18138465', 'JUAN MANUEL CHAN', NULL, NULL, ''),
(41, 'DNI', '45657141', 'EDUARDO LA RIVA', NULL, NULL, ''),
(42, 'DNI', '09350147', 'ELIAS BALVIN', NULL, NULL, ''),
(43, 'DNI', '06008558', 'PEDRO GIL CASTAÑEDA ', NULL, NULL, ''),
(44, 'DNI', '40023084', 'VICTOR PABLO MELT CAMPOS', NULL, NULL, ''),
(45, 'DNI', '00802487', 'HILMER GUZMAN DE REATEGUI', NULL, NULL, ''),
(46, 'DNI', '07232832', 'CARLOS BAGAZO', NULL, NULL, ''),
(47, 'RUC', '20517430596', 'ECOPROJET SAC', NULL, NULL, ''),
(48, 'DNI', '41715166', 'MANUEL FUERTES', NULL, NULL, ''),
(49, 'DNI', '10735509', 'GONZALO FALLA CARILLO', NULL, NULL, ''),
(50, 'DNI', '42411571', 'FREDDY TTITO THUPA', NULL, NULL, ''),
(51, 'RUC', '20602492541', 'FRIGOINCA SAC', NULL, NULL, ''),
(52, 'DNI', '08230054', 'ALFREDO FERRERO', NULL, NULL, ''),
(53, 'RUC', '2012108443', 'INDUSTRIAS TRIVECA S.A.C.', NULL, NULL, ''),
(54, 'DNI', '19937768', 'DIANA MARICELA VELIZ CALDERON', NULL, NULL, ''),
(55, 'RUC', '20604004251', 'INVERSIONES DIVISAS SAC', NULL, NULL, ''),
(56, 'DNI', '48506372', 'HORACIO BENINCASA', NULL, NULL, ''),
(57, 'RUC', '10435895234', 'CAMBIOS EVELYN', NULL, NULL, ''),
(58, 'DNI', '76327397', 'YOSELIN HUAMANI FLORES', NULL, NULL, ''),
(59, 'DNI', '07957502', 'VIDAL GALINDO VERASTEGUI', NULL, NULL, ''),
(60, 'RUC', '20606640758', 'VIAJES VAN PERU EIRL', NULL, NULL, ''),
(61, 'DNI', '06486871', 'HECTOR JONE HUACCHO NAVARRO', NULL, NULL, ''),
(62, 'DNI', '07861015', 'JORGE CARHUANCO ESCOBAR', NULL, NULL, ''),
(63, 'DNI', '40974776', 'KARLA LANDA CHANGANA', NULL, NULL, ''),
(64, 'DNI', '40497920', 'DAMIAN VILLANUEVA OLANO', NULL, NULL, ''),
(65, 'DNI', '09344677', 'JOSE ANTONIO MARQUINA GANOZA', NULL, NULL, ''),
(66, 'CE', '001464228', 'JOHNNY DUQUE', NULL, NULL, ''),
(67, 'DNI', '06765380', 'MANUEL ROLANDO NIETO CERDA', NULL, NULL, ''),
(68, 'DNI', '06509117', 'CARMEN ACOSTA DE HELM', NULL, NULL, ''),
(69, 'DNI', '70189576', 'JOSE LOYOLA YLLESCAS', NULL, NULL, ''),
(70, 'DNI', '07878881', 'XIMENA FRANCO CALLE', NULL, NULL, ''),
(71, 'DNI', '41166743', 'CARLOS ZUÑIGA GOGNY', NULL, NULL, ''),
(72, 'RUC', '20492058646', 'INVERSIONES VIRGEN DEL PERPETUO SOCORRO SAC', NULL, NULL, ''),
(73, 'DNI', '20607149837', 'DIVISAS ANGEL S.A.C.', NULL, NULL, ''),
(74, 'DNI', '43904851', 'ERICK ALBINO CAQUI', NULL, NULL, ''),
(76, 'DNI', '06104670', 'FLAVIANO HUAMAN MACEDO', NULL, NULL, ''),
(77, 'DNI', '07538346', 'LUIS LUQUE TEJADA', NULL, NULL, ''),
(78, 'DNI', '07966235', 'LUIS SANGUINETTI DIAZ', NULL, NULL, ''),
(79, 'CE', '001989558', 'FERNANDO JACOME', NULL, NULL, ''),
(80, 'RUC', '20606849681', 'CONSORCIO CIRCUITO', NULL, NULL, ''),
(82, 'DNI', '08810566', 'BASILIO FLORES ESTRADA', NULL, NULL, ''),
(83, 'RUC', '20602851894', 'NEGOCIACIONES LIMA SANTA ROSA', NULL, NULL, ''),
(84, 'RUC', '10435895234', 'KAMBIO$ VIP', NULL, NULL, ''),
(85, 'DNI', '41771590', 'WILLIAMS AZA ASTUCURI', NULL, NULL, ''),
(86, 'DNI', '09087013', 'YNES GLADYS ALARCON GARCIA', NULL, NULL, ''),
(87, 'DNI', '40389007', 'ROBERTO CARLO MATOS CALDAS', NULL, NULL, ''),
(88, 'DNI', '46492329', 'CAROLINA CHU GONZALES', NULL, NULL, ''),
(89, 'DNI', '44833043', 'ALEXANDER VARGAS MORVELI', NULL, NULL, ''),
(90, 'DNI', '43698238', 'VICTOR TRELLES CARRILLO', NULL, NULL, ''),
(91, 'DNI', '08720298', 'FELIX VILCHEZ HORNA', NULL, NULL, ''),
(92, 'DNI', '73786622', 'MATHIAS MINCHAN WOLSTROHN', NULL, NULL, ''),
(93, 'DNI', '40749327', 'NANCI MENDOZA PAREDES', NULL, NULL, ''),
(94, 'DNI', '07742867', 'JAVIER BARCO', NULL, NULL, ''),
(95, 'DNI', '40189497', 'ADA MENDOZA PALOMINO', NULL, NULL, ''),
(96, 'CE', '001404590', 'LAO LI', NULL, NULL, ''),
(97, 'DNI', '07863635', 'GROVER MORALES HUALPA', NULL, NULL, ''),
(98, 'RUC', '20512791825', 'GLASS IMPORT AUTOMOTRIZ', NULL, NULL, ''),
(99, 'DNI', '08961960', 'GONZALO NICANOR NIETO SALCEDO', NULL, NULL, ''),
(100, 'DNI', '08808900', 'JORGE WONG WONG ', NULL, NULL, ''),
(101, 'DNI', '40384225', 'CARLOS RAMOS ABENSUR', NULL, NULL, ''),
(102, 'RUC', '20607077607', 'PERUVIAN ALIMENT COMPANY SOCIEDAD ANONIMA CERRADA', NULL, NULL, ''),
(103, 'DNI', '07877161', 'ELSA HUAMAN YLLESCA', NULL, NULL, ''),
(104, 'DNI', '46892849', 'VICTOR CASAVILCA QUICHCA', NULL, NULL, ''),
(105, 'DNI', '46791113', 'RAUL ESPINOZA MESTANZA', NULL, NULL, ''),
(106, 'RUC', '10157028907', 'CAMBIOS EFRAIN', NULL, NULL, ''),
(107, 'DNI', '07828226', 'TEOFILO JESUS PEREZ CHAVAYA', NULL, NULL, ''),
(108, 'DNI', '46380779', 'RICHARD ESPINOZA', NULL, NULL, ''),
(109, 'DNI', '08944091', 'DELIA MESA ROMERO', NULL, NULL, ''),
(110, 'DNI', '07796040', 'IDA RODRIGUEZ NUÑEZ DE RAMIREZ', NULL, NULL, ''),
(111, 'DNI', '09584938', 'EUGENIO MEJIA RIVERA', NULL, NULL, ''),
(112, 'PAS', '42651463', 'CRISTIAN FAUNDES SANCHEZ', NULL, NULL, ''),
(114, 'DNI', '06310543', 'FERNANDO REAÑO IBAÑEZ', NULL, NULL, ''),
(115, 'DNI', '28977234', 'NIEVES DAISY CARHUAS GUTIERREZ', NULL, NULL, ''),
(116, 'CE', '001335996', 'ENRIQUE MARTINEZ GARCIA', NULL, NULL, ''),
(117, 'DNI', '07568792', 'JORGE REYES RAMO', NULL, NULL, ''),
(118, 'DNI', '10492316', 'CARLOS EDUARDO DEL SOLAR SEGURA', NULL, NULL, ''),
(119, 'RUC', '20521377136', 'HL REPRESENTACIONES GENERALES S.R.L.', NULL, NULL, ''),
(120, 'CE', '000497161', 'CARMEN LIU', NULL, NULL, ''),
(121, 'RUC', '20606964341', 'J & N GLOBAL SERVICES PERU SAC', NULL, NULL, ''),
(122, 'RUC', '20451760883', 'SIGI PERUANA EIRL', NULL, NULL, ''),
(123, 'DNI', '74720221', 'MARCO MONTENEGRO', NULL, NULL, ''),
(124, 'DNI', '07845451', 'MARIA ESTER ARAUJO ', NULL, NULL, ''),
(125, 'DNI', '08211502', 'CESAR ALEJANDRO ACUÑA FOPPIANO', NULL, NULL, ''),
(126, 'DNI', '05224185', 'NICOLOSA GONZALES LA TORRE DE SIFUENTES', NULL, NULL, ''),
(127, 'DNI', '43601417', 'FERNANDO RENGIFO CHAVEZ', NULL, NULL, ''),
(128, 'DNI', '18197947', 'PEDRO HOYOS PARDO', NULL, NULL, ''),
(129, 'DNI', '00240497', 'FERNANDO ATOCHE TOVAR', NULL, NULL, ''),
(130, 'CE', '003626783', 'DIEGO EMILIO VICKE MENDOZA', NULL, NULL, ''),
(131, 'DNI', '47506556', 'BETEL PERALTA GALVEZ', NULL, NULL, ''),
(132, 'DNI', '78113237', 'STEFANO ALEXANDER VALLADARES PRE', NULL, NULL, ''),
(133, 'DNI', '16581559', 'MARIA MANUELA BARRETO VDA DE DAVILA', NULL, NULL, ''),
(134, 'DNI', '07866938', 'MARIA GOMEZ PAICO', NULL, NULL, ''),
(135, 'DNI', '21867691', 'TANIA JESUS PACHECO ENRIQUEZ DE TRISCHMAN', NULL, NULL, ''),
(136, 'DNI', '76220697', 'BRAYAN JIMY RAMOS QUISPE', NULL, NULL, ''),
(137, 'DNI', '09759458', 'JULIA MABEL NUÑEZ VARGAS', NULL, NULL, ''),
(138, 'DNI', '09871853', 'FLOR SARAI AVELLANEDA CHAVEZ', NULL, NULL, ''),
(139, 'DNI', '10080161', 'MICHAEL RIOS GUARDIA', NULL, NULL, ''),
(140, 'DNI', '06442053', 'DANIEL ROBERTO VASQUEZ CARDOZA', NULL, NULL, ''),
(141, 'DNI', '75210604', 'MARKO ALEXANDER LA TORRE VASQUEZ', NULL, NULL, ''),
(142, 'DNI', '10713930', 'FIDEL GONZALO HUERTA ZEGARRA', NULL, NULL, ''),
(143, 'DNI', '77670085', 'JEAN PIERRE ALI HERRERA', NULL, NULL, ''),
(144, 'CE', '000540893', 'KARINA CASTRO SANCHEZ', NULL, NULL, ''),
(145, 'DNI', '08171024', 'ANA MARIA MALDONADO CASAS', NULL, NULL, ''),
(146, 'DNI', '77421907', 'JEAN POOL GABRIEL GARCIA', NULL, NULL, '');

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
  MODIFY `id_cierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

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
  MODIFY `id_ent_sal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `ganancia`
--
ALTER TABLE `ganancia`
  MODIFY `id_ganancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
