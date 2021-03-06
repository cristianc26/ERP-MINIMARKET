-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2015 a las 23:54:08
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_sismima`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`serveracme`@`localhost` PROCEDURE `sp_registrarProducto`(
  desc_Prod varchar(100) ,
  presentacion varchar(20) ,
  tipoProd char(1),
  stock int(11) ,
  idMarca int(11)  ,
  idCategoria int(11)  ,
  estadoProd char(1),
  Precio numeric(8,2)  
)
BEGIN
insert into Producto(desc_Prod,presentacion,tipoProd,stock,idMarca,idCategoria,estadoProd,Precio) 
values(desc_Prod,presentacion,tipoProd,stock,idMarca,idCategoria,estadoProd,Precio);
END$$

--
-- Funciones
--
CREATE DEFINER=`serveracme`@`localhost` FUNCTION `initcap`(cadena VARCHAR(100)) RETURNS varchar(100) CHARSET latin1
BEGIN 
DECLARE pos INT DEFAULT 0; 
DECLARE tmp VARCHAR(100) 
DEFAULT ''; 
DECLARE result VARCHAR(100) DEFAULT ''; 
REPEAT SET pos = LOCATE(' ', cadena); 
 IF pos = 0 THEN SET pos = CHAR_LENGTH(cadena); 
 END IF; 
 SET tmp = LEFT(cadena,pos); 
 IF CHAR_LENGTH(tmp) < 4 THEN SET result = CONCAT(result, tmp); 
 ELSE SET result = CONCAT(result, UPPER(LEFT(tmp,1)),SUBSTR(tmp,2)); 
 END IF; 
 SET cadena = RIGHT(cadena,CHAR_LENGTH(cadena)-pos); 
UNTIL CHAR_LENGTH(cadena) = 0 END REPEAT; 
RETURN result; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admcatalogo`
--

