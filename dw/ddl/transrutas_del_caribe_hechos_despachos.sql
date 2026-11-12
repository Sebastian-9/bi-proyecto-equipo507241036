-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: transrutas_del_caribe
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hechos_despachos`
--

DROP TABLE IF EXISTS `hechos_despachos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hechos_despachos` (
  `id_hecho` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_terminal` bigint unsigned NOT NULL,
  `id_vehiculo` bigint unsigned DEFAULT NULL,
  `id_ruta` bigint unsigned NOT NULL,
  `id_tiempo` bigint unsigned NOT NULL,
  `tipo_despacho` varchar(50) DEFAULT NULL,
  `despachos` int DEFAULT NULL,
  `pasajeros` int DEFAULT NULL,
  PRIMARY KEY (`id_hecho`),
  UNIQUE KEY `id_hecho` (`id_hecho`),
  KEY `fk_hechos_ruta` (`id_ruta`),
  KEY `fk_hechos_terminal` (`id_terminal`),
  KEY `fk_hechos_vehiculo` (`id_vehiculo`),
  KEY `fk_hechos_tiempo` (`id_tiempo`),
  CONSTRAINT `fk_hechos_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `dim_ruta` (`id_ruta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_hechos_terminal` FOREIGN KEY (`id_terminal`) REFERENCES `dim_terminal` (`id_terminal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_hechos_tiempo` FOREIGN KEY (`id_tiempo`) REFERENCES `dim_tiempo` (`id_tiempo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_hechos_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `dim_vehiculo` (`id_vehiculo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12 11:47:55
