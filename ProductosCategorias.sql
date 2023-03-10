use database RBD;

create table Productos(
    ProductosId int NOT NULL auto-increment,
    Nombre Varchar(40) NOT NULL,
    Color Varchar(10),
    Precio int NOT NULL,
    Descripcion varchar(250) NOT NULL,
    Imagen varchar(1000),
    CategoriaID int NOT NULL
);

create table Categoria(
    CategoriaId int NOT NULL auto-increment,
    Nombre varchar(20) NOT NULL,
    Imagen varchar(1000)
);

alter table Productos add constraint 'fk_CategoriaId' FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaId);

insert into Categorias('Nombre', 'Imagen') values ('Ropa','https://www.todo-yoga.net/wp-content/uploads/2018/07/camiseta-blanca-unisex-algoddon-416x416.jpg')
insert into Categorias('Nombre', 'Imagen') values ('Shaker','https://www.gastrolabweb.com/u/fotografias/fotosnoticias/2021/4/7/11334.jpg')
insert into Categorias('Nombre', 'Imagen') values ('Suplementos','https://chemaarguedas.com/cms/wp-content/uploads/2019/11/Captura-de-pantalla-2020-05-20-a-las-12.29.55.jpg')



insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Impact Whey Protein', 'Blanco','11,99', 'Este suero de alta calidad incluye 21 g de proteína por ración', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/10530943-1224889444460882.jpg','3')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Clear Whey Isolate','Rojo','30,99', ' A partir de nuestro aislado de suero de leche hidrolizado de la más alta calidad, hemos diseñado una versión más ligera y refrescante más similar a un zumo que a un batido de proteínas convencional.', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/12081396-1994792209042321.jpg','3') 
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('THE Whey','Blanca','43,99','Con 25 g de proteína por ración, a partir de una mezcla de proteína purificada única de concentrado de lactosuero, aislado de lactosuero y Lacprodan® HYDRO.','https://static.thcdn.com/images/large/webp//productimg/1600/1600/12968610-1775002146207435.jpg','3')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Pantalón corto Velocity', 'Verde frondoso', '27,99', 'Pantalón corto para hombre con tiro de 13 cm con bolsillos con cremallera','https://static.thcdn.com/images/large/webp//productimg/1600/1600/13763186-1895011271804925.jpg','1')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Sudadera con capucha y cremallera Tempo','Negro', '41,99','Sudadera con capucha y cremallera de corte recto para hombre','https://static.thcdn.com/images/large/webp//productimg/1600/1600/13459345-1414972603525218.jpg','1')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Camiseta sin mangas de entrenamiento con detalle gráfico','Negro','19,99', 'Camiseta sin mangas de corte recto', 'https://static.thcdn.com/images/large/webp//productimg/1600/1600/13115065-1504958671601910.jpg','1')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('BioTechUSA Shaker 600 ml','Blanco','12,66','Shaker de BioTechUSA para la mezcla perfecta de todos tus complementos nutricionales.Formato:Bote de 700 ml','https://contents.mediadecathlon.com/m10131669/k$70e04f94fd8527bbffd2a2dec7048e59/sq/biotechusa-shaker-600-ml-blanco.jpg?format=auto&f=800x0','2')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Agitador de acero inoxidable de 900 ml-SmartShake','Negro','18,90','Un agitador silencioso de alta calidad, diseño resistente, muy duradero y 100% impermeable, pesa sólo 170 gramos, gran abertura para facilitar la limpieza (sólo lavar a mano).','https://contents.mediadecathlon.com/m10084259/k$1b0a0c255d09f8dd8732773d98c0df96/sq/agitador-de-acero-inoxidable-de-900-ml-smartshake.jpg?format=auto&f=800x0','2')
insert into Productos ('Nombre', 'Color', 'Precio', 'Descripcion', 'Imagen', 'CategoriaID') values ('Classic Shaker 500 ml','Azul','8,99','Tapón con doble cierre de seguridad «clic-clac» audible y garantía de cero fugas. Asa de transporte para que puedas llevarte el shaker en tus desplazamientos deportivos','https://contents.mediadecathlon.com/p2402366/k$529b12e6c813b2562902a8ef4d8fa350/sq/classic-shaker-500-ml-azul.jpg?format=auto&f=800x0','2')

