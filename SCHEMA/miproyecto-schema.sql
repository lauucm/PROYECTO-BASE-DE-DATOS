CREATE DATABASE `gimnasio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `actividad` (
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `clase` (
  `id_clase` int NOT NULL,
  `dia` varchar(15) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `sala_numero` int NOT NULL,
  PRIMARY KEY (`id_clase`,`sala_numero`),
  KEY `sala_numero` (`sala_numero`),
  CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`sala_numero`) REFERENCES `sala` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `clase_entrenadores` (
  `id_entrenador` int NOT NULL,
  `id_clase` int NOT NULL,
  PRIMARY KEY (`id_entrenador`,`id_clase`),
  KEY `id_clase` (`id_clase`),
  CONSTRAINT `clase_entrenadores_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`),
  CONSTRAINT `clase_entrenadores_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `DNI` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `entrenadores` (
  `id_entrenador` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `num_telefono` varchar(45) DEFAULT NULL,
  `profesion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_entrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `matricula` (
  `cod_matricula` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `CLIENTE_id_cliente` int NOT NULL,
  PRIMARY KEY (`cod_matricula`),
  KEY `matricula_FK` (`CLIENTE_id_cliente`),
  CONSTRAINT `matricula_FK` FOREIGN KEY (`CLIENTE_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `personal_cliente` (
  `ENTRENADORES_id_entrenador` int NOT NULL,
  `CLIENTE_id_cliente` int NOT NULL,
  `dia` varchar(10) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time DEFAULT '00:00:00',
  PRIMARY KEY (`ENTRENADORES_id_entrenador`,`CLIENTE_id_cliente`,`dia`,`hora_inicio`),
  KEY `personal_cliente_ibfk_2` (`CLIENTE_id_cliente`),
  CONSTRAINT `personal_cliente_ibfk_1` FOREIGN KEY (`ENTRENADORES_id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personal_cliente_ibfk_2` FOREIGN KEY (`CLIENTE_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sala` (
  `numero` int NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sala_has_actividad` (
  `SALA_numero` int NOT NULL,
  `ACTIVIDAD_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`SALA_numero`,`ACTIVIDAD_nombre`),
  KEY `sala_has_actividad_FK_1` (`ACTIVIDAD_nombre`),
  CONSTRAINT `sala_has_actividad_FK` FOREIGN KEY (`SALA_numero`) REFERENCES `sala` (`numero`),
  CONSTRAINT `sala_has_actividad_FK_1` FOREIGN KEY (`ACTIVIDAD_nombre`) REFERENCES `actividad` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