CREATE TABLE IF NOT EXISTS `admcatalogo` (
`ide_elemento` int(10) unsigned NOT NULL,
  `ide_grupo` int(10) unsigned NOT NULL,
  `des_nombre` varchar(250) NOT NULL,
  `ide_estado` char(1) NOT NULL,
  `des_usu_registra` varchar(250) DEFAULT NULL,
  `fec_registra` datetime DEFAULT NULL,
  `des_usu_modifica` varchar(250) DEFAULT NULL,
  `fec_modifica` datetime DEFAULT NULL,
  `cod_sunat` varchar(10) DEFAULT NULL,
  `des_abrev` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admcatalogo`
--

INSERT INTO `admcatalogo` (`ide_elemento`, `ide_grupo`, `des_nombre`, `ide_estado`, `des_usu_registra`, `fec_registra`, `des_usu_modifica`, `fec_modifica`, `cod_sunat`, `des_abrev`) VALUES
(1, 1, 'ADMINISTRADOR', '1', 'lalipazaga@sismima.com', '2015-04-18 21:46:25', NULL, NULL, NULL, NULL),
(2, 2, 'MODULO DE VENTAS', '1', 'lalipazaga@sismima.com', '2015-04-18 21:54:55', NULL, NULL, NULL, NULL),
(3, 2, 'MODULO DE COMPRAS', '1', 'lalipazaga@sismima.com', '2015-04-18 21:54:57', NULL, NULL, NULL, NULL),
(4, 2, 'CONTROL DE FACTURACION', '1', 'lalipazaga@sismima.com', '2015-04-18 21:54:59', NULL, NULL, NULL, NULL),
(5, 2, 'CONTROL DE ALMACEN', '1', 'lalipazaga@sismima.com', '2015-04-18 21:55:00', NULL, NULL, NULL, NULL),
(6, 2, 'MODULO DE PERSONAL', '1', 'lalipazaga@sismima.com', '2015-04-18 21:55:02', NULL, NULL, NULL, NULL),
(7, 2, 'MODULO DE COTIZACIONES', '1', 'lalipazaga@sismima.com', '2015-04-18 21:55:04', NULL, NULL, NULL, NULL),
(8, 2, 'CONSULTA DE REPORTES', '1', 'lalipazaga@sismima.com', '2015-04-18 21:55:05', NULL, NULL, NULL, NULL),
(9, 2, 'SEGURIDAD', '1', 'lalipazaga@sismima.com', '2015-04-18 21:55:08', NULL, NULL, NULL, NULL),
(10, 3, 'DOC. NACIONAL DE IDENTIDAD', '1', 'lalipazaga@sismima.com', '2015-04-19 14:00:08', NULL, NULL, '01', 'D.N.I.'),
(11, 3, 'CARNE DE EXTRANJERIA', '1', 'lalipazaga@sismima.com', '2015-04-19 14:00:08', NULL, NULL, '04', 'C.EX.'),
(12, 4, 'PERSONA NATURAL', '1', 'lalipazaga@sismima.com', '2015-04-19 23:53:25', NULL, NULL, NULL, NULL),
(13, 4, 'PERSONA JURIDICA', '1', 'lalipazaga@sismima.com', '2015-04-19 23:54:29', NULL, NULL, NULL, NULL),
(14, 3, 'REG. UNICO DE CONTRIBUYENTES', '1', 'lalipazaga@sismima.com', '2015-04-20 02:13:16', NULL, NULL, '06', 'R.U.C.'),
(15, 3, 'PASAPORTE', '1', 'lalipazaga@sismima.com', '2015-04-20 02:13:28', NULL, NULL, '07', 'PAS.'),
(16, 3, 'PARTIDA DE NACIMIENTO', '1', 'lalipazaga@sismima.com', '2015-04-20 02:14:42', NULL, NULL, '11', 'PART. NAC.'),
(17, 5, 'USUARIO', '1', 'lalipazaga@sismima.com', '2015-04-21 01:11:14', NULL, NULL, NULL, NULL),
(18, 5, 'EMPLEADO', '1', 'lalipazaga@sismima.com', '2015-04-21 01:13:19', NULL, NULL, NULL, NULL),
(19, 5, 'PROVEEDOR', '1', 'lalipazaga@sismima.com', '2015-04-21 01:16:11', NULL, NULL, NULL, NULL),
(20, 5, 'CLIENTE', '1', 'lalipazaga@sismima.com', '2015-04-21 01:16:48', NULL, NULL, NULL, NULL),
(21, 6, 'MASCULINO', '1', 'lalipazaga@sismima.com', '2015-04-21 01:16:48', NULL, NULL, NULL, NULL),
(22, 6, 'FEMENINO', '1', 'lalipazaga@sismima.com', '2015-04-21 01:16:48', NULL, NULL, NULL, NULL),
(23, 7, 'SOLTERO(A)', '1', 'lalipazaga@sismima.com', '2015-04-21 17:07:18', NULL, NULL, NULL, NULL),
(24, 7, 'CASADO(A)', '1', 'lalipazaga@sismima.com', '2015-04-21 17:07:32', NULL, NULL, NULL, NULL),
(25, 7, 'VIUDO(A)', '1', 'lalipazaga@sismima.com', '2015-04-21 17:07:49', NULL, NULL, NULL, NULL),
(26, 7, 'CONVIVIENTE', '1', 'lalipazaga@sismima.com', '2015-04-21 17:07:49', NULL, NULL, NULL, NULL),
(27, 7, 'DIVORCIADO(A)', '1', 'lalipazaga@sismima.com', '2015-04-21 17:08:12', NULL, NULL, NULL, NULL),
(28, 7, 'SEPARADO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:08:19', NULL, NULL, NULL, NULL),
(29, 8, 'SECUNDARIA COMPLETA', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(30, 8, 'SUPERIOR TECNICO COMPLETO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(31, 8, 'SUPERIOR TECNICO INCOMPLETO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(32, 8, 'SUPERIOR UNIVERSITARIO COMPLETO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(33, 8, 'SUPERIOR UNIVERSITARIO INCOMPLETO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(34, 8, 'PRIMARIA', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(35, 8, 'DIPLOMATURA', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(36, 8, 'MAGISTER', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(37, 8, 'DOCTORADO', '1', 'lalipazaga@sismima.com', '2015-04-21 17:11:22', NULL, NULL, NULL, NULL),
(38, 2, 'UTILITARIOS', '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admgrcatalogo`
--

CREATE TABLE IF NOT EXISTS `admgrcatalogo` (
`ide_grupo` int(10) unsigned NOT NULL,
  `des_nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admgrcatalogo`
--

INSERT INTO `admgrcatalogo` (`ide_grupo`, `des_nombre`) VALUES
(1, 'TIPO DE USUARIO'),
(2, 'MENU'),
(3, 'TIPO DE DOCUMENTO'),
(4, 'TIPO DE PERSONA'),
(5, 'TIPO CONDICION'),
(6, 'SEXO'),
(7, 'ESTADO CIVIL'),
(8, 'GRADO DE INSTRUCCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admopcion`
--

CREATE TABLE IF NOT EXISTS `admopcion` (
`ide_opcion` int(10) unsigned NOT NULL,
  `ide_modulo` int(10) unsigned NOT NULL,
  `des_nombre` varchar(250) NOT NULL,
  `des_ruta` varchar(250) DEFAULT NULL,
  `ind_padre` int(10) unsigned NOT NULL,
  `ide_estado` char(1) NOT NULL,
  `des_usu_registra` varchar(250) DEFAULT NULL,
  `fec_registra` datetime DEFAULT NULL,
  `des_usu_modifica` varchar(250) DEFAULT NULL,
  `fec_modifica` datetime DEFAULT NULL,
  `des_icon` varchar(45) DEFAULT NULL,
  `ind_orden` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admopcion`
--

INSERT INTO `admopcion` (`ide_opcion`, `ide_modulo`, `des_nombre`, `des_ruta`, `ind_padre`, `ide_estado`, `des_usu_registra`, `fec_registra`, `des_usu_modifica`, `fec_modifica`, `des_icon`, `ind_orden`) VALUES
(1, 2, 'MODULO DE VENTAS', '--', 0, '1', 'lalipazaga@sismima.com', '2015-04-18 22:04:06', NULL, NULL, 'tags', 1),
(2, 2, 'REGISTRO DE VENTAS', 'ventas/registraVenta', 1, '1', 'lalipazaga@sismima.com', '2015-04-18 22:07:13', NULL, NULL, '', 0),
(3, 3, 'MODULO DE COMPRAS', '--', 0, '1', 'lalipazaga@sismima.com', '2015-04-18 22:10:18', NULL, NULL, 'shopping-cart', 2),
(4, 3, 'REGISTRO DE COMPRAS', 'compras/registraCompra', 3, '1', 'lalipazaga@sismima.com', '2015-04-18 22:10:58', NULL, NULL, '', 0),
(5, 2, 'CLIENTES', 'ventas/listadoClientes', 1, '1', 'lalipazaga@sismima.com', '2015-04-19 05:23:58', NULL, NULL, '', 0),
(6, 3, 'PROVEEDORES', 'compras/listadoProveedores', 3, '1', 'lalipazaga@sismima.com', '2015-04-19 18:06:58', NULL, NULL, '', 0),
(7, 5, 'CONTROL DE ALMACEN', '--', 0, '1', 'lalipazaga@sismima.com', '2015-04-19 18:15:58', NULL, NULL, 'tasks', 3),
(8, 5, 'PRODUCTOS', 'almacen/listadoProductos', 7, '1', 'lalipazaga@sismima.com', '2015-04-19 18:20:58', NULL, NULL, NULL, 0),
(9, 9, 'SEGURIDAD', '--', 0, '1', 'lalipazaga@sismima.com', '2015-04-19 21:11:21', NULL, NULL, 'lock', 10),
(10, 9, 'PARAMETROS GENERALES', 'seguridad/parametrosGenerales', 9, '1', 'lalipazaga@sismima.com', '2015-04-19 21:12:13', NULL, NULL, NULL, 0),
(11, 6, 'MODULO DE PERSONAL', '--', 0, '1', 'lalipazaga@sismima.com', '2015-04-19 22:32:19', NULL, NULL, 'users', 4),
(12, 6, 'EMPLEADOS', 'personal/listadoEmpleados', 11, '1', 'lalipazaga@sismima.com', '2015-04-19 22:34:19', NULL, NULL, NULL, 0),
(13, 9, 'USUARIOS', 'seguridad/listaUsuarios', 9, '1', 'lalipazaga@sismima.com', '2015-04-19 23:41:11', NULL, NULL, NULL, NULL),
(14, 9, 'REGISTRA PERSONAS', 'seguridad/listadoPersonas', 9, '1', 'lalipazaga@sismima.com', '2015-04-26 05:30:18', NULL, NULL, NULL, NULL),
(15, 2, 'Generar Factura', 'ventas/registrarFactura', 1, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, NULL),
(16, 2, 'Facturas', 'ventas/facturas', 1, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, NULL),
(17, 5, 'INVENTARIO', 'almacen/Inventario', 7, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, NULL),
(18, 3, 'Ordenes de Compra', 'compras/ordenesCompra', 3, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, NULL),
(19, 38, 'Utlilitarios', '--', 0, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, 'wrench', 6),
(20, 38, 'PARAMETROS GENERALES', 'utilitarios/parametrosGenerales', 19, '1', 'lalipazaga@sismima.com', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admrol`
--

CREATE TABLE IF NOT EXISTS `admrol` (
`ide_rol` int(10) unsigned NOT NULL,
  `des_nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admrol`
--

INSERT INTO `admrol` (`ide_rol`, `des_nombre`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'GERENTE DE VENTAS'),
(3, 'VENDEDOR'),
(4, 'GERENTE DE COMPRAS'),
(5, 'GERENTE GENERAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admrolopcion`
--

CREATE TABLE IF NOT EXISTS `admrolopcion` (
`ide_rolopcion` int(10) unsigned NOT NULL,
  `ide_opcion` int(10) unsigned NOT NULL,
  `ide_rol` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admrolopcion`
--

INSERT INTO `admrolopcion` (`ide_rolopcion`, `ide_opcion`, `ide_rol`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 1, 2),
(16, 2, 2),
(17, 7, 2),
(18, 8, 2),
(19, 1, 5),
(20, 2, 5),
(21, 3, 5),
(22, 4, 5),
(23, 5, 5),
(24, 6, 5),
(25, 7, 5),
(26, 8, 5),
(27, 11, 5),
(28, 12, 5),
(29, 15, 1),
(30, 16, 1),
(31, 18, 1),
(32, 17, 1),
(33, 19, 1),
(34, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
`idCategoria` int(11) NOT NULL,
  `nomCategoria` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nomCategoria`) VALUES
(5, 'Bebidas'),
(3, 'Cereales'),
(7, 'Dulces'),
(9, 'Fideos'),
(8, 'Frutas'),
(2, 'Galletas'),
(1, 'Helados'),
(4, 'Lacteos'),
(6, 'Snacks');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
`idCliente` int(11) NOT NULL,
  `RazSoc_Cli` varchar(250) NOT NULL,
  `tipoPersona_Cli` char(1) NOT NULL,
  `ruc_Cli` char(11) NOT NULL,
  `direccion_Cli` varchar(150) NOT NULL,
  `telefono_Cli` char(9) NOT NULL,
  `email_Cli` varchar(50) DEFAULT NULL,
  `fec_reg_Cli` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_Cli` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `RazSoc_Cli`, `tipoPersona_Cli`, `ruc_Cli`, `direccion_Cli`, `telefono_Cli`, `email_Cli`, `fec_reg_Cli`, `estado_Cli`) VALUES
(1, 'ORIHUELA LOZANO JEAN PAUL', '0', '10400409761', 'Av Arequipa 785', '944659233', 'orihuelalozano@gmail.com', '2015-05-07 06:39:03', '1'),
(2, 'Comercial HINOZTROSA', '1', '20321568795', 'Los Olivos #725', '987456259', 'hinoztrosa@hotmail.com', '2015-05-14 01:52:18', '1'),
(3, 'ORIHUELA LOZANO JEAN PAUL', '0', '10400409761', 'Av Arequipa 785', '944659233', 'orihuelalozano@gmail.com', '2015-05-18 15:17:13', '1'),
(4, 'COmercial Huachipa', '0', '20123654872', 'Av arenales 712', '994512454', 'hadsha2@gmail.com', '2015-05-18 15:17:14', '1'),
(5, 'ANA MARCIA LOZANO', '0', '10214578421', 'SALAVERRY 55', '965454213', 'IWDKW@gmail.com', '2015-05-18 15:17:14', '1'),
(6, 'JUAN CARRASCO VALDES', '1', '10421325412', 'ATE VITARTE', '654512587', 'JUAN_54@gmail.com', '2015-05-18 15:17:14', '0'),
(7, 'comercial DOÑA MARIANA', '1', '20441245778', 'Av ZARATE 845', '956412584', 'MARIARIKA@gmail.com', '2015-05-18 15:17:14', '0'),
(8, 'JUAN CARLOS BARBARAN', '1', '10412457894', 'Av SALAVERRY 7', '994512478', 'ELPALETAZO@gmail.com', '2015-05-18 15:17:14', '0'),
(9, 'comercial PALETAZO', '0', '20547856912', 'AV CHIMU 65', '944659233', 'OTROPALETAZO@gmail.com', '2015-05-18 15:17:14', '1'),
(10, 'COMERCIAL MIAKALIFA', '1', '20441245633', 'Av CUBA 785', '993451478', 'RIKA889@gmail.com', '2015-05-18 15:17:14', '0'),
(11, 'JEAN PAUL SANTA MARIA', '1', '10465421561', 'Av parinacochas', '944665413', 'jean@gmail.com', '2015-05-18 15:17:14', '1'),
(12, 'estrada ramirez', '0', '10145409761', 'juan miraflores 785', '944632143', 'loestrada@gmail.com', '2015-05-18 15:17:14', '1'),
(13, 'arrelucea roberto', '0', '10400321451', 'Av miroquesada 785', '932564533', 'robert@gmail.com', '2015-05-18 15:17:14', '0'),
(14, 'COMERCIAL CONTRERAZ', '1', '20475123654', 'Av carlos izaguirre', '954687542', 'miri@gmail.com', '2015-05-18 15:17:14', '1'),
(15, 'COMERCIAL LUPE', '0', '20478409761', 'Av 28 julio', '943214563', 'lupe@gmail.com', '2015-05-18 15:17:14', '0'),
(16, 'obregon salsedo marita', '1', '10778125454', 'Av aviacion', '964578451', 'breon@gmail.com', '2015-05-18 15:17:14', '1'),
(17, 'CHIPANA EBRIO', '0', '10400456471', 'Av carlos izaguirre', '936559233', 'chipanin@gmail.com', '2015-05-18 15:17:14', '0'),
(18, 'carrasco jorge', '0', '10400405421', 'Av Arenales', '946547233', 'jorge@gmail.com', '2015-05-18 15:17:14', '1'),
(19, 'mika rita', '0', '10000464781', 'Av humbolt', '932559233', 'jariin@gmail.com', '2015-05-18 15:17:14', '1'),
(20, 'sacarias paz', '0', '10654784581', 'Av 6 agosto', '932512233', 'sacar@gmail.com', '2015-05-18 15:17:14', '1'),
(21, 'COMERCIAL MARCK', '1', '20470464781', 'Av mariategui', '932211233', 'mardfd@gmail.com', '2015-05-18 15:17:14', '1'),
(22, 'solorzano noel', '0', '10400464781', 'Av cabildo', '554759233', 'solsl@gmail.com', '2015-05-18 15:17:14', '1'),
(23, 'matias fernandes carrasco', '1', '10478464781', 'Av los cabitos', '547859233', 'ahh@gmail.com', '2015-05-18 15:17:14', '0'),
(24, 'COMERCIAL LA LUZ', '0', '20421464781', 'Av carlos valdes', '987559233', 'luser@gmail.com', '2015-05-18 15:17:14', '1'),
(25, 'COMERCIAL VALENCIA', '0', '20403547892', 'la molina', '987159233', 'cdgsl@gmail.com', '2015-05-18 15:17:14', '1'),
(26, 'carrasco asco gabriel', '0', '10745124875', 'Av 3 postes', '994784213', 'carras@gmail.com', '2015-05-18 15:17:14', '0'),
(27, 'COMERCIAL FOTOGRAFO', '1', '20774512367', 'magdalena', '657759213', 'osvita@gmail.com', '2015-05-18 15:17:14', '1'),
(28, 'rondon salazar', '0', '10745464781', 'jesus maria', '554654733', 'rondin@gmail.com', '2015-05-18 15:17:14', '1'),
(29, 'Bebeto romario', '1', '10314574781', 'Av mexico', '992457841', 'bebe@gmail.com', '2015-05-18 15:17:14', '0'),
(30, 'COMERCIAL GUTIERREZ', '0', '20897451235', 'zarate', '654759233', 'amer@gmail.com', '2015-05-18 15:17:14', '1'),
(31, 'jean carlos valdes', '1', '10745464781', 'Av isaan', '995787435', 'jean@gmail.com', '2015-05-18 15:17:15', '0'),
(32, 'COMERCIAL RIQUELME', '0', '20784236541', 'paradero flecha', '995778421', 'ramos@gmail.com', '2015-05-18 15:17:15', '1'),
(33, 'COMERCIAL OYOS', '0', '20754136487', 'manzanilla', '554657845', 'jime@gmail.com', '2015-05-18 15:17:15', '0'),
(34, 'matilde cuba ana', '1', '10784464781', 'feliciano calle 5', '995464512', 'mati@gmail.com', '2015-05-18 15:17:15', '1'),
(35, 'gustavo bueno juan', '0', '10452369875', 'Av elias cuba', '597543457', 'gusty@gmail.com', '2015-05-18 15:17:15', '0'),
(36, 'luana sana rina', '0', '10842136458', 'Av peres tello', '994759233', 'luan@gmail.com', '2015-05-18 15:17:15', '1'),
(37, 'COMERCIAL MALTIN', '0', '20770464781', 'Av poste 4', '997754214', 'mirtin@gmail.com', '2015-05-18 15:17:15', '1'),
(38, 'jony velasques salas', '0', '10657784581', 'cercado lima', '654759233', 'cowa@gmail.com', '2015-05-18 15:17:15', '1'),
(39, 'COMERCIAL PORNASO', '0', '20784247841', 'jr cuzco', '995459233', 'pornin@gmail.com', '2015-05-18 15:17:15', '1'),
(40, 'jordano bravo vasques', '0', '10470464781', 'Av argentina', '999759233', 'redemon@gmail.com', '2015-05-18 15:17:15', '1'),
(41, 'COMERCIAL RIVAS', '1', '20774512478', 'los olivo', '654759233', 'poetasi@gmail.com', '2015-05-18 15:17:15', '1'),
(42, 'marita milagros roque', '0', '10400464781', 'los olivos', '995647233', 'mia@gmail.com', '2015-05-18 15:17:15', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE IF NOT EXISTS `detallefactura` (
  `nroSerie` char(3) NOT NULL,
  `nroFact` int(10) unsigned NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `precio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`nroSerie`, `nroFact`, `idProducto`, `cantidad`, `precio`) VALUES
('001', 1, 1, 20, '2.00'),
('001', 1, 30, 5, '1.50'),
('001', 1, 34, 1, '1.50'),
('001', 2, 2, 10, '5.00'),
('001', 3, 1, 11, '2.00'),
('001', 3, 3, 111, '3.00'),
('001', 5, 2, 5, '5.00'),
('001', 5, 6, 5, '2.00'),
('001', 6, 15, 14, '3.00'),
('001', 6, 4, 7, '1.50');

--
-- Disparadores `detallefactura`
--
DELIMITER //
CREATE TRIGGER `ActualizarStock` AFTER INSERT ON `detallefactura`
 FOR EACH ROW UPDATE Producto 
     SET stock = stock - NEW.cantidad
   WHERE idProducto = NEW.idProducto
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleordencompra`
--

CREATE TABLE IF NOT EXISTS `detalleordencompra` (
  `nroSerie` char(3) NOT NULL,
  `nroOrden` int(10) unsigned NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `precio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleordencompra`
--

INSERT INTO `detalleordencompra` (`nroSerie`, `nroOrden`, `idProducto`, `cantidad`, `precio`) VALUES
('001', 1, 2, 20, '5.00'),
('001', 2, 1, 5, '2.00'),
('001', 2, 2, 6, '5.00'),
('001', 3, 3, 10, '3.00'),
('001', 3, 14, 5, '1.50');

--
-- Disparadores `detalleordencompra`
--
DELIMITER //
CREATE TRIGGER `ActualizarStockCompra` AFTER INSERT ON `detalleordencompra`
 FOR EACH ROW UPDATE Producto 
     SET stock = stock + NEW.cantidad
   WHERE idProducto = NEW.idProducto
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
`idEmpleado` int(10) unsigned NOT NULL,
  `apePat` varchar(50) DEFAULT NULL,
  `apeMat` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `DNI` char(8) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `nroSerie` char(3) NOT NULL,
  `nroFact` int(10) unsigned NOT NULL DEFAULT '0',
  `idCliente` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `fechEmic` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subTotal` decimal(8,2) NOT NULL,
  `IGV` decimal(8,2) NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `estadoFact` char(1) DEFAULT '1',
  `fechaElim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`nroSerie`, `nroFact`, `idCliente`, `idEmpleado`, `fechEmic`, `subTotal`, `IGV`, `Total`, `estadoFact`, `fechaElim`) VALUES
('001', 1, 2, 1, '2015-05-20 23:12:55', '49.00', '8.82', '57.82', '1', NULL),
('001', 2, 5, 1, '2015-05-20 23:13:40', '50.00', '9.00', '59.00', '1', NULL),
('001', 3, 2, 1, '2015-05-22 04:49:29', '355.00', '63.90', '418.90', '1', NULL),
('001', 4, 26, 1, '2015-05-22 05:33:50', '16.00', '2.88', '18.88', '1', NULL),
('001', 5, 2, 1, '2015-05-22 05:35:13', '35.00', '6.30', '41.30', '1', NULL),
('001', 6, 6, 1, '2015-05-22 06:14:29', '52.50', '9.45', '61.95', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
`idMovimiento` int(10) unsigned NOT NULL,
  `tipo_documento` char(1) DEFAULT NULL,
  `serie` char(3) DEFAULT NULL,
  `nro_documento` int(10) unsigned DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` char(1) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  `valor_unitario` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idMovimiento`, `tipo_documento`, `serie`, `nro_documento`, `fecha`, `tipo`, `idproducto`, `cantidad`, `valor_unitario`, `total`) VALUES
(1, '1', '001', 1, '2015-05-20 23:12:55', 'S', 1, 20, '2.00', '40.00'),
(2, '1', '001', 1, '2015-05-20 23:12:56', 'S', 30, 5, '1.50', '7.50'),
(3, '1', '001', 1, '2015-05-20 23:12:56', 'S', 34, 1, '1.50', '1.50'),
(4, '1', '001', 2, '2015-05-20 23:13:40', 'S', 2, 10, '5.00', '50.00'),
(5, '2', '001', 1, '2015-05-20 23:14:36', 'E', 2, 20, '5.00', '100.00'),
(6, '2', '001', 2, '2015-05-22 04:48:50', 'E', 1, 5, '2.00', '10.00'),
(7, '2', '001', 2, '2015-05-22 04:48:50', 'E', 2, 6, '5.00', '30.00'),
(8, '1', '001', 3, '2015-05-22 04:49:30', 'S', 1, 11, '2.00', '22.00'),
(9, '1', '001', 3, '2015-05-22 04:49:30', 'S', 3, 111, '3.00', '333.00'),
(10, '1', '001', 5, '2015-05-22 05:35:13', 'S', 2, 5, '5.00', '25.00'),
(11, '1', '001', 5, '2015-05-22 05:35:13', 'S', 6, 5, '2.00', '10.00'),
(12, '2', '001', 3, '2015-05-22 05:36:13', 'E', 3, 10, '3.00', '30.00'),
(13, '2', '001', 3, '2015-05-22 05:36:13', 'E', 14, 5, '1.50', '7.50'),
(15, '1', '001', 6, '2015-05-22 06:14:29', 'S', 15, 14, '3.00', '42.00'),
(16, '1', '001', 6, '2015-05-22 06:14:29', 'S', 4, 7, '1.50', '10.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
`idMarca` int(11) NOT NULL,
  `nomMarca` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nomMarca`) VALUES
(5, 'Coca Cola'),
(4, 'Donofrio'),
(1, 'Gloria'),
(9, 'Inka Kola'),
(3, 'Karinto'),
(10, 'Lavaghi'),
(2, 'Nestle'),
(6, 'Pura Vida'),
(7, 'San Luis'),
(8, 'Soda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordencompra`
--

CREATE TABLE IF NOT EXISTS `ordencompra` (
  `nroSerie` char(3) NOT NULL,
  `nroOrden` int(10) unsigned NOT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `FechaOrden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subTotal` decimal(8,2) DEFAULT NULL,
  `IGV` decimal(8,2) DEFAULT NULL,
  `Total` decimal(8,2) DEFAULT NULL,
  `estadoOrden` char(1) DEFAULT '1',
  `fechaElim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordencompra`
--

INSERT INTO `ordencompra` (`nroSerie`, `nroOrden`, `idProveedor`, `idEmpleado`, `FechaOrden`, `subTotal`, `IGV`, `Total`, `estadoOrden`, `fechaElim`) VALUES
('001', 1, 3, 1, '2015-05-20 23:14:35', '100.00', '18.00', '118.00', '1', NULL),
('001', 2, 3, 1, '2015-05-22 04:48:49', '40.00', '7.20', '47.20', '1', NULL),
('001', 3, 3, 1, '2015-05-22 05:36:13', '37.50', '6.75', '44.25', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametrogeneral`
--

CREATE TABLE IF NOT EXISTS `parametrogeneral` (
`idParametro` int(10) unsigned NOT NULL,
  `desc_Param` varchar(150) NOT NULL,
  `valor_Param` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametrogeneral`
--

INSERT INTO `parametrogeneral` (`idParametro`, `desc_Param`, `valor_Param`) VALUES
(1, 'IGV', '0.18'),
(2, 'Tipo de Cambio', '3.15'),
(3, 'Serie Factura', '001'),
(4, 'Serie Orden de Compra', '001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
`idProducto` int(11) NOT NULL,
  `desc_Prod` varchar(100) NOT NULL,
  `presentacion` varchar(20) NOT NULL,
  `tipoProd` char(1) NOT NULL DEFAULT '1',
  `stock` int(11) NOT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estadoProd` char(1) NOT NULL DEFAULT '1',
  `Precio` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `desc_Prod`, `presentacion`, `tipoProd`, `stock`, `idMarca`, `idCategoria`, `fecha_creacion`, `estadoProd`, `Precio`) VALUES
(1, 'Leche Gloria', 'Lata', '0', 0, 1, 4, '2015-05-07 06:34:02', '1', '2.00'),
(2, 'Aceite de Olivo', 'Botella', '1', 36, 3, 5, '2015-05-07 22:25:31', '0', '5.00'),
(3, 'Cereales', 'bolsa', '1', 10, 8, 8, '2015-05-07 22:25:31', '1', '3.00'),
(4, 'Leche Soy Vida', 'lata', '1', 113, 4, 4, '2015-05-07 22:27:31', '1', '1.50'),
(5, 'Leche Gloria', 'Lata', '0', 0, 1, 4, '2015-05-17 04:35:59', '1', '2.00'),
(6, 'te', 'CAJA', '0', 25, 1, 4, '2015-05-17 04:47:16', '1', '2.00'),
(7, 'Leche Gloria', 'Lata', '0', 45, 1, 4, '2015-05-17 04:48:36', '1', '2.00'),
(8, 'Aceite Friol', 'Botella', '1', 34, 3, 5, '2015-05-17 04:48:36', '0', '5.00'),
(9, 'Cereales', 'bolsa', '1', 94, 8, 8, '2015-05-17 04:48:37', '1', '3.00'),
(10, 'Leche Soy Vida', 'lata', '1', 0, 4, 4, '2015-05-17 04:48:37', '1', '1.50'),
(11, 'Leche Gloria', 'Lata', '0', 45, 1, 4, '2015-05-17 04:49:11', '1', '2.00'),
(12, 'Aceite Friol', 'Botella', '1', 36, 9, 5, '2015-05-17 04:49:11', '0', '5.00'),
(13, 'Cereales', 'bolsa', '1', 104, 8, 8, '2015-05-17 04:49:12', '1', '3.00'),
(14, 'Leche Soy Vida', 'lata', '1', 155, 4, 4, '2015-05-17 04:49:12', '1', '1.50'),
(15, 'Inca Kola 1Litro', 'Botella', '0', 30, 9, 5, '2015-05-17 04:49:12', '1', '3.00'),
(16, 'Cerveza Klosterbier Rhönbräu', 'Botella', '1', 36, 3, 5, '2015-05-17 04:49:12', '1', '5.00'),
(17, 'Licor Cloudberry', 'Botella', '1', 94, 8, 8, '2015-05-17 04:49:12', '1', '3.00'),
(18, 'caviar rojo', 'Botella', '1', 142, 4, 5, '2015-05-17 04:49:12', '1', '1.50'),
(19, 'Cerveza Outback', 'Lata', '0', 23, 1, 5, '2015-05-17 04:49:12', '1', '2.00'),
(20, 'Chocolate blanco', 'Botella', '1', 0, 3, 7, '2015-05-17 04:49:12', '1', '5.00'),
(21, 'Empanada de carne', 'bolsa', '1', 82, 8, 6, '2015-05-17 04:49:12', '1', '3.00'),
(22, 'Sublime', 'bolsa', '1', 144, 4, 7, '2015-05-17 04:49:12', '1', '1.50'),
(23, 'Leche condensada', 'Lata', '0', 33, 1, 7, '2015-05-17 04:49:12', '1', '2.00'),
(24, 'oreo', 'bolsa', '1', 30, 3, 2, '2015-05-17 04:49:12', '1', '5.00'),
(25, 'charada', 'bolsa', '1', 94, 8, 2, '2015-05-17 04:49:12', '1', '3.00'),
(26, 'papa lays', 'lata', '1', 144, 4, 6, '2015-05-17 04:49:12', '1', '1.50'),
(27, 'piqueo', 'Lata', '0', 45, 1, 6, '2015-05-17 04:49:12', '1', '2.00'),
(28, 'pezidury', 'Botella', '1', 36, 3, 1, '2015-05-17 04:49:12', '1', '5.00'),
(29, 'sevix', 'bolsa', '1', 104, 8, 3, '2015-05-17 04:49:12', '1', '3.00'),
(30, 'Milo', 'lata', '1', 139, 4, 4, '2015-05-17 04:49:12', '1', '1.50'),
(31, 'don victorio', 'bolsa', '0', 45, 1, 9, '2015-05-17 04:49:12', '1', '2.00'),
(32, 'fideo anita', 'bolsa', '1', 0, 3, 9, '2015-05-17 04:49:12', '1', '5.00'),
(33, 'Cifrut', 'Botella', '1', 84, 8, 5, '2015-05-17 04:49:12', '1', '3.00'),
(34, 'Coca Cola', 'Botella', '1', 139, 4, 5, '2015-05-17 04:49:12', '1', '1.50'),
(35, 'platano', 'Lata', '0', 45, 1, 8, '2015-05-17 04:49:12', '1', '2.00'),
(36, 'pera', 'Botella', '1', 36, 3, 8, '2015-05-17 04:49:12', '1', '5.00'),
(37, 'fresa', 'bolsa', '1', 94, 8, 8, '2015-05-17 04:49:12', '1', '3.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
`idProveedor` int(11) NOT NULL,
  `RazSoc_Prov` varchar(250) NOT NULL,
  `tipoPersona_Prov` char(1) NOT NULL,
  `ruc_Prov` char(11) NOT NULL,
  `direccion_Prov` varchar(150) NOT NULL,
  `telefono_Prov` char(9) NOT NULL,
  `email_Prov` varchar(50) DEFAULT NULL,
  `fec_reg_Prov` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_Prov` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `RazSoc_Prov`, `tipoPersona_Prov`, `ruc_Prov`, `direccion_Prov`, `telefono_Prov`, `email_Prov`, `fec_reg_Prov`, `estado_Prov`) VALUES
(1, 'LAVAGUI E.I.R.L.', '1', '10492988627', 'Av Arequipa #790', '956859256', 'aldra@hotmail.com', '2015-05-07 06:40:27', '1'),
(2, 'DONOFRIO E.I.R.L.', '1', '10492988627', 'Av Arequipa #790', '956859256', 'aldra@hotmail.com', '2015-05-17 03:04:03', '1'),
(3, 'D''MATOS SAC S.A.', '1', '20684782668', 'Av Peru #870', '996559856', 'dmastos@hotmail.com', '2015-05-17 03:04:04', '1'),
(4, 'NESTLE S.A.', '1', '20658235263', 'Av SanJuan #960', '958925956', 'transrowi@hotmail.com', '2015-05-17 03:04:04', '1'),
(5, 'ALICORP S.A.', '1', '20278157284', 'Avenida Argentina, 4793', '985674282', 'alicorp@hotmail.com', '2015-05-17 03:04:04', '1'),
(6, 'GRUPO JIMENEZ E.I.R.L.', '1', '10698752469', 'Calle Garcilaso de la Vega, 12', '992687963', 'grupojimenez@hotmail.com', '2015-05-17 03:04:04', '1'),
(7, 'Austral Group S.A', '1', '20202020202', 'Av. Victor Andres Belaunde, San Isidro', '7107000', 'australgroup@hotmail.com', '2015-05-17 03:04:04', '1'),
(8, 'PANTENE S.A', '1', '20521471552', 'Av. 28 de Julio, Lima', '3215468', 'petroperu@hotmail.com', '2015-05-17 03:04:04', '1'),
(9, 'GLORIA S.A', '1', '20874112522', 'Av. Bolivar, Pueblo Libre', '2541022', 'mifarma@hotmail.com', '2015-05-17 03:04:04', '1'),
(10, 'PURINA S.A', '1', '20474555525', 'Av. Antonio de Sucre 693, Pueblo Libre', '5857474', 'movistar@hotmail.com', '2015-05-17 03:04:04', '1'),
(11, 'ANDINA GOURMET S.A', '1', '20412521414', 'Av. Antonio de Sucre 900, San juan', '2020255', 'entel@hotmail.com', '2015-05-17 03:04:04', '1'),
(12, 'ComCenter S.A', '1', '20254014140', 'Av. Arequipa 5280, Miraflores', '6669854', 'comcenter@hotmail.com', '2015-05-17 03:04:04', '1'),
(13, 'Ambev Peru S.A', '1', '20874101410', 'Av. Tarapaca, Lurigancho', '5241410', 'ambevperu@hotmail.com', '2015-05-17 03:04:04', '1'),
(14, 'Cosapi S.A', '1', '20255587401', 'Av. Salaverry, Miraflores', '3555841', 'cosapi@hotmail.com', '2015-05-17 03:04:04', '1'),
(15, 'PANIMAR S.A', '1', '20410002511', 'Av. La marina 2000, San Miguel', '2414000', 'luzdelsur@hotmail.com', '2015-05-17 03:04:04', '1'),
(16, 'IRMITA S.A', '1', '20870411410', 'Av. Arequipa 6980, Miraflores', '2587410', 'electroperu@hotmail.com', '2015-05-17 03:04:04', '1'),
(17, 'D´CARMEN S.A', '1', '20401455251', 'Av. Canada, Lince', '3655005', 'quimicasuiza@hotmail.com', '2015-05-17 03:04:04', '1'),
(18, 'CHIFLES OLA S.A', '1', '20655520011', 'Av. Canada,  San Borja', '5541241', 'clinicainternacional@hotmail.com', '2015-05-17 03:04:04', '1'),
(19, 'MESAJIL S.A', '1', '20414014141', 'Av. Javier Prado, Miraflores ', '2541411', 'credicorp@hotmail.com', '2015-05-17 03:04:04', '1'),
(20, 'ARMIJO E.I.R.L.', '1', '10052410141', 'Av. Arequipa 5698, Miraflores', '1474147', 'mibanco@hotmail.com', '2015-05-17 03:04:04', '1'),
(21, 'LAGUNAS E.I.R.L.', '1', '10700000251', 'Av. Salaverry, Miraflores 5978', '2510141', 'credifast@hotmail.com', '2015-05-17 03:04:04', '1'),
(22, 'DIFESA S.A', '1', '20700255021', 'Av. Javier Prado, Miraflores ', '2651410', 'nacionbank@hotmail.com', '2015-05-17 03:04:04', '1'),
(23, 'Shopping Word S.A', '1', '20700010114', 'Av. Canada, Lince 3658', '2587414', 'shoppingword@hotmail.com', '2015-05-17 03:04:04', '1'),
(24, 'Aceros Arequipa S.A', '1', '20444777741', 'Av. salaverry 8569, Miraflores', '1444772', 'acerosarequipa@hotmail.com', '2015-05-17 03:04:04', '0'),
(25, 'INTERLOON E.I.R.L.', '1', '10477788853', 'Av. La marina 7800, San Miguel', '1444222', 'topytop@hotmail.com', '2015-05-17 03:04:04', '1'),
(26, 'Mi Tienda S.A', '1', '20777444111', 'Av. Canada, Lince 8975, San Miguel', '8887741', 'mitienda@hotmail.com', '2015-05-17 03:04:04', '1'),
(27, 'Baby Happy E.I.R.L.', '1', '10656985411', 'Av. La marina 9423, San Miguel', '4777412', 'babyhappu@hotmail.com', '2015-05-17 03:04:04', '1'),
(28, 'ALPROSA S.A', '1', '20785000251', 'Av. Salaverry, Miraflores 3568', '8741256', 'zapatillasword@hotmail.com', '2015-05-17 03:04:04', '1'),
(29, 'San Fernando S.A', '1', '20100154308', 'Av. Caminos del Inca 1012, Surco', '994193000', 'sanfernando@hotmail.com', '2015-05-17 03:04:04', '1'),
(30, 'Laive S.A', '1', '20100095450', 'Av. Nicolas De Piérola, Ate Vitarte', '996187600', 'laive@hotmail.com', '2015-05-17 03:04:04', '1'),
(31, 'LATINO ANDINA S.A.', '1', '20100041953', 'Av. Paseo de la República 3505, San Isidro', '994111000', 'rimacseguros@hotmail.com', '2015-05-17 03:04:04', '1'),
(32, 'LECHE BONLE S.A', '1', '20100035392', 'Av. Juan de Arona 830, San isidro', '985135000', 'pacificoseguros@hotmail.com', '2015-05-17 03:04:04', '1'),
(33, 'Saga Falabella S.A', '1', '20100128056', 'Av. Arequipa 5280, Miraflores', '982037070', 'sagafalabella@hotmail.com', '2015-05-17 03:04:04', '1'),
(34, 'DISTRIBUIDORA STA.LUCIA E.I.R.L.', '1', '10269985900', 'Av. Antonio de Sucre 693, Pueblo Libre', '995612001', 'eldernor@hotmail.com', '2015-05-17 03:04:04', '1'),
(35, 'LA LEÑA S.A', '1', '20337564373', 'Av. La marina 2000, San Miguel', '995663569', 'riplay@hotmail.com', '2015-05-17 03:04:05', '1'),
(36, 'Wong E.I.R.L.', '1', '10333541541', 'Av. La marina 2000, San Miguel', '982514255', 'wong@hotmail.com', '2015-05-17 03:04:05', '1'),
(37, 'Metro S.a', '1', '20202020202', 'Av. Antonio de Sucre 693, Pueblo Libre', '992121212', 'metro@hotmail.com', '2015-05-17 03:04:05', '1'),
(38, 'The House E.I.R.L.', '1', '10212500201', 'Av. Salaverry, Miraflores', '992425254', 'house@hotmail.com', '2015-05-17 03:04:05', '1'),
(39, 'Taxis Fast S.A', '1', '20212500201', 'Av. Arequipa 5280, Miraflores', '994246465', 'taxifast@hotmail.com', '2015-05-17 03:04:05', '1'),
(40, 'Oechsle S.A', '1', '20788545100', 'Av. Wilson 3250', '981414155', 'oechsle@hotmail.com', '2015-05-17 03:04:05', '1'),
(41, 'PesAtun E.I.R.L.', '1', '10758855558', 'Av. Juan de Arona 920, San Isidro', '995464748', 'pesatun@hotmail.com', '2015-05-17 03:04:05', '1'),
(42, 'ARROS Word S.A', '1', '20544411400', 'Av. Salaverry, Miraflores', '984145888', 'autoword@hotmail.com', '2015-05-17 03:04:05', '1'),
(43, 'GPAE S.A', '1', '20454225525', 'Av. Larco Mar , Mirafloes', '998562025', 'citibank@hotmail.com', '2015-05-17 03:04:05', '1'),
(44, 'ADECCO E.I.R.L.', '1', '10587774410', 'Av. Salaverry, Miraflores', '992323666', 'segurimax@hotmail.com', '2015-05-17 03:04:05', '1'),
(45, 'GRUPO PAES S.A', '1', '20569555550', 'Urb. Santa Catalina, La victoria', '992134000', 'cpeinka@hotmail.com', '2015-05-17 03:04:05', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisdepartamento`
--

CREATE TABLE IF NOT EXISTS `sisdepartamento` (
  `ide_departamento` char(2) NOT NULL,
  `des_nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisdepartamento`
--

INSERT INTO `sisdepartamento` (`ide_departamento`, `des_nombre`) VALUES
('01', 'AMAZONAS'),
('02', 'ANCASH'),
('03', 'APURIMAC'),
('04', 'AREQUIPA'),
('05', 'AYACUCHO'),
('06', 'CAJAMARCA'),
('07', 'CALLAO'),
('08', 'CUSCO'),
('09', 'HUANCAVELICA'),
('10', 'HUANUCO'),
('11', 'ICA'),
('12', 'JUNIN'),
('13', 'LA LIBERTAD'),
('14', 'LAMBAYEQUE'),
('15', 'LIMA'),
('16', 'LORETO'),
('17', 'MADRE DE DIOS'),
('18', 'MOQUEGUA'),
('19', 'PASCO'),
('20', 'PIURA'),
('21', 'PUNO'),
('22', 'SAN MARTIN'),
('23', 'TACNA'),
('24', 'TUMBES'),
('25', 'UCAYALI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisdireccion`
--

CREATE TABLE IF NOT EXISTS `sisdireccion` (
`ide_direccion` int(10) unsigned NOT NULL,
  `ide_persona` int(10) unsigned NOT NULL,
  `ide_tipodireccion` int(10) unsigned NOT NULL,
  `ind_ubigeo` char(6) NOT NULL,
  `ide_via` char(2) NOT NULL,
  `nom_via` varchar(100) NOT NULL,
  `ide_zona` char(2) DEFAULT NULL,
  `des_zona` varchar(100) DEFAULT NULL,
  `des_referencia` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisdistrito`
--

CREATE TABLE IF NOT EXISTS `sisdistrito` (
  `ide_departamento` char(2) NOT NULL,
  `ide_provincia` char(2) NOT NULL,
  `ide_distrito` char(2) NOT NULL,
  `des_nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisdistrito`
--

INSERT INTO `sisdistrito` (`ide_departamento`, `ide_provincia`, `ide_distrito`, `des_nombre`) VALUES
('01', '01', '01', 'CHACHAPOYAS'),
('01', '01', '02', 'ASUNCION'),
('01', '01', '03', 'BALSAS'),
('01', '01', '04', 'CHETO'),
('01', '01', '05', 'CHILIQUIN'),
('01', '01', '06', 'CHUQUIBAMBA'),
('01', '01', '07', 'GRANADA'),
('01', '01', '08', 'HUANCAS'),
('01', '01', '09', 'LA JALCA'),
('01', '01', '10', 'LEIMEBAMBA'),
('01', '01', '11', 'LEVANTO'),
('01', '01', '12', 'MAGDALENA'),
('01', '01', '13', 'MARISCAL CASTILLA'),
('01', '01', '14', 'MOLINOPAMPA'),
('01', '01', '15', 'MONTEVIDEO'),
('01', '01', '16', 'OLLEROS'),
('01', '01', '17', 'QUINJALCA'),
('01', '01', '18', 'SAN FRANCISCO DE DAGUAS'),
('01', '01', '19', 'SAN ISIDRO DE MAINO'),
('01', '01', '20', 'SOLOCO'),
('01', '01', '21', 'SONCHE'),
('01', '02', '01', 'BAGUA'),
('01', '02', '02', 'ARAMANGO'),
('01', '02', '03', 'COPALLIN'),
('01', '02', '04', 'EL PARCO'),
('01', '02', '05', 'IMAZA'),
('01', '02', '06', 'LA PECA'),
('01', '03', '01', 'JUMBILLA'),
('01', '03', '02', 'CHISQUILLA'),
('01', '03', '03', 'CHURUJA'),
('01', '03', '04', 'COROSHA'),
('01', '03', '05', 'CUISPES'),
('01', '03', '06', 'FLORIDA'),
('01', '03', '07', 'JAZAN'),
('01', '03', '08', 'RECTA'),
('01', '03', '09', 'SAN CARLOS'),
('01', '03', '10', 'SHIPASBAMBA'),
('01', '03', '11', 'VALERA'),
('01', '03', '12', 'YAMBRASBAMBA'),
('01', '04', '01', 'NIEVA'),
('01', '04', '02', 'EL CENEPA'),
('01', '04', '03', 'RIO SANTIAGO'),
('01', '05', '01', 'LAMUD'),
('01', '05', '02', 'CAMPORREDONDO'),
('01', '05', '03', 'COCABAMBA'),
('01', '05', '04', 'COLCAMAR'),
('01', '05', '05', 'CONILA'),
('01', '05', '06', 'INGUILPATA'),
('01', '05', '07', 'LONGUITA'),
('01', '05', '08', 'LONYA CHICO'),
('01', '05', '09', 'LUYA'),
('01', '05', '10', 'LUYA VIEJO'),
('01', '05', '11', 'MARIA'),
('01', '05', '12', 'OCALLI'),
('01', '05', '13', 'OCUMAL'),
('01', '05', '14', 'PISUQUIA'),
('01', '05', '15', 'PROVIDENCIA'),
('01', '05', '16', 'SAN CRISTOBAL'),
('01', '05', '17', 'SAN FRANCISCO DEL YESO'),
('01', '05', '18', 'SAN JERONIMO'),
('01', '05', '19', 'SAN JUAN DE LOPECANCHA'),
('01', '05', '20', 'SANTA CATALINA'),
('01', '05', '21', 'SANTO TOMAS'),
('01', '05', '22', 'TINGO'),
('01', '05', '23', 'TRITA'),
('01', '06', '01', 'SAN NICOLAS'),
('01', '06', '02', 'CHIRIMOTO'),
('01', '06', '03', 'COCHAMAL'),
('01', '06', '04', 'HUAMBO'),
('01', '06', '05', 'LIMABAMBA'),
('01', '06', '06', 'LONGAR'),
('01', '06', '07', 'MARISCAL BENAVIDES'),
('01', '06', '08', 'MILPUC'),
('01', '06', '09', 'OMIA'),
('01', '06', '10', 'SANTA ROSA'),
('01', '06', '11', 'TOTORA'),
('01', '06', '12', 'VISTA ALEGRE'),
('01', '07', '01', 'BAGUA GRANDE'),
('01', '07', '02', 'CAJARURO'),
('01', '07', '03', 'CUMBA'),
('01', '07', '04', 'EL MILAGRO'),
('01', '07', '05', 'JAMALCA'),
('01', '07', '06', 'LONYA GRANDE'),
('01', '07', '07', 'YAMON'),
('02', '01', '01', 'HUARAZ'),
('02', '01', '02', 'COCHABAMBA'),
('02', '01', '03', 'COLCABAMBA'),
('02', '01', '04', 'HUANCHAY'),
('02', '01', '05', 'INDEPENDENCIA'),
('02', '01', '06', 'JANGAS'),
('02', '01', '07', 'LA LIBERTAD'),
('02', '01', '08', 'OLLEROS'),
('02', '01', '09', 'PAMPAS'),
('02', '01', '10', 'PARIACOTO'),
('02', '01', '11', 'PIRA'),
('02', '01', '12', 'TARICA'),
('02', '02', '01', 'AIJA'),
('02', '02', '02', 'CORIS'),
('02', '02', '03', 'HUACLLAN'),
('02', '02', '04', 'LA MERCED'),
('02', '02', '05', 'SUCCHA'),
('02', '03', '01', 'LLAMELLIN'),
('02', '03', '02', 'ACZO'),
('02', '03', '03', 'CHACCHO'),
('02', '03', '04', 'CHINGAS'),
('02', '03', '05', 'MIRGAS'),
('02', '03', '06', 'SAN JUAN DE RONTOY'),
('02', '04', '01', 'CHACAS'),
('02', '04', '02', 'ACOCHACA'),
('02', '05', '01', 'CHIQUIAN'),
('02', '05', '02', 'ABELARDO PARDO LEZAMETA'),
('02', '05', '03', 'ANTONIO RAYMONDI'),
('02', '05', '04', 'AQUIA'),
('02', '05', '05', 'CAJACAY'),
('02', '05', '06', 'CANIS'),
('02', '05', '07', 'COLQUIOC'),
('02', '05', '08', 'HUALLANCA'),
('02', '05', '09', 'HUASTA'),
('02', '05', '10', 'HUAYLLACAYAN'),
('02', '05', '11', 'LA PRIMAVERA'),
('02', '05', '12', 'MANGAS'),
('02', '05', '13', 'PACLLON'),
('02', '05', '14', 'SAN MIGUEL DE CORPANQUI'),
('02', '05', '15', 'TICLLOS'),
('02', '06', '01', 'CARHUAZ'),
('02', '06', '02', 'ACOPAMPA'),
('02', '06', '03', 'AMASHCA'),
('02', '06', '04', 'ANTA'),
('02', '06', '05', 'ATAQUERO'),
('02', '06', '06', 'MARCARA'),
('02', '06', '07', 'PARIAHUANCA'),
('02', '06', '08', 'SAN MIGUEL DE ACO'),
('02', '06', '09', 'SHILLA'),
('02', '06', '10', 'TINCO'),
('02', '06', '11', 'YUNGAR'),
('02', '07', '01', 'SAN LUIS'),
('02', '07', '02', 'SAN NICOLAS'),
('02', '07', '03', 'YAUYA'),
('02', '08', '01', 'CASMA'),
('02', '08', '02', 'BUENA VISTA ALTA'),
('02', '08', '03', 'COMANDANTE NOEL'),
('02', '08', '04', 'YAUTAN'),
('02', '09', '01', 'CORONGO'),
('02', '09', '02', 'ACO'),
('02', '09', '03', 'BAMBAS'),
('02', '09', '04', 'CUSCA'),
('02', '09', '05', 'LA PAMPA'),
('02', '09', '06', 'YANAC'),
('02', '09', '07', 'YUPAN'),
('02', '10', '01', 'HUARI'),
('02', '10', '02', 'ANRA'),
('02', '10', '03', 'CAJAY'),
('02', '10', '04', 'CHAVIN DE HUANTAR'),
('02', '10', '05', 'HUACACHI'),
('02', '10', '06', 'HUACCHIS'),
('02', '10', '07', 'HUACHIS'),
('02', '10', '08', 'HUANTAR'),
('02', '10', '09', 'MASIN'),
('02', '10', '10', 'PAUCAS'),
('02', '10', '11', 'PONTO'),
('02', '10', '12', 'RAHUAPAMPA'),
('02', '10', '13', 'RAPAYAN'),
('02', '10', '14', 'SAN MARCOS'),
('02', '10', '15', 'SAN PEDRO DE CHANA'),
('02', '10', '16', 'UCO'),
('02', '11', '01', 'HUARMEY'),
('02', '11', '02', 'COCHAPETI'),
('02', '11', '03', 'CULEBRAS'),
('02', '11', '04', 'HUAYAN'),
('02', '11', '05', 'MALVAS'),
('02', '12', '01', 'CARAZ'),
('02', '12', '02', 'HUALLANCA'),
('02', '12', '03', 'HUATA'),
('02', '12', '04', 'HUAYLAS'),
('02', '12', '05', 'MATO'),
('02', '12', '06', 'PAMPAROMAS'),
('02', '12', '07', 'PUEBLO LIBRE  / 1 '),
('02', '12', '08', 'SANTA CRUZ'),
('02', '12', '09', 'SANTO TORIBIO'),
('02', '12', '10', 'YURACMARCA'),
('02', '13', '01', 'PISCOBAMBA'),
('02', '13', '02', 'CASCA'),
('02', '13', '03', 'ELEAZAR GUZMAN BARRON'),
('02', '13', '04', 'FIDEL OLIVAS ESCUDERO'),
('02', '13', '05', 'LLAMA'),
('02', '13', '06', 'LLUMPA'),
('02', '13', '07', 'LUCMA'),
('02', '13', '08', 'MUSGA'),
('02', '14', '01', 'OCROS'),
('02', '14', '02', 'ACAS'),
('02', '14', '03', 'CAJAMARQUILLA'),
('02', '14', '04', 'CARHUAPAMPA'),
('02', '14', '05', 'COCHAS'),
('02', '14', '06', 'CONGAS'),
('02', '14', '07', 'LLIPA'),
('02', '14', '08', 'SAN CRISTOBAL DE RAJAN'),
('02', '14', '09', 'SAN PEDRO'),
('02', '14', '10', 'SANTIAGO DE CHILCAS'),
('02', '15', '01', 'CABANA'),
('02', '15', '02', 'BOLOGNESI'),
('02', '15', '03', 'CONCHUCOS'),
('02', '15', '04', 'HUACASCHUQUE'),
('02', '15', '05', 'HUANDOVAL'),
('02', '15', '06', 'LACABAMBA'),
('02', '15', '07', 'LLAPO'),
('02', '15', '08', 'PALLASCA'),
('02', '15', '09', 'PAMPAS'),
('02', '15', '10', 'SANTA ROSA'),
('02', '15', '11', 'TAUCA'),
('02', '16', '01', 'POMABAMBA'),
('02', '16', '02', 'HUAYLLAN'),
('02', '16', '03', 'PAROBAMBA'),
('02', '16', '04', 'QUINUABAMBA'),
('02', '17', '01', 'RECUAY'),
('02', '17', '02', 'CATAC'),
('02', '17', '03', 'COTAPARACO'),
('02', '17', '04', 'HUAYLLAPAMPA'),
('02', '17', '05', 'LLACLLIN'),
('02', '17', '06', 'MARCA'),
('02', '17', '07', 'PAMPAS CHICO'),
('02', '17', '08', 'PARARIN'),
('02', '17', '09', 'TAPACOCHA'),
('02', '17', '10', 'TICAPAMPA'),
('02', '18', '01', 'CHIMBOTE'),
('02', '18', '02', 'CACERES DEL PERU'),
('02', '18', '03', 'COISHCO'),
('02', '18', '04', 'MACATE'),
('02', '18', '05', 'MORO'),
('02', '18', '06', 'NEPEÑA'),
('02', '18', '07', 'SAMANCO'),
('02', '18', '08', 'SANTA'),
('02', '18', '09', 'NUEVO CHIMBOTE'),
('02', '19', '01', 'SIHUAS'),
('02', '19', '02', 'ACOBAMBA'),
('02', '19', '03', 'ALFONSO UGARTE'),
('02', '19', '04', 'CASHAPAMPA'),
('02', '19', '05', 'CHINGALPO'),
('02', '19', '06', 'HUAYLLABAMBA'),
('02', '19', '07', 'QUICHES'),
('02', '19', '08', 'RAGASH'),
('02', '19', '09', 'SAN JUAN'),
('02', '19', '10', 'SICSIBAMBA'),
('02', '20', '01', 'YUNGAY'),
('02', '20', '02', 'CASCAPARA'),
('02', '20', '03', 'MANCOS'),
('02', '20', '04', 'MATACOTO'),
('02', '20', '05', 'QUILLO'),
('02', '20', '06', 'RANRAHIRCA'),
('02', '20', '07', 'SHUPLUY'),
('02', '20', '08', 'YANAMA'),
('03', '01', '01', 'ABANCAY'),
('03', '01', '02', 'CHACOCHE'),
('03', '01', '03', 'CIRCA'),
('03', '01', '04', 'CURAHUASI'),
('03', '01', '05', 'HUANIPACA'),
('03', '01', '06', 'LAMBRAMA'),
('03', '01', '07', 'PICHIRHUA'),
('03', '01', '08', 'SAN PEDRO DE CACHORA'),
('03', '01', '09', 'TAMBURCO'),
('03', '02', '01', 'ANDAHUAYLAS'),
('03', '02', '02', 'ANDARAPA'),
('03', '02', '03', 'CHIARA'),
('03', '02', '04', 'HUANCARAMA'),
('03', '02', '05', 'HUANCARAY'),
('03', '02', '06', 'HUAYANA'),
('03', '02', '07', 'KISHUARA'),
('03', '02', '08', 'PACOBAMBA'),
('03', '02', '09', 'PACUCHA'),
('03', '02', '10', 'PAMPACHIRI'),
('03', '02', '11', 'POMACOCHA'),
('03', '02', '12', 'SAN ANTONIO DE CACHI'),
('03', '02', '13', 'SAN JERONIMO'),
('03', '02', '14', 'SAN MIGUEL DE CHACCRAMPA'),
('03', '02', '15', 'SANTA MARIA DE CHICMO'),
('03', '02', '16', 'TALAVERA'),
('03', '02', '17', 'TUMAY HUARACA'),
('03', '02', '18', 'TURPO'),
('03', '02', '19', 'KAQUIABAMBA'),
('03', '03', '01', 'ANTABAMBA'),
('03', '03', '02', 'EL ORO'),
('03', '03', '03', 'HUAQUIRCA'),
('03', '03', '04', 'JUAN ESPINOZA MEDRANO'),
('03', '03', '05', 'OROPESA'),
('03', '03', '06', 'PACHACONAS'),
('03', '03', '07', 'SABAINO'),
('03', '04', '01', 'CHALHUANCA'),
('03', '04', '02', 'CAPAYA'),
('03', '04', '03', 'CARAYBAMBA'),
('03', '04', '04', 'CHAPIMARCA'),
('03', '04', '05', 'COLCABAMBA'),
('03', '04', '06', 'COTARUSE'),
('03', '04', '07', 'HUAYLLO'),
('03', '04', '08', 'JUSTO APU SAHUARAURA'),
('03', '04', '09', 'LUCRE'),
('03', '04', '10', 'POCOHUANCA'),
('03', '04', '11', 'SAN JUAN DE CHACÑA'),
('03', '04', '12', 'SAÑAYCA'),
('03', '04', '13', 'SORAYA'),
('03', '04', '14', 'TAPAIRIHUA'),
('03', '04', '15', 'TINTAY'),
('03', '04', '16', 'TORAYA'),
('03', '04', '17', 'YANACA'),
('03', '05', '01', 'TAMBOBAMBA'),
('03', '05', '02', 'COTABAMBAS'),
('03', '05', '03', 'COYLLURQUI'),
('03', '05', '04', 'HAQUIRA'),
('03', '05', '05', 'MARA'),
('03', '05', '06', 'CHALLHUAHUACHO'),
('03', '06', '01', 'CHINCHEROS'),
('03', '06', '02', 'ANCO-HUALLO'),
('03', '06', '03', 'COCHARCAS'),
('03', '06', '04', 'HUACCANA'),
('03', '06', '05', 'OCOBAMBA'),
('03', '06', '06', 'ONGOY'),
('03', '06', '07', 'URANMARCA'),
('03', '06', '08', 'RANRACANCHA'),
('03', '07', '01', 'CHUQUIBAMBILLA'),
('03', '07', '02', 'CURPAHUASI'),
('03', '07', '03', 'GAMARRA'),
('03', '07', '04', 'HUAYLLATI'),
('03', '07', '05', 'MAMARA'),
('03', '07', '06', 'MICAELA BASTIDAS'),
('03', '07', '07', 'PATAYPAMPA'),
('03', '07', '08', 'PROGRESO'),
('03', '07', '09', 'SAN ANTONIO'),
('03', '07', '10', 'SANTA ROSA'),
('03', '07', '11', 'TURPAY'),
('03', '07', '12', 'VILCABAMBA'),
('03', '07', '13', 'VIRUNDO'),
('03', '07', '14', 'CURASCO'),
('04', '01', '01', 'AREQUIPA'),
('04', '01', '02', 'ALTO SELVA ALEGRE'),
('04', '01', '03', 'CAYMA'),
('04', '01', '04', 'CERRO COLORADO'),
('04', '01', '05', 'CHARACATO'),
('04', '01', '06', 'CHIGUATA'),
('04', '01', '07', 'JACOBO HUNTER'),
('04', '01', '08', 'LA JOYA'),
('04', '01', '09', 'MARIANO MELGAR'),
('04', '01', '10', 'MIRAFLORES'),
('04', '01', '11', 'MOLLEBAYA'),
('04', '01', '12', 'PAUCARPATA'),
('04', '01', '13', 'POCSI'),
('04', '01', '14', 'POLOBAYA'),
('04', '01', '15', 'QUEQUEÑA'),
('04', '01', '16', 'SABANDIA'),
('04', '01', '17', 'SACHACA'),
('04', '01', '18', 'SAN JUAN DE SIGUAS /1'),
('04', '01', '19', 'SAN JUAN DE TARUCANI'),
('04', '01', '20', 'SANTA ISABEL DE SIGUAS'),
('04', '01', '21', 'SANTA RITA DE SIGUAS'),
('04', '01', '22', 'SOCABAYA'),
('04', '01', '23', 'TIABAYA'),
('04', '01', '24', 'UCHUMAYO'),
('04', '01', '25', 'VITOR '),
('04', '01', '26', 'YANAHUARA'),
('04', '01', '27', 'YARABAMBA'),
('04', '01', '28', 'YURA'),
('04', '01', '29', 'JOSE LUIS BUSTAMANTE Y RIVERO'),
('04', '02', '01', 'CAMANA'),
('04', '02', '02', 'JOSE MARIA QUIMPER'),
('04', '02', '03', 'MARIANO NICOLAS VALCARCEL'),
('04', '02', '04', 'MARISCAL CACERES'),
('04', '02', '05', 'NICOLAS DE PIEROLA'),
('04', '02', '06', 'OCOÑA'),
('04', '02', '07', 'QUILCA'),
('04', '02', '08', 'SAMUEL PASTOR'),
('04', '03', '01', 'CARAVELI'),
('04', '03', '02', 'ACARI'),
('04', '03', '03', 'ATICO'),
('04', '03', '04', 'ATIQUIPA'),
('04', '03', '05', 'BELLA UNION'),
('04', '03', '06', 'CAHUACHO'),
('04', '03', '07', 'CHALA'),
('04', '03', '08', 'CHAPARRA'),
('04', '03', '09', 'HUANUHUANU'),
('04', '03', '10', 'JAQUI'),
('04', '03', '11', 'LOMAS'),
('04', '03', '12', 'QUICACHA'),
('04', '03', '13', 'YAUCA'),
('04', '04', '01', 'APLAO'),
('04', '04', '02', 'ANDAGUA'),
('04', '04', '03', 'AYO'),
('04', '04', '04', 'CHACHAS'),
('04', '04', '05', 'CHILCAYMARCA'),
('04', '04', '06', 'CHOCO'),
('04', '04', '07', 'HUANCARQUI'),
('04', '04', '08', 'MACHAGUAY'),
('04', '04', '09', 'ORCOPAMPA'),
('04', '04', '10', 'PAMPACOLCA'),
('04', '04', '11', 'TIPAN'),
('04', '04', '12', 'UÑON'),
('04', '04', '13', 'URACA'),
('04', '04', '14', 'VIRACO'),
('04', '05', '01', 'CHIVAY'),
('04', '05', '02', 'ACHOMA'),
('04', '05', '03', 'CABANACONDE'),
('04', '05', '04', 'CALLALLI'),
('04', '05', '05', 'CAYLLOMA'),
('04', '05', '06', 'COPORAQUE'),
('04', '05', '07', 'HUAMBO'),
('04', '05', '08', 'HUANCA'),
('04', '05', '09', 'ICHUPAMPA'),
('04', '05', '10', 'LARI'),
('04', '05', '11', 'LLUTA'),
('04', '05', '12', 'MACA'),
('04', '05', '13', 'MADRIGAL'),
('04', '05', '14', 'SAN ANTONIO DE CHUCA  2/'),
('04', '05', '15', 'SIBAYO'),
('04', '05', '16', 'TAPAY'),
('04', '05', '17', 'TISCO'),
('04', '05', '18', 'TUTI'),
('04', '05', '19', 'YANQUE'),
('04', '05', '20', 'MAJES'),
('04', '06', '01', 'CHUQUIBAMBA'),
('04', '06', '02', 'ANDARAY'),
('04', '06', '03', 'CAYARANI'),
('04', '06', '04', 'CHICHAS'),
('04', '06', '05', 'IRAY'),
('04', '06', '06', 'RIO GRANDE'),
('04', '06', '07', 'SALAMANCA'),
('04', '06', '08', 'YANAQUIHUA'),
('04', '07', '01', 'MOLLENDO'),
('04', '07', '02', 'COCACHACRA'),
('04', '07', '03', 'DEAN VALDIVIA'),
('04', '07', '04', 'ISLAY'),
('04', '07', '05', 'MEJIA'),
('04', '07', '06', 'PUNTA DE BOMBON'),
('04', '08', '01', 'COTAHUASI'),
('04', '08', '02', 'ALCA'),
('04', '08', '03', 'CHARCANA'),
('04', '08', '04', 'HUAYNACOTAS'),
('04', '08', '05', 'PAMPAMARCA'),
('04', '08', '06', 'PUYCA'),
('04', '08', '07', 'QUECHUALLA'),
('04', '08', '08', 'SAYLA'),
('04', '08', '09', 'TAURIA'),
('04', '08', '10', 'TOMEPAMPA'),
('04', '08', '11', 'TORO'),
('05', '01', '01', 'AYACUCHO'),
('05', '01', '02', 'ACOCRO'),
('05', '01', '03', 'ACOS VINCHOS'),
('05', '01', '04', 'CARMEN ALTO'),
('05', '01', '05', 'CHIARA'),
('05', '01', '06', 'OCROS'),
('05', '01', '07', 'PACAYCASA'),
('05', '01', '08', 'QUINUA'),
('05', '01', '09', 'SAN JOSE DE TICLLAS'),
('05', '01', '10', 'SAN JUAN BAUTISTA'),
('05', '01', '11', 'SANTIAGO DE PISCHA'),
('05', '01', '12', 'SOCOS'),
('05', '01', '13', 'TAMBILLO'),
('05', '01', '14', 'VINCHOS'),
('05', '01', '15', 'JESUS NAZARENO'),
('05', '02', '01', 'CANGALLO'),
('05', '02', '02', 'CHUSCHI'),
('05', '02', '03', 'LOS MOROCHUCOS'),
('05', '02', '04', 'MARIA PARADO DE BELLIDO'),
('05', '02', '05', 'PARAS'),
('05', '02', '06', 'TOTOS'),
('05', '03', '01', 'SANCOS'),
('05', '03', '02', 'CARAPO'),
('05', '03', '03', 'SACSAMARCA'),
('05', '03', '04', 'SANTIAGO DE LUCANAMARCA'),
('05', '04', '01', 'HUANTA'),
('05', '04', '02', 'AYAHUANCO'),
('05', '04', '03', 'HUAMANGUILLA'),
('05', '04', '04', 'IGUAIN'),
('05', '04', '05', 'LURICOCHA'),
('05', '04', '06', 'SANTILLANA'),
('05', '04', '07', 'SIVIA'),
('05', '04', '08', 'LLOCHEGUA'),
('05', '05', '01', 'SAN MIGUEL'),
('05', '05', '02', 'ANCO'),
('05', '05', '03', 'AYNA'),
('05', '05', '04', 'CHILCAS'),
('05', '05', '05', 'CHUNGUI'),
('05', '05', '06', 'LUIS CARRANZA'),
('05', '05', '07', 'SANTA ROSA'),
('05', '05', '08', 'TAMBO'),
('05', '06', '01', 'PUQUIO'),
('05', '06', '02', 'AUCARA'),
('05', '06', '03', 'CABANA'),
('05', '06', '04', 'CARMEN SALCEDO'),
('05', '06', '05', 'CHAVIÑA'),
('05', '06', '06', 'CHIPAO'),
('05', '06', '07', 'HUAC-HUAS'),
('05', '06', '08', 'LARAMATE'),
('05', '06', '09', 'LEONCIO PRADO'),
('05', '06', '10', 'LLAUTA'),
('05', '06', '11', 'LUCANAS'),
('05', '06', '12', 'OCAÑA'),
('05', '06', '13', 'OTOCA'),
('05', '06', '14', 'SAISA'),
('05', '06', '15', 'SAN CRISTOBAL'),
('05', '06', '16', 'SAN JUAN'),
('05', '06', '17', 'SAN PEDRO'),
('05', '06', '18', 'SAN PEDRO DE PALCO'),
('05', '06', '19', 'SANCOS'),
('05', '06', '20', 'SANTA ANA DE HUAYCAHUACHO'),
('05', '06', '21', 'SANTA LUCIA'),
('05', '07', '01', 'CORACORA'),
('05', '07', '02', 'CHUMPI'),
('05', '07', '03', 'CORONEL CASTAÑEDA'),
('05', '07', '04', 'PACAPAUSA'),
('05', '07', '05', 'PULLO'),
('05', '07', '06', 'PUYUSCA'),
('05', '07', '07', 'SAN FRANCISCO DE RAVACAYCO'),
('05', '07', '08', 'UPAHUACHO'),
('05', '08', '01', 'PAUSA'),
('05', '08', '02', 'COLTA'),
('05', '08', '03', 'CORCULLA'),
('05', '08', '04', 'LAMPA'),
('05', '08', '05', 'MARCABAMBA'),
('05', '08', '06', 'OYOLO'),
('05', '08', '07', 'PARARCA'),
('05', '08', '08', 'SAN JAVIER DE ALPABAMBA'),
('05', '08', '09', 'SAN JOSE DE USHUA'),
('05', '08', '10', 'SARA SARA'),
('05', '09', '01', 'QUEROBAMBA'),
('05', '09', '02', 'BELEN'),
('05', '09', '03', 'CHALCOS'),
('05', '09', '04', 'CHILCAYOC'),
('05', '09', '05', 'HUACAÑA'),
('05', '09', '06', 'MORCOLLA'),
('05', '09', '07', 'PAICO'),
('05', '09', '08', 'SAN PEDRO DE LARCAY'),
('05', '09', '09', 'SAN SALVADOR DE QUIJE'),
('05', '09', '10', 'SANTIAGO DE PAUCARAY'),
('05', '09', '11', 'SORAS'),
('05', '10', '01', 'HUANCAPI'),
('05', '10', '02', 'ALCAMENCA'),
('05', '10', '03', 'APONGO'),
('05', '10', '04', 'ASQUIPATA'),
('05', '10', '05', 'CANARIA'),
('05', '10', '06', 'CAYARA'),
('05', '10', '07', 'COLCA'),
('05', '10', '08', 'HUAMANQUIQUIA'),
('05', '10', '09', 'HUANCARAYLLA'),
('05', '10', '10', 'HUAYA'),
('05', '10', '11', 'SARHUA'),
('05', '10', '12', 'VILCANCHOS'),
('05', '11', '01', 'VILCAS HUAMAN'),
('05', '11', '02', 'ACCOMARCA'),
('05', '11', '03', 'CARHUANCA'),
('05', '11', '04', 'CONCEPCION'),
('05', '11', '05', 'HUAMBALPA'),
('05', '11', '06', 'INDEPENDENCIA /1'),
('05', '11', '07', 'SAURAMA'),
('05', '11', '08', 'VISCHONGO'),
('06', '01', '01', 'CAJAMARCA'),
('06', '01', '02', 'ASUNCION'),
('06', '01', '03', 'CHETILLA'),
('06', '01', '04', 'COSPAN'),
('06', '01', '05', 'ENCAÑADA'),
('06', '01', '06', 'JESUS'),
('06', '01', '07', 'LLACANORA'),
('06', '01', '08', 'LOS BAÑOS DEL INCA'),
('06', '01', '09', 'MAGDALENA'),
('06', '01', '10', 'MATARA'),
('06', '01', '11', 'NAMORA'),
('06', '01', '12', 'SAN JUAN'),
('06', '02', '01', 'CAJABAMBA'),
('06', '02', '02', 'CACHACHI'),
('06', '02', '03', 'CONDEBAMBA'),
('06', '02', '04', 'SITACOCHA'),
('06', '03', '01', 'CELENDIN'),
('06', '03', '02', 'CHUMUCH'),
('06', '03', '03', 'CORTEGANA'),
('06', '03', '04', 'HUASMIN'),
('06', '03', '05', 'JORGE CHAVEZ'),
('06', '03', '06', 'JOSE GALVEZ'),
('06', '03', '07', 'MIGUEL IGLESIAS'),
('06', '03', '08', 'OXAMARCA'),
('06', '03', '09', 'SOROCHUCO'),
('06', '03', '10', 'SUCRE'),
('06', '03', '11', 'UTCO'),
('06', '03', '12', 'LA LIBERTAD DE PALLAN'),
('06', '04', '01', 'CHOTA'),
('06', '04', '02', 'ANGUIA'),
('06', '04', '03', 'CHADIN'),
('06', '04', '04', 'CHIGUIRIP'),
('06', '04', '05', 'CHIMBAN'),
('06', '04', '06', 'CHOROPAMPA'),
('06', '04', '07', 'COCHABAMBA'),
('06', '04', '08', 'CONCHAN'),
('06', '04', '09', 'HUAMBOS'),
('06', '04', '10', 'LAJAS'),
('06', '04', '11', 'LLAMA'),
('06', '04', '12', 'MIRACOSTA'),
('06', '04', '13', 'PACCHA'),
('06', '04', '14', 'PION'),
('06', '04', '15', 'QUEROCOTO'),
('06', '04', '16', 'SAN JUAN DE LICUPIS'),
('06', '04', '17', 'TACABAMBA'),
('06', '04', '18', 'TOCMOCHE'),
('06', '04', '19', 'CHALAMARCA'),
('06', '05', '01', 'CONTUMAZA'),
('06', '05', '02', 'CHILETE'),
('06', '05', '03', 'CUPISNIQUE'),
('06', '05', '04', 'GUZMANGO'),
('06', '05', '05', 'SAN BENITO'),
('06', '05', '06', 'SANTA CRUZ DE TOLED'),
('06', '05', '07', 'TANTARICA'),
('06', '05', '08', 'YONAN'),
('06', '06', '01', 'CUTERVO'),
('06', '06', '02', 'CALLAYUC'),
('06', '06', '03', 'CHOROS'),
('06', '06', '04', 'CUJILLO'),
('06', '06', '05', 'LA RAMADA'),
('06', '06', '06', 'PIMPINGOS'),
('06', '06', '07', 'QUEROCOTILLO'),
('06', '06', '08', 'SAN ANDRES DE CUTERVO'),
('06', '06', '09', 'SAN JUAN DE CUTERVO'),
('06', '06', '10', 'SAN LUIS DE LUCMA'),
('06', '06', '11', 'SANTA CRUZ'),
('06', '06', '12', 'SANTO DOMINGO DE LA CAPILLA'),
('06', '06', '13', 'SANTO TOMAS'),
('06', '06', '14', 'SOCOTA'),
('06', '06', '15', 'TORIBIO CASANOVA'),
('06', '07', '01', 'BAMBAMARCA'),
('06', '07', '02', 'CHUGUR'),
('06', '07', '03', 'HUALGAYOC'),
('06', '08', '01', 'JAEN'),
('06', '08', '02', 'BELLAVISTA'),
('06', '08', '03', 'CHONTALI'),
('06', '08', '04', 'COLASAY'),
('06', '08', '05', 'HUABAL'),
('06', '08', '06', 'LAS PIRIAS'),
('06', '08', '07', 'POMAHUACA'),
('06', '08', '08', 'PUCARA'),
('06', '08', '09', 'SALLIQUE'),
('06', '08', '10', 'SAN FELIPE'),
('06', '08', '11', 'SAN JOSE DEL ALTO'),
('06', '08', '12', 'SANTA ROSA'),
('06', '09', '01', 'SAN IGNACIO'),
('06', '09', '02', 'CHIRINOS'),
('06', '09', '03', 'HUARANGO'),
('06', '09', '04', 'LA COIPA'),
('06', '09', '05', 'NAMBALLE'),
('06', '09', '06', 'SAN JOSE DE LOURDES'),
('06', '09', '07', 'TABACONAS'),
('06', '10', '01', 'PEDRO GALVEZ'),
('06', '10', '02', 'CHANCAY'),
('06', '10', '03', 'EDUARDO VILLANUEVA'),
('06', '10', '04', 'GREGORIO PITA'),
('06', '10', '05', 'ICHOCAN'),
('06', '10', '06', 'JOSE MANUEL QUIROZ'),
('06', '10', '07', 'JOSE SABOGAL'),
('06', '11', '01', 'SAN MIGUEL'),
('06', '11', '02', 'BOLIVAR'),
('06', '11', '03', 'CALQUIS'),
('06', '11', '04', 'CATILLUC'),
('06', '11', '05', 'EL PRADO'),
('06', '11', '06', 'LA FLORIDA'),
('06', '11', '07', 'LLAPA'),
('06', '11', '08', 'NANCHOC'),
('06', '11', '09', 'NIEPOS'),
('06', '11', '10', 'SAN GREGORIO'),
('06', '11', '11', 'SAN SILVESTRE DE COCHAN'),
('06', '11', '12', 'TONGOD'),
('06', '11', '13', 'UNION AGUA BLANCA'),
('06', '12', '01', 'SAN PABLO'),
('06', '12', '02', 'SAN BERNARDINO'),
('06', '12', '03', 'SAN LUIS'),
('06', '12', '04', 'TUMBADEN'),
('06', '13', '01', 'SANTA CRUZ'),
('06', '13', '02', 'ANDABAMBA'),
('06', '13', '03', 'CATACHE'),
('06', '13', '04', 'CHANCAYBAÑOS'),
('06', '13', '05', 'LA ESPERANZA'),
('06', '13', '06', 'NINABAMBA'),
('06', '13', '07', 'PULAN'),
('06', '13', '08', 'SAUCEPAMPA'),
('06', '13', '09', 'SEXI'),
('06', '13', '10', 'UTICYACU'),
('06', '13', '11', 'YAUYUCAN'),
('07', '01', '01', 'CALLAO'),
('07', '01', '02', 'BELLAVISTA'),
('07', '01', '03', 'CARMEN DE LA LEGUA REYNOSO'),
('07', '01', '04', 'LA PERLA'),
('07', '01', '05', 'LA PUNTA'),
('07', '01', '06', 'VENTANILLA'),
('08', '01', '01', 'CUSCO'),
('08', '01', '02', 'CCORCA'),
('08', '01', '03', 'POROY'),
('08', '01', '04', 'SAN JERONIMO'),
('08', '01', '05', 'SAN SEBASTIAN'),
('08', '01', '06', 'SANTIAGO'),
('08', '01', '07', 'SAYLLA'),
('08', '01', '08', 'WANCHAQ'),
('08', '02', '01', 'ACOMAYO'),
('08', '02', '02', 'ACOPIA'),
('08', '02', '03', 'ACOS'),
('08', '02', '04', 'MOSOC LLACTA'),
('08', '02', '05', 'POMACANCHI'),
('08', '02', '06', 'RONDOCAN'),
('08', '02', '07', 'SANGARARA'),
('08', '03', '01', 'ANTA'),
('08', '03', '02', 'ANCAHUASI'),
('08', '03', '03', 'CACHIMAYO'),
('08', '03', '04', 'CHINCHAYPUJIO'),
('08', '03', '05', 'HUAROCONDO'),
('08', '03', '06', 'LIMATAMBO'),
('08', '03', '07', 'MOLLEPATA'),
('08', '03', '08', 'PUCYURA'),
('08', '03', '09', 'ZURITE'),
('08', '04', '01', 'CALCA'),
('08', '04', '02', 'COYA'),
('08', '04', '03', 'LAMAY'),
('08', '04', '04', 'LARES'),
('08', '04', '05', 'PISAC'),
('08', '04', '06', 'SAN SALVADOR'),
('08', '04', '07', 'TARAY'),
('08', '04', '08', 'YANATILE'),
('08', '05', '01', 'YANAOCA'),
('08', '05', '02', 'CHECCA'),
('08', '05', '03', 'KUNTURKANKI'),
('08', '05', '04', 'LANGUI'),
('08', '05', '05', 'LAYO'),
('08', '05', '06', 'PAMPAMARCA'),
('08', '05', '07', 'QUEHUE'),
('08', '05', '08', 'TUPAC AMARU'),
('08', '06', '01', 'SICUANI'),
('08', '06', '02', 'CHECACUPE'),
('08', '06', '03', 'COMBAPATA'),
('08', '06', '04', 'MARANGANI'),
('08', '06', '05', 'PITUMARCA'),
('08', '06', '06', 'SAN PABLO'),
('08', '06', '07', 'SAN PEDRO'),
('08', '06', '08', 'TINTA'),
('08', '07', '01', 'SANTO TOMAS'),
('08', '07', '02', 'CAPACMARCA'),
('08', '07', '03', 'CHAMACA'),
('08', '07', '04', 'COLQUEMARCA'),
('08', '07', '05', 'LIVITACA'),
('08', '07', '06', 'LLUSCO'),
('08', '07', '07', 'QUIÑOTA'),
('08', '07', '08', 'VELILLE'),
('08', '08', '01', 'ESPINAR'),
('08', '08', '02', 'CONDOROMA'),
('08', '08', '03', 'COPORAQUE'),
('08', '08', '04', 'OCORURO'),
('08', '08', '05', 'PALLPATA'),
('08', '08', '06', 'PICHIGUA'),
('08', '08', '07', 'SUYCKUTAMBO 3/'),
('08', '08', '08', 'ALTO PICHIGUA'),
('08', '09', '01', 'SANTA ANA'),
('08', '09', '02', 'ECHARATE'),
('08', '09', '03', 'HUAYOPATA /1'),
('08', '09', '04', 'MARANURA'),
('08', '09', '05', 'OCOBAMBA  /2'),
('08', '09', '06', 'QUELLOUNO'),
('08', '09', '07', 'KIMBIRI'),
('08', '09', '08', 'SANTA TERESA'),
('08', '09', '09', 'VILCABAMBA'),
('08', '09', '10', 'PICHARI'),
('08', '10', '01', 'PARURO'),
('08', '10', '02', 'ACCHA'),
('08', '10', '03', 'CCAPI'),
('08', '10', '04', 'COLCHA'),
('08', '10', '05', 'HUANOQUITE'),
('08', '10', '06', 'OMACHA'),
('08', '10', '07', 'PACCARITAMBO'),
('08', '10', '08', 'PILLPINTO'),
('08', '10', '09', 'YAURISQUE'),
('08', '11', '01', 'PAUCARTAMBO'),
('08', '11', '02', 'CAICAY'),
('08', '11', '03', 'CHALLABAMBA'),
('08', '11', '04', 'COLQUEPATA'),
('08', '11', '05', 'HUANCARANI'),
('08', '11', '06', 'KOSÑIPATA'),
('08', '12', '01', 'URCOS'),
('08', '12', '02', 'ANDAHUAYLILLAS'),
('08', '12', '03', 'CAMANTI'),
('08', '12', '04', 'CCARHUAYO'),
('08', '12', '05', 'CCATCA'),
('08', '12', '06', 'CUSIPATA'),
('08', '12', '07', 'HUARO'),
('08', '12', '08', 'LUCRE'),
('08', '12', '09', 'MARCAPATA'),
('08', '12', '10', 'OCONGATE'),
('08', '12', '11', 'OROPESA'),
('08', '12', '12', 'QUIQUIJANA'),
('08', '13', '01', 'URUBAMBA'),
('08', '13', '02', 'CHINCHERO'),
('08', '13', '03', 'HUAYLLABAMBA'),
('08', '13', '04', 'MACHUPICCHU'),
('08', '13', '05', 'MARAS'),
('08', '13', '06', 'OLLANTAYTAMBO'),
('08', '13', '07', 'YUCAY'),
('09', '01', '01', 'HUANCAVELICA'),
('09', '01', '02', 'ACOBAMBILLA'),
('09', '01', '03', 'ACORIA'),
('09', '01', '04', 'CONAYCA'),
('09', '01', '05', 'CUENCA'),
('09', '01', '06', 'HUACHOCOLPA'),
('09', '01', '07', 'HUAYLLAHUARA'),
('09', '01', '08', 'IZCUCHACA'),
('09', '01', '09', 'LARIA'),
('09', '01', '10', 'MANTA'),
('09', '01', '11', 'MARISCAL CACERES'),
('09', '01', '12', 'MOYA'),
('09', '01', '13', 'NUEVO OCCORO'),
('09', '01', '14', 'PALCA'),
('09', '01', '15', 'PILCHACA'),
('09', '01', '16', 'VILCA'),
('09', '01', '17', 'YAULI'),
('09', '01', '18', 'ASCENSION'),
('09', '01', '19', 'HUANDO'),
('09', '02', '01', 'ACOBAMBA'),
('09', '02', '02', 'ANDABAMBA'),
('09', '02', '03', 'ANTA'),
('09', '02', '04', 'CAJA'),
('09', '02', '05', 'MARCAS'),
('09', '02', '06', 'PAUCARA'),
('09', '02', '07', 'POMACOCHA'),
('09', '02', '08', 'ROSARIO'),
('09', '03', '01', 'LIRCAY'),
('09', '03', '02', 'ANCHONGA'),
('09', '03', '03', 'CALLANMARCA'),
('09', '03', '04', 'CCOCHACCASA'),
('09', '03', '05', 'CHINCHO'),
('09', '03', '06', 'CONGALLA'),
('09', '03', '07', 'HUANCA-HUANCA'),
('09', '03', '08', 'HUAYLLAY GRANDE'),
('09', '03', '09', 'JULCAMARCA'),
('09', '03', '10', 'SAN ANTONIO DE ANTAPARCO'),
('09', '03', '11', 'SANTO TOMAS DE PATA'),
('09', '03', '12', 'SECCLLA'),
('09', '04', '01', 'CASTROVIRREYNA'),
('09', '04', '02', 'ARMA'),
('09', '04', '03', 'AURAHUA'),
('09', '04', '04', 'CAPILLAS'),
('09', '04', '05', 'CHUPAMARCA'),
('09', '04', '06', 'COCAS'),
('09', '04', '07', 'HUACHOS'),
('09', '04', '08', 'HUAMATAMBO'),
('09', '04', '09', 'MOLLEPAMPA'),
('09', '04', '10', 'SAN JUAN'),
('09', '04', '11', 'SANTA ANA'),
('09', '04', '12', 'TANTARA'),
('09', '04', '13', 'TICRAPO'),
('09', '05', '01', 'CHURCAMPA'),
('09', '05', '02', 'ANCO'),
('09', '05', '03', 'CHINCHIHUASI'),
('09', '05', '04', 'EL CARMEN'),
('09', '05', '05', 'LA MERCED'),
('09', '05', '06', 'LOCROJA'),
('09', '05', '07', 'PAUCARBAMBA'),
('09', '05', '08', 'SAN MIGUEL DE MAYOCC'),
('09', '05', '09', 'SAN PEDRO DE CORIS'),
('09', '05', '10', 'PACHAMARCA '),
('09', '06', '01', 'HUAYTARA'),
('09', '06', '02', 'AYAVI'),
('09', '06', '03', 'CORDOVA'),
('09', '06', '04', 'HUAYACUNDO ARMA'),
('09', '06', '05', 'LARAMARCA'),
('09', '06', '06', 'OCOYO'),
('09', '06', '07', 'PILPICHACA'),
('09', '06', '08', 'QUERCO'),
('09', '06', '09', 'QUITO-ARMA'),
('09', '06', '10', 'SAN ANTONIO DE CUSICANCHA'),
('09', '06', '11', 'SAN FRANCISCO DE SANGAYAICO'),
('09', '06', '12', 'SAN ISIDRO'),
('09', '06', '13', 'SANTIAGO DE CHOCORVOS'),
('09', '06', '14', 'SANTIAGO DE QUIRAHUARA'),
('09', '06', '15', 'SANTO DOMINGO DE CAPILLAS'),
('09', '06', '16', 'TAMBO'),
('09', '07', '01', 'PAMPAS'),
('09', '07', '02', 'ACOSTAMBO'),
('09', '07', '03', 'ACRAQUIA'),
('09', '07', '04', 'AHUAYCHA'),
('09', '07', '05', 'COLCABAMBA'),
('09', '07', '06', 'DANIEL HERNANDEZ'),
('09', '07', '07', 'HUACHOCOLPA'),
('09', '07', '09', 'HUARIBAMBA'),
('09', '07', '10', 'ÑAHUIMPUQUIO'),
('09', '07', '11', 'PAZOS'),
('09', '07', '13', 'QUISHUAR'),
('09', '07', '14', 'SALCABAMBA'),
('09', '07', '15', 'SALCAHUASI'),
('09', '07', '16', 'SAN MARCOS DE ROCCHAC'),
('09', '07', '17', 'SURCUBAMBA'),
('09', '07', '18', 'TINTAY PUNCU'),
('10', '01', '01', 'HUANUCO'),
('10', '01', '02', 'AMARILIS'),
('10', '01', '03', 'CHINCHAO'),
('10', '01', '04', 'CHURUBAMBA'),
('10', '01', '05', 'MARGOS'),
('10', '01', '06', 'QUISQUI'),
('10', '01', '07', 'SAN FRANCISCO DE CAYRAN'),
('10', '01', '08', 'SAN PEDRO DE CHAULAN'),
('10', '01', '09', 'SANTA MARIA DEL VALLE'),
('10', '01', '10', 'YARUMAYO'),
('10', '01', '11', 'PILLCO MARCA'),
('10', '02', '01', 'AMBO'),
('10', '02', '02', 'CAYNA'),
('10', '02', '03', 'COLPAS'),
('10', '02', '04', 'CONCHAMARCA'),
('10', '02', '05', 'HUACAR'),
('10', '02', '06', 'SAN FRANCISCO'),
('10', '02', '07', 'SAN RAFAEL'),
('10', '02', '08', 'TOMAY KICHWA'),
('10', '03', '01', 'LA UNION'),
('10', '03', '07', 'CHUQUIS'),
('10', '03', '11', 'MARIAS'),
('10', '03', '13', 'PACHAS'),
('10', '03', '16', 'QUIVILLA'),
('10', '03', '17', 'RIPAN'),
('10', '03', '21', 'SHUNQUI'),
('10', '03', '22', 'SILLAPATA'),
('10', '03', '23', 'YANAS'),
('10', '04', '01', 'HUACAYBAMBA'),
('10', '04', '02', 'CANCHABAMBA'),
('10', '04', '03', 'COCHABAMBA'),
('10', '04', '04', 'PINRA'),
('10', '05', '01', 'LLATA'),
('10', '05', '02', 'ARANCAY'),
('10', '05', '03', 'CHAVIN DE PARIARCA'),
('10', '05', '04', 'JACAS GRANDE'),
('10', '05', '05', 'JIRCAN'),
('10', '05', '06', 'MIRAFLORES'),
('10', '05', '07', 'MONZON'),
('10', '05', '08', 'PUNCHAO'),
('10', '05', '09', 'PUÑOS'),
('10', '05', '10', 'SINGA'),
('10', '05', '11', 'TANTAMAYO'),
('10', '06', '01', 'RUPA-RUPA'),
('10', '06', '02', 'DANIEL ALOMIA ROBLES'),
('10', '06', '03', 'HERMILIO VALDIZAN'),
('10', '06', '04', 'JOSE CRESPO Y CASTILLO'),
('10', '06', '05', 'LUYANDO 1/'),
('10', '06', '06', 'MARIANO DAMASO BERAUN'),
('10', '07', '01', 'HUACRACHUCO'),
('10', '07', '02', 'CHOLON'),
('10', '07', '03', 'SAN BUENAVENTURA'),
('10', '08', '01', 'PANAO'),
('10', '08', '02', 'CHAGLLA'),
('10', '08', '03', 'MOLINO'),
('10', '08', '04', 'UMARI  '),
('10', '09', '01', 'PUERTO INCA'),
('10', '09', '02', 'CODO DEL POZUZO'),
('10', '09', '03', 'HONORIA'),
('10', '09', '04', 'TOURNAVISTA'),
('10', '09', '05', 'YUYAPICHIS'),
('10', '10', '01', 'JESUS'),
('10', '10', '02', 'BAÑOS'),
('10', '10', '03', 'JIVIA'),
('10', '10', '04', 'QUEROPALCA'),
('10', '10', '05', 'RONDOS'),
('10', '10', '06', 'SAN FRANCISCO DE ASIS'),
('10', '10', '07', 'SAN MIGUEL DE CAURI'),
('10', '11', '01', 'CHAVINILLO'),
('10', '11', '02', 'CAHUAC'),
('10', '11', '03', 'CHACABAMBA'),
('10', '11', '04', 'APARICIO POMARES'),
('10', '11', '05', 'JACAS CHICO'),
('10', '11', '06', 'OBAS'),
('10', '11', '07', 'PAMPAMARCA'),
('10', '11', '08', 'CHORAS'),
('11', '01', '01', 'ICA'),
('11', '01', '02', 'LA TINGUIÑA'),
('11', '01', '03', 'LOS AQUIJES'),
('11', '01', '04', 'OCUCAJE'),
('11', '01', '05', 'PACHACUTEC'),
('11', '01', '06', 'PARCONA'),
('11', '01', '07', 'PUEBLO NUEVO'),
('11', '01', '08', 'SALAS'),
('11', '01', '09', 'SAN JOSE DE LOS MOLINOS'),
('11', '01', '10', 'SAN JUAN BAUTISTA'),
('11', '01', '11', 'SANTIAGO'),
('11', '01', '12', 'SUBTANJALLA'),
('11', '01', '13', 'TATE'),
('11', '01', '14', 'YAUCA DEL ROSARIO  1/'),
('11', '02', '01', 'CHINCHA ALTA'),
('11', '02', '02', 'ALTO LARAN'),
('11', '02', '03', 'CHAVIN'),
('11', '02', '04', 'CHINCHA BAJA'),
('11', '02', '05', 'EL CARMEN'),
('11', '02', '06', 'GROCIO PRADO'),
('11', '02', '07', 'PUEBLO NUEVO'),
('11', '02', '08', 'SAN JUAN DE YANAC'),
('11', '02', '09', 'SAN PEDRO DE HUACARPANA'),
('11', '02', '10', 'SUNAMPE'),
('11', '02', '11', 'TAMBO DE MORA'),
('11', '03', '01', 'NAZCA'),
('11', '03', '02', 'CHANGUILLO'),
('11', '03', '03', 'EL INGENIO'),
('11', '03', '04', 'MARCONA'),
('11', '03', '05', 'VISTA ALEGRE'),
('11', '04', '01', 'PALPA'),
('11', '04', '02', 'LLIPATA'),
('11', '04', '03', 'RIO GRANDE'),
('11', '04', '04', 'SANTA CRUZ'),
('11', '04', '05', 'TIBILLO'),
('11', '05', '01', 'PISCO'),
('11', '05', '02', 'HUANCANO'),
('11', '05', '03', 'HUMAY'),
('11', '05', '04', 'INDEPENDENCIA'),
('11', '05', '05', 'PARACAS'),
('11', '05', '06', 'SAN ANDRES'),
('11', '05', '07', 'SAN CLEMENTE'),
('11', '05', '08', 'TUPAC AMARU INCA'),
('12', '01', '01', 'HUANCAYO'),
('12', '01', '04', 'CARHUACALLANGA'),
('12', '01', '05', 'CHACAPAMPA'),
('12', '01', '06', 'CHICCHE'),
('12', '01', '07', 'CHILCA'),
('12', '01', '08', 'CHONGOS ALTO'),
('12', '01', '11', 'CHUPURO'),
('12', '01', '12', 'COLCA'),
('12', '01', '13', 'CULLHUAS'),
('12', '01', '14', 'EL TAMBO'),
('12', '01', '16', 'HUACRAPUQUIO'),
('12', '01', '17', 'HUALHUAS'),
('12', '01', '19', 'HUANCAN'),
('12', '01', '20', 'HUASICANCHA'),
('12', '01', '21', 'HUAYUCACHI'),
('12', '01', '22', 'INGENIO'),
('12', '01', '24', 'PARIAHUANCA   1/'),
('12', '01', '25', 'PILCOMAYO'),
('12', '01', '26', 'PUCARA'),
('12', '01', '27', 'QUICHUAY'),
('12', '01', '28', 'QUILCAS'),
('12', '01', '29', 'SAN AGUSTIN'),
('12', '01', '30', 'SAN JERONIMO DE TUNAN'),
('12', '01', '32', 'SAÑO'),
('12', '01', '33', 'SAPALLANGA'),
('12', '01', '34', 'SICAYA'),
('12', '01', '35', 'SANTO DOMINGO DE ACOBAMBA'),
('12', '01', '36', 'VIQUES'),
('12', '02', '01', 'CONCEPCION'),
('12', '02', '02', 'ACO'),
('12', '02', '03', 'ANDAMARCA'),
('12', '02', '04', 'CHAMBARA'),
('12', '02', '05', 'COCHAS'),
('12', '02', '06', 'COMAS'),
('12', '02', '07', 'HEROINAS TOLEDO'),
('12', '02', '08', 'MANZANARES'),
('12', '02', '09', 'MARISCAL CASTILLA'),
('12', '02', '10', 'MATAHUASI'),
('12', '02', '11', 'MITO'),
('12', '02', '12', 'NUEVE DE JULIO'),
('12', '02', '13', 'ORCOTUNA'),
('12', '02', '14', 'SAN JOSE DE QUERO'),
('12', '02', '15', 'SANTA ROSA DE OCOPA'),
('12', '03', '01', 'CHANCHAMAYO'),
('12', '03', '02', 'PERENE'),
('12', '03', '03', 'PICHANAQUI'),
('12', '03', '04', 'SAN LUIS DE SHUARO'),
('12', '03', '05', 'SAN RAMON'),
('12', '03', '06', 'VITOC'),
('12', '04', '01', 'JAUJA'),
('12', '04', '02', 'ACOLLA'),
('12', '04', '03', 'APATA'),
('12', '04', '04', 'ATAURA'),
('12', '04', '05', 'CANCHAYLLO'),
('12', '04', '06', 'CURICACA'),
('12', '04', '07', 'EL MANTARO'),
('12', '04', '08', 'HUAMALI'),
('12', '04', '09', 'HUARIPAMPA'),
('12', '04', '10', 'HUERTAS'),
('12', '04', '11', 'JANJAILLO'),
('12', '04', '12', 'JULCAN'),
('12', '04', '13', 'LEONOR ORDOÑEZ'),
('12', '04', '14', 'LLOCLLAPAMPA'),
('12', '04', '15', 'MARCO'),
('12', '04', '16', 'MASMA'),
('12', '04', '17', 'MASMA CHICCHE'),
('12', '04', '18', 'MOLINOS'),
('12', '04', '19', 'MONOBAMBA'),
('12', '04', '20', 'MUQUI'),
('12', '04', '21', 'MUQUIYAUYO'),
('12', '04', '22', 'PACA'),
('12', '04', '23', 'PACCHA'),
('12', '04', '24', 'PANCAN'),
('12', '04', '25', 'PARCO'),
('12', '04', '26', 'POMACANCHA'),
('12', '04', '27', 'RICRAN'),
('12', '04', '28', 'SAN LORENZO'),
('12', '04', '29', 'SAN PEDRO DE CHUNAN'),
('12', '04', '30', 'SAUSA'),
('12', '04', '31', 'SINCOS'),
('12', '04', '32', 'TUNAN MARCA'),
('12', '04', '33', 'YAULI'),
('12', '04', '34', 'YAUYOS'),
('12', '05', '01', 'JUNIN'),
('12', '05', '02', 'CARHUAMAYO'),
('12', '05', '03', 'ONDORES'),
('12', '05', '04', 'ULCUMAYO'),
('12', '06', '01', 'SATIPO'),
('12', '06', '02', 'COVIRIALI'),
('12', '06', '03', 'LLAYLLA'),
('12', '06', '04', 'MAZAMARI'),
('12', '06', '05', 'PAMPA HERMOSA'),
('12', '06', '06', 'PANGOA'),
('12', '06', '07', 'RIO NEGRO'),
('12', '06', '08', 'RIO TAMBO'),
('12', '07', '01', 'TARMA'),
('12', '07', '02', 'ACOBAMBA'),
('12', '07', '03', 'HUARICOLCA'),
('12', '07', '04', 'HUASAHUASI'),
('12', '07', '05', 'LA UNION'),
('12', '07', '06', 'PALCA'),
('12', '07', '07', 'PALCAMAYO'),
('12', '07', '08', 'SAN PEDRO DE CAJAS'),
('12', '07', '09', 'TAPO'),
('12', '08', '01', 'LA OROYA'),
('12', '08', '02', 'CHACAPALPA'),
('12', '08', '03', 'HUAY-HUAY'),
('12', '08', '04', 'MARCAPOMACOCHA'),
('12', '08', '05', 'MOROCOCHA'),
('12', '08', '06', 'PACCHA'),
('12', '08', '07', 'SANTA BARBARA DE CARHUACAYAN'),
('12', '08', '08', 'SANTA ROSA DE SACCO'),
('12', '08', '09', 'SUITUCANCHA'),
('12', '08', '10', 'YAULI'),
('12', '09', '01', 'CHUPACA'),
('12', '09', '02', 'AHUAC'),
('12', '09', '03', 'CHONGOS BAJO'),
('12', '09', '04', 'HUACHAC'),
('12', '09', '05', 'HUAMANCACA CHICO'),
('12', '09', '06', 'SAN JUAN DE ISCOS'),
('12', '09', '07', 'SAN JUAN DE JARPA'),
('12', '09', '08', 'TRES DE DICIEMBRE'),
('12', '09', '09', 'YANACANCHA'),
('13', '01', '01', 'TRUJILLO'),
('13', '01', '02', 'EL PORVENIR'),
('13', '01', '03', 'FLORENCIA DE MORA'),
('13', '01', '04', 'HUANCHACO'),
('13', '01', '05', 'LA ESPERANZA'),
('13', '01', '06', 'LAREDO'),
('13', '01', '07', 'MOCHE'),
('13', '01', '08', 'POROTO'),
('13', '01', '09', 'SALAVERRY'),
('13', '01', '10', 'SIMBAL'),
('13', '01', '11', 'VICTOR LARCO HERRERA'),
('13', '02', '01', 'ASCOPE'),
('13', '02', '02', 'CHICAMA'),
('13', '02', '03', 'CHOCOPE'),
('13', '02', '04', 'MAGDALENA DE CAO'),
('13', '02', '05', 'PAIJAN'),
('13', '02', '06', 'RAZURI'),
('13', '02', '07', 'SANTIAGO DE CAO'),
('13', '02', '08', 'CASA GRANDE'),
('13', '03', '01', 'BOLIVAR'),
('13', '03', '02', 'BAMBAMARCA'),
('13', '03', '03', 'CONDORMARCA /1'),
('13', '03', '04', 'LONGOTEA'),
('13', '03', '05', 'UCHUMARCA'),
('13', '03', '06', 'UCUNCHA'),
('13', '04', '01', 'CHEPEN'),
('13', '04', '02', 'PACANGA'),
('13', '04', '03', 'PUEBLO NUEVO'),
('13', '05', '01', 'JULCAN'),
('13', '05', '02', 'CALAMARCA'),
('13', '05', '03', 'CARABAMBA'),
('13', '05', '04', 'HUASO'),
('13', '06', '01', 'OTUZCO'),
('13', '06', '02', 'AGALLPAMPA'),
('13', '06', '04', 'CHARAT'),
('13', '06', '05', 'HUARANCHAL'),
('13', '06', '06', 'LA CUESTA'),
('13', '06', '08', 'MACHE'),
('13', '06', '10', 'PARANDAY'),
('13', '06', '11', 'SALPO'),
('13', '06', '13', 'SINSICAP'),
('13', '06', '14', 'USQUIL'),
('13', '07', '01', 'SAN PEDRO DE LLOC'),
('13', '07', '02', 'GUADALUPE'),
('13', '07', '03', 'JEQUETEPEQUE'),
('13', '07', '04', 'PACASMAYO'),
('13', '07', '05', 'SAN JOSE'),
('13', '08', '01', 'TAYABAMBA'),
('13', '08', '02', 'BULDIBUYO'),
('13', '08', '03', 'CHILLIA'),
('13', '08', '04', 'HUANCASPATA'),
('13', '08', '05', 'HUAYLILLAS'),
('13', '08', '06', 'HUAYO'),
('13', '08', '07', 'ONGON'),
('13', '08', '08', 'PARCOY'),
('13', '08', '09', 'PATAZ'),
('13', '08', '10', 'PIAS'),
('13', '08', '11', 'SANTIAGO DE CHALLAS'),
('13', '08', '12', 'TAURIJA'),
('13', '08', '13', 'URPAY'),
('13', '09', '01', 'HUAMACHUCO'),
('13', '09', '02', 'CHUGAY'),
('13', '09', '03', 'COCHORCO'),
('13', '09', '04', 'CURGOS'),
('13', '09', '05', 'MARCABAL'),
('13', '09', '06', 'SANAGORAN'),
('13', '09', '07', 'SARIN'),
('13', '09', '08', 'SARTIMBAMBA'),
('13', '10', '01', 'SANTIAGO DE CHUCO'),
('13', '10', '02', 'ANGASMARCA'),
('13', '10', '03', 'CACHICADAN'),
('13', '10', '04', 'MOLLEBAMBA'),
('13', '10', '05', 'MOLLEPATA'),
('13', '10', '06', 'QUIRUVILCA'),
('13', '10', '07', 'SANTA CRUZ DE CHUCA'),
('13', '10', '08', 'SITABAMBA'),
('13', '11', '01', 'CASCAS'),
('13', '11', '02', 'LUCMA'),
('13', '11', '03', 'COMPIN'),
('13', '11', '04', 'SAYAPULLO'),
('13', '12', '01', 'VIRU'),
('13', '12', '02', 'CHAO'),
('13', '12', '03', 'GUADALUPITO'),
('14', '01', '01', 'CHICLAYO'),
('14', '01', '02', 'CHONGOYAPE'),
('14', '01', '03', 'ETEN'),
('14', '01', '04', 'ETEN PUERTO'),
('14', '01', '05', 'JOSE LEONARDO ORTIZ'),
('14', '01', '06', 'LA VICTORIA'),
('14', '01', '07', 'LAGUNAS   '),
('14', '01', '08', 'MONSEFU'),
('14', '01', '09', 'NUEVA ARICA'),
('14', '01', '10', 'OYOTUN'),
('14', '01', '11', 'PICSI'),
('14', '01', '12', 'PIMENTEL'),
('14', '01', '13', 'REQUE'),
('14', '01', '14', 'SANTA ROSA'),
('14', '01', '15', 'SAÑA'),
('14', '01', '16', 'CAYALTI'),
('14', '01', '17', 'PATAPO'),
('14', '01', '18', 'POMALCA'),
('14', '01', '19', 'PUCALA'),
('14', '01', '20', 'TUMAN'),
('14', '02', '01', 'FERREÑAFE'),
('14', '02', '02', 'CAÑARIS'),
('14', '02', '03', 'INCAHUASI'),
('14', '02', '04', 'MANUEL ANTONIO MESONES MURO'),
('14', '02', '05', 'PITIPO'),
('14', '02', '06', 'PUEBLO NUEVO'),
('14', '03', '01', 'LAMBAYEQUE'),
('14', '03', '02', 'CHOCHOPE'),
('14', '03', '03', 'ILLIMO'),
('14', '03', '04', 'JAYANCA'),
('14', '03', '05', 'MOCHUMI'),
('14', '03', '06', 'MORROPE'),
('14', '03', '07', 'MOTUPE'),
('14', '03', '08', 'OLMOS'),
('14', '03', '09', 'PACORA'),
('14', '03', '10', 'SALAS'),
('14', '03', '11', 'SAN JOSE'),
('14', '03', '12', 'TUCUME'),
('15', '01', '01', 'LIMA'),
('15', '01', '02', 'ANCON'),
('15', '01', '03', 'ATE'),
('15', '01', '04', 'BARRANCO'),
('15', '01', '05', 'BREÑA'),
('15', '01', '06', 'CARABAYLLO'),
('15', '01', '07', 'CHACLACAYO'),
('15', '01', '08', 'CHORRILLOS'),
('15', '01', '09', 'CIENEGUILLA'),
('15', '01', '10', 'COMAS'),
('15', '01', '11', 'EL AGUSTINO'),
('15', '01', '12', 'INDEPENDENCIA'),
('15', '01', '13', 'JESUS MARIA'),
('15', '01', '14', 'LA MOLINA'),
('15', '01', '15', 'LA VICTORIA'),
('15', '01', '16', 'LINCE'),
('15', '01', '17', 'LOS OLIVOS'),
('15', '01', '18', 'LURIGANCHO'),
('15', '01', '19', 'LURIN'),
('15', '01', '20', 'MAGDALENA DEL MAR'),
('15', '01', '21', 'PUEBLO LIBRE'),
('15', '01', '22', 'MIRAFLORES'),
('15', '01', '23', 'PACHACAMAC'),
('15', '01', '24', 'PUCUSANA'),
('15', '01', '25', 'PUENTE PIEDRA'),
('15', '01', '26', 'PUNTA HERMOSA'),
('15', '01', '27', 'PUNTA NEGRA'),
('15', '01', '28', 'RIMAC'),
('15', '01', '29', 'SAN BARTOLO'),
('15', '01', '30', 'SAN BORJA'),
('15', '01', '31', 'SAN ISIDRO'),
('15', '01', '32', 'SAN JUAN DE LURIGANCHO'),
('15', '01', '33', 'SAN JUAN DE MIRAFLORES'),
('15', '01', '34', 'SAN LUIS'),
('15', '01', '35', 'SAN MARTIN DE PORRES'),
('15', '01', '36', 'SAN MIGUEL'),
('15', '01', '37', 'SANTA ANITA'),
('15', '01', '38', 'SANTA MARIA DEL MAR'),
('15', '01', '39', 'SANTA ROSA'),
('15', '01', '40', 'SANTIAGO DE SURCO'),
('15', '01', '41', 'SURQUILLO'),
('15', '01', '42', 'VILLA EL SALVADOR'),
('15', '01', '43', 'VILLA MARIA DEL TRIUNFO'),
('15', '02', '01', 'BARRANCA'),
('15', '02', '02', 'PARAMONGA'),
('15', '02', '03', 'PATIVILCA'),
('15', '02', '04', 'SUPE'),
('15', '02', '05', 'SUPE PUERTO'),
('15', '03', '01', 'CAJATAMBO'),
('15', '03', '02', 'COPA'),
('15', '03', '03', 'GORGOR'),
('15', '03', '04', 'HUANCAPON'),
('15', '03', '05', 'MANAS'),
('15', '04', '01', 'CANTA'),
('15', '04', '02', 'ARAHUAY'),
('15', '04', '03', 'HUAMANTANGA'),
('15', '04', '04', 'HUAROS'),
('15', '04', '05', 'LACHAQUI'),
('15', '04', '06', 'SAN BUENAVENTURA'),
('15', '04', '07', 'SANTA ROSA DE QUIVES'),
('15', '05', '01', 'SAN VICENTE DE CAÑETE'),
('15', '05', '02', 'ASIA'),
('15', '05', '03', 'CALANGO'),
('15', '05', '04', 'CERRO AZUL'),
('15', '05', '05', 'CHILCA'),
('15', '05', '06', 'COAYLLO'),
('15', '05', '07', 'IMPERIAL'),
('15', '05', '08', 'LUNAHUANA'),
('15', '05', '09', 'MALA'),
('15', '05', '10', 'NUEVO IMPERIAL'),
('15', '05', '11', 'PACARAN'),
('15', '05', '12', 'QUILMANA'),
('15', '05', '13', 'SAN ANTONIO'),
('15', '05', '14', 'SAN LUIS'),
('15', '05', '15', 'SANTA CRUZ DE FLORES'),
('15', '05', '16', 'ZUÑIGA'),
('15', '06', '01', 'HUARAL'),
('15', '06', '02', 'ATAVILLOS ALTO'),
('15', '06', '03', 'ATAVILLOS BAJO'),
('15', '06', '04', 'AUCALLAMA'),
('15', '06', '05', 'CHANCAY'),
('15', '06', '06', 'IHUARI'),
('15', '06', '07', 'LAMPIAN'),
('15', '06', '08', 'PACARAOS'),
('15', '06', '09', 'SAN MIGUEL DE ACOS'),
('15', '06', '10', 'SANTA CRUZ DE ANDAMARCA'),
('15', '06', '11', 'SUMBILCA'),
('15', '06', '12', 'VEINTISIETE DE NOVIEMBRE'),
('15', '07', '01', 'MATUCANA'),
('15', '07', '02', 'ANTIOQUIA'),
('15', '07', '03', 'CALLAHUANCA'),
('15', '07', '04', 'CARAMPOMA'),
('15', '07', '05', 'CHICLA'),
('15', '07', '06', 'CUENCA'),
('15', '07', '07', 'HUACHUPAMPA'),
('15', '07', '08', 'HUANZA'),
('15', '07', '09', 'HUAROCHIRI'),
('15', '07', '10', 'LAHUAYTAMBO'),
('15', '07', '11', 'LANGA'),
('15', '07', '12', 'LARAOS'),
('15', '07', '13', 'MARIATANA'),
('15', '07', '14', 'RICARDO PALMA'),
('15', '07', '15', 'SAN ANDRES DE TUPICOCHA'),
('15', '07', '16', 'SAN ANTONIO'),
('15', '07', '17', 'SAN BARTOLOME'),
('15', '07', '18', 'SAN DAMIAN'),
('15', '07', '19', 'SAN JUAN DE IRIS'),
('15', '07', '20', 'SAN JUAN DE TANTARANCHE'),
('15', '07', '21', 'SAN LORENZO DE QUINTI'),
('15', '07', '22', 'SAN MATEO'),
('15', '07', '23', 'SAN MATEO DE OTAO'),
('15', '07', '24', 'SAN PEDRO DE CASTA'),
('15', '07', '25', 'SAN PEDRO DE HUANCAYRE'),
('15', '07', '26', 'SANGALLAYA'),
('15', '07', '27', 'SANTA CRUZ DE COCACHACRA'),
('15', '07', '28', 'SANTA EULALIA'),
('15', '07', '29', 'SANTIAGO DE ANCHUCAYA'),
('15', '07', '30', 'SANTIAGO DE TUNA'),
('15', '07', '31', 'SANTO DOMINGO DE LOS OLLEROS'),
('15', '07', '32', 'SURCO'),
('15', '08', '01', 'HUACHO'),
('15', '08', '02', 'AMBAR'),
('15', '08', '03', 'CALETA DE CARQUIN'),
('15', '08', '04', 'CHECRAS'),
('15', '08', '05', 'HUALMAY'),
('15', '08', '06', 'HUAURA'),
('15', '08', '07', 'LEONCIO PRADO'),
('15', '08', '08', 'PACCHO'),
('15', '08', '09', 'SANTA LEONOR'),
('15', '08', '10', 'SANTA MARIA'),
('15', '08', '11', 'SAYAN'),
('15', '08', '12', 'VEGUETA'),
('15', '09', '01', 'OYON'),
('15', '09', '02', 'ANDAJES'),
('15', '09', '03', 'CAUJUL'),
('15', '09', '04', 'COCHAMARCA'),
('15', '09', '05', 'NAVAN'),
('15', '09', '06', 'PACHANGARA'),
('15', '10', '01', 'YAUYOS'),
('15', '10', '02', 'ALIS'),
('15', '10', '03', 'ALLAUCA'),
('15', '10', '04', 'AYAVIRI'),
('15', '10', '05', 'AZANGARO'),
('15', '10', '06', 'CACRA'),
('15', '10', '07', 'CARANIA'),
('15', '10', '08', 'CATAHUASI'),
('15', '10', '09', 'CHOCOS'),
('15', '10', '10', 'COCHAS'),
('15', '10', '11', 'COLONIA'),
('15', '10', '12', 'HONGOS'),
('15', '10', '13', 'HUAMPARA'),
('15', '10', '14', 'HUANCAYA'),
('15', '10', '15', 'HUANGASCAR'),
('15', '10', '16', 'HUANTAN'),
('15', '10', '17', 'HUAÑEC'),
('15', '10', '18', 'LARAOS'),
('15', '10', '19', 'LINCHA'),
('15', '10', '20', 'MADEAN'),
('15', '10', '21', 'MIRAFLORES'),
('15', '10', '22', 'OMAS'),
('15', '10', '23', 'PUTINZA'),
('15', '10', '24', 'QUINCHES'),
('15', '10', '25', 'QUINOCAY'),
('15', '10', '26', 'SAN JOAQUIN'),
('15', '10', '27', 'SAN PEDRO DE PILAS'),
('15', '10', '28', 'TANTA'),
('15', '10', '29', 'TAURIPAMPA'),
('15', '10', '30', 'TOMAS'),
('15', '10', '31', 'TUPE'),
('15', '10', '32', 'VIÑAC'),
('15', '10', '33', 'VITIS'),
('16', '01', '01', 'IQUITOS'),
('16', '01', '02', 'ALTO NANAY'),
('16', '01', '03', 'FERNANDO LORES'),
('16', '01', '04', 'INDIANA'),
('16', '01', '05', 'LAS AMAZONAS'),
('16', '01', '06', 'MAZAN'),
('16', '01', '07', 'NAPO'),
('16', '01', '08', 'PUNCHANA'),
('16', '01', '09', 'PUTUMAYO    '),
('16', '01', '10', 'TORRES CAUSANA'),
('16', '01', '12', 'BELEN'),
('16', '01', '13', 'SAN JUAN BAUTISTA'),
('16', '01', '14', 'TENIENTE MANUEL CLAVERO'),
('16', '02', '01', 'YURIMAGUAS'),
('16', '02', '02', 'BALSAPUERTO'),
('16', '02', '05', 'JEBEROS'),
('16', '02', '06', 'LAGUNAS'),
('16', '02', '10', 'SANTA CRUZ'),
('16', '02', '11', 'TENIENTE CESAR LOPEZ ROJAS'),
('16', '03', '01', 'NAUTA'),
('16', '03', '02', 'PARINARI '),
('16', '03', '03', 'TIGRE'),
('16', '03', '04', 'TROMPETEROS'),
('16', '03', '05', 'URARINAS'),
('16', '04', '01', 'RAMON CASTILLA'),
('16', '04', '02', 'PEBAS'),
('16', '04', '03', 'YAVARI  /1'),
('16', '04', '04', 'SAN PABLO'),
('16', '05', '01', 'REQUENA'),
('16', '05', '02', 'ALTO TAPICHE'),
('16', '05', '03', 'CAPELO'),
('16', '05', '04', 'EMILIO SAN MARTIN'),
('16', '05', '05', 'MAQUIA'),
('16', '05', '06', 'PUINAHUA'),
('16', '05', '07', 'SAQUENA'),
('16', '05', '08', 'SOPLIN'),
('16', '05', '09', 'TAPICHE'),
('16', '05', '10', 'JENARO HERRERA'),
('16', '05', '11', 'YAQUERANA    '),
('16', '06', '01', 'CONTAMANA'),
('16', '06', '02', 'INAHUAYA'),
('16', '06', '03', 'PADRE MARQUEZ'),
('16', '06', '04', 'PAMPA HERMOSA'),
('16', '06', '05', 'SARAYACU'),
('16', '06', '06', 'VARGAS GUERRA'),
('16', '07', '01', 'BARRANCA'),
('16', '07', '02', 'CAHUAPANAS'),
('16', '07', '03', 'MANSERICHE'),
('16', '07', '04', 'MORONA'),
('16', '07', '05', 'PASTAZA'),
('16', '07', '06', 'ANDOAS'),
('17', '01', '01', 'TAMBOPATA'),
('17', '01', '02', 'INAMBARI '),
('17', '01', '03', 'LAS PIEDRAS'),
('17', '01', '04', 'LABERINTO'),
('17', '02', '01', 'MANU    '),
('17', '02', '02', 'FITZCARRALD    '),
('17', '02', '03', 'MADRE DE DIOS    '),
('17', '02', '04', 'HUEPETUHE'),
('17', '03', '01', 'IÑAPARI'),
('17', '03', '02', 'IBERIA'),
('17', '03', '03', 'TAHUAMANU'),
('18', '01', '01', 'MOQUEGUA'),
('18', '01', '02', 'CARUMAS'),
('18', '01', '03', 'CUCHUMBAYA'),
('18', '01', '04', 'SAMEGUA'),
('18', '01', '05', 'SAN CRISTOBAL'),
('18', '01', '06', 'TORATA'),
('18', '02', '01', 'OMATE'),
('18', '02', '02', 'CHOJATA'),
('18', '02', '03', 'COALAQUE'),
('18', '02', '04', 'ICHUÑA'),
('18', '02', '05', 'LA CAPILLA'),
('18', '02', '06', 'LLOQUE'),
('18', '02', '07', 'MATALAQUE'),
('18', '02', '08', 'PUQUINA'),
('18', '02', '09', 'QUINISTAQUILLAS'),
('18', '02', '10', 'UBINAS'),
('18', '02', '11', 'YUNGA'),
('18', '03', '01', 'ILO'),
('18', '03', '02', 'EL ALGARROBAL'),
('18', '03', '03', 'PACOCHA'),
('19', '01', '01', 'CHAUPIMARCA'),
('19', '01', '02', 'HUACHON'),
('19', '01', '03', 'HUARIACA'),
('19', '01', '04', 'HUAYLLAY'),
('19', '01', '05', 'NINACACA'),
('19', '01', '06', 'PALLANCHACRA'),
('19', '01', '07', 'PAUCARTAMBO'),
('19', '01', '08', 'SAN FRANCISCO DE ASIS DE YARUSYACAN'),
('19', '01', '09', 'SIMON BOLIVAR'),
('19', '01', '10', 'TICLACAYAN'),
('19', '01', '11', 'TINYAHUARCO'),
('19', '01', '12', 'VICCO'),
('19', '01', '13', 'YANACANCHA'),
('19', '02', '01', 'YANAHUANCA'),
('19', '02', '02', 'CHACAYAN'),
('19', '02', '03', 'GOYLLARISQUIZGA'),
('19', '02', '04', 'PAUCAR'),
('19', '02', '05', 'SAN PEDRO DE PILLAO'),
('19', '02', '06', 'SANTA ANA DE TUSI'),
('19', '02', '07', 'TAPUC'),
('19', '02', '08', 'VILCABAMBA'),
('19', '03', '01', 'OXAPAMPA'),
('19', '03', '02', 'CHONTABAMBA'),
('19', '03', '03', 'HUANCABAMBA'),
('19', '03', '04', 'PALCAZU'),
('19', '03', '05', 'POZUZO'),
('19', '03', '06', 'PUERTO BERMUDEZ'),
('19', '03', '07', 'VILLA RICA'),
('20', '01', '01', 'PIURA'),
('20', '01', '04', 'CASTILLA'),
('20', '01', '05', 'CATACAOS'),
('20', '01', '07', 'CURA MORI'),
('20', '01', '08', 'EL TALLAN'),
('20', '01', '09', 'LA ARENA'),
('20', '01', '10', 'LA UNION'),
('20', '01', '11', 'LAS LOMAS'),
('20', '01', '14', 'TAMBO GRANDE'),
('20', '02', '01', 'AYABACA'),
('20', '02', '02', 'FRIAS'),
('20', '02', '03', 'JILILI'),
('20', '02', '04', 'LAGUNAS'),
('20', '02', '05', 'MONTERO'),
('20', '02', '06', 'PACAIPAMPA'),
('20', '02', '07', 'PAIMAS'),
('20', '02', '08', 'SAPILLICA'),
('20', '02', '09', 'SICCHEZ'),
('20', '02', '10', 'SUYO'),
('20', '03', '01', 'HUANCABAMBA'),
('20', '03', '02', 'CANCHAQUE'),
('20', '03', '03', 'EL CARMEN DE LA FRONTERA'),
('20', '03', '04', 'HUARMACA'),
('20', '03', '05', 'LALAQUIZ'),
('20', '03', '06', 'SAN MIGUEL DE EL FAIQUE'),
('20', '03', '07', 'SONDOR'),
('20', '03', '08', 'SONDORILLO'),
('20', '04', '01', 'CHULUCANAS'),
('20', '04', '02', 'BUENOS AIRES'),
('20', '04', '03', 'CHALACO'),
('20', '04', '04', 'LA MATANZA'),
('20', '04', '05', 'MORROPON'),
('20', '04', '06', 'SALITRAL'),
('20', '04', '07', 'SAN JUAN DE BIGOTE'),
('20', '04', '08', 'SANTA CATALINA DE MOSSA'),
('20', '04', '09', 'SANTO DOMINGO'),
('20', '04', '10', 'YAMANGO'),
('20', '05', '01', 'PAITA'),
('20', '05', '02', 'AMOTAPE'),
('20', '05', '03', 'ARENAL'),
('20', '05', '04', 'COLAN'),
('20', '05', '05', 'LA HUACA'),
('20', '05', '06', 'TAMARINDO'),
('20', '05', '07', 'VICHAYAL'),
('20', '06', '01', 'SULLANA'),
('20', '06', '02', 'BELLAVISTA'),
('20', '06', '03', 'IGNACIO ESCUDERO'),
('20', '06', '04', 'LANCONES'),
('20', '06', '05', 'MARCAVELICA'),
('20', '06', '06', 'MIGUEL CHECA'),
('20', '06', '07', 'QUERECOTILLO'),
('20', '06', '08', 'SALITRAL'),
('20', '07', '01', 'PARIÑAS'),
('20', '07', '02', 'EL ALTO'),
('20', '07', '03', 'LA BREA'),
('20', '07', '04', 'LOBITOS'),
('20', '07', '05', 'LOS ORGANOS'),
('20', '07', '06', 'MANCORA'),
('20', '08', '01', 'SECHURA'),
('20', '08', '02', 'BELLAVISTA DE LA UNION'),
('20', '08', '03', 'BERNAL'),
('20', '08', '04', 'CRISTO NOS VALGA'),
('20', '08', '05', 'VICE'),
('20', '08', '06', 'RINCONADA LLICUAR');
INSERT INTO `sisdistrito` (`ide_departamento`, `ide_provincia`, `ide_distrito`, `des_nombre`) VALUES
('21', '01', '01', 'PUNO'),
('21', '01', '02', 'ACORA'),
('21', '01', '03', 'AMANTANI'),
('21', '01', '04', 'ATUNCOLLA'),
('21', '01', '05', 'CAPACHICA'),
('21', '01', '06', 'CHUCUITO'),
('21', '01', '07', 'COATA'),
('21', '01', '08', 'HUATA'),
('21', '01', '09', 'MAÑAZO'),
('21', '01', '10', 'PAUCARCOLLA'),
('21', '01', '11', 'PICHACANI'),
('21', '01', '12', 'PLATERIA'),
('21', '01', '13', 'SAN ANTONIO  /1'),
('21', '01', '14', 'TIQUILLACA'),
('21', '01', '15', 'VILQUE'),
('21', '02', '01', 'AZANGARO'),
('21', '02', '02', 'ACHAYA'),
('21', '02', '03', 'ARAPA'),
('21', '02', '04', 'ASILLO'),
('21', '02', '05', 'CAMINACA'),
('21', '02', '06', 'CHUPA'),
('21', '02', '07', 'JOSE DOMINGO CHOQUEHUANCA'),
('21', '02', '08', 'MUÑANI'),
('21', '02', '09', 'POTONI'),
('21', '02', '10', 'SAMAN'),
('21', '02', '11', 'SAN ANTON'),
('21', '02', '12', 'SAN JOSE'),
('21', '02', '13', 'SAN JUAN DE SALINAS'),
('21', '02', '14', 'SANTIAGO DE PUPUJA'),
('21', '02', '15', 'TIRAPATA'),
('21', '03', '01', 'MACUSANI'),
('21', '03', '02', 'AJOYANI'),
('21', '03', '03', 'AYAPATA'),
('21', '03', '04', 'COASA'),
('21', '03', '05', 'CORANI'),
('21', '03', '06', 'CRUCERO'),
('21', '03', '07', 'ITUATA   2/'),
('21', '03', '08', 'OLLACHEA'),
('21', '03', '09', 'SAN GABAN'),
('21', '03', '10', 'USICAYOS'),
('21', '04', '01', 'JULI'),
('21', '04', '02', 'DESAGUADERO'),
('21', '04', '03', 'HUACULLANI'),
('21', '04', '04', 'KELLUYO'),
('21', '04', '05', 'PISACOMA'),
('21', '04', '06', 'POMATA'),
('21', '04', '07', 'ZEPITA'),
('21', '05', '01', 'ILAVE'),
('21', '05', '02', 'CAPAZO'),
('21', '05', '03', 'PILCUYO'),
('21', '05', '04', 'SANTA ROSA'),
('21', '05', '05', 'CONDURIRI'),
('21', '06', '01', 'HUANCANE'),
('21', '06', '02', 'COJATA'),
('21', '06', '03', 'HUATASANI'),
('21', '06', '04', 'INCHUPALLA'),
('21', '06', '05', 'PUSI'),
('21', '06', '06', 'ROSASPATA'),
('21', '06', '07', 'TARACO'),
('21', '06', '08', 'VILQUE CHICO'),
('21', '07', '01', 'LAMPA'),
('21', '07', '02', 'CABANILLA'),
('21', '07', '03', 'CALAPUJA'),
('21', '07', '04', 'NICASIO'),
('21', '07', '05', 'OCUVIRI'),
('21', '07', '06', 'PALCA'),
('21', '07', '07', 'PARATIA'),
('21', '07', '08', 'PUCARA'),
('21', '07', '09', 'SANTA LUCIA'),
('21', '07', '10', 'VILAVILA'),
('21', '08', '01', 'AYAVIRI'),
('21', '08', '02', 'ANTAUTA'),
('21', '08', '03', 'CUPI'),
('21', '08', '04', 'LLALLI'),
('21', '08', '05', 'MACARI'),
('21', '08', '06', 'NUÑOA'),
('21', '08', '07', 'ORURILLO'),
('21', '08', '08', 'SANTA ROSA'),
('21', '08', '09', 'UMACHIRI'),
('21', '09', '01', 'MOHO'),
('21', '09', '02', 'CONIMA'),
('21', '09', '03', 'HUAYRAPATA'),
('21', '09', '04', 'TILALI'),
('21', '10', '01', 'PUTINA'),
('21', '10', '02', 'ANANEA'),
('21', '10', '03', 'PEDRO VILCA APAZA'),
('21', '10', '04', 'QUILCAPUNCU'),
('21', '10', '05', 'SINA'),
('21', '11', '01', 'JULIACA'),
('21', '11', '02', 'CABANA'),
('21', '11', '03', 'CABANILLAS'),
('21', '11', '04', 'CARACOTO'),
('21', '12', '01', 'SANDIA'),
('21', '12', '02', 'CUYOCUYO'),
('21', '12', '03', 'LIMBANI'),
('21', '12', '04', 'PATAMBUCO'),
('21', '12', '05', 'PHARA'),
('21', '12', '06', 'QUIACA'),
('21', '12', '07', 'SAN JUAN DEL ORO'),
('21', '12', '08', 'YANAHUAYA'),
('21', '12', '09', 'ALTO INAMBARI'),
('21', '12', '10', 'SAN PEDRO DE PUTINA PUNCO'),
('21', '13', '01', 'YUNGUYO'),
('21', '13', '02', 'ANAPIA'),
('21', '13', '03', 'COPANI'),
('21', '13', '04', 'CUTURAPI'),
('21', '13', '05', 'OLLARAYA'),
('21', '13', '06', 'TINICACHI'),
('21', '13', '07', 'UNICACHI'),
('22', '01', '01', 'MOYOBAMBA'),
('22', '01', '02', 'CALZADA'),
('22', '01', '03', 'HABANA'),
('22', '01', '04', 'JEPELACIO'),
('22', '01', '05', 'SORITOR'),
('22', '01', '06', 'YANTALO'),
('22', '02', '01', 'BELLAVISTA'),
('22', '02', '02', 'ALTO BIAVO'),
('22', '02', '03', 'BAJO BIAVO'),
('22', '02', '04', 'HUALLAGA'),
('22', '02', '05', 'SAN PABLO'),
('22', '02', '06', 'SAN RAFAEL'),
('22', '03', '01', 'SAN JOSE DE SISA'),
('22', '03', '02', 'AGUA BLANCA'),
('22', '03', '03', 'SAN MARTIN'),
('22', '03', '04', 'SANTA ROSA'),
('22', '03', '05', 'SHATOJA'),
('22', '04', '01', 'SAPOSOA'),
('22', '04', '02', 'ALTO SAPOSOA'),
('22', '04', '03', 'EL ESLABON'),
('22', '04', '04', 'PISCOYACU'),
('22', '04', '05', 'SACANCHE'),
('22', '04', '06', 'TINGO DE SAPOSOA'),
('22', '05', '01', 'LAMAS'),
('22', '05', '02', 'ALONSO DE ALVARADO'),
('22', '05', '03', 'BARRANQUITA'),
('22', '05', '04', 'CAYNARACHI   1/'),
('22', '05', '05', 'CUÑUMBUQUI'),
('22', '05', '06', 'PINTO RECODO'),
('22', '05', '07', 'RUMISAPA'),
('22', '05', '08', 'SAN ROQUE DE CUMBAZA'),
('22', '05', '09', 'SHANAO'),
('22', '05', '10', 'TABALOSOS'),
('22', '05', '11', 'ZAPATERO'),
('22', '06', '01', 'JUANJUI'),
('22', '06', '02', 'CAMPANILLA'),
('22', '06', '03', 'HUICUNGO'),
('22', '06', '04', 'PACHIZA'),
('22', '06', '05', 'PAJARILLO'),
('22', '07', '01', 'PICOTA'),
('22', '07', '02', 'BUENOS AIRES'),
('22', '07', '03', 'CASPISAPA'),
('22', '07', '04', 'PILLUANA'),
('22', '07', '05', 'PUCACACA'),
('22', '07', '06', 'SAN CRISTOBAL'),
('22', '07', '07', 'SAN HILARION'),
('22', '07', '08', 'SHAMBOYACU'),
('22', '07', '09', 'TINGO DE PONASA'),
('22', '07', '10', 'TRES UNIDOS'),
('22', '08', '01', 'RIOJA'),
('22', '08', '02', 'AWAJUN'),
('22', '08', '03', 'ELIAS SOPLIN VARGAS'),
('22', '08', '04', 'NUEVA CAJAMARCA'),
('22', '08', '05', 'PARDO MIGUEL'),
('22', '08', '06', 'POSIC'),
('22', '08', '07', 'SAN FERNANDO'),
('22', '08', '08', 'YORONGOS'),
('22', '08', '09', 'YURACYACU'),
('22', '09', '01', 'TARAPOTO'),
('22', '09', '02', 'ALBERTO LEVEAU'),
('22', '09', '03', 'CACATACHI'),
('22', '09', '04', 'CHAZUTA'),
('22', '09', '05', 'CHIPURANA'),
('22', '09', '06', 'EL PORVENIR'),
('22', '09', '07', 'HUIMBAYOC'),
('22', '09', '08', 'JUAN GUERRA'),
('22', '09', '09', 'LA BANDA DE SHILCAYO'),
('22', '09', '10', 'MORALES'),
('22', '09', '11', 'PAPAPLAYA'),
('22', '09', '12', 'SAN ANTONIO'),
('22', '09', '13', 'SAUCE'),
('22', '09', '14', 'SHAPAJA'),
('22', '10', '01', 'TOCACHE'),
('22', '10', '02', 'NUEVO PROGRESO'),
('22', '10', '03', 'POLVORA'),
('22', '10', '04', 'SHUNTE  2/ '),
('22', '10', '05', 'UCHIZA'),
('23', '01', '01', 'TACNA'),
('23', '01', '02', 'ALTO DE LA ALIANZA'),
('23', '01', '03', 'CALANA'),
('23', '01', '04', 'CIUDAD NUEVA'),
('23', '01', '05', 'INCLAN'),
('23', '01', '06', 'PACHIA'),
('23', '01', '07', 'PALCA'),
('23', '01', '08', 'POCOLLAY'),
('23', '01', '09', 'SAMA'),
('23', '01', '10', 'CORONEL GREGORIO ALBARRACIN LANCHIPA'),
('23', '02', '01', 'CANDARAVE'),
('23', '02', '02', 'CAIRANI'),
('23', '02', '03', 'CAMILACA'),
('23', '02', '04', 'CURIBAYA'),
('23', '02', '05', 'HUANUARA'),
('23', '02', '06', 'QUILAHUANI'),
('23', '03', '01', 'LOCUMBA'),
('23', '03', '02', 'ILABAYA'),
('23', '03', '03', 'ITE'),
('23', '04', '01', 'TARATA'),
('23', '04', '02', 'HEROES ALBARRACIN'),
('23', '04', '03', 'ESTIQUE'),
('23', '04', '04', 'ESTIQUE-PAMPA'),
('23', '04', '05', 'SITAJARA'),
('23', '04', '06', 'SUSAPAYA'),
('23', '04', '07', 'TARUCACHI'),
('23', '04', '08', 'TICACO'),
('24', '01', '01', 'TUMBES'),
('24', '01', '02', 'CORRALES'),
('24', '01', '03', 'LA CRUZ'),
('24', '01', '04', 'PAMPAS DE HOSPITAL'),
('24', '01', '05', 'SAN JACINTO'),
('24', '01', '06', 'SAN JUAN DE LA VIRGEN'),
('24', '02', '01', 'ZORRITOS'),
('24', '02', '02', 'CASITAS'),
('24', '02', '03', 'CANOAS DE PUNTA SAL'),
('24', '03', '01', 'ZARUMILLA'),
('24', '03', '02', 'AGUAS VERDES'),
('24', '03', '03', 'MATAPALO'),
('24', '03', '04', 'PAPAYAL'),
('25', '01', '01', 'CALLERIA'),
('25', '01', '02', 'CAMPOVERDE'),
('25', '01', '03', 'IPARIA'),
('25', '01', '04', 'MASISEA'),
('25', '01', '05', 'YARINACOCHA'),
('25', '01', '06', 'NUEVA REQUENA'),
('25', '01', '07', 'MANANTAY'),
('25', '02', '01', 'RAYMONDI'),
('25', '02', '02', 'SEPAHUA'),
('25', '02', '03', 'TAHUANIA'),
('25', '02', '04', 'YURUA'),
('25', '03', '01', 'PADRE ABAD'),
('25', '03', '02', 'IRAZOLA'),
('25', '03', '03', 'CURIMANA'),
('25', '04', '01', 'PURUS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sispersona`
--

CREATE TABLE IF NOT EXISTS `sispersona` (
`ide_persona` int(10) unsigned NOT NULL,
  `des_nombres` varchar(250) DEFAULT NULL,
  `des_apepat` varchar(250) DEFAULT NULL,
  `des_apemat` varchar(250) DEFAULT NULL,
  `des_razonsocial` varchar(250) DEFAULT NULL,
  `nro_documento` varchar(20) NOT NULL,
  `ide_tipodocumento` int(10) unsigned NOT NULL,
  `des_telefono` varchar(45) DEFAULT NULL,
  `des_correo` varchar(45) DEFAULT NULL,
  `ide_tipopersona` int(10) unsigned NOT NULL,
  `ide_condicion` int(10) unsigned NOT NULL,
  `ide_sexo` int(10) unsigned DEFAULT NULL,
  `ide_estcivil` int(10) unsigned DEFAULT NULL,
  `fec_nacimiento` date DEFAULT NULL,
  `ide_estado` char(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sispersona`
--

INSERT INTO `sispersona` (`ide_persona`, `des_nombres`, `des_apepat`, `des_apemat`, `des_razonsocial`, `nro_documento`, `ide_tipodocumento`, `des_telefono`, `des_correo`, `ide_tipopersona`, `ide_condicion`, `ide_sexo`, `ide_estcivil`, `fec_nacimiento`, `ide_estado`) VALUES
(1, 'LIZANDRO', 'ALIPAZAGA', 'COLLANTES', '', '44305724', 10, '972620265', 'i_sonny@hotmail.com', 12, 17, 21, 24, '1987-06-03', '1'),
(2, 'MARIELA', 'ESPINOZA', 'OLIVOS', NULL, '44417336', 10, '947236548', 'marielae@hotmail.com', 12, 17, 22, 24, '1987-06-01', '1'),
(3, 'ERICK', 'FITZCARRALD', 'ALIPAZAGA', NULL, '45258793', 10, '978545325', 'erickfz@hotmail.com', 12, 18, 21, 24, '1987-09-18', '1'),
(4, 'ENRIQUE', 'FIGUEROA', 'RODRIGUEZ', NULL, '46258965', 10, '925468624', 'efigueroa@gmail.com', 12, 18, 21, 23, '1987-05-03', '1'),
(5, NULL, NULL, NULL, 'DISTRIBUIDORA EL CHANCAYANO', '20181654789', 14, '3771654', NULL, 13, 19, NULL, NULL, '0000-00-00', '1'),
(6, 'JOSE LUIS', 'MANDUJANO', 'BUENO', NULL, '42568974', 10, '4528967', 'jmandujano@hotmail.com', 12, 18, 21, 23, '1987-04-28', '1'),
(7, 'EMILIANO', 'MALLQUI', 'AGUILAR', NULL, '06242471', 10, '971945325', 'emiliano@gmail.com', 12, 18, 21, 23, '1980-02-18', '1'),
(8, 'EUSEBIO', 'AGUILAR', 'CALDERON', NULL, '19817929', 10, '972665965', 'eusebio458@gmail.com', 12, 18, 21, 24, '1982-06-23', '1'),
(9, 'LEONELA', 'ESPINOZA', 'AVILA', NULL, '15201863', 10, '972610665', 'leonela789@gmail.com', 12, 18, 22, 23, '1986-12-14', '1'),
(10, 'JOAQUIN', 'PACCO', 'HUAMAN', NULL, '20963858', 10, '977020265', 'joaquinrt45@gmail.com', 12, 18, 21, 23, '1981-11-10', '1'),
(11, 'ELEUTERIO', 'LAZARO', 'PAITAN', NULL, '19910024', 10, '978545730', 'eleuterio4587@gmail.com', 12, 18, 21, 24, '1980-12-18', '1'),
(12, 'JULIA CUNCA', 'BRAVO', 'LAURA', NULL, '19993743', 10, '972830265', 'julia.cunca@gmail.com', 12, 18, 22, 23, '1983-03-14', '1'),
(13, 'JULIA', 'CHAVEZ', 'FERNANDEZ', NULL, '25462984', 10, '974925325', 'julia4789@gmail.com', 12, 18, 22, 23, '1985-09-17', '1'),
(14, 'MAURO', 'CUTIPA', 'FLORES', '', '44305724', 10, '3556458', 'prueba@sismima.com', 12, 18, 21, 26, '1987-08-12', '1'),
(15, 'Jose Luis', 'Ayala ', 'Benito', '', '71886624', 10, '944659233', 'joseluis@sismima.com', 12, 18, 21, 23, '1996-06-07', '1'),
(16, 'Cristian', 'Contreras', 'Contreras', '', '19910024', 10, '978545730', 'cristian@sismima.com', 12, 18, 21, 23, '1980-10-16', '1'),
(17, 'MAURO', 'CUTIPA', 'FLORES', '', '44305724', 10, '3556458', 'prueba@sismima.com', 12, 18, 21, 28, '1987-07-11', '1'),
(21, 'LEONELA', 'ESPINOZA', 'AVILA', '', '15201863', 10, '972610665', 'leonela789@gmail.com', 12, 18, 21, 24, '1986-11-13', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisprovincia`
--

CREATE TABLE IF NOT EXISTS `sisprovincia` (
  `ide_departamento` char(2) NOT NULL,
  `ide_provincia` char(2) NOT NULL,
  `des_nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisprovincia`
--

INSERT INTO `sisprovincia` (`ide_departamento`, `ide_provincia`, `des_nombre`) VALUES
('01', '01', 'CHACHAPOYAS'),
('01', '02', 'BAGUA'),
('01', '03', 'BONGARA'),
('01', '04', 'CONDORCANQUI'),
('01', '05', 'LUYA'),
('01', '06', 'RODRIGUEZ DE MENDOZA'),
('01', '07', 'UTCUBAMBA'),
('02', '01', 'HUARAZ'),
('02', '02', 'AIJA'),
('02', '03', 'ANTONIO RAYMONDI'),
('02', '04', 'ASUNCION'),
('02', '05', 'BOLOGNESI'),
('02', '06', 'CARHUAZ'),
('02', '07', 'CARLOS FERMIN FITZCARRALD'),
('02', '08', 'CASMA'),
('02', '09', 'CORONGO'),
('02', '10', 'HUARI'),
('02', '11', 'HUARMEY'),
('02', '12', 'HUAYLAS'),
('02', '13', 'MARISCAL LUZURIAGA'),
('02', '14', 'OCROS'),
('02', '15', 'PALLASCA'),
('02', '16', 'POMABAMBA'),
('02', '17', 'RECUAY'),
('02', '18', 'SANTA'),
('02', '19', 'SIHUAS'),
('02', '20', 'YUNGAY'),
('03', '01', 'ABANCAY'),
('03', '02', 'ANDAHUAYLAS'),
('03', '03', 'ANTABAMBA'),
('03', '04', 'AYMARAES'),
('03', '05', 'COTABAMBAS'),
('03', '06', 'CHINCHEROS'),
('03', '07', 'GRAU'),
('04', '01', 'AREQUIPA'),
('04', '02', 'CAMANA'),
('04', '03', 'CARAVELI'),
('04', '04', 'CASTILLA'),
('04', '05', 'CAYLLOMA'),
('04', '06', 'CONDESUYOS'),
('04', '07', 'ISLAY'),
('04', '08', 'LA UNION'),
('05', '01', 'HUAMANGA'),
('05', '02', 'CANGALLO'),
('05', '03', 'HUANCA SANCOS'),
('05', '04', 'HUANTA'),
('05', '05', 'LA MAR'),
('05', '06', 'LUCANAS'),
('05', '07', 'PARINACOCHAS'),
('05', '08', 'PAUCAR DEL SARA SARA'),
('05', '09', 'SUCRE'),
('05', '10', 'VICTOR FAJARDO'),
('05', '11', 'VILCAS HUAMAN'),
('06', '01', 'CAJAMARCA'),
('06', '02', 'CAJABAMBA'),
('06', '03', 'CELENDIN'),
('06', '04', 'CHOTA'),
('06', '05', 'CONTUMAZA'),
('06', '06', 'CUTERVO'),
('06', '07', 'HUALGAYOC'),
('06', '08', 'JAEN'),
('06', '09', 'SAN IGNACIO'),
('06', '10', 'SAN MARCOS'),
('06', '11', 'SAN MIGUEL'),
('06', '12', 'SAN PABLO'),
('06', '13', 'SANTA CRUZ'),
('07', '01', 'PROV. CONST. DEL CALLAO'),
('08', '01', 'CUSCO'),
('08', '02', 'ACOMAYO'),
('08', '03', 'ANTA'),
('08', '04', 'CALCA'),
('08', '05', 'CANAS'),
('08', '06', 'CANCHIS'),
('08', '07', 'CHUMBIVILCAS'),
('08', '08', 'ESPINAR'),
('08', '09', 'LA CONVENCION'),
('08', '10', 'PARURO'),
('08', '11', 'PAUCARTAMBO'),
('08', '12', 'QUISPICANCHI'),
('08', '13', 'URUBAMBA'),
('09', '01', 'HUANCAVELICA'),
('09', '02', 'ACOBAMBA'),
('09', '03', 'ANGARAES'),
('09', '04', 'CASTROVIRREYNA'),
('09', '05', 'CHURCAMPA'),
('09', '06', 'HUAYTARA'),
('09', '07', 'TAYACAJA'),
('10', '01', 'HUANUCO'),
('10', '02', 'AMBO'),
('10', '03', 'DOS DE MAYO'),
('10', '04', 'HUACAYBAMBA'),
('10', '05', 'HUAMALIES'),
('10', '06', 'LEONCIO PRADO'),
('10', '07', 'MARAÑON'),
('10', '08', 'PACHITEA'),
('10', '09', 'PUERTO INCA'),
('10', '10', 'LAURICOCHA'),
('10', '11', 'YAROWILCA'),
('11', '01', 'ICA'),
('11', '02', 'CHINCHA'),
('11', '03', 'NAZCA'),
('11', '04', 'PALPA'),
('11', '05', 'PISCO'),
('12', '01', 'HUANCAYO'),
('12', '02', 'CONCEPCION'),
('12', '03', 'CHANCHAMAYO'),
('12', '04', 'JAUJA'),
('12', '05', 'JUNIN'),
('12', '06', 'SATIPO'),
('12', '07', 'TARMA'),
('12', '08', 'YAULI'),
('12', '09', 'CHUPACA'),
('13', '01', 'TRUJILLO'),
('13', '02', 'ASCOPE'),
('13', '03', 'BOLIVAR'),
('13', '04', 'CHEPEN'),
('13', '05', 'JULCAN'),
('13', '06', 'OTUZCO'),
('13', '07', 'PACASMAYO'),
('13', '08', 'PATAZ'),
('13', '09', 'SANCHEZ CARRION'),
('13', '10', 'SANTIAGO DE CHUCO'),
('13', '11', 'GRAN CHIMU'),
('13', '12', 'VIRU'),
('14', '01', 'CHICLAYO'),
('14', '02', 'FERREÑAFE'),
('14', '03', 'LAMBAYEQUE'),
('15', '01', 'LIMA'),
('15', '02', 'BARRANCA'),
('15', '03', 'CAJATAMBO'),
('15', '04', 'CANTA'),
('15', '05', 'CAÑETE'),
('15', '06', 'HUARAL'),
('15', '07', 'HUAROCHIRI'),
('15', '08', 'HUAURA'),
('15', '09', 'OYON'),
('15', '10', 'YAUYOS'),
('16', '01', 'MAYNAS'),
('16', '02', 'ALTO AMAZONAS'),
('16', '03', 'LORETO'),
('16', '04', 'MARISCAL RAMON CASTILLA'),
('16', '05', 'REQUENA'),
('16', '06', 'UCAYALI'),
('16', '07', 'DATEM DEL MARAÑON'),
('17', '01', 'TAMBOPATA'),
('17', '02', 'MANU'),
('17', '03', 'TAHUAMANU'),
('18', '01', 'MARISCAL NIETO'),
('18', '02', 'GENERAL SANCHEZ CERRO'),
('18', '03', 'ILO'),
('19', '01', 'PASCO'),
('19', '02', 'DANIEL ALCIDES CARRION'),
('19', '03', 'OXAPAMPA'),
('20', '01', 'PIURA'),
('20', '02', 'AYABACA'),
('20', '03', 'HUANCABAMBA'),
('20', '04', 'MORROPON'),
('20', '05', 'PAITA'),
('20', '06', 'SULLANA'),
('20', '07', 'TALARA'),
('20', '08', 'SECHURA'),
('21', '01', 'PUNO'),
('21', '02', 'AZANGARO'),
('21', '03', 'CARABAYA'),
('21', '04', 'CHUCUITO'),
('21', '05', 'EL COLLAO'),
('21', '06', 'HUANCANE'),
('21', '07', 'LAMPA'),
('21', '08', 'MELGAR'),
('21', '09', 'MOHO'),
('21', '10', 'SAN ANTONIO DE PUTINA'),
('21', '11', 'SAN ROMAN'),
('21', '12', 'SANDIA'),
('21', '13', 'YUNGUYO'),
('22', '01', 'MOYOBAMBA'),
('22', '02', 'BELLAVISTA'),
('22', '03', 'EL DORADO'),
('22', '04', 'HUALLAGA'),
('22', '05', 'LAMAS'),
('22', '06', 'MARISCAL CACERES'),
('22', '07', 'PICOTA'),
('22', '08', 'RIOJA'),
('22', '09', 'SAN MARTIN'),
('22', '10', 'TOCACHE'),
('23', '01', 'TACNA'),
('23', '02', 'CANDARAVE'),
('23', '03', 'JORGE BASADRE'),
('23', '04', 'TARATA'),
('24', '01', 'TUMBES'),
('24', '02', 'CONTRALMIRANTE VILLAR'),
('24', '03', 'ZARUMILLA'),
('25', '01', 'CORONEL PORTILLO'),
('25', '02', 'ATALAYA'),
('25', '03', 'PADRE ABAD'),
('25', '04', 'PURUS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisusuario`
--

CREATE TABLE IF NOT EXISTS `sisusuario` (
`ide_usuario` int(10) unsigned NOT NULL,
  `des_usuario` varchar(50) NOT NULL,
  `des_password` varchar(50) NOT NULL,
  `ide_rol` int(10) unsigned NOT NULL,
  `ide_persona` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisusuario`
--

INSERT INTO `sisusuario` (`ide_usuario`, `des_usuario`, `des_password`, `ide_rol`, `ide_persona`) VALUES
(1, 'lizandro@sismima.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1),
(2, 'joseluis@sismima.com', 'e10adc3949ba59abbe56e057f20f883e', 5, 15),
(3, 'cristian@sismima.com', 'e10adc3949ba59abbe56e057f20f883e', 2, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sisvia`
--

CREATE TABLE IF NOT EXISTS `sisvia` (
  `ide_via` char(2) NOT NULL,
  `des_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sisvia`
--

INSERT INTO `sisvia` (`ide_via`, `des_nombre`) VALUES
('01', 'AVENIDA'),
('02', 'JIRÓN'),
('03', 'CALLE'),
('04', 'PASAJE'),
('05', 'ALAMEDA'),
('06', 'MALECÓN'),
('07', 'OVALO'),
('08', 'PARQUE'),
('09', 'PLAZA'),
('10', 'CARRETERA'),
('11', 'BLOCK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siszona`
--

CREATE TABLE IF NOT EXISTS `siszona` (
  `ide_zona` char(2) NOT NULL,
  `des_abrev` varchar(5) NOT NULL,
  `des_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `siszona`
--

INSERT INTO `siszona` (`ide_zona`, `des_abrev`, `des_nombre`) VALUES
('01', 'URB.', 'URBANIZACIÓN'),
('02', 'P.J.', 'PUEBLO JOVEN'),
('03', 'U.V.', 'UNIDAD VECINAL'),
('04', 'C.H.', 'CONJUNTO HABITACIONAL'),
('05', 'A.H.', 'ASENTAMIENTO HUMANO'),
('06', 'COO.', 'COOPERATIVA'),
('07', 'RES.', 'RESIDENCIAL'),
('08', 'Z.I.', 'ZONA INDUSTRIAL'),
('09', 'GRU.', 'GRUPO'),
('10', 'CAS.', 'CASERÍO'),
('11', 'FND.', 'FUNDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profiles`
--

CREATE TABLE IF NOT EXISTS `tbl_profiles` (
`user_id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_profiles`
--

INSERT INTO `tbl_profiles` (`user_id`, `lastname`, `firstname`) VALUES
(1, 'Admin', 'Administrator'),
(2, 'Demo', 'Demo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profiles_fields`
--

CREATE TABLE IF NOT EXISTS `tbl_profiles_fields` (
`id` int(10) NOT NULL,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_profiles_fields`
--

INSERT INTO `tbl_profiles_fields` (`id`, `varname`, `title`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `widget`, `widgetparams`, `position`, `visible`) VALUES
(1, 'lastname', 'Last Name', 'VARCHAR', '50', '3', 1, '', '', 'Incorrect Last Name (length between 3 and 50 characters).', '', '', '', '', 1, 3),
(2, 'firstname', 'First Name', 'VARCHAR', '50', '3', 1, '', '', 'Incorrect First Name (length between 3 and 50 characters).', '', '', '', '', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
`id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `email`, `activkey`, `create_at`, `lastvisit_at`, `superuser`, `status`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'webmaster@example.com', '9a24eff8c15a6a141ece27eb6947da0f', '2015-05-19 05:44:20', '0000-00-00 00:00:00', 1, 1),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '099f825543f7850cc038b90aaff39fac', '2015-05-19 05:44:20', '0000-00-00 00:00:00', 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admcatalogo`
--
ALTER TABLE `admcatalogo`
 ADD PRIMARY KEY (`ide_elemento`);

--
-- Indices de la tabla `admgrcatalogo`
--
ALTER TABLE `admgrcatalogo`
 ADD PRIMARY KEY (`ide_grupo`);

--
-- Indices de la tabla `admopcion`
--
ALTER TABLE `admopcion`
 ADD PRIMARY KEY (`ide_opcion`);

--
-- Indices de la tabla `admrol`
--
ALTER TABLE `admrol`
 ADD PRIMARY KEY (`ide_rol`);

--
-- Indices de la tabla `admrolopcion`
--
ALTER TABLE `admrolopcion`
 ADD PRIMARY KEY (`ide_rolopcion`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`idCategoria`), ADD UNIQUE KEY `nomCategoria` (`nomCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
 ADD KEY `fk_Fac_detFac` (`nroSerie`,`nroFact`), ADD KEY `fk_DetFac_Prod` (`idProducto`);

--
-- Indices de la tabla `detalleordencompra`
--
ALTER TABLE `detalleordencompra`
 ADD KEY `fk_ord_detord` (`nroSerie`,`nroOrden`), ADD KEY `fk_Detord_Prod` (`idProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
 ADD PRIMARY KEY (`nroSerie`,`nroFact`), ADD KEY `fk_Fac_Cli` (`idCliente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
 ADD PRIMARY KEY (`idMovimiento`), ADD KEY `fk_Inv_Prod` (`idproducto`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
 ADD PRIMARY KEY (`idMarca`), ADD UNIQUE KEY `nomMarca` (`nomMarca`);

--
-- Indices de la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
 ADD PRIMARY KEY (`nroSerie`,`nroOrden`), ADD KEY `fk_ord_Prov` (`idProveedor`);

--
-- Indices de la tabla `parametrogeneral`
--
ALTER TABLE `parametrogeneral`
 ADD PRIMARY KEY (`idParametro`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`idProducto`), ADD KEY `fk_producto_categoria` (`idCategoria`), ADD KEY `fk_producto_marca` (`idMarca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `sisdireccion`
--
ALTER TABLE `sisdireccion`
 ADD PRIMARY KEY (`ide_direccion`);

--
-- Indices de la tabla `sispersona`
--
ALTER TABLE `sispersona`
 ADD PRIMARY KEY (`ide_persona`);

--
-- Indices de la tabla `sisusuario`
--
ALTER TABLE `sisusuario`
 ADD PRIMARY KEY (`ide_usuario`), ADD KEY `pk_user_rol` (`ide_rol`), ADD KEY `pk_user_persona` (`ide_persona`);

--
-- Indices de la tabla `siszona`
--
ALTER TABLE `siszona`
 ADD PRIMARY KEY (`ide_zona`);

--
-- Indices de la tabla `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
 ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `tbl_profiles_fields`
--
ALTER TABLE `tbl_profiles_fields`
 ADD PRIMARY KEY (`id`), ADD KEY `varname` (`varname`,`widget`,`visible`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD KEY `status` (`status`), ADD KEY `superuser` (`superuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admcatalogo`
--
ALTER TABLE `admcatalogo`
MODIFY `ide_elemento` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `admgrcatalogo`
--
ALTER TABLE `admgrcatalogo`
MODIFY `ide_grupo` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `admopcion`
--
ALTER TABLE `admopcion`
MODIFY `ide_opcion` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `admrol`
--
ALTER TABLE `admrol`
MODIFY `ide_rol` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `admrolopcion`
--
ALTER TABLE `admrolopcion`
MODIFY `ide_rolopcion` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
MODIFY `idEmpleado` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
MODIFY `idMovimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `parametrogeneral`
--
ALTER TABLE `parametrogeneral`
MODIFY `idParametro` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `sisdireccion`
--
ALTER TABLE `sisdireccion`
MODIFY `ide_direccion` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sispersona`
--
ALTER TABLE `sispersona`
MODIFY `ide_persona` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `sisusuario`
--
ALTER TABLE `sisusuario`
MODIFY `ide_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_profiles_fields`
--
ALTER TABLE `tbl_profiles_fields`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
ADD CONSTRAINT `fk_DetFac_Prod` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
ADD CONSTRAINT `fk_Fac_detFac` FOREIGN KEY (`nroSerie`, `nroFact`) REFERENCES `factura` (`nroSerie`, `nroFact`);

--
-- Filtros para la tabla `detalleordencompra`
--
ALTER TABLE `detalleordencompra`
ADD CONSTRAINT `fk_Detord_Prod` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
ADD CONSTRAINT `fk_ord_detord` FOREIGN KEY (`nroSerie`, `nroOrden`) REFERENCES `ordencompra` (`nroSerie`, `nroOrden`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
ADD CONSTRAINT `fk_Fac_Cli` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
ADD CONSTRAINT `fk_Inv_Prod` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
ADD CONSTRAINT `fk_ord_Prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`);

--
-- Filtros para la tabla `sisusuario`
--
ALTER TABLE `sisusuario`
ADD CONSTRAINT `pk_user_persona` FOREIGN KEY (`ide_persona`) REFERENCES `sispersona` (`ide_persona`),
ADD CONSTRAINT `pk_user_rol` FOREIGN KEY (`ide_rol`) REFERENCES `admrol` (`ide_rol`);

--
-- Filtros para la tabla `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
ADD CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
