/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - db_empresa_foto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_empresa_foto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */;

USE `db_empresa_foto`;

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `cedula` varchar(20) NOT NULL,
  `tipodoc` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'C',
  `apellidos` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombres` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `genero` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'M' COMMENT 'M=Masculino, F=Femenino',
  `fechanac` date DEFAULT '2000-01-01',
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movil` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `foto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'user.jpg',
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='TRIAL';

/*Data for the table `personas` */

insert  into `personas`(`cedula`,`tipodoc`,`apellidos`,`nombres`,`genero`,`fechanac`,`direccion`,`telefono`,`movil`,`email`,`foto`) values ('1002003001','C','PILATAXI ALBA','VICTOR RENE','M','2000-01-01','Caranqui','0999458787','0999458787','renepila@yahoo.es','rene.jpeg');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL',
  `rol_nombre` varchar(45) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `observacion` varchar(90) DEFAULT NULL COMMENT 'TRIAL',
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idrol`),
  UNIQUE KEY `tipou_nombre` (`rol_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TRIAL';

/*Data for the table `roles` */

insert  into `roles`(`idrol`,`rol_nombre`,`estado`,`observacion`,`activo`) values (1,'ADMINISTRADOR',NULL,NULL,1),(2,'CLIENTE',NULL,NULL,1),(3,'VENDEDOR',NULL,NULL,1);

/*Table structure for table `usuario_roles` */

DROP TABLE IF EXISTS `usuario_roles`;

CREATE TABLE `usuario_roles` (
  `persona_cedula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `idrol` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`persona_cedula`,`idrol`),
  KEY `idtipou` (`idrol`),
  CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`persona_cedula`) REFERENCES `usuarios` (`persona_cedula`),
  CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TRIAL';

/*Data for the table `usuario_roles` */

insert  into `usuario_roles`(`persona_cedula`,`idrol`) values ('1002003001',1);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `persona_cedula` varchar(20) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `upassword` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`persona_cedula`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_cedula`) REFERENCES `personas` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci COMMENT='TRIAL';

/*Data for the table `usuarios` */

insert  into `usuarios`(`persona_cedula`,`fecha_creacion`,`upassword`,`ultimo_acceso`,`activo`) values ('1002003001','2026-06-22 17:52:16','0192023a7bbd73250516f069df18b500','2026-06-22 18:12:39',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
