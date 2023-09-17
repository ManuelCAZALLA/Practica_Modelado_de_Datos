create schema Vehiculos;

create table Vehiculo (
   id_vehiculo serial  not null,   matricula varchar (30)primary key,
   id_marca int  not null,
   id_color int not null,
   km_totales float not null,
   fecha_compra date not null,
   id_poliza int not null,
   id_aseguradora int not null
   
);

create table Marca (
   id_marca serial primary key not null,
   nombre_marca varchar (30) not null,
   id_grupo int
);

create table Modelo (
    id_modelo serial primary key not null,
    id_marca int not null,
    nombre_modelo varchar (30) not null
);

create table Grupo_Empresarial ( 
     id_grupo serial primary key not null,
     nombre_grupo varchar(50) not null
);


create table polizas(
	 id_poliza serial primary key not null,
	 n_poliza varchar (50) not null,
	 fecha_alta date not null
);

create table Revision (
    id_revision serial  not null,
    matricula_coche varchar primary key not null ,
    km_revision float not null,
    fecha_revision date not null,
    id_moneda int not null,
    importe float not null,    n_revisiones int not null
);
create table Moneda (
    id_moneda serial primary key not null,
    nombre_moneda varchar(30) not null
);
create table Colores (
     id_color serial primary key not null,
     nombre_color varchar (20) not null
);
create table Aseguradoras (
	 id serial primary key not null,
	 nombre_aseguradora varchar (30) not null,
	 id_poliza serial not null
);

-- Relación de tablas

alter table vehiculos.revision  add constraint fk_matricula foreign key (matricula_coche) references vehiculos.vehiculo (matricula);
alter table vehiculos.vehiculo  add constraint fk_color foreign key (id_color) references vehiculos.colores(id_color);
alter table vehiculos.vehiculo add constraint fk_marca foreign key (id_marca) references vehiculos.marca (id_marca);
alter table vehiculos.vehiculo add constraint fk_seguro foreign key (id_poliza) references vehiculos.polizas (id_poliza);
alter table vehiculos.marca  add constraint fk_grupo foreign key (id_grupo) references vehiculos.grupo_empresarial (id_grupo);
alter table vehiculos.revision  add constraint fk_moneda foreign key (id_moneda) references vehiculos.moneda (id_moneda);
alter table vehiculos.marca  add constraint pk_modelo foreign key (id_marca) references vehiculos.modelo (id_modelo);
alter table vehiculos.aseguradoras  add constraint fk_polizas foreign key (id_poliza) references vehiculos.polizas(id_poliza);
alter table vehiculos.vehiculo add constraint fh_aseguradora foreign key (id_aseguradora) references vehiculos.aseguradoras(id);

--Insercción de datos

insert into vehiculos.colores (id_color, nombre_color) values 
(1,'Verde'),(2,'Blanco'),(3,'Gris Plateado'),(4,'Azul'),(5,'Negro'),(6,'Rojo') ;

insert into vehiculos.grupo_empresarial (id_grupo ,nombre_grupo) values 
(1,'Hyunday Motor Group'),(2,'PSA Peugeot S.A'),(3,'Renault-Nissan-Mitsubihi Alliance');

insert into vehiculos.moneda (id_moneda ,nombre_moneda ) values 
(1,'Peso Colombiano'),(2,'Dollar'),(3,'Peso Mexicano'),(4,'Euro');
 


insert into vehiculos.polizas  (id_poliza,n_poliza, fecha_alta) values
(1,25786,'2009-06-01'),(2,195433,'2010-04-17'),(3,11071,'2011-08-23'),(4,79842,'2008-03-03'),(5,45889,'2015-09-08'),
(6,11998,'2014-09-08'),(7,65779,'2013-10-04'),(8,58777,'2009-07-13'),(9,64747,'2012-08-07'),(10,9776,'2005-04-01'),
(11,66332,'2018-08-04'),(12,44778,'2010-03-02'),(13,58494,'2020-10-18'),(14,44839,'2018-12-12'),(15,38894,'2019-07-04');

insert into vehiculos.aseguradoras (id,nombre_aseguradora) values 
(1,'Allianz'),(2,'Mapfre'),(3,'Axa'),(4,'Generali');


