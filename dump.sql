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
-- Table structure for table `accedes`
--

DROP TABLE IF EXISTS `accedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accedes` (
  `idUsuario` varchar(20) NOT NULL,
  `idModulo` varchar(5) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idModulo`),
  KEY `idModulo` (`idModulo`),
  CONSTRAINT `accedes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accedes_ibfk_2` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accedes`
--

LOCK TABLES `accedes` WRITE;
/*!40000 ALTER TABLE `accedes` DISABLE KEYS */;
INSERT INTO `accedes` VALUES ('Administrador01','A0001'),('Educador06','A0002'),('Educador03','A0003'),('Educador08','A0003'),('Educador04','A0004'),('Educador07','A0004'),('Educador05','A0005'),('Educador06','A0005');
/*!40000 ALTER TABLE `accedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accidentes_sufridos`
--

DROP TABLE IF EXISTS `accidentes_sufridos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accidentes_sufridos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `accidente` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`accidente`),
  CONSTRAINT `accidentes_sufridos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidentes_sufridos`
--

LOCK TABLES `accidentes_sufridos` WRITE;
/*!40000 ALTER TABLE `accidentes_sufridos` DISABLE KEYS */;
/*!40000 ALTER TABLE `accidentes_sufridos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_salud`
--

DROP TABLE IF EXISTS `antecedente_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente_salud` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `enfermedad` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`,`apellido`,`enfermedad`),
  CONSTRAINT `antecedente_salud_ibfk_1` FOREIGN KEY (`nombre`, `apellido`) REFERENCES `familiars` (`nombre`, `apellido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_salud`
--

LOCK TABLES `antecedente_salud` WRITE;
/*!40000 ALTER TABLE `antecedente_salud` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedente_salud` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros`
--

LOCK TABLES `centros` WRITE;
/*!40000 ALTER TABLE `centros` DISABLE KEYS */;
INSERT INTO `centros` VALUES ('Villa Nueva','Sector 1','E00001'),('Villa Nueva','Sector 2','E00003'),('Los Pinos','Sector 1','E00005'),('Nueva Suyapa','Sector 1','E00007');
/*!40000 ALTER TABLE `centros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_viviendas`
--

DROP TABLE IF EXISTS `componente_viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componente_viviendas` (
  `codigoExpediente` varchar(10) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `revision` date NOT NULL,
  `condicion` varchar(7) NOT NULL,
  `observacion` text,
  PRIMARY KEY (`codigoExpediente`,`nombre`,`revision`),
  CONSTRAINT `componente_viviendas_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_viviendas` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_viviendas`
--

LOCK TABLES `componente_viviendas` WRITE;
/*!40000 ALTER TABLE `componente_viviendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_viviendas` ENABLE KEYS */;
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
  `idUsuario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `educadors_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educadors`
--

LOCK TABLES `educadors` WRITE;
/*!40000 ALTER TABLE `educadors` DISABLE KEYS */;
INSERT INTO `educadors` VALUES ('E00001','Luis','Medina','educador01'),('E00002','Carlos','Almendarez','educador02'),('E00003','Rosa','NuÃ±ez','educador03'),('E00004','Marilyn','Argueta','educador04'),('E00005','Carlos','Erazo','educador05'),('E00006','Carmen','Guzman','educador06'),('E00007','Reina','Flores','educador07'),('E00008','Josue','Rodriguez','educador08');
/*!40000 ALTER TABLE `educadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedades` (
  `codigoExpediente` varchar(10) NOT NULL,
  `enfermedad` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`enfermedad`),
  CONSTRAINT `enfermedades_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades`
--

LOCK TABLES `enfermedades` WRITE;
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;
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
  CONSTRAINT `esfamiliars_ibfk_2` FOREIGN KEY (`nombreFamiliar`, `apellidoFamiliar`) REFERENCES `familiars` (`nombre`, `apellido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esfamiliars`
--

LOCK TABLES `esfamiliars` WRITE;
/*!40000 ALTER TABLE `esfamiliars` DISABLE KEYS */;
/*!40000 ALTER TABLE `esfamiliars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_descriptivos`
--

DROP TABLE IF EXISTS `expediente_descriptivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_descriptivos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `drogas` text,
  `fumador` tinyint(1) DEFAULT '0',
  `alcohol` tinyint(1) DEFAULT '0',
  `tatuajes` text,
  `descripcionAmigos` text,
  `descripcionActual` text,
  `descripcionActualAmigos` text,
  `observaciones` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_descriptivos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_descriptivos`
--

LOCK TABLES `expediente_descriptivos` WRITE;
/*!40000 ALTER TABLE `expediente_descriptivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_descriptivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_educativo`
--

DROP TABLE IF EXISTS `expediente_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_educativo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `descripcionNoAsistenciaPre` text,
  `edadIngresoPre` smallint(6) DEFAULT NULL,
  `edadEgresoPre` smallint(6) DEFAULT NULL,
  `nombrePrescolar` varchar(50) DEFAULT NULL,
  `edadIngresoPrim` smallint(6) DEFAULT NULL,
  `edadEgresoPrim` smallint(6) DEFAULT NULL,
  `nombrePrimaria` varchar(50) DEFAULT NULL,
  `descripcionNoAsistenciaPri` text,
  `clasesFavoritas` text,
  `descripcionesExpulsiones` text,
  `des_Inasistencia` text,
  `clasesDificultad` text,
  `oficio` varchar(50) DEFAULT NULL,
  `club` varchar(50) DEFAULT NULL,
  `diversion` text,
  `carrera` varchar(40) DEFAULT NULL,
  `cursoDiversificado` smallint(6) DEFAULT NULL,
  `cursoAprobado` smallint(6) DEFAULT NULL,
  `asisteSecundaria` tinyint(1) DEFAULT '0',
  `descripcionNoAsistenciaSecundaria` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_educativo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_educativo`
--

LOCK TABLES `expediente_educativo` WRITE;
/*!40000 ALTER TABLE `expediente_educativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_educativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_familiar`
--

DROP TABLE IF EXISTS `expediente_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_familiar` (
  `codigoExpediente` varchar(10) NOT NULL,
  `familiaMaterna` text,
  `entreHermanos` text,
  `entreHijos` text,
  `familiaPaterna` text,
  `padreHijo` text,
  `padres` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_familiar_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_familiar`
--

LOCK TABLES `expediente_familiar` WRITE;
/*!40000 ALTER TABLE `expediente_familiar` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_juridico`
--

DROP TABLE IF EXISTS `expediente_juridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_juridico` (
  `codigoExpediente` varchar(10) NOT NULL,
  `inscritoRNP` tinyint(1) DEFAULT '1',
  `reconodicoPor` varchar(15) DEFAULT NULL,
  `maltratoFisico` text,
  `contactoEmergencia` varchar(60) DEFAULT NULL,
  `problemaSobreNombre` tinyint(1) DEFAULT '0',
  `descripcionNoInscrito` text,
  `maltratadoPor` text,
  `victimaViolacion` tinyint(1) DEFAULT NULL,
  `auxilioExterno` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_juridico_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_juridico`
--

LOCK TABLES `expediente_juridico` WRITE;
/*!40000 ALTER TABLE `expediente_juridico` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_juridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_salud`
--

DROP TABLE IF EXISTS `expediente_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_salud` (
  `codigoExpediente` varchar(10) NOT NULL,
  `TipoParto` varchar(30) DEFAULT NULL,
  `TipoNacimiento` varchar(30) DEFAULT NULL,
  `EmbarazoControlado` tinyint(1) DEFAULT '1',
  `SaludActual` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_salud_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_salud`
--

LOCK TABLES `expediente_salud` WRITE;
/*!40000 ALTER TABLE `expediente_salud` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_salud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_trabajo`
--

DROP TABLE IF EXISTS `expediente_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_trabajo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `empleador` varchar(25) DEFAULT NULL,
  `lugarTrabajo` varchar(50) DEFAULT NULL,
  `formaPago` varchar(7) DEFAULT NULL,
  `contrato` varchar(30) DEFAULT NULL,
  `diasLaborales` varchar(15) DEFAULT NULL,
  `horaEntrada` time DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `trabajoPeligroso` tinyint(1) DEFAULT '0',
  `acompanante` varchar(50) DEFAULT NULL,
  `motivosAbandonoHogar` text,
  `relacionesCompaneros` text,
  `aspiraciones` text,
  `habilidades` text,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_trabajo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_trabajo`
--

LOCK TABLES `expediente_trabajo` WRITE;
/*!40000 ALTER TABLE `expediente_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_viviendas`
--

DROP TABLE IF EXISTS `expediente_viviendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_viviendas` (
  `codigoExpediente` varchar(10) NOT NULL,
  `cantidadCuartos` smallint(6) DEFAULT NULL,
  `material` varchar(40) DEFAULT NULL,
  `antiguedad` smallint(6) DEFAULT NULL,
  `propietario` varchar(30) DEFAULT NULL,
  `luz` varchar(15) DEFAULT NULL,
  `agua` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `expediente_viviendas_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expedientes` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_viviendas`
--

LOCK TABLES `expediente_viviendas` WRITE;
/*!40000 ALTER TABLE `expediente_viviendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_viviendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedientes`
--

DROP TABLE IF EXISTS `expedientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedientes` (
  `codigo` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `responsable` varchar(40) DEFAULT NULL,
  `codigoNino` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigoNino` (`codigoNino`),
  CONSTRAINT `expedientes_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedientes`
--

LOCK TABLES `expedientes` WRITE;
/*!40000 ALTER TABLE `expedientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia_laboral` (
  `codigoExpediente` varchar(10) NOT NULL,
  `experiencia` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `experiencia_laboral_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia_laboral`
--

LOCK TABLES `experiencia_laboral` WRITE;
/*!40000 ALTER TABLE `experiencia_laboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencia_laboral` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiars`
--

LOCK TABLES `familiars` WRITE;
/*!40000 ALTER TABLE `familiars` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_trabajo`
--

DROP TABLE IF EXISTS `gastos_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos_trabajo` (
  `codigoExpediente` varchar(10) NOT NULL,
  `gastos` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `gastos_trabajo_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_trabajo`
--

LOCK TABLES `gastos_trabajo` WRITE;
/*!40000 ALTER TABLE `gastos_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos_trabajo` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historials`
--

LOCK TABLES `historials` WRITE;
/*!40000 ALTER TABLE `historials` DISABLE KEYS */;
/*!40000 ALTER TABLE `historials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `id` varchar(5) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES ('A0001','Accesso completo a todo'),('A0002','acceso a propios ninos'),('A0003','acceso a los expedientes solamente'),('A0004','acceso a centros especificos'),('A0005','acceso a todos los centros');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ninos`
--

LOCK TABLES `ninos` WRITE;
/*!40000 ALTER TABLE `ninos` DISABLE KEYS */;
INSERT INTO `ninos` VALUES ('128901','Carlos AndrÃ©s','Rodriguez Martinez','Padrinazgo Partage','2000-12-01','m','Madre','Villa Nueva','Sector 1','E00001'),('128902','Martha Maria','Pacheco Mendoza','Padrinazgo Partage','2001-11-04','f','Madre, Padre y 2 hermanos','Villa Nueva','Sector 1','E00001'),('128903','Mario Alberto','Sierra OrdoÃ±ez','Padrinazgo Compartir','0000-00-00','m','Madre, Padre y 1 hermana','Villa Nueva','Sector 1','E00001'),('128904','Monica Alejandra','Fiallos','Padrinazgo Compartir','2001-10-04','f','Madre y Padre','Villa Nueva','Sector 1','E00001');
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
  `titulo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrinos`
--

LOCK TABLES `padrinos` WRITE;
/*!40000 ALTER TABLE `padrinos` DISABLE KEYS */;
INSERT INTO `padrinos` VALUES ('2711001','Luis Ramirez','HondureÃ±a','Sr'),('2711002','Isabelle Aubret','Francesa','Sra'),('2711003','Francois Audrain','Francesa','Sr'),('2711004','Charles Aznavour','Francesa','Sr'),('2711005','Dominique Badi','Francesa','Sr'),('2711006','Pierre Balavoine','Francesa','Sr'),('2711007','Jeane Aufray','Francesa','Sra'),('2711008','Lucienne Boyer','Francesa','Sr'),('2711009','Chevalier de Maurice','Francesa','Sr'),('2711010','Marie Dubas','Francesa','Sra');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participas`
--

LOCK TABLES `participas` WRITE;
/*!40000 ALTER TABLE `participas` DISABLE KEYS */;
/*!40000 ALTER TABLE `participas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemas_congenitos`
--

DROP TABLE IF EXISTS `problemas_congenitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problemas_congenitos` (
  `codigoExpediente` varchar(10) NOT NULL,
  `problema` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`,`problema`),
  CONSTRAINT `problemas_congenitos_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_salud` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemas_congenitos`
--

LOCK TABLES `problemas_congenitos` WRITE;
/*!40000 ALTER TABLE `problemas_congenitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `problemas_congenitos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `centro` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigoNino`,`anio`),
  CONSTRAINT `situacion_academicas_ibfk_1` FOREIGN KEY (`codigoNino`) REFERENCES `ninos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `telefono_educadors_ibfk_1` FOREIGN KEY (`codigoEducador`) REFERENCES `educadors` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_educadors`
