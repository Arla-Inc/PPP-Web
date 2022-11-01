-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-11-2022 a las 18:45:36
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ppp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `idclientes_UNIQUE` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `cedula`, `direccion`, `telefono`, `estado`) VALUES
(1, 'Mario Casas', '103259878', 'Los Lagos', '214545', 1),
(2, 'Juan Camilo', '281-051089-0012s', 'Torres', '333333', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE IF NOT EXISTS `gastos` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `concepto` varchar(50) NOT NULL,
  `gasto` decimal(16,2) NOT NULL,
  PRIMARY KEY (`idgasto`),
  UNIQUE KEY `idgasto_UNIQUE` (`idgasto`),
  KEY `fkgastosusuarios_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `idprestamo` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `cuota` decimal(16,2) NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fkPrestamos_idx` (`idprestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpago`, `idprestamo`, `usuario`, `fecha`, `cuota`) VALUES
(2, 2, 'juan', '2019-04-30 00:00:00', '1000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(50) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `permiso`) VALUES
(1, 'Escritorio'),
(2, 'Clientes'),
(3, 'Prestamos'),
(4, 'Pagos'),
(5, 'Usuarios'),
(6, 'Gastos'),
(7, 'Consultas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `idprestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fprestamo` datetime NOT NULL,
  `monto` decimal(16,2) NOT NULL,
  `interes` decimal(16,2) NOT NULL,
  `saldo` decimal(16,2) NOT NULL,
  `formapago` varchar(20) DEFAULT NULL,
  `fpago` datetime DEFAULT NULL,
  `plazo` varchar(20) DEFAULT NULL,
  `fplazo` datetime DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idprestamo`),
  KEY `fkClientes_idx` (`idcliente`),
  KEY `fkusuarios_idx` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idprestamo`, `idcliente`, `usuario`, `fprestamo`, `monto`, `interes`, `saldo`, `formapago`, `fpago`, `plazo`, `fplazo`, `estado`) VALUES
(2, 1, 3, '2019-04-30 00:00:00', '10000.00', '20.00', '12000.00', 'Diario', '2019-04-01 00:00:00', 'Mes', '2019-05-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariopermiso`
--

DROP TABLE IF EXISTS `usuariopermiso`;
CREATE TABLE IF NOT EXISTS `usuariopermiso` (
  `idusuariopermiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `idpermiso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuariopermiso`),
  UNIQUE KEY `idusuariopermiso_UNIQUE` (`idusuariopermiso`),
  KEY `fkPermiso_idx` (`idpermiso`),
  KEY `fkUsuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuariopermiso`
--

INSERT INTO `usuariopermiso` (`idusuariopermiso`, `idusuario`, `idpermiso`) VALUES
(73, 4, 1),
(74, 4, 2),
(75, 4, 3),
(76, 4, 4),
(77, 4, 5),
(78, 4, 6),
(79, 4, 7),
(80, 3, 1),
(81, 3, 2),
(82, 3, 3),
(83, 3, 4),
(84, 3, 5),
(85, 3, 6),
(86, 3, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `direccion`, `telefono`, `login`, `clave`, `imagen`, `estado`) VALUES
(3, 'Laura', 'Centro 2', '8333333', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1667328111.jpg', 1),
(4, 'Arthuro', 'Centro', '222222', 'arthuro', 'b75b74ff496e84c01de3985f0d5c1672ce8db7cbbc0ac3ffd3c5ad5812a12e55', '1667328097.jpg', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `fkgastosusuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fkPrestamos` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fkClientes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkusuarios` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariopermiso`
--
ALTER TABLE `usuariopermiso`
  ADD CONSTRAINT `fkPermiso` FOREIGN KEY (`idpermiso`) REFERENCES `permisos` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkUsuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