insert into vehiculos.modelo (id_modelo,id_marca,nombre_modelo) values
(1,5,'5008'),(2,7,'i30'),(3,1,'Clio'),(4,6,'Duster'),(5,1,'Megane'),(6,3,'Qashqai'),(7,2,'DS4'),(8,6,'Lodgy'),
(9,3,'Leaf'),(10,4,'Ceed'),(11,4,'Rio'),(12,5,'206'),(13,2,'Berlingo'),(14,1,'Kangoo'),(15,7,'Tucson');


insert into vehiculos.marca  (id_marca ,nombre_marca, id_grupo) values 
(1,'Renault',3),(2,'Citroen',2),(3,'Nissan',3),(4,'Kia',1),(5,'Peugeot',2),(6,'Dacia',3),(7,'Hyundai',1);


insert into vehiculos.vehiculo (id_vehiculo,matricula,id_marca,id_color,km_totales,fecha_compra,id_poliza,id_aseguradora) values 
(1,'7343FRT',1,6,47.644,'2011-06-01',3,1),(2,'2438GSV',2,3,52.349,'2010-04-17',2,2),(3,'9466JOL',3,2,70.456,'2008-03-29',4,3),
(4,'7987YTG',4,4,24.726,'2015-05-09',5,4),(5,'4325kMF',2,1,77.890,'2019-08-23',15,4),(6,'6231KKQ',6,5,39.654,'2018-11-24',14,3),
(7,'0827FSF',1,4,82.890,'2010-11-08',12,2),(8,'4367TFG',7,6,74.568,'2020-10-13',11,1),(9,'0366GUI',5,4,118.897,'2020-04-02',13,2),
(10,'1567PLI,',4,2,76.009,'2015-10-13',1,3),(11,'3230XDT',3,6,65.008,'2015-06-01',6,4),(12,'8802RTY',6,3,97.331,'2015-09-23',7,1),
(13,'8706RHU',7,5,30.767,'2019-03-02',8,3),(14,'2428FTF',1,4,120.534,'2000-04-20',9,2),(15,'5047HER',2,6,45.690,'2018-03-27',10,1);

insert into vehiculos.revision (id_revision,matricula_coche,km_revision,fecha_revision,id_moneda,importe,n_revisiones)
values (1,'7343FRT',25.045,'2005-07-02',3,1076023.5,1),(2,'2438GSV',15.045,'2014-04-03',4,45.50,2),(3,'9466JOL',60.034,'2020-09-10',2,40.10,2),
(4,'7987YTG',10.041,'2022-01-17',1,791.8,1),(5,'4325kMF',65.090,'2021-06-12',4,51.40,3),(6,'6231KKQ',20.898,'2022-07-01',3,10265.9,1),
(7,'0827FSF',74.003,'2019-09-05',2,47.8,3),(8,'4367TFG',50.454,'2018-04-24',4,54.80,5),(9,'0366GUI',90.087,'2018-05-25',2,56.90,6),
(10,'1567PLI,',20.657,'2019-04-12',1,387.9,4),(11,'3230XDT',30.565,'2018-09-02',4,45.78,4),(12,'8802RTY',67900,'2022-07-06',3,1783.9,7),
(13,'8706RHU',12.098,'2023-08-12',4,45.98,2),(14,'2428FTF',100.898,'2020-11-02',2,50.60,10),(15,'5047HER',27.763,'2020-12-09',4,30.90,3);



-- consultas

  
 select distinct
  M.nombre_modelo as "Nombre del Modelo",
  Ma.nombre_marca as "Marca",
  GE.nombre_grupo as "Grupo",
  V.fecha_compra as "Fecha de Compra",
  V.matricula as "Matricula",
  C.nombre_color as "Color del Coche",
  V.km_totales as "Total de Kilómetros",
  A.nombre_aseguradora as "Empresa Aseguradora",
  P.n_poliza as "Número de Póliza"
	from Vehiculo as V
	inner join Marca as Ma on V.id_marca = Ma.id_marca
	inner join Modelo AS M on Ma.id_marca = M.id_marca
	inner join Grupo_Empresarial as GE on Ma.id_grupo = GE.id_grupo
	inner join Colores as C on V.id_color = C.id_color
	inner join Aseguradoras as A on V.id_aseguradora = A.id
	inner join polizas as P on V.id_poliza = P.id_poliza
	where 
  M.nombre_modelo is not null and
  Ma.nombre_marca is not null and
  GE.nombre_grupo is not null and
  V.fecha_compra is not null and
  V.matricula is not null and
  C.nombre_color is not null and
  V.km_totales is not null and
  A.nombre_aseguradora is not null and
  P.n_poliza is not null;



