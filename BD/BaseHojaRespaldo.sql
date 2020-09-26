-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hoja2base2
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Nit` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Saldo` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Cliente1','1111-2222','Direccion1',1000),(2,'Cliente2','2222-3333','Direccion2',9100),(3,'Cliente3','3333-4443','Direccion3',18500),(4,'Cliente4','4444-5555','Direccion4',1200),(5,'Cliente5','5555-6666','Direccion5',2850),(7,'Cliente 7','9999-2222','Direccion7',900),(10,'Cliente 8','9999-2222','Direccion7',100),(12,'Cliente 9','0000-335','Direccion7',10010),(17,'cliente 10','0000-1110','Direccion10',0),(18,'cliente 11','0001-1111','Direccion11',0),(22,'cliente13','555-443','direccion13',0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER eliminarCliente
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN
DELETE FROM pagoscredito WHERE Cliente_id = old.id;
DELETE FROM factura WHERE Cliente_id = old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallefactura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Factura_id` int(11) NOT NULL,
  `Producto_id` int(11) NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Factura_id` (`Factura_id`),
  KEY `Producto_id` (`Producto_id`),
  CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`Factura_id`) REFERENCES `factura` (`id`),
  CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepago`
--

DROP TABLE IF EXISTS `detallepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PagosCredito_id` int(11) NOT NULL,
  `Monto` float DEFAULT NULL,
  `Factura_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PagosCredito_id` (`PagosCredito_id`),
  KEY `Factura_id` (`Factura_id`),
  CONSTRAINT `detallepago_ibfk_1` FOREIGN KEY (`PagosCredito_id`) REFERENCES `pagoscredito` (`id`),
  CONSTRAINT `detallepago_ibfk_2` FOREIGN KEY (`Factura_id`) REFERENCES `factura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepago`
--

LOCK TABLES `detallepago` WRITE;
/*!40000 ALTER TABLE `detallepago` DISABLE KEYS */;
INSERT INTO `detallepago` VALUES (1,1,300,1),(2,2,100,1),(3,3,100,1),(4,4,400,1),(5,5,100,1),(6,6,200,1),(7,7,1000,1),(8,8,300,2),(11,9,990,13),(12,9,0,14),(13,10,900,14),(14,11,570,8);
/*!40000 ALTER TABLE `detallepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Credito` tinyint(1) DEFAULT NULL,
  `Impresa` tinyint(1) DEFAULT NULL,
  `Saldo` float DEFAULT NULL,
  `Anulada` float DEFAULT NULL,
  `Cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cliente_id` (`Cliente_id`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2020-08-17 20:52:07',1000,0,1,0,1,1),(2,'2020-08-17 20:52:07',3000,0,1,0,1,1),(3,'2020-08-17 20:52:07',5000,1,1,4300,0,2),(4,'2020-08-17 20:52:07',500,0,1,0,1,3),(5,'2020-08-17 20:52:08',20000,1,1,18500,0,3),(6,'2020-08-17 20:52:08',1400,0,1,0,1,4),(7,'2020-08-17 20:59:42',1600,1,1,1200,0,4),(8,'2020-08-17 20:59:42',600,0,1,0,1,5),(9,'2020-08-17 20:59:42',3000,1,1,2850,0,5),(13,'2020-08-20 21:33:26',1050,0,1,0,1,1),(14,'2020-08-20 21:33:26',2200,1,1,1000,0,1),(15,'2020-08-20 21:33:26',5000,1,1,4600,0,2);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminarFactura` BEFORE DELETE ON `factura` FOR EACH ROW BEGIN
DELETE FROM detallefactura WHERE  Factura_id = old.id;
DELETE FROM detallepago WHERE Factura_id = old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagoscredito`
--

DROP TABLE IF EXISTS `pagoscredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagoscredito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cliente_id` (`Cliente_id`),
  CONSTRAINT `pagoscredito_ibfk_1` FOREIGN KEY (`Cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoscredito`
--

LOCK TABLES `pagoscredito` WRITE;
/*!40000 ALTER TABLE `pagoscredito` DISABLE KEYS */;
INSERT INTO `pagoscredito` VALUES (1,'2020-08-17 22:59:06',300,1),(2,'2020-08-17 22:59:24',100,1),(3,'2020-08-17 22:59:37',100,1),(4,'2020-08-17 23:03:03',400,1),(5,'2020-08-17 23:04:44',100,1),(6,'2020-08-17 23:04:55',200,1),(7,'2020-08-17 23:05:06',1000,1),(8,'2020-08-17 23:05:19',300,1),(9,'2020-08-20 22:28:35',990,1),(10,'2020-08-20 22:29:25',900,1),(11,'2020-08-20 22:34:41',570,5);
/*!40000 ALTER TABLE `pagoscredito` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nuevoPago` AFTER INSERT ON `pagoscredito` FOR EACH ROW begin 
declare varSaldo,varPago float;
declare varIdFactura int;
declare cont1 int default 0;

declare curFactura cursor for select F.id,F.Saldo from factura F where F.Cliente_id = new.Cliente_id and F.Anulada = 0; 
		
declare continue handler for sqlstate '02000' set cont1 = 1;		
set varPago = new.Total;		
open curFactura;
fetch curFactura into varIdFactura,varSaldo;
while not cont1 do

if varPago >= varSaldo then

insert into detallePago(PagosCredito_id,Monto,Factura_id) values(new.id,varSaldo,varIdFactura);
update factura set Saldo = 0, Anulada = 1, Credito = 0 where id = varIdFactura;
update cliente set Saldo = Saldo - varSaldo where id = new.Cliente_id;
set varPago = varPago - varSaldo;

if varPago = 0 then
set cont1 = 1;
end if;

else
insert into detallePago(PagosCredito_id,Monto,Factura_id) values(new.id,varPago,varIdFactura);
update factura set Saldo = Saldo-varPago where id = varIdFactura;
update cliente set Saldo = Saldo - varPago where id = new.Cliente_id;
set cont1 = 1;
end if;

fetch curFactura into varIdFactura,varSaldo;
end while;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER eliminarCredito
BEFORE DELETE ON pagoscredito
FOR EACH ROW
BEGIN
DELETE FROM detallepago WHERE PagosCredito_id = old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Existencias` float DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (31,'Producto 1',10,15.5),(32,'Producto 2',10,18.5),(33,'Producto 3',10,120),(34,'Producto 4',10,13.6),(35,'Producto 5',10,89),(36,'Producto 6',10,11.5),(47,'Producto 7',10,15.5),(48,'Producto 8',10,15.5),(49,'Producto 9',10,15.5),(50,'Producto 10',10,15.5),(51,'Producto 11',10,15.5),(52,'Producto 12',10,15.5),(53,'Producto 13',10,15.5),(54,'Producto 14',10,15.5),(55,'Producto 15',10,15.5),(56,'Producto 16',10,15.5),(67,'Producto 17',10,15.5),(68,'Producto 18',10,15.5),(69,'Producto 19',10,15.5),(70,'Producto 20',10,15.5),(71,'Producto 21',10,15.5),(72,'Producto 22',10,15.5),(73,'Producto 23',10,15.5),(74,'Producto 24',10,15.5),(75,'Producto 25',10,15.5),(76,'Producto 26',10,15.5),(77,'Producto 27',10,10),(93,'Producto 28',10,10),(94,'Producto 29',10,10),(95,'Producto 30',10,10),(96,'Producto 31',10,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15 21:47:30
