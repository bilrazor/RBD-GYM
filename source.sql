CREATE DATABASE RBD_GYM;

USE RBD_GYM;

CREATE TABLE tPersona (
id integer primary key auto_increment,
DNI varchar(20),
Nombre VARCHAR(50),
Correo VARCHAR(200),
Pago Integer,
Dirección varchar(200),
Nºteléfono Integer
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


create table Categoria(
    CategoriaId integer NOT NULL auto_increment,
    Nombre varchar(20) NOT NULL,
    Imagen varchar(2000)
);

create table Productos(
    ProductosId integer NOT NULL auto_increment,
    Nombre Varchar(40) NOT NULL,
    Color Varchar(10),
    Precio integer NOT NULL,
    Descripcion varchar(250) NOT NULL,
    Imagen varchar(2000),
    CategoriaID integer NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaId)
)


INSERT INTO tPersona (id,DNI, Nombre, Correo, Pago, Dirección, Nºteléfono) VALUES ("54701531Q", 'John Smith', 'johnsmith@example.com', 30, '123 Main St', 5555551);
INSERT INTO tPersona (id,DNI, Nombre, Correo, Pago, Dirección, Nºteléfono) VALUES ("54701532Q", 'Jane Doe', 'janedoe@example.com', 30, '456 Park Ave',5555552);
INSERT INTO tPersona (id,DNI, Nombre, Correo, Pago, Dirección, Nºteléfono) VALUES ("54701533Q", 'Bob Johnson', 'bobjohnson@example.com', 30, '789 Elm St', 5555553);
INSERT INTO tPersona (id,DNI, Nombre, Correo, Pago, Dirección, Nºteléfono) VALUES ("54701534Q", 'Amy Miller', 'amymiller@example.com', 28, '321 Oak St', 5555554);
INSERT INTO tPersona (id,DNI, Nombre, Correo, Pago, Dirección, Nºteléfono) VALUES ("54701535Q", 'Mark Wilson', 'markwilson@example.com', 28,'654 Pine St', 5555555);

 
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




insert into Categorias('Nombre', 'Imagen') values ('Ropa','https://www.todo-yoga.net/wp-content/uploads/2018/07/camiseta-blanca-unisex-algoddon-416x416.jpg');
insert into Categorias('Nombre', 'Imagen') values ('Shaker','https://www.gastrolabweb.com/u/fotografias/fotosnoticias/2021/4/7/11334.jpg');
insert into Categorias('Nombre', 'Imagen') values ('Suplementos','https://chemaarguedas.com/cms/wp-content/uploads/2019/11/Captura-de-pantalla-2020-05-20-a-las-12.29.55.jpg');



insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Impact Whey Protein', 'Blanco','11,99', 'w','3');
