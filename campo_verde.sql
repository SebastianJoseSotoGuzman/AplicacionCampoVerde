-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2024 a las 16:32:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `campo_verde`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIO_POR_CODIGO` (IN `CCodigo_U` VARCHAR(100))   begin
	select * from USUARIO
    where usu = CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newdetallekardex` (`_Idmovimiento` INT, `_Idproducto` INT, `_Ingreso` DECIMAL(11,2), `_Salida` DECIMAL(11,2), `_Saldo` DECIMAL(11,2))   BEGIN
	insert into Kardex(Idmovimiento,Idproducto,Ingreso,Salida,Saldo,Estado,Costo) values(_Idmovimiento,_Idproducto,_Ingreso,_Salida,_Saldo,"Activo","0.00");
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newdetallemovimiento` (`_Idmovimiento` INT, `_Idproducto` INT, `_cantidad` DECIMAL(11,2), `_Costo` DECIMAL(11,2), `_Subtotal` DECIMAL(11,2))   BEGIN
	insert into Detallemovimiento(Idmovimiento,Idproducto,Cantidad,Costo,Subtotal,Estado,Saldo) values(_Idmovimiento,_Idproducto,_Cantidad,_Costo,_Subtotal,"Activo","0.00");
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Codigomovimiento` ()   select max(Idmovimiento)from Movimiento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Consultarproductoporproveedor` (`num` INT)   select * from Producto where  Idauxiliar=num$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigocategoria` ()   begin
    declare codeCat char(6);
    declare codcat int;
	select ifnull(max(Codigo),0)+1 into codcat
	 from Categoria;
     set codeCat = lpad(codcat ,5 ,'0' );
     select codeCat;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoclasificacion` ()   begin
    declare codeClas char(6);
    declare codclas int;
	select ifnull(max(Codigo),0)+1 into codclas
	 from Clasificacion;
     set codeClas = lpad(codclas ,5 ,'0' );
     select codeClas;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigocliente` ()   begin
    declare codeClie char(8);
    declare codclie int;
	select ifnull(max(Codigo),0)+1 into codclie
	 from Auxiliar where Tipoauxi='C';
     set codeClie = lpad(codclie ,6 ,'0');
     select codeClie;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoconductor` ()   begin
    declare codeCon char(6);
    declare codcon int;
	select ifnull(max(Codigo),0)+1 into codcon
	 from Conductor;
     set codeCon = lpad(codcon ,6 ,'0' );
     select codeCon;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoguiaremisoncli` ()   begin
    declare codeGrem char(8);
    declare codgrem int;
	select ifnull(max(Correlativo),0)+1 into codgrem
	 from Movimiento where Serie='GR02';
     set codeGrem = lpad(codgrem ,8 ,'0');
     select codeGrem;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigomotivo` ()   begin
    declare codeMot char(6);
    declare codmot int;
	select ifnull(max(Codigo),0)+1 into codmot
	 from Motivo;
     set codeMot = lpad(codmot ,5 ,'0' );
     select codeMot;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigonotadeingreso` ()   begin
    declare codeNing char(8);
    declare codning int;
	select ifnull(max(Correlativo),0)+1 into codning
	 from Movimiento where Serie='NI01';
     set codeNing = lpad(codning ,8 ,'0');
     select codeNing;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigonotadesalida` ()   begin
    declare codeNsal char(8);
    declare codnsal int;
	select ifnull(max(Correlativo),0)+1 into codnsal
	 from Movimiento where Serie='NS01';
     set codeNsal = lpad(codnsal ,8 ,'0');
     select codeNsal;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoproducto` ()   begin
    declare codePro char(6);
    declare codpro int;
	select ifnull(max(Codigo),0)+1 into codpro
	 from Producto;
     
     set codePro = lpad(codpro ,6 ,'0' );
     
     select codePro;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoproveedor` ()   begin
    declare codeProv char(8);
    declare codprov int;
	select ifnull(max(Codigo),0)+1 into codprov
	 from Auxiliar where Tipoauxi='P';
     set codeProv = lpad(codprov ,6 ,'0');
     select codeProv;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoSubcategoria` ()   begin
    declare codesCat char(6);
    declare codscat int;
	select ifnull(max(Codigo),0)+1 into codscat
	 from Subcategoria;
     set codesCat = lpad(codscat ,5 ,'0' );
     select codesCat;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigotransporte` ()   begin
    declare codeTra char(6);
    declare codtra int;
	select ifnull(max(Codigo),0)+1 into codtra
	 from Transporte;
     set codeTra = lpad(codtra ,5 ,'0' );
     select codeTra;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoUndVenta` ()   begin
    declare codeUve char(6);
    declare coduve int;
	select ifnull(max(Codigo),0)+1 into coduve
	 from unidadmedidaventa;
     set codeUve = lpad(coduve ,5 ,'0' );
     select codeUve;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigousuario` ()   begin
    declare codeUsu char(6);
    declare codusu int;
	select ifnull(max(Codigo),0)+1 into codusu
	 from usuario;
     set codeUsu = lpad(codusu ,6 ,'0' );
     select codeUsu;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_codigoVehiculo` ()   begin
    declare codeVeh char(6);
    declare codveh int;
	select ifnull(max(Codigo),0)+1 into codveh
	 from Vehiculo;
     set codeVeh = lpad(codveh ,6 ,'0' );
     select codeVeh;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_contarcliente` ()   begin
   SELECT COUNT(Idauxiliar) AS Y
FROM Auxiliar
WHERE Tipoauxi='C' ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_contarproducto` ()   begin
   SELECT COUNT(Idproducto) AS Y
