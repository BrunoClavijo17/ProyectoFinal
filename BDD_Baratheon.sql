create database bdd_baratheon;
use bdd_baratheon;

create table Insumos(
cod_Insumo varchar(20) primary key ,
nom_Insumo varchar(30) NOT NULL,
area_Insumo varchar(12) NOT NULL,
estado_Insumo varchar(12) NOT NULL,
fechaCompra_Insumo date NOT NULL,
nom_donador varchar(20)
);

create table Usuarios(
CI_Usuario varchar(8) primary key,
pNom_Usuario varchar(30) NOT NULL,
sNom_Usuario varchar(30) ,
pApe_Usuario varchar(30) NOT NULL,
sApe_Usuario varchar(30),
contrasena_Usuario varchar(20) NOT NULL,
tipo_Usuario varchar(15) NOT NULL,
email_Usuario varchar(50) NOT NULL,
area_Usuario varchar(12)

);
create table Logeo(
FK_CI_Usuario varchar(8) NOT NULL,
fechahoraInicio_Logeo datetime NOT NULL,
fechahoraCierre_Logeo datetime NOT NULL,

PRIMARY KEY (FK_CI_Usuario, fechahoraInicio_Logeo , fechahoraCierre_Logeo),

FOREIGN KEY (FK_CI_Usuario) REFERENCES Usuarios(CI_Usuario));


create table Tickets(
cod_Ticket INT(15) primary key AUTO_INCREMENT ,
CI_Ticket varchar(8)  NOT NULL,
nom_Ticket varchar(20) NOT NULL,
ape_Ticket varchar(20) NOT NULL,
estado_Ticket varchar(8) ,
prioridad_Ticket varchar(5) NOT NULL,
detalles_Ticket varchar(500) NOT NULL,
asunto_Ticket varchar(100) NOT NULL,
area_Ticket varchar(10) NOT NULL,
email_Ticket varchar(50) NOT NULL,
fecha_Ticket date NOT NULL,
hora_Ticket time NOT NULL



);

create table HistoricoTicket(
FK_CI_Usuario varchar(8) NOT NULL,
FK_cod_Ticket INT(15) NOT NULL,
informe_TicketCerrado varchar(500) NOT NULL,
estado_HistoricoTicket varchar (12) NOT NULL, 
fechaCierre_TicketCerrado date NOT NULL,
horaCierre_TicketCerrado time NOT NULL,



	PRIMARY KEY (FK_CI_Usuario, FK_cod_Ticket),
	FOREIGN KEY(FK_CI_Usuario) REFERENCES Usuarios(CI_Usuario),
	FOREIGN KEY(FK_cod_Ticket) REFERENCES Tickets(cod_Ticket)

	);

create table Gestiona (
FK_CI_Usuario varchar(8) NOT NULL,
FK_cod_Insumo varchar(20) NOT NULL,

	PRIMARY KEY (FK_CI_Usuario, FK_cod_Insumo),
	FOREIGN KEY(FK_CI_Usuario) REFERENCES Usuarios(CI_Usuario),
	FOREIGN KEY(FK_cod_Insumo) REFERENCES Insumos(cod_Insumo)

);

create table EstadosInsumos(

FK_cod_Insumo varchar(20) NOT NULL,
Nom_EstadosInsumos varchar(12) NOT NULL,
area_EstadosInsumos varchar(12) NOT NULL,
estado_EstadosInsumos varchar(5) NOT NULL,
Fecha_EstadosInsumos date NOT NULL, 

PRIMARY KEY (FK_cod_Insumo, Nom_EstadosInsumos, Fecha_EstadosInsumos, estado_EstadosInsumos),

FOREIGN KEY (FK_cod_Insumo) REFERENCES Insumos (cod_Insumo)

);

Insert into EstadosInsumos
VALUES
("1","Monitor" , "6T" , "Baja" , '2019-8-9'), 
("2","Mouse" , "Taller" , "Alta" , '2018-4-2'), 
("3","Mouse" , "Salones" , "Baja" , '2018-10-1'), 
("4","Teclado" , "Sala" , "Alta" , '2017-12-11'), 
("5","Teclado" , "Oficinas" , "Baja" , '2020-2-10'), 
("6","Router" , "Sala" , "Baja" , '2019-5-2'), 
("7","Switch" , "Sala" , "Alta" , '2020-5-1'), 
("8","Laptop" , "Taller" , "Baja" , '2019-2-3'), 
("9","Laptop" , "6T" , "Alta" , '2019-4-1'), 
("10","Monitor" , "Oficinas" , "Alta" , '2020-2-28'),

 ("1","Monitor" , "6T" , "Baja" , '2020-8-9'), 
