-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for supermercado
DROP DATABASE IF EXISTS `supermercado`;
CREATE DATABASE IF NOT EXISTS `supermercado` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `supermercado`;


-- Dumping structure for procedure supermercado.actualizarProducto
DROP PROCEDURE IF EXISTS `actualizarProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto`(IN `pID` INT, IN `pnombre` VARCHAR(150), IN `pcant_inventario` INT, IN `pcosto` INT, IN `pprecio_final` INT, IN `pdescuento` INT, IN `pfoto` INT)
BEGIN
update producto
set producto.nombre=pnombre, producto.cant_inventario=pcant_inventario,producto.costo=pcosto,producto.precio_final=pprecio_final,producto.descuento=pdescuento,producto.foto=pfoto
where producto.ID=pID;
END//
DELIMITER ;


-- Dumping structure for procedure supermercado.actualizarUsuario
DROP PROCEDURE IF EXISTS `actualizarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario`(IN `pcorreo` VARCHAR(255), IN `pnombre` VARCHAR(50), IN `papellido1` VARCHAR(50), IN `papellido2` VARCHAR(50), IN `pclave` VARCHAR(255), IN `pfoto` BLOB)
BEGIN
update usuario set usuario.nombre=nombre,usuario.apellido1=papellido1,usuario.apellido2=papellido2,usuario.clave=pclave,usuario.foto=pfoto
where usuario.correo = pcorreo;
END//
DELIMITER ;


-- Dumping structure for procedure supermercado.insertarProducto
DROP PROCEDURE IF EXISTS `insertarProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto`(IN `pID` INT, IN `pnombre` VARCHAR(150), IN `pcant` INT, IN `pcosto` INT, IN `pprecio_final` INT, IN `pdescuento` INT, IN `pfoto` BLOB)
BEGIN
insert into producto(ID,nombre,cant_inventario,costo,precio_final,descuento,foto)
values (pID,pnombre,pcant,pcosto,pprecio_final,pdescuento,pfoto);
END//
DELIMITER ;


-- Dumping structure for procedure supermercado.insertarUsuario
DROP PROCEDURE IF EXISTS `insertarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(IN `pcorreo` VARCHAR(255), IN `pnombre` VARCHAR(50), IN `papellido1` VARCHAR(50), IN `papellido2` VARCHAR(50), IN `pclave` VARCHAR(255), IN `pfoto` BLOB)
BEGIN
insert into usuario (correo,nombre,apellido1,apellido2,clave,es_admin,foto)
values(pcorreo,pnombre,papellido1,papellido2,pclave,0,pfoto);
END//
DELIMITER ;


-- Dumping structure for procedure supermercado.nombrarAdmin
DROP PROCEDURE IF EXISTS `nombrarAdmin`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `nombrarAdmin`(IN `pcorreo` VARCHAR(255), IN `pAdmin` BIT)
BEGIN
update usuario 
set usuario.es_admin = pAdmin 
where usuario.correo = pcorreo;
END//
DELIMITER ;


-- Dumping structure for table supermercado.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cant_inventario` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  `precio_final` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `foto` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table supermercado.producto: ~0 rows (approximately)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


-- Dumping structure for table supermercado.receta
DROP TABLE IF EXISTS `receta`;
CREATE TABLE IF NOT EXISTS `receta` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table supermercado.receta: ~0 rows (approximately)
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;


-- Dumping structure for table supermercado.receta_x_producto
DROP TABLE IF EXISTS `receta_x_producto`;
CREATE TABLE IF NOT EXISTS `receta_x_producto` (
  `ID_producto` int(11) NOT NULL,
  `ID_receta` int(11) NOT NULL,
  PRIMARY KEY (`ID_producto`,`ID_receta`),
  KEY `FK_receta` (`ID_receta`),
  CONSTRAINT `FK_producto` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID`),
  CONSTRAINT `FK_receta` FOREIGN KEY (`ID_receta`) REFERENCES `receta` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table supermercado.receta_x_producto: ~0 rows (approximately)
/*!40000 ALTER TABLE `receta_x_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_x_producto` ENABLE KEYS */;


-- Dumping structure for table supermercado.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `correo` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `es_admin` bit(1) NOT NULL,
  `foto` blob NOT NULL,
  PRIMARY KEY (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table supermercado.usuario: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
