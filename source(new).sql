<<<<<<< HEAD
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: RBD_GYM
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1

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
-- Table structure for table `tClases`
--

DROP TABLE IF EXISTS `tClases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tClases` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) NOT NULL,
  `Horarios` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tClases`
--

LOCK TABLES `tClases` WRITE;
/*!40000 ALTER TABLE `tClases` DISABLE KEYS */;
INSERT INTO `tClases` VALUES (1,'Yoga','8:30'),(2,'Spinning','12:30'),(3,'Boxeo','17:00'),(4,'Pilates','19:00'),(5,'Zumba','21:00');
/*!40000 ALTER TABLE `tClases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPedidos`
--

DROP TABLE IF EXISTS `tPedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPedidos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPedidos`
--

LOCK TABLES `tPedidos` WRITE;
/*!40000 ALTER TABLE `tPedidos` DISABLE KEYS */;
INSERT INTO `tPedidos` VALUES (1,'2022-11-30',4),(2,'2023-01-11',3),(3,'2023-01-05',2),(4,'2022-12-20',1),(5,'2022-12-09',3);
/*!40000 ALTER TABLE `tPedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tPersona`
--

DROP TABLE IF EXISTS `tPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tPersona` (
  `DNI` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Correo` varchar(200) DEFAULT NULL,
  `Pago` int(11) DEFAULT NULL,
  `Dirección` varchar(200) DEFAULT NULL,
  `Nºteléfono` int(11) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tPersona`
--

LOCK TABLES `tPersona` WRITE;
/*!40000 ALTER TABLE `tPersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tPersona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-30 13:50:42
=======
CREATE DATABASE RBD_GYM;

USE RBD_GYM;

CREATE TABLE tCarrito (
    ProductosId integer  NOT NULL  primary key auto_increment,
    Nombre Varchar(400) NOT NULL,
    Color Varchar(100),
    Precio varchar(100),
    Descripcion varchar(250) NOT NULL,
    Imagen varchar(2000),
    CategoriaID integer NOT NULL,
);

CREATE TABLE tPersona (
	IdPersona integer not null primary key auto_increment,
	dni varchar(50),
	nombre VARCHAR(500),
	correo VARCHAR(200),
    password varchar(20),
	Pago Integer,
	direccion varchar(2000),
	telefono Integer
);


create table tPedidos(
    Id integer primary key auto_increment,
    Fecha date,
    Cantidad integer not null
);

create table tClases(
    Id integer primary key auto_increment,
    Nombre varchar(40) not null,
    Horarios varchar(50)
);


create table tCategorias(
    CategoriaId integer NOT NULL  primary key auto_increment,
    Nombre varchar(20) NOT NULL,
    Imagen varchar(2000)
);

create table tProductos(
    ProductosId integer  NOT NULL  primary key auto_increment,
    Nombre Varchar(400) NOT NULL,
    Color Varchar(100),
    Precio varchar(100),
    Descripcion varchar(250) NOT NULL,
    Imagen varchar(2000),
    CategoriaID integer NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES tCategorias(CategoriaId)
);


INSERT INTO tPersona (dni, nombre, correo,password, Pago, direccion, telefono) VALUES ('54701531Q', 'John Smith', 'johnsmith@example.com',"1234", 30, '123 Main St', 5555551);
INSERT INTO tPersona (dni, nombre, correo,password, Pago, direccion, telefono) VALUES ("54701532Q", 'Jane Doe', 'janedoe@example.com', 30,"1234", '456 Park Ave',5555552);
INSERT INTO tPersona (dni, nombre, correo,password, Pago, direccion, telefono) VALUES ("54701533Q", 'Bob Johnson', 'bobjohnson@example.com',"1234", 30, '789 Elm St', 5555553);
INSERT INTO tPersona (dni, nombre, correo,password, Pago, direccion, telefono) VALUES ("54701534Q", 'Amy Miller', 'amymiller@example.com',"1234", 28, '321 Oak St', 5555554);
INSERT INTO tPersona (dni, nombre, correo,password, Pago, direccion, telefono) VALUES ("54701535Q", 'Mark Wilson', 'markwilson@example.com',"1234", 28,'654 Pine St', 5555555);

 
insert into tPedidos(Fecha, Cantidad) VALUES ("2022-11-30", "4");
insert into tPedidos(Fecha, Cantidad) VALUES ("2023-01-11", "3");
insert into tPedidos(Fecha, Cantidad) VALUES ("2023-01-05", "2");
insert into tPedidos(Fecha, Cantidad) VALUES ("2022-12-20", "1");
insert into tPedidos(Fecha, Cantidad) VALUES ("2022-12-09", "3");


