use RBD;

create table tPedidos(
    Id integer primary key auto_increment,
    Fecha date,
    Cantidad integer not null
);

create table tClases(
    Id integer primary key auto_increment,
    Nombre varchar(40) not null,
    Horarios integer not null
);

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