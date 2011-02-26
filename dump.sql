-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: asociacionCompartir
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apadrinas`
--

DROP TABLE IF EXISTS `apadrinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apadrinas` (
  `codigoNino` varchar(10) NOT NULL,
  `codigoPadrino` varchar(10) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaInterrupcion` date DEFAULT NULL,
  `tipoPadrinazgo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codigoNino`,`codigoPadrino`),
  KEY `codigoPadrino` (`codigoPadrino`),
  CONSTRAINT `apadrinas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `apadrinas_ibfk_2` FOREIGN KEY (`codigoPadrino`) REFERENCES `padrinos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apadrinas`
--

LOCK TABLES `apadrinas` WRITE;
/*!40000 ALTER TABLE `apadrinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `apadrinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficios`
--

DROP TABLE IF EXISTS `beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficios` (
  `codigoNino` varchar(10) NOT NULL,
  `tipoBeneficio` varchar(30) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle` text,
  `importe` decimal(11,2) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`codigoNino`,`tipoBeneficio`),
  CONSTRAINT `beneficios_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios`
--

LOCK TABLES `beneficios` WRITE;
/*!40000 ALTER TABLE `beneficios` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centros`
--

DROP TABLE IF EXISTS `centros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centros` (
  `nombre` varchar(30) NOT NULL,
  `sector` varchar(20) NOT NULL,
  `codigoAdministrador` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`sector`),
  KEY `codigoAdministrador` (`codigoAdministrador`),
  CONSTRAINT `centros_ibfk_1` FOREIGN KEY (`codigoAdministrador`) REFERENCES `educadors` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros`
--

LOCK TABLES `centros` WRITE;
/*!40000 ALTER TABLE `centros` DISABLE KEYS */;
/*!40000 ALTER TABLE `centros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educadors`
--

DROP TABLE IF EXISTS `educadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educadors` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educadors`
--

LOCK TABLES `educadors` WRITE;
/*!40000 ALTER TABLE `educadors` DISABLE KEYS */;
INSERT INTO `educadors` VALUES ('educ-01','Juan','Perez');
/*!40000 ALTER TABLE `educadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esfamiliars`
--

DROP TABLE IF EXISTS `esfamiliars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esfamiliars` (
  `codigoNino` varchar(10) NOT NULL,
  `nombreFamiliar` varchar(30) NOT NULL,
  `apellidoFamiliar` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoNino`,`nombreFamiliar`,`apellidoFamiliar`),
  KEY `nombreFamiliar` (`nombreFamiliar`,`apellidoFamiliar`),
  CONSTRAINT `esfamiliars_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `esfamiliars_ibfk_2` FOREIGN KEY (`nombreFamiliar`, `apellidoFamiliar`) REFERENCES `familiars` (`nombre`, `apellido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esfamiliars`
--

LOCK TABLES `esfamiliars` WRITE;
/*!40000 ALTER TABLE `esfamiliars` DISABLE KEYS */;
/*!40000 ALTER TABLE `esfamiliars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiars`
--

DROP TABLE IF EXISTS `familiars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familiars` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `ocupacion` varchar(25) DEFAULT NULL,
  `salud` varchar(50) DEFAULT NULL,
  `salario` decimal(11,2) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `fechaAct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estadoCivil` varchar(15) DEFAULT NULL,
  `parentesco` varchar(15) DEFAULT NULL,
  `lugarTrabajo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`apellido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiars`
--

LOCK TABLES `familiars` WRITE;
/*!40000 ALTER TABLE `familiars` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historials`
--

DROP TABLE IF EXISTS `historials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historials` (
  `codigoNino` varchar(10) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `foto` longblob,
  `descripcion` mediumtext,
  PRIMARY KEY (`codigoNino`,`fecha`),
  CONSTRAINT `historials_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historials`
--

LOCK TABLES `historials` WRITE;
/*!40000 ALTER TABLE `historials` DISABLE KEYS */;
/*!40000 ALTER TABLE `historials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ninos`
--

DROP TABLE IF EXISTS `ninos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ninos` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `estadoPadrinazgo` varchar(25) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  `habitaCon` varchar(30) DEFAULT NULL,
  `nombreCentro` varchar(30) NOT NULL,
  `nombreSector` varchar(20) NOT NULL,
  `codigoEducador` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `nombreCentro` (`nombreCentro`,`nombreSector`),
  KEY `codigoEducador` (`codigoEducador`),
  CONSTRAINT `ninos_ibfk_1` FOREIGN KEY (`nombreCentro`, `nombreSector`) REFERENCES `centros` (`nombre`, `sector`) ON UPDATE CASCADE,
  CONSTRAINT `ninos_ibfk_2` FOREIGN KEY (`codigoEducador`) REFERENCES `educadors` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ninos`
--

LOCK TABLES `ninos` WRITE;
/*!40000 ALTER TABLE `ninos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ninos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padrinos`
--

DROP TABLE IF EXISTS `padrinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `padrinos` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrinos`
--

LOCK TABLES `padrinos` WRITE;
/*!40000 ALTER TABLE `padrinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `padrinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participas`
--

DROP TABLE IF EXISTS `participas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participas` (
  `codigoNino` varchar(10) NOT NULL,
  `tipoPrograma` varchar(20) NOT NULL,
  `componentePrograma` varchar(20) NOT NULL,
  `fechaInic` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `resultado` text,
  PRIMARY KEY (`codigoNino`,`tipoPrograma`,`componentePrograma`),
  KEY `tipoPrograma` (`tipoPrograma`,`componentePrograma`),
  CONSTRAINT `participas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`),
  CONSTRAINT `participas_ibfk_2` FOREIGN KEY (`tipoPrograma`, `componentePrograma`) REFERENCES `programas` (`tipo`, `componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participas`
--

LOCK TABLES `participas` WRITE;
/*!40000 ALTER TABLE `participas` DISABLE KEYS */;
/*!40000 ALTER TABLE `participas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `tipo` varchar(20) NOT NULL,
  `componente` varchar(20) NOT NULL,
  PRIMARY KEY (`tipo`,`componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacion_academicas`
--

DROP TABLE IF EXISTS `situacion_academicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacion_academicas` (
  `codigoNino` varchar(10) NOT NULL,
  `anio` char(4) NOT NULL,
  `grado` char(2) DEFAULT NULL,
  `indice` decimal(5,2) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`codigoNino`,`anio`),
  CONSTRAINT `situacion_academicas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacion_academicas`
--

LOCK TABLES `situacion_academicas` WRITE;
/*!40000 ALTER TABLE `situacion_academicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `situacion_academicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_educadors`
--

DROP TABLE IF EXISTS `telefono_educadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono_educadors` (
  `codigoEducador` varchar(10) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  PRIMARY KEY (`codigoEducador`,`telefono`),
  CONSTRAINT `telefono_educadors_ibfk_1` FOREIGN KEY (`codigoEducador`) REFERENCES `educadors` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_educadors`
--

LOCK TABLES `telefono_educadors` WRITE;
/*!40000 ALTER TABLE `telefono_educadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_educadors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-02-26 16:41:59