--

LOCK TABLES `telefono_educadors` WRITE;
/*!40000 ALTER TABLE `telefono_educadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_educadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajos_anteriores`
--

DROP TABLE IF EXISTS `trabajos_anteriores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajos_anteriores` (
  `codigoExpediente` varchar(10) NOT NULL,
  `trabajos` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoExpediente`),
  CONSTRAINT `trabajos_anteriores_ibfk_1` FOREIGN KEY (`codigoExpediente`) REFERENCES `expediente_trabajo` (`codigoExpediente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajos_anteriores`
--

LOCK TABLES `trabajos_anteriores` WRITE;
/*!40000 ALTER TABLE `trabajos_anteriores` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajos_anteriores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` varchar(20) NOT NULL,
  `contrasena` varchar(40) NOT NULL,
  `acceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Administrador01','4898d47432db938163b998f98ef796e1','2011-02-28 04:16:19'),('Administrador02','631b3307d7c2417c290bf149c2acacb6','2011-02-28 04:16:19'),('Educador01','d15e24d89c8a72a2ac57d0f0e1312075','2011-02-28 04:16:19'),('Educador02','5db9880611a877470756b5431a0759d8','2011-02-28 04:16:19'),('Educador03','4bc0a9afbc1ae9bfa030331e87e29102','2011-02-28 04:16:19'),('Educador04','952cfd67e0303758c5d551998e9bdb93','2011-02-28 04:16:19'),('Educador05','35630d60edf8ce2e659bddd0826cdb00','2011-02-28 04:16:19'),('Educador06','e37e1a186dcd4ed68f2338976e475a62','2011-02-28 04:16:19'),('Educador07','0d7b06a575ff251372923af6e8c73eb1','2011-02-28 04:16:19'),('Educador08','85fd41461eefa1ed04dd3a63e03b9a08','2011-02-28 04:16:19');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-02-27 22:41:38
