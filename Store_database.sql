CREATE DATABASE  IF NOT EXISTS `cuentas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cuentas`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cuentas
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Karina','Mendez','88634798','KarMen@mail.com'),(2,'Carlos','Brenes','5548796','Carbre@mail.com'),(3,'Daniel','Smith','2215478','DanSmi@mail.com'),(4,'Robert','Flores','78426984','Robflo@mail.com'),(5,'Andrea','Monge','74895230','Andmon@mail.com'),(6,'Raul','Elizondo','74895762','Raueli@mail.com'),(7,'Sthefany','Barahona','89754263','SthBar@mail.com'),(8,'Jimena','Clark','87594620','Jimcla@mail.com'),(9,'Jesus','Ash','78549232','Jesash@mail.com'),(10,'Cristel','Brown','75846981','Crisbro@mail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertarStatus` AFTER INSERT ON `cliente` FOR EACH ROW insert into clientestatus (idcliente, Nota) values (new.idcliente, "CUENTA ABIERTA CON ÉXITO") */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientestatus`
--

DROP TABLE IF EXISTS `clientestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientestatus` (
  `idCliente` int NOT NULL,
  `Nota` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientestatus`
--

LOCK TABLES `clientestatus` WRITE;
/*!40000 ALTER TABLE `clientestatus` DISABLE KEYS */;
INSERT INTO `clientestatus` VALUES (11,'CUENTA ABIERTA CON ÉXITO'),(12,'CUENTA ABIERTA CON ÉXITO');
/*!40000 ALTER TABLE `clientestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `iddireccion` int NOT NULL,
  `etiqueta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'credito'),(2,'debito');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `idtransaccion` int NOT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  `importe` decimal(7,2) DEFAULT NULL,
  `divisa` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `iddireccion` int DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idtransaccion`),
  KEY `transaccion-cliente_idx` (`idcliente`),
  KEY `transaccion-direccion_idx` (`iddireccion`),
  CONSTRAINT `transaccion-cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `transaccion-direccion` FOREIGN KEY (`iddireccion`) REFERENCES `direccion` (`iddireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,'Salario',750.00,'USD','2022-01-13 20:25:30',1,2),(2,'Peri',30.00,'USD','2022-01-20 10:15:30',2,1),(3,'Restaurante Rex',7.00,'USD','2022-01-16 03:30:10',2,3),(4,'Sinpe Movil',40.00,'USD','2022-01-25 04:36:22',1,4),(5,'Tienda Lock',56.00,'USD','2022-01-18 09:34:12',2,5),(6,'Gym Shake',60.00,'USD','2022-02-02 05:23:02',2,7),(7,'Ferreteria',15.00,'USD','2022-02-03 07:08:15',2,6),(8,'VideoStore',10.00,'USD','2022-02-04 11:15:27',2,8),(9,'Salario',780.00,'USD','2022-02-13 19:14:26',1,1),(10,'Salario',850.00,'USD','2022-02-14 20:30:40',1,3),(11,'Gas',100.00,'USD','2022-02-14 18:12:53',2,1),(12,'ZARA',55.00,'USD','2022-02-25 12:22:12',2,9),(13,'Salario',1000.00,'USD','2022-03-02 08:15:11',1,9),(14,'Restaurante Lux',40.00,'USD','2022-03-15 12:28:13',2,9),(15,'RAFFLE',18.00,'USD','2022-03-18 10:45:32',2,3);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Credito_call` AFTER INSERT ON `transaccion` FOR EACH ROW call proc_actualizacion_credito */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `transaciones`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `importe`,
 1 AS `etiqueta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view2`
--

DROP TABLE IF EXISTS `view2`;
/*!50001 DROP VIEW IF EXISTS `view2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view2` AS SELECT 
 1 AS `idcliente`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cuentas'
--

--
-- Dumping routines for database 'cuentas'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_actualizacion_creditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizacion_creditos`(
in idtrasaccion int ,
in asunto varchar (45),
in importe decimal (7,2),
in divisa varchar (45),
fecha datetime,
iddireccion int,
idcliente int

)
BEGIN
insert into transaccion (idtransaccion, asunto, importe, divisa, fecha, iddireccion, idcliente) values (idtransaccion, asunto, importe, divisa, fecha, iddireccion, idcliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_actualizacion_debitos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizacion_debitos`(
in asunto varchar(45), 
in importe decimal(7,2),
 in divisa varchar(45), 
 in fecha datetime, 
 in idDireccion int, 
 in idCliente int)
BEGIN
 
	set @maximo = (select max(idTransaccion)
		from transaccion 
        where transaccion.idDireccion = 1 or transaccion.idDireccion = 2);
        
	set @importeold = (select transaccion.importe 
		from transaccion 
		where transaccion.idTransaccion = @maximo);
	
		if idDirección = 2 then
		if @importeold > importe then

		INSERT INTO transaccion values (null, asunto, (@importeold-importe), divisa, fecha, idDireccion, idCliente);
	else
		select 'Error';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_actual_creditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actual_creditos`(
in idtransaccion int,
in asunto varchar (45),
in importe decimal (7,2),
in divisa varchar (45),
in fecha datetime,
iddireccion int,
idcliente int
)
BEGIN
insert into transaccion(idtransaccion, asunto, importe, divisa, fecha, iddireccion, idcliente) values (idtransaccion, asunto, importe, divisa, fecha, iddireccion, idcliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_cliente_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cliente_estado`()
BEGIN
select transaccion.idcliente, sum(transaccion.importe) as total, direccion.etiqueta as tipo from transaccion 
join direccion on transaccion.iddireccion = direccion.iddireccion group by idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `cliente`.`idcliente` AS `transaciones`,`cliente`.`nombre` AS `nombre`,`cliente`.`apellido` AS `apellido`,`transaccion`.`importe` AS `importe`,`direccion`.`etiqueta` AS `etiqueta` from ((`cliente` join `transaccion` on((`cliente`.`idcliente` = `transaccion`.`idcliente`))) join `direccion` on((`transaccion`.`iddireccion` = `direccion`.`iddireccion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view2`
--

/*!50001 DROP VIEW IF EXISTS `view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view2` AS select `cliente`.`idcliente` AS `idcliente`,`cliente`.`nombre` AS `nombre`,`cliente`.`apellido` AS `apellido` from `cliente` where (`cliente`.`idcliente` = 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-21 14:36:13
