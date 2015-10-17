-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2015 a las 10:52:03
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `supermercado`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto`(IN `pID` INT, IN `pnombre` VARCHAR(150), IN `pcant_inventario` INT, IN `pcosto` INT, IN `pprecio_final` INT, IN `pdescuento` INT, IN `pfoto` LONGBLOB)
BEGIN
update producto
set producto.nombre=pnombre, producto.cant_inventario=pcant_inventario,producto.costo=pcosto,producto.precio_final=pprecio_final,producto.descuento=pdescuento,producto.foto=pfoto
where producto.ID=pID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario`(IN `pcorreo` VARCHAR(255), IN `pnombre` VARCHAR(50), IN `papellido1` VARCHAR(50), IN `papellido2` VARCHAR(50), IN `pclave` VARCHAR(255), IN `pfoto` LONGBLOB)
BEGIN
update usuario set usuario.nombre=nombre,usuario.apellido1=papellido1,usuario.apellido2=papellido2,usuario.clave=pclave,usuario.foto=pfoto
where usuario.correo = pcorreo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto`(IN `pID` INT, IN `pnombre` VARCHAR(150), IN `pcant` INT, IN `pcosto` INT, IN `pprecio_final` INT, IN `pdescuento` INT, IN `pfoto` LONGBLOB)
BEGIN
insert into producto(ID,nombre,cant_inventario,costo,precio_final,descuento,foto)
values (pID,pnombre,pcant,pcosto,pprecio_final,pdescuento,pfoto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `pcorreo` VARCHAR(255), IN `pnombre` VARCHAR(50), IN `papellido1` VARCHAR(50), IN `papellido2` VARCHAR(50), IN `pclave` VARCHAR(255), IN `pfoto` LONGBLOB)
BEGIN
insert into usuario (correo,nombre,apellido1,apellido2,clave,es_admin,foto)
values(pcorreo,pnombre,papellido1,papellido2,pclave,0,pfoto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nombrarAdmin`(IN `pcorreo` VARCHAR(255), IN `pAdmin` BIT)
BEGIN
update usuario 
set usuario.es_admin = pAdmin 
where usuario.correo = pcorreo;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `cant_inventario` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  `precio_final` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `foto` longblob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE IF NOT EXISTS `receta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_x_producto`
--

CREATE TABLE IF NOT EXISTS `receta_x_producto` (
  `ID_producto` int(11) NOT NULL,
  `ID_receta` int(11) NOT NULL,
  PRIMARY KEY (`ID_producto`,`ID_receta`),
  KEY `FK_ID_receta` (`ID_receta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `correo` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `es_admin` bit(1) NOT NULL,
  `foto` longblob NOT NULL,
  PRIMARY KEY (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `receta_x_producto`
--
ALTER TABLE `receta_x_producto`
  ADD CONSTRAINT `FK_ID_receta` FOREIGN KEY (`ID_receta`) REFERENCES `receta` (`ID`),
  ADD CONSTRAINT `FK_ID_producto` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