FROM Producto;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_contarproveedor` ()   begin
   SELECT COUNT(Idauxiliar) AS Y
FROM Auxiliar
WHERE Tipoauxi='P' ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_contarusuario` ()   begin
   SELECT COUNT(Id) AS Y
FROM Usuario;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_valorinventario` ()   begin
   SELECT SUM(Preciocompra*Stock) AS Y
FROM Producto where estado="activo";
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listaporid` (`cod` INT)   select p.Idproducto,p.Codigo,p.Descripcion,p.Idclasi,p.Idcategoria,p.Idsubc,p.Idauxiliar,p.Iduventa,p.Moneda,p.Codigoanexo,p.Preciocompra,p.Precioventa,p.Fecharegistro,p.Obser,p.Stock,p.Stockminimo,Stockmaximo,p.Estado
from Producto p where p.Idproducto=cod order by p.Descripcion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegistrarMovimiento` (INOUT `cod` INT, `_Idauxiliar` INT, `_Idusu` INT, `_Tipocomprobante` VARCHAR(20), `_Serie` VARCHAR(10), `_Correlativo` VARCHAR(10), `_Fecha` VARCHAR(50), `_Fechaentrega` VARCHAR(50), `_Idreferencia` INT, `_Referencia` VARCHAR(50), `_Tienda` VARCHAR(50), `_Almacen` VARCHAR(50), `_Condicion` VARCHAR(50), `_Idmotivo` INT, `_Idtrans` INT, `_Idvehi` INT, `_Idcond` INT, `_Subtotal` DECIMAL(11,2), `_Igv` DECIMAL(11,2), `_Total` DECIMAL(11,2), `_Estado` VARCHAR(30))   BEGIN
SELECT IFNULL(MAX(Idmovimiento),0)+1 into cod FROM Movimiento;
INSERT INTO Movimiento VALUES ( cod,_Idauxiliar,_Idusu,_Tipocomprobante,_Serie,_Correlativo,_Fecha,_Fechaentrega,_Idreferencia,_Referencia,_Tienda,_Almacen,_Condicion,_Idmotivo,_Idtrans,_Idvehi,_Idcond,_Subtotal,_Igv,_Total,_Estado);
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auxiliar`
--