insert into tClases(Nombre, Horarios) VALUES ("Yoga", "8:30");
insert into tClases(Nombre, Horarios) VALUES ("Spinning", "12:30");
insert into tClases(Nombre, Horarios) VALUES ("Boxeo", "17:00");
insert into tClases(Nombre, Horarios) VALUES ("Pilates", "19:00");
insert into tClases(Nombre, Horarios) VALUES ("Zumba", "21:00");




insert into tCategorias(Nombre, Imagen) values ('Ropa','https://www.todo-yoga.net/wp-content/uploads/2018/07/camiseta-blanca-unisex-algoddon-416x416.jpg');
insert into tCategorias(Nombre, Imagen) values ('Shaker','https://www.gastrolabweb.com/u/fotografias/fotosnoticias/2021/4/7/11334.jpg');
insert into tCategorias(Nombre, Imagen) values ('Suplementos','https://chemaarguedas.com/cms/wp-content/uploads/2019/11/Captura-de-pantalla-2020-05-20-a-las-12.29.55.jpg');




insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Impact Whey Protein', 'Blanco','11,99', 'Este suero de alta calidad incluye 21 g de proteína por ración', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/10530943-1224889444460882.jpg','3');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Clear Whey Isolate','Rojo','30,99', ' A partir de nuestro aislado de suero de leche hidrolizado de la más alta calidad, hemos diseñado una versión más ligera y refrescante más similar a un zumo que a un batido de proteínas convencional.', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/12081396-1994792209042321.jpg','3');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('THE Whey','Blanca','43,99','Con 25 g de proteína por ración, a partir de una mezcla de proteína purificada única de concentrado de lactosuero, aislado de lactosuero y Lacprodan® HYDRO.','https://static.thcdn.com/images/large/webp//productimg/1600/1600/12968610-1775002146207435.jpg','3');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Pantalón corto Velocity', 'Verde frondoso', '27,99', 'Pantalón corto para hombre con tiro de 13 cm con bolsillos con cremallera','https://static.thcdn.com/images/large/webp//productimg/1600/1600/13763186-1895011271804925.jpg','1');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Sudadera con capucha y cremallera Tempo','Negro', '41,99','Sudadera con capucha y cremallera de corte recto para hombre','https://static.thcdn.com/images/large/webp//productimg/1600/1600/13459345-1414972603525218.jpg','1');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Camiseta sin mangas de entrenamiento con detalle gráfico','Negro','19,99', 'Camiseta sin mangas de corte recto', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/13115065-1504958671601910.jpg','1');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('BioTechUSA Shaker 600 ml','Blanco','12,66','Shaker de BioTechUSA para la mezcla perfecta de todos tus complementos nutricionales.Formato:Bote de 700 ml','https://contents.mediadecathlon.com/m10131669/k$70e04f94fd8527bbffd2a2dec7048e59/sq/biotechusa-shaker-600-ml-blanco.jpg?format=auto&f=800x0','2');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Agitador de acero inoxidable de 900 ml-SmartShake','Negro','18,90','Un agitador silencioso de alta calidad, diseño resistente, muy duradero y 100% impermeable, pesa sólo 170 gramos, gran abertura para facilitar la limpieza (sólo lavar a mano).','https://contents.mediadecathlon.com/m10084259/k$1b0a0c255d09f8dd8732773d98c0df96/sq/agitador-de-acero-inoxidable-de-900-ml-smartshake.jpg?format=auto&f=800x0','2');
insert into tProductos (Nombre, Color, Precio, Descripcion, Imagen, CategoriaID) values ('Classic Shaker 500 ml','Azul','8,99','Tapón con doble cierre de seguridad «clic-clac» audible y garantía de cero fugas. Asa de transporte para que puedas llevarte el shaker en tus desplazamientos deportivos','https://contents.mediadecathlon.com/p2402366/k$529b12e6c813b2562902a8ef4d8fa350/sq/classic-shaker-500-ml-azul.jpg?format=auto&f=800x0','2');
>>>>>>> 446e82e860848b750001a57a212d3b0a91d1d363
