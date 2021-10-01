DROP DATABASE prueba_venta_de_vehiculos;
CREATE DATABASE prueba_venta_de_vehiculos;
USE prueba_venta_de_vehiculos;
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     21/10/2013 10:45:19                          */
/*==============================================================*/


drop table if exists CATEGORIA;

drop table if exists DATOSPERSONALES;

drop table if exists ROL;

drop table if exists USUARIO;

drop table if exists USUARIO_ROL;

drop table if exists VEHICULO;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   CATID                int not null auto_increment,
   CATIPO               varchar(50),
   primary key (CATID)
);

/*==============================================================*/
/* Table: DATOSPERSONALES                                       */
/*==============================================================*/
create table DATOSPERSONALES
(
   DATID                int not null auto_increment,
   USUID                int,
   DATNOMBRE            varchar(50),
   DATAPELLIDO          varchar(50),
   DATIPOID             varchar(20),
   DATNUMEROID          varchar(20),
   DATELEFONO           varchar(20),
   DATCORREO            varchar(50),
   primary key (DATID)
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   ROLID                int not null auto_increment,
   ROLTIPO              varchar(50),
   primary key (ROLID)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   USUID                int not null auto_increment,
   USULOGIN             varchar(20),
   USUPASSWORD          varchar(20),
   primary key (USUID)
);

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL
(
   ROLID                int not null,
   USUID                int not null,
   primary key (ROLID, USUID)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO
(
   VEHPLACA             varchar(10) not null,
   DATID                int,
   CATID                int,
   VEHMODELO            int,
   VEHMARCA             varchar(50),
   VEHESTADO            varchar(30),
   VEHPRECIO            int,
   primary key (VEHPLACA)
);

alter table DATOSPERSONALES add constraint FK_RELATIONSHIP_1 foreign key (USUID)
      references USUARIO (USUID) on delete restrict on update restrict;

alter table USUARIO_ROL add constraint FK_RELATIONSHIP_2 foreign key (USUID)
      references USUARIO (USUID) on delete restrict on update restrict;

alter table USUARIO_ROL add constraint FK_RELATIONSHIP_3 foreign key (ROLID)
      references ROL (ROLID) on delete restrict on update restrict;

alter table VEHICULO add constraint FK_REFERENCE_5 foreign key (CATID)
      references CATEGORIA (CATID) on delete restrict on update restrict;

alter table VEHICULO add constraint FK_REFERENCE_6 foreign key (DATID)
      references DATOSPERSONALES (DATID) on delete restrict on update restrict;
      
INSERT INTO ROL(roltipo) VALUES('Comprador');
INSERT INTO ROL(roltipo) VALUES('Vendedor');

SELECT u.usuid, u.usulogin, u.usupassword, r.rolid, r.roltipo
FROM USUARIO u INNER JOIN USUARIO_ROL ur
ON u.usuid = ur.usuid INNER JOIN ROL r
ON r.rolid = ur.rolid;