("2","Mouse" , "6T" , "Baja" , '2018-5-10'),
("2","Mouse"  , "Taller" , "Alta" , '2018-5-17'), 
("3","Mouse"  , "Salones" , "Baja" , '2019-10-1'), 
("4","Teclado" , "Sala" ,  "Baja" , '2018-3-7'),
("4","Teclado" , "6T" , "Alta" , '2018-4-2'), 
("5","Teclado" , "Oficinas" , "Baja", '2020-5-30'), 
("6","Router" , "Sala" , "Baja" , '2019-7-22'), 
("7","Switch" , "Sala" , "Baja" , '2020-7-1'),
("7","Switch" , "Taller" , "Alta" , '2020-7-10'), 
("8","Laptop" , "Taller" , "Baja" , '2019-4-13');







Insert into Insumos (cod_Insumo, nom_Insumo, area_Insumo, estado_Insumo, fechaCompra_Insumo, nom_donador)
values ("1","Monitor" , "6T" , "Baja" , '2019-8-9' , ""), 
("2","Mouse" , "Taller" , "Alta" , '2018-4-2' , ""), 
("3","Mouse" , "Salones" , "Baja" , '2018-10-1', ""), 
("4","Teclado" , "Sala" , "Alta" , '2017-12-11', ""), 
("5","Teclado" , "Oficinas" , "Baja" , '2020-2-10' , ""), 
("6","Router" , "Sala" , "Baja" , '2019-5-2' , ""), 
("7","Switch" , "Sala" , "Alta" , '2020-5-1' , ""), 
("8","Laptop" , "Taller" , "Baja" , '2019-2-3', "Plan Ceibal"), 
("9","Laptop" , "6T" , "Alta" , '2019-4-1', "Plan Ceibal"), 
("10","Monitor" , "Oficinas" , "Alta" , '2020-2-28' , "");



Insert into Usuarios (CI_Usuario, pNom_Usuario, sNom_Usuario, pApe_Usuario, sApe_Usuario, contrasena_Usuario, tipo_Usuario, email_Usuario, area_Usuario)
values ("52619166", "Bruno", "Nicolas", "Clavijo" , "Trujillo" , "1234" , "Administrador" , "bclavijo@liceoimpulso.edu.uy", ""),
("52902014", "Sergio", "", "Maidana" , "Masner" , "1234" , "Administrador" , "smaidana@liceoimpulso.edu.uy", ""),
("52866765", "Daysi", "Evelyn", "Gonzalez" , "Macedo" , "1234" , "Tecnico" , "dgonzalez@liceoimpulso.edu.uy", "Oficinas"),
("53054753", "Damian", "Eloy", "Suarez" , "Facelli" , "1234" , "Reporte" , "dsuarez@liceoimpulso.edu.uy", ""),
("51160437", "Lucas", "", "Cespedes" , "" , "1234" , "Tecnico" , "lcespedes@liceoimpulso.edu.uy", "Salones"),
("53779640", "Ivan", "", "Zapater" , "" , "1234" , "Tecnico" , "izapater@liceoimpulso.edu.uy", "6T"),
("54909337", "Richard", " ", "Suarez" , " " , "1234" , "Tecnico" , "rsuarez@liceoimpulso.edu.uy", "Sala"),
("54909268", "Fernando", " ", "Suarez " , " " , "1234" , "Tecnico" , "fsuarez@liceoimpulso.edu.uy", "Taller"),
("56831419", "Ezequiel", "Dario", "Diaz" , "Garcia" , "1234" , "Administrador" , "ezdiaz@liceoimpulso.edu.uy", ""),
("52096445", "Facundo", "Nahuel ", "Muñoz" , "Pereira " , "1234" , "Reporte" , "fmunoz@liceoimpulso.edu.uy", "");

insert into Logeo
values ("52619166", '2019-3-17 12:47:12', '2019-3-17 13:00:02'),
("52902014", '2019-2-25 11:16:57', '2019-2-25 11:28:14'),
("52866765", '2020-8-14 14:01:36', '2020-8-14 14:30:16'),
("53054753", '2020-3-21 12:12:12', '2020-3-21 12:21:47'),
("51160437", '2020-4-7 10:17:15', '2020-4-7 10:22:08'),
("53779640", '2019-9-17 15:40:37', '2019-9-17 15:45:22'),
("54909337", '2019-4-12 12:47:13', '2019-4-12 13:00:01'),
("54909268", '2020-7-5 07:55:53', '2020-7-5 08:00:18'),
("56831419", '2020-6-29 12:47:12', '2020-6-29 13:02:11'),
("52096445", '2019-5-12 08:02:12', '2019-5-12 8:12:16');


