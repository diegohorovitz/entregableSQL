-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: entregable
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Deportes'),(2,'Economia'),(3,'Sociedad'),(4,'Politica'),(5,'Espectaculos'),(6,'Policiales'),(7,'Humor'),(8,'Internacional'),(9,'Cocina'),(10,'Viajes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  `descripcion` text NOT NULL,
  `puedeBorrarse` tinyint(4) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_FK` (`usuario_id`),
  CONSTRAINT `notas_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'La mejor receta para hacer tacos','2004-09-21 03:00:00',NULL,'Aprende a hacer los tacos como se sirven en Mexico y otras partes del mundo',1,8),(2,'China se niega a entregar informacion sobre el laboratorio de Wuhan','2004-09-21 03:00:00',NULL,'Desde el gobierno chino desmienten que el virus haya sido creado en el laboratorio de Wuhan e insisten que ese rumor fue instalado por EEUU',0,3),(3,'Argentina visitara a Brasil buscando cortar su racha perfecta como local en eliminatorias','2004-09-21 03:00:00',NULL,'La albiceleste intentara repetir lo que ya supo conseguir hace casi dos meses. Brasil nunca perdio por eliminatorias jugando como local (45 victorias y 12 empates)',0,6),(4,'Previaje 2022: conoce como acceder','2004-09-21 03:00:00','2005-09-21 03:00:00','El detalle de todos los consumos que pueden ser bonificados y los plazos para la carga de cada ticket',1,1),(5,'El peso argentino se encuentra entre las monedas mas devaluadas del mundo','2004-09-21 03:00:00',NULL,'La moneda argentina es de las debiles de la region, solamente superada por Venezuela en la region, y se acerca a las cifras de los paises mas pobres y en guerra',0,4),(6,'Como comprar online en el exterior','2004-09-21 03:00:00','2005-09-21 03:00:00','Conoce cuantos envios por año estan permitidos, costos de aduana ',1,5),(7,'A fines de 2022 se podria alcanzar la inmunidad de rebaño','2004-09-21 03:00:00',NULL,'El estudio fue confeccionado por la OMS y se cree que siguiendo el ritmo de vacunacion se podria volver a la normalidad en 2023',1,2),(8,'Los murcielagos cayeron ante Brasil y se quedaron con la medalla de plata en los Juegos Paralimpicos','2004-09-21 03:00:00',NULL,'El equipo de futbol de no videntes aportó la novena medalla para la delegación argentina: cinco de plata y cuatro de bronce.',0,7),(9,'Conoce donde votar y todos los protocolos de seguridad','2004-09-21 03:00:00','2006-09-21 03:00:00','Solamente con ingresar tu numero de DNI vas a poder acceder al padron electoral y conocer en que escuela votar',1,10),(10,'A que paises se puede viajar sin vacuna? Semaforo actualizado pais por pais','2004-09-21 03:00:00','2006-09-21 03:00:00','Permisos, restricciones y visas de los principales destinos que buscan los argentinos',0,3);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorias_id` int(11) NOT NULL,
  `notas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_categorias_FK` (`notas_id`),
  KEY `notas_categorias_FK_1` (`categorias_id`),
  CONSTRAINT `notas_categorias_FK` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`),
  CONSTRAINT `notas_categorias_FK_1` FOREIGN KEY (`categorias_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categorias`
--

LOCK TABLES `notas_categorias` WRITE;
/*!40000 ALTER TABLE `notas_categorias` DISABLE KEYS */;
INSERT INTO `notas_categorias` VALUES (1,9,1),(2,10,4),(3,2,5),(4,1,3),(5,10,10),(6,8,2),(7,10,9),(8,8,7),(9,3,6),(10,1,8);
/*!40000 ALTER TABLE `notas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_un` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Diego','diego@gmail.com'),(2,'Flor','flor@gmail.com'),(3,'Liliana','liliana@gmail.com'),(4,'Rodolfo','rodolfo@gmail.com'),(5,'Daniela','daniela@gmail.com'),(6,'Federico','federico@gmail.com'),(7,'Matias','matias@gmail.com'),(8,'Nicolas','nicolas@gmail.com'),(9,'Fernando','fernando@gmail.com'),(10,'Hernan','hernan@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'entregable'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 18:20:22
