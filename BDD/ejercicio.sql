SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `comida`;
CREATE TABLE `comida` (
  `cod_com` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `dificultad` varchar(25) NOT NULL,
  `tipo_comida` int(10) NOT NULL,
  PRIMARY KEY (`cod_com`),
  KEY `tipo_comida` (`tipo_comida`),
  CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`tipo_comida`) REFERENCES `tipos_comida` (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comida` (`cod_com`, `nombre`, `dificultad`, `tipo_comida`) VALUES
(1,	'macarrones',	'baja',	3),
(2,	'tortilla',	'media',	1);

DROP TABLE IF EXISTS `comi_ingr`;
CREATE TABLE `comi_ingr` (
  `cod_com` int(10) NOT NULL,
  `cod_ingr` int(10) NOT NULL,
  PRIMARY KEY (`cod_com`,`cod_ingr`),
  KEY `cod_ingr` (`cod_ingr`),
  CONSTRAINT `comi_ingr_ibfk_3` FOREIGN KEY (`cod_ingr`) REFERENCES `ingredientes` (`cod_ing`),
  CONSTRAINT `comi_ingr_ibfk_4` FOREIGN KEY (`cod_com`) REFERENCES `comida` (`cod_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comi_ingr` (`cod_com`, `cod_ingr`) VALUES
(1,	1),
(1,	2),
(2,	3),
(2,	4),
(2,	5);

DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE `ingredientes` (
  `cod_ing` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_ing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ingredientes` (`cod_ing`, `nombre`) VALUES
(1,	'pasta'),
(2,	'tomate'),
(3,	'patata'),
(4,	'cebolla'),
(5,	'huevos');

DROP TABLE IF EXISTS `tipos_comida`;
CREATE TABLE `tipos_comida` (
  `cod_tipo` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tipos_comida` (`cod_tipo`, `nombre`) VALUES
(1,	'asiatica'),
(2,	'francesa'),
(3,	'italiana');