insert into Tickets ( CI_Ticket, nom_Ticket, ape_Ticket, estado_Ticket,  prioridad_Ticket, detalles_Ticket, asunto_Ticket,area_Ticket,email_Ticket, fecha_Ticket, hora_Ticket)
values ("52619166","Bruno","Clavijo","Cerrado","Alta","De un momento al otro no prendio mas el equipo"," Software ","Taller","bclavijo@liceoimpulso.edu.uy", '2020-06-21' , NOW()),
("43122233","Ignacio","Hernandez","Cerrado","Baja","Se cayo un mouse y dejo de funcionar","Hardware ","Salones","ihernandez@liceoimpulso.edu.uy",'2020-07-12'  , NOW()),
("54326755","Axel","Rodriguez","Cerrado","Alta","Pantallazo azul","Software ","6T","arodriguez@liceoimpulso.edu.uy",'2020-06-28'  , NOW()),
("54332564","Ezequiel","Diaz","Cerrado","Baja","Se rompio un cargador","Hardware ","Taller","ezdiaz@liceoimpulso.edu.uy", '2020-08-22' , NOW()),
("52866765","Daysi","Gonzalez","Cerrado","Media","Una laptop no tiene Sistema Operativo instalado","Software ","Taller","dgonzalez@liceoimpulso.edu.uy", '2020-04-1' , NOW()),
("49235349","Leticia","De los Santos","Cerrado","Baja","El equipo de docente del taller no enciende ","Software ","Taller","ldelossantos@liceoimpulso.edu.uy", '2020-06-21' , NOW()),
("52902014","Sergio","Maidana","Cerrado","Media","Pantallazo azul en maquina de taller","Software","Taller","smaidana@liceoimpulso.edu.uy", '2020-01-1' , NOW()),
("12906645","Nicole","Uhualde","Cerrado","Media","El equipo de docente de la sala no enciende ","Software ","Sala","ldelossantos@liceimpulso.edu.uy", '2020-08-10' , NOW()),
("85235672","Fernando","Suarez","Cerrado","Alta","No enciende el equipo de la oficina","Hardware ","Oficinas","fsuarez@liceoimpulso.edu.uy", '2020-06-2' , NOW()),
("54693061","Amaique","Cardozo","Cerrado","Baja","Limpie el teclado con alchohol y este dejo funcionar", "Hardware ","Taller","acardoso@liceoimpulso.edu.uy", '2020-03-3' , NOW()),
("54693061","Amaique","Cardozo","Abierto","Baja","Limpie el teclado con alchohol y este dejo funcionar", "Hardware ","Taller","acardoso@liceoimpulso.edu.uy", '2020-03-3' , NOW());



insert into Gestiona (FK_CI_Usuario, FK_cod_Insumo)
VALUES(52902014, 2730),
(52902014, 1237),
(52866765, 6866),
(53054753, 1100),
(52866765, 1289),
(52902014, 2777),
(52866765, 8724),
(52866765, 0010),
(52619166, 0553),
(53054753, 4002);


insert into HistoricoTicket (FK_CI_Usuario, FK_cod_Ticket , informe_TicketCerrado , estado_HistoricoTicket , fechaCierre_TicketCerrado , horaCierre_TicketCerrado )
values 
("54909268" , "1", "Se cambio el cable de poder", "Cerrado" , '2020/09/12', '20:22:54'),
("51160437" , "2", "No tiene arreglo", "Cerrado"  , '2020/09/12', '22:32:22'),
("53779640" , "3", "Se formateo el pc", "Cerrado"  , '2020/09/01', '20:26:08'),
("54909268" , "4", "No tiene arreglo ", "Cerrado"  , '2020/09/23', '12:54:47'),
("54909268" , "5", "Se le instalo un sistema operativo", "Cerrado"  , '2020/10/11', '17:54:52'),
("54909268" , "6", "Se cambio el cable de poder", "Cerrado"  , '2020/11/25', '20:07:33'),
("54909268" , "7", "Se formateo la pc", 'Cerrado', "2020/12/09"  , '15:03:14'),
("54909337" , "8", "Memoria ram mal colocada, se coloco correctamente", "Cerrado"  , '2020/9/30', '08:47:53'),
("52866765" , "9", "Se cambio el cable de poder", "Cerrado"  , '2020/10/17', '19:15:21'),
("54909268" , "10", "No tiene arreglo", "Cerrado"  , '2020/11/10', '22:09:22');