CREATE TABLE `auxiliar` (
  `Idauxiliar` int(11) NOT NULL,
  `Tipoauxi` varchar(6) NOT NULL,
  `Codigo` varchar(6) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Celular` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `Fechaderegistro` date NOT NULL,
  `Idtipodocumento` int(11) NOT NULL,
  `Numerodocumento` varchar(255) NOT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auxiliar`
--

INSERT INTO `auxiliar` (`Idauxiliar`, `Tipoauxi`, `Codigo`, `Nombre`, `Correo`, `Telefono`, `Celular`, `Direccion`, `Contacto`, `Fechaderegistro`, `Idtipodocumento`, `Numerodocumento`, `Sexo`, `Estado`) VALUES
(1, 'C', '000001', 'UNE3SERCERRADA', 'uac@gmail.com', '', '', 'Cal. Lopez de Ayala Nro. 1585', '', '2022-09-26', 2, '78451223', 'null', 'Activo'),
(2, 'P', '000005', 'INVERSIONES RUBEN DARIO S.A.C.', 'andinaplast@gmail.com', '', '', 'CAL.S/N MZA. D LOTE. 15 COO. LA CALICHERA (ALT. KM 13.5 AV. TUPAC AMARU)', '', '2022-09-26', 4, '20512891536', 'null', 'Activo'),
(3, 'P', '000002', 'INVERSIONES CASA GRANDE EIRL', 'casagrande@gmail.com', '', '', 'CAR.PANAMERICANA NORTE KM. 2360 SEC. PUERTO EL CURA ', '', '2024-07-10', 4, '20525298087', 'null', 'Activo'),
(5, 'C', '000003', 'MANUEL RODRGUEZ', 'JUAN@GMAIL.COM', '98745663', '98746321', 'ICA 6580', 'DRFVFGRGR', '2024-07-15', 2, '78475986', 'M', 'Activo'),
(6, 'P', '000003', 'INVERSIONES RAABA S.A.C.S.', 'RAABA@gmail.com', '987465325', '987465325', 'PJ. MANUEL CIPRIANO DULANTO NRO. 180 DPTO. 914 LIMA - LIMA - PUEBLO LIBRE', 'DRFVFGRGR', '2024-07-15', 4, '20612047716', 'null', 'Activo'),
(8, 'C', '000003', 'CONSTRUCCIONES Y MAQUINARIAS DARIO S.A.C.', 'dario@gmail.com', '', '', 'JR. ITALIA NRO. 110 C.P. BELLASVISTA, JUNIN - HUANCAYO - SAN AGUSTIN', '', '2024-07-16', 4, '20602380697', 'null', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Idcategoria` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Idcategoria`, `Codigo`, `Nombre`, `Estado`) VALUES
(1, '00001', 'GANADERO', 'Activo'),
(2, '00028', 'AGRICOLA', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `Idclasi` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`Idclasi`, `Codigo`, `Nombre`, `Estado`) VALUES
(1, '00001', 'PRODUCTO TERMINADO', 'Desactivado'),
(2, '00003', 'MATERIA PRIMA', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `Idcond` int(11) NOT NULL,
  `Codigo` varchar(6) NOT NULL,
  `Idtipodocumento` int(11) NOT NULL,
  `Numerodocumento` varchar(255) NOT NULL,
  `chofer` varchar(255) NOT NULL,
  `licencia` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`Idcond`, `Codigo`, `Idtipodocumento`, `Numerodocumento`, `chofer`, `licencia`, `Estado`) VALUES
(1, '00001', 1, '75469293', 'Hugo Domingo Parreño Barrios', 'X25469293', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallemovimiento`
--

CREATE TABLE `detallemovimiento` (
  `Iddetalle` int(11) NOT NULL,
  `Idmovimiento` int(11) NOT NULL,
  `Idproducto` int(11) NOT NULL,
  `Cantidad` decimal(11,2) NOT NULL,
  `Costo` decimal(11,2) NOT NULL,
  `Subtotal` decimal(11,2) NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Saldo` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallemovimiento`
--

INSERT INTO `detallemovimiento` (`Iddetalle`, `Idmovimiento`, `Idproducto`, `Cantidad`, `Costo`, `Subtotal`, `Estado`, `Saldo`) VALUES
(1, 1, 2, 15.00, 15.00, 20.00, 'Activo', 0.00),
(2, 2, 2, 18.00, 0.00, 0.00, 'Activo', 0.00),
(3, 3, 2, 20.00, 0.00, 0.00, 'Anulado', 0.00),
(4, 4, 2, 10.00, 0.00, 0.00, 'Activo', 0.00),
(5, 5, 2, 20.00, 0.00, 0.00, 'Anulado', 0.00),
(6, 6, 2, 50.00, 0.00, 0.00, 'Activo', 0.00),
(7, 7, 2, 8.00, 0.00, 0.00, 'Activo', 0.00),
(8, 8, 1, 100.00, 0.00, 0.00, 'Activo', 0.00),
(9, 9, 4, 500.00, 0.00, 0.00, 'Activo', 0.00),
(10, 9, 3, 150.00, 0.00, 0.00, 'Activo', 0.00),
(11, 10, 4, 250.00, 0.00, 0.00, 'Activo', 0.00),
(12, 11, 4, 20.00, 0.00, 0.00, 'Activo', 0.00);

--
-- Disparadores `detallemovimiento`
--
DELIMITER $$
CREATE TRIGGER `tr_kardexingreso` AFTER INSERT ON `detallemovimiento` FOR EACH ROW BEGIN
 UPDATE Kardex pxa
 JOIN producto di
      ON di.Idproducto = pxa.Idproducto
SET pxa.Saldo=di.stock
 WHERE pxa.Idproducto = NEW.Idproducto and NEW.Idmovimiento=pxa.Idmovimiento ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_kardexingresosalida0` AFTER INSERT ON `detallemovimiento` FOR EACH ROW BEGIN
 UPDATE Kardex pxa
 JOIN producto di
      ON di.Idproducto = pxa.Idproducto
       JOIN Movimiento m
      ON m.Idmovimiento = pxa.Idmovimiento
SET pxa.Salida=0
 WHERE pxa.Idproducto = NEW.Idproducto and NEW.Idmovimiento=pxa.Idmovimiento and m.serie="NI01" ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockNotaIngresotienda` AFTER INSERT ON `detallemovimiento` FOR EACH ROW BEGIN
 UPDATE Producto pxa
JOIN Movimiento m
ON NEW.Idmovimiento=m.Idmovimiento
SET pxa.Stock = pxa.Stock + NEW.Cantidad 
 WHERE pxa.Idproducto = NEW.Idproducto  and m.Serie="NI01";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockNotaSalida` AFTER INSERT ON `detallemovimiento` FOR EACH ROW BEGIN
 UPDATE Producto pxa
JOIN Movimiento m
ON NEW.Idmovimiento=m.Idmovimiento
SET pxa.Stock = pxa.Stock - NEW.Cantidad 
 WHERE pxa.Idproducto = NEW.Idproducto and m.Serie="NS01";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockguiaderemision` AFTER INSERT ON `detallemovimiento` FOR EACH ROW BEGIN
 UPDATE Producto pxa
JOIN Movimiento m
ON NEW.Idmovimiento=m.Idmovimiento
SET pxa.Stock = pxa.Stock - NEW.Cantidad 
 WHERE pxa.Idproducto = NEW.Idproducto and m.Serie="GR02";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockventaAnularGR` AFTER UPDATE ON `detallemovimiento` FOR EACH ROW BEGIN
  UPDATE Producto a
    JOIN Detallemovimiento di
      ON di.Idproducto = a.Idproducto
      JOIN Movimiento m
      ON di.Idmovimiento = m.Idmovimiento
     AND di.Estado ='Anulado'
     AND di.Iddetalle =NEW.Iddetalle
     set a.Stock = a.Stock + di.Cantidad
     WHERE a.Idproducto = NEW.Idproducto  and m.Tipocomprobante="GUIA DE REMISION"
;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockventaAnularNI` AFTER UPDATE ON `detallemovimiento` FOR EACH ROW BEGIN
  UPDATE Producto a
    JOIN Detallemovimiento di
      ON di.Idproducto = a.Idproducto
      JOIN Movimiento m
      ON di.Idmovimiento = m.Idmovimiento
     AND di.Estado ='Anulado'
     AND di.Iddetalle =NEW.Iddetalle
     set a.Stock = a.Stock - di.Cantidad
     WHERE a.Idproducto = NEW.Idproducto  and m.Tipocomprobante="NOTA DE INGRESO"
;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_updStockventaAnularNS` AFTER UPDATE ON `detallemovimiento` FOR EACH ROW BEGIN
  UPDATE Producto a
    JOIN Detallemovimiento di
      ON di.Idproducto = a.Idproducto
      JOIN Movimiento m
      ON di.Idmovimiento = m.Idmovimiento
     AND di.Estado ='Anulado'
     AND di.Iddetalle =NEW.Iddetalle
     set a.Stock = a.Stock + di.Cantidad
     WHERE a.Idproducto = NEW.Idproducto  and m.Tipocomprobante="NOTA DE SALIDA"
;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Nro` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ubigeo` varchar(255) NOT NULL,
  `Adicional` varchar(255) NOT NULL,
  `filename1` varchar(255) DEFAULT NULL,
  `path1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`Id`, `Nombre`, `Nro`, `Direccion`, `Ubigeo`, `Adicional`, `filename1`, `path1`) VALUES
(1, 'CAMPO VERDE SAC', '20220202000', 'Direccion', 'Direccion', 'ingjose@gmail.com', 'images\\campo.jpg', 'F:\\CICLO MARZO 2024\\Desarrollo Web Integrado\\Actividades\\AppCampoVerde\\build\\web\\\\images\\campo.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `Iddetallekardex` int(11) NOT NULL,
  `Idmovimiento` int(11) NOT NULL,
  `Idproducto` int(11) NOT NULL,
  `Ingreso` decimal(11,2) NOT NULL,
  `Salida` decimal(11,2) NOT NULL,
  `Saldo` decimal(11,2) NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Costo` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`Iddetallekardex`, `Idmovimiento`, `Idproducto`, `Ingreso`, `Salida`, `Saldo`, `Estado`, `Costo`) VALUES
(1, 2, 2, 18.00, 0.00, 118.00, 'Activo', 0.00),
(3, 4, 2, 0.00, 10.00, 88.00, 'Activo', 0.00),
(5, 6, 2, 0.00, 50.00, 58.00, 'Activo', 0.00),
(6, 7, 2, 0.00, 8.00, 50.00, 'Activo', 0.00),
(7, 8, 1, 100.00, 0.00, 0.00, 'Activo', 0.00),
(8, 9, 4, 500.00, 0.00, 0.00, 'Activo', 0.00),
(9, 9, 3, 150.00, 0.00, 0.00, 'Activo', 0.00),
(10, 10, 4, 0.00, 250.00, 250.00, 'Activo', 0.00),
(11, 11, 4, 0.00, 20.00, 230.00, 'Activo', 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

CREATE TABLE `motivo` (
  `Idmotivo` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Tipo` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motivo`
--

INSERT INTO `motivo` (`Idmotivo`, `Codigo`, `Nombre`, `Tipo`, `Estado`) VALUES
(1, '00001', 'SALIDA PARA PRODUCCION', 'Salida', 'Activo'),
(2, '00002', 'SALIDA POR VENTA', 'Salida', 'Activo'),
(3, '00003', 'INGRESO POR PRODUCCION', 'Ingreso', 'Activo'),
(4, '00004', 'INGRESO POR COMPRA', 'Ingreso', 'Activo'),
(5, '00005', 'PRODUCTO EN MAL ESTADO', 'Salida', 'Activo'),
(6, '00006', 'PRODUCTO VENCIDO', 'Salida', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `Idmovimiento` int(10) NOT NULL,
  `Idauxiliar` int(10) NOT NULL,
  `Idusuario` int(10) NOT NULL,
  `Tipocomprobante` varchar(20) NOT NULL,
  `Serie` varchar(10) NOT NULL,
  `Correlativo` varchar(10) NOT NULL,
  `Fecha` varchar(50) DEFAULT NULL,
  `Fechaentrega` varchar(50) DEFAULT NULL,
  `Idreferencia` int(11) DEFAULT NULL,
  `Referencia` varchar(50) DEFAULT NULL,
  `Tienda` varchar(50) NOT NULL,
  `Almacen` varchar(50) NOT NULL,
  `condicion` varchar(50) DEFAULT NULL,
  `Idmotivo` int(11) NOT NULL,
  `Idtrans` int(10) DEFAULT NULL,
  `Idvehi` int(10) DEFAULT NULL,
  `Idcond` int(10) DEFAULT NULL,
  `Subtotal` decimal(11,2) NOT NULL,
  `Igv` decimal(11,2) NOT NULL,
  `Total` decimal(11,2) NOT NULL,
  `Estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`Idmovimiento`, `Idauxiliar`, `Idusuario`, `Tipocomprobante`, `Serie`, `Correlativo`, `Fecha`, `Fechaentrega`, `Idreferencia`, `Referencia`, `Tienda`, `Almacen`, `condicion`, `Idmotivo`, `Idtrans`, `Idvehi`, `Idcond`, `Subtotal`, `Igv`, `Total`, `Estado`) VALUES
(1, 2, 1, 'NI', 'NI01', '00000001', '30/11/20 - 10:34:46', '30/11/2022', 1, 'Referencia', 'PLASTITEX S.A.C', 'Almacen Tienda', 'Contado', 1, 1, 1, 1, 18.20, 12.20, 35.20, 'Vendido'),
(2, 2, 1, 'NOTA DE INGRESO', 'NI01', '00000001', '07/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'CONTADO', 4, 1, 1, 1, 0.00, 0.00, 0.00, 'Pendiente'),
(3, 1, 1, 'NOTA DE SALIDA', 'NS01', '00000001', '07/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'CONTADO', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Anulado'),
(4, 1, 2, 'GUIA DE REMISION', 'GR02', '00000001', '07/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'JR. ANCASH NRP. 919 INT. 9 LIMA - LIMA - LIMA', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Terminado'),
(5, 1, 1, 'NOTA DE SALIDA', 'NS01', '00000002', '07/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'CONTADO', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Anulado'),
(6, 1, 1, 'NOTA DE SALIDA', 'NS01', '00000003', '07/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'CONTADO', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Terminado'),
(7, 1, 1, 'NOTA DE SALIDA', 'NS01', '00000004', '08/07/2024', '', 0, '', 'EMPRESA SAC', 'ALMACEN GENERAL', 'CONTADO', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Terminado'),
(8, 2, 1, 'NOTA DE INGRESO', 'NI01', '00000002', '10/07/2024', '', 0, '', 'CAMPO VERDE SAC', 'ALMACEN GENERAL', 'CONTADO', 4, 1, 1, 1, 0.00, 0.00, 0.00, 'Pendiente'),
(9, 6, 1, 'NOTA DE INGRESO', 'NI01', '00000003', '15/07/2024', '', 0, '', 'CAMPO VERDE SAC', 'ALMACEN GENERAL', 'CONTADO', 4, 1, 1, 1, 0.00, 0.00, 0.00, 'Pendiente'),
(10, 5, 1, 'NOTA DE SALIDA', 'NS01', '00000005', '15/07/2024', '', 0, '', 'CAMPO VERDE SAC', 'ALMACEN GENERAL', 'CONTADO', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Terminado'),
(11, 5, 2, 'GUIA DE REMISION', 'GR02', '00000002', '15/07/2024', '', 0, '', 'CAMPO VERDE SAC', 'ALMACEN GENERAL', 'JR. ANCASH NRP. 919 INT. 9 LIMA - LIMA - LIMA', 2, 1, 1, 1, 0.00, 0.00, 0.00, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  `nombre_tarjeta` varchar(255) NOT NULL,
  `numero_tarjeta` varchar(20) NOT NULL,
  `mes_expiracion` varchar(10) NOT NULL,
  `ano_expiracion` varchar(10) NOT NULL,
  `cvv` varchar(10) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `nombre_completo`, `email`, `direccion`, `ciudad`, `estado`, `codigo_postal`, `nombre_tarjeta`, `numero_tarjeta`, `mes_expiracion`, `ano_expiracion`, `cvv`, `fecha_pago`) VALUES
(1, 'Sebastian Jose Soto Guzman', 'sebastian_5216@outlook.com', 'Parcona', 'berlin', 'estad', '12312', 'seb', '425312', 'febrero', '12312', '123123', '2024-07-15 22:20:43'),
(2, 'jacob', 'wasa@gmail', 'mañana', 'asd', 'asd', '564654', '4asda', '564as6d45a', 'a5sd4as65', '123132', '4565', '2024-07-15 22:22:29'),
(3, 'Sebastian Jose Soto Guzman', 'sebastian_5216@outlook.com', 'Parcona', 'berlin', 'estad', '12312', 'seb', '12312', '12312', '123', '12312', '2024-07-15 23:26:46'),
(4, 'jacob', 'wasa@gmail', 'mañana', 'asd', 'asd', '564654', '4asda', '564as6d45a', 'a5sd4as65', '123132', '4565', '2024-07-15 23:42:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Idproducto` int(11) NOT NULL,
  `Codigo` varchar(6) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Idclasi` int(11) NOT NULL,
  `Idcategoria` int(11) NOT NULL,
  `Idsubc` int(11) NOT NULL,
  `Idauxiliar` int(11) DEFAULT NULL,
  `Iduventa` int(11) NOT NULL,
  `Moneda` varchar(20) NOT NULL,
  `Codigoanexo` varchar(20) DEFAULT NULL,
  `Preciocompra` decimal(11,2) DEFAULT NULL,
  `Precioventa` decimal(11,2) DEFAULT NULL,
  `Fecharegistro` date NOT NULL,
  `Obser` varchar(200) DEFAULT NULL,
  `Stock` decimal(11,2) NOT NULL,
  `Stockminimo` decimal(11,2) DEFAULT NULL,
  `Stockmaximo` decimal(11,2) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Idproducto`, `Codigo`, `Descripcion`, `Idclasi`, `Idcategoria`, `Idsubc`, `Idauxiliar`, `Iduventa`, `Moneda`, `Codigoanexo`, `Preciocompra`, `Precioventa`, `Fecharegistro`, `Obser`, `Stock`, `Stockminimo`, `Stockmaximo`, `Estado`) VALUES
(1, '000001', 'VACA', 1, 1, 1, 1, 1, 'soles', 'P-0006', 58.00, 0.00, '2020-11-27', ' ', 100.00, 50.00, 200.00, 'Activo'),
(2, '000117', 'CERDO', 1, 1, 1, 1, 1, 'soles', 'MDHC000018', 0.00, 50.00, '2020-11-27', 'o', 50.00, 10.00, 300.00, 'Activo'),
(3, '000118', 'oveja blanca', 1, 1, 3, 1, 3, 'Soles', '', 0.00, 0.00, '2024-07-11', '', 150.00, 15.00, 200.00, 'Activo'),
(4, '000119', 'PATO', 2, 1, 7, 1, 3, 'Soles', 'V-004', 0.00, 0.00, '2024-07-15', '', 230.00, 30.00, 250.00, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `Idsubc` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`Idsubc`, `Codigo`, `Nombre`, `Estado`) VALUES
(1, '00001', 'FRUTAS', 'Activo'),
(2, '00046', 'VERDURAS', 'Activo'),
(3, '00047', 'CAPRINO', 'Activo'),
(4, '00048', 'OVINO', 'Activo'),
(5, '00049', 'PORCINO', 'Activo'),
(6, '00050', 'BOVINO', 'Activo'),
(7, '00051', 'AVE', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `Idtipodocumento` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `TipoDocumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`Idtipodocumento`, `Codigo`, `TipoDocumento`) VALUES
(1, 0, 'NO Documentado'),
(2, 1, 'DNI'),
(3, 4, 'PASAPORTE'),
(4, 6, 'RUC'),
(5, 7, 'CARNET DE EXTRANJERIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `Idtrans` int(11) NOT NULL,
  `Codigo` varchar(6) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`Idtrans`, `Codigo`, `Nombre`, `Tipo`, `Estado`) VALUES
(1, '00001', 'Empresa S.A.C', 'Privado', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedidaventa`
--

CREATE TABLE `unidadmedidaventa` (
  `Iduventa` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `Nombre` varchar(55) DEFAULT NULL,
  `Contenido` int(11) DEFAULT NULL,
  `Estado` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadmedidaventa`
--

INSERT INTO `unidadmedidaventa` (`Iduventa`, `Codigo`, `Nombre`, `Contenido`, `Estado`) VALUES
(1, '00001', 'PIEZA', 1, 'Desactivado'),
(2, '00006', 'MTS', 1, 'Desactivado'),
(3, '00007', 'UNIDAD', 1, 'Activo'),
(4, '00008', 'CAJA', 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `Codigo` varchar(6) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `Idtipodocumento` int(11) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `sueldo` decimal(11,2) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecharegistro` date NOT NULL,
  `filename1` varchar(255) DEFAULT NULL,
  `path1` varchar(255) DEFAULT NULL,
  `usu` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `Codigo`, `nombre`, `Idtipodocumento`, `dni`, `sueldo`, `telefono`, `direccion`, `email`, `fecharegistro`, `filename1`, `path1`, `usu`, `password`, `rol`, `estado`) VALUES
(1, '000001', 'Marcelo', 2, '72887506', 2000.00, '', '', 'ingjose@gmail.com', '2022-08-26', 'images\\user.png', 'F:\\CICLO MARZO 2024\\Desarrollo Web Integrado\\Actividades\\AppCampoVerde\\build\\web\\\\images\\user.png', 'lumar', '123', 'Administrador', 'Activo'),
(2, '000002', 'SEBASTIAN', 2, '73756368', 2000.00, '', '', 'ingjose@gmail.com', '2022-08-26', 'images\\user1.png', 'F:\\CICLO MARZO 2024\\Desarrollo Web Integrado\\Actividades\\AppCampoVerde\\build\\web\\\\images\\user1.png', 'SEBAS', '123', 'Administrador', 'Activo'),
(4, '000004', 'PICHARDI MEDINA, ELISA ALICIA', 2, '22296536', 2000.00, '987453252', 'ica 200', 'alicia@gmail.com', '2024-07-18', 'images\\user2.png', 'F:\\CICLO MARZO 2024\\Desarrollo Web Integrado\\Actividades\\AppCampoVerde\\build\\web\\\\images\\user2.png', 'alicia', '7908281b119b087a0c719cd42d7d75a9f301304f4db96b03756001317dbd942f', 'Administrador', 'Activo'),
(5, '000004', 'MARTICORENA AQUIJE, LUIS MARCELO', 2, '72887506', 2000.00, '987456210', 'ica 520', 'u21305357@gmail.com', '2024-07-18', 'images\\user.png', 'F:\\CICLO MARZO 2024\\Desarrollo Web Integrado\\Actividades\\AppCampoVerde\\build\\web\\\\images\\user.png', 'lmma', 'c8b6b45900672d726ff420f115b5c32367c4ca2db2ef7be8c0a763f297fd7eca', 'Administrador', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Idvehi` int(11) NOT NULL,
  `Codigo` varchar(6) NOT NULL,
  `placa` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`Idvehi`, `Codigo`, `placa`, `marca`, `Estado`) VALUES
(1, '00001', 'A7M668', 'NISSAN', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auxiliar`
--
ALTER TABLE `auxiliar`
  ADD PRIMARY KEY (`Idauxiliar`),
  ADD KEY `FK_Idtipodocumento` (`Idtipodocumento`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Idcategoria`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`Idclasi`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`Idcond`);

--
-- Indices de la tabla `detallemovimiento`
--
ALTER TABLE `detallemovimiento`
  ADD PRIMARY KEY (`Iddetalle`),
  ADD KEY `FK_Idmovimiento` (`Idmovimiento`),
  ADD KEY `FK_Idproductos` (`Idproducto`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`Iddetallekardex`),
  ADD KEY `FK_Idmovimientos` (`Idmovimiento`),
  ADD KEY `FK_Idproduct` (`Idproducto`);

--
-- Indices de la tabla `motivo`
--
ALTER TABLE `motivo`
  ADD PRIMARY KEY (`Idmotivo`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`Idmovimiento`),
  ADD KEY `FK_Idauxiliars` (`Idauxiliar`),
  ADD KEY `FK_Idusuario` (`Idusuario`),
  ADD KEY `FK_Idmotiv` (`Idmotivo`),
  ADD KEY `FK_Idtrans` (`Idtrans`),
  ADD KEY `FK_Idvehi` (`Idvehi`),
  ADD KEY `FK_Idcond` (`Idcond`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Idproducto`),
  ADD KEY `FK_Idcategoria` (`Idcategoria`),
  ADD KEY `FK_Idclasi` (`Idclasi`),
  ADD KEY `FK_Iduventa` (`Iduventa`),
  ADD KEY `FK_Idsubc` (`Idsubc`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`Idsubc`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`Idtipodocumento`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`Idtrans`);

--
-- Indices de la tabla `unidadmedidaventa`
--
ALTER TABLE `unidadmedidaventa`
  ADD PRIMARY KEY (`Iduventa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Idtipodocum` (`Idtipodocumento`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`Idvehi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auxiliar`
--
ALTER TABLE `auxiliar`
  MODIFY `Idauxiliar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `Idclasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `conductor`
--
ALTER TABLE `conductor`
  MODIFY `Idcond` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallemovimiento`
--
ALTER TABLE `detallemovimiento`
  MODIFY `Iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `Iddetallekardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `motivo`
--
ALTER TABLE `motivo`
  MODIFY `Idmotivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `Idsubc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `Idtipodocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `transporte`
--
ALTER TABLE `transporte`
  MODIFY `Idtrans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unidadmedidaventa`
--
ALTER TABLE `unidadmedidaventa`
  MODIFY `Iduventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `Idvehi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auxiliar`
--
ALTER TABLE `auxiliar`
  ADD CONSTRAINT `FK_Idtipodocumento` FOREIGN KEY (`Idtipodocumento`) REFERENCES `tipodocumento` (`Idtipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallemovimiento`
--
ALTER TABLE `detallemovimiento`
  ADD CONSTRAINT `FK_Idmovimiento` FOREIGN KEY (`Idmovimiento`) REFERENCES `movimiento` (`Idmovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idproductos` FOREIGN KEY (`Idproducto`) REFERENCES `producto` (`Idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `FK_Idmovimientos` FOREIGN KEY (`Idmovimiento`) REFERENCES `movimiento` (`Idmovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idproduct` FOREIGN KEY (`Idproducto`) REFERENCES `producto` (`Idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `FK_Idauxiliars` FOREIGN KEY (`Idauxiliar`) REFERENCES `auxiliar` (`Idauxiliar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idcond` FOREIGN KEY (`Idcond`) REFERENCES `conductor` (`Idcond`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idmotiv` FOREIGN KEY (`Idmotivo`) REFERENCES `motivo` (`Idmotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idtrans` FOREIGN KEY (`Idtrans`) REFERENCES `transporte` (`Idtrans`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idusuario` FOREIGN KEY (`Idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idvehi` FOREIGN KEY (`Idvehi`) REFERENCES `vehiculo` (`Idvehi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_Idcategoria` FOREIGN KEY (`Idcategoria`) REFERENCES `categoria` (`Idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idclasi` FOREIGN KEY (`Idclasi`) REFERENCES `clasificacion` (`Idclasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Idsubc` FOREIGN KEY (`Idsubc`) REFERENCES `subcategoria` (`Idsubc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Iduventa` FOREIGN KEY (`Iduventa`) REFERENCES `unidadmedidaventa` (`Iduventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Idtipodocum` FOREIGN KEY (`Idtipodocumento`) REFERENCES `tipodocumento` (`Idtipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