/* 1 */

create view Consulta1 As

select * from tickets

where cod_Ticket NOT IN (select FK_cod_Ticket from HistoricoTicket);

/* 2 */

create view Consulta2 As

select count(*), area_Ticket from Tickets

GROUP BY (area_Ticket);

/* 3 */


create view Consulta3 As

select pNom_Usuario As Nombre, pApe_Usuario As apellido

from usuarios

inner join Tickets
ON area_Ticket = ((select area_Ticket  from
(SELECT count(*) As cantidad, area_Ticket

FROM tickets
GROUP BY area_Ticket

ORDER BY cantidad DESC
LIMIT 1) As T)) AND area_Ticket = area_Usuario GROUP BY (pNom_Usuario);

/* 4 */

create view Consulta4 As

select  Tickets.cod_Ticket , fecha_Ticket As "Fecha que se abrio" , fechaCierre_TicketCerrado As "Fecha que fue cerrado" , TIMESTAMPDIFF (day,fecha_Ticket, fechaCierre_TicketCerrado) As "Diferencia de dias"
from Tickets
inner join HistoricoTicket
on Tickets.cod_Ticket = HistoricoTicket.FK_cod_Ticket;

/* 5 */

 create view Consulta5 As
 
select nom_Insumo as "Nombre de insumo", count(*) as "Cantidad de insumos" from Insumos group by (nom_Insumo);


 

/* PROFE, ESTA ES LA CREACION DE USUARIOS. LOS CREAMOS Y COPIAMOS EL CODIGO TAL CUAL NOS DIJISTE PERO NOS SALE UN ERROR QUE DESCONOCEMOS.

*CREATE USER 'tecnico'@'%' IDENTIFIED WITH mysql_native_password AS 'impulso2020';GRANT USAGE ON . TO 'tecnico'@'%' ;
*GRANT SELECT, INSERT, UPDATE (estado_Insumo), DELETE ON bdd_proyecto.insumos TO 'tecnico'@'%';

*GRANT SELECT, INSERT, UPDATE, DELETE ON bdd_proyecto.* TO 'administrador'@'%';

*CREATE USER 'reporte'@'%' IDENTIFIED WITH mysql_native_password AS 'impulso2020';GRANT USAGE ON . TO 'reporte'@'%';
*GRANT SELECT ON bdd_proyecto.insumos TO 'reporte'@'%';
*GRANT SELECT ON bdd_proyecto.tickets TO 'reporte'@'%';

*CREATE USER 'invitado'@'%' IDENTIFIED WITH mysql_native_password AS '';GRANT USAGE ON . TO 'invitado'@'%' ;
*GRANT INSERT ON bdd_proyecto.tickets TO 'invitado'@'%';+
*GRANT SELECT (FK_CI_Usuario, FK_cod_Ticket, informe_TicketCerrado) ON bdd_proyecto.ticketcerrado TO 'invitado'@'%';

*CREATE USER 'superadmin'@'%' IDENTIFIED WITH mysql_native_password AS 'admin';GRANT ALL PRIVILEGES ON . TO 'superadmin'@'%' ;
[18:18]
***
*/




/* consultas que pidio leticia */



select nom_Insumo, count(*) from insumos where nom_Insumo = "Mouse" AND estado_Insumo = "Alta";


select nom_Insumo, count(*) from insumos where nom_Insumo = "Teclado" AND estado_Insumo = "Baja";


SELECT nom_Insumo, COUNT(*) from insumos where nom_Insumo = "Laptop" and fechaCompra_Insumo <= "2019-12-31";

/*6*/
create view Consulta6 As
SELECT cod_Insumo, nom_Insumo, area_Insumo
from insumos;

/* 7 */
create view Consulta7 As
SELECT * from estadosinsumos;


/* 8 */

create view Consulta8 As
select cod_Insumo, nom_Insumo, nom_Donador, fechaCompra_Insumo as "Fecha ingreso"
from insumos
where nom_Donador != "";


/* 9 */

create view Consulta9 As
select cod_Ticket as Codigo , pNom_Usuario as "Nombre tecnico", pApe_Usuario as "Apellido tecnico", area_Ticket as Area, fecha_Ticket as "Fecha que se abrio", fechaCierre_TicketCerrado as "Fecha que se cerró" 

from HistoricoTicket 

right join tickets on tickets.cod_Ticket = HistoricoTicket.FK_cod_Ticket 

left join usuarios on HistoricoTicket.FK_CI_Usuario = usuarios.CI_Usuario;

/* 10 */

create view Consulta10 As
select * from Logeo;




