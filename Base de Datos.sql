CREATE DATABASE BIBLIOTECA_PUBLICA
USE BIBLIOTECA_PUBLICA

CREATE TABLE AUTORES
(
ID_AUTORS INT PRIMARY KEY NOT NULL identity (1,1),
NOMBRE VARCHAR(150),
AREA VARCHAR(50),
PERFIL VARCHAR(100)
)

CREATE TABLE LIBROS
(
ID_LIBRO INT PRIMARY KEY NOT NULL identity (1,1),
ID_AUTOR INT,
CODIGO VARCHAR(MAX),
NOMBRE VARCHAR(MAX),
EDITORIAL VARCHAR(MAX),
EDICION VARCHAR(MAX),
PERFIL VARCHAR(100),
ISBN INT,
CANTIDAD INT,
A�O INT,
PROVEEDOR VARCHAR(100),
FECHA VARCHAR(50),
STATUS VARCHAR(9) DEFAULT 'ACTIVO',
FOREIGN KEY (ID_AUTOR) REFERENCES AUTORES (ID_AUTORS)
)

  
CREATE TABLE MEMBRESIA
(
ID_MIEMBRO INT PRIMARY KEY NOT NULL identity (1,1), 
NOMBRE VARCHAR(MAX),
APELLIDO VARCHAR(MAX),
OCUPACION VARCHAR(50),
DIRECCION VARCHAR(MAX),
TELEFONO VARCHAR(12),
SEXO VARCHAR(25),
CORREO_ELECTRONICO VARCHAR(MAX),
COSTO INT,
TIPO VARCHAR (100),
STATUS VARCHAR(9) DEFAULT 'ACTIVO'
)

CREATE TABLE TIPO_MEMBRESIA
(
ID_TIPO INT PRIMARY KEY NOT NULL IDENTITY (1,1),
TIPO VARCHAR(MAX),
PRECIO INT
)


CREATE TABLE EMPLEADO
(
ID_EMPLEADO INT IDENTITY(2000,1) PRIMARY KEY NOT NULL,
NOMBRE VARCHAR (MAX),
APELLIDOS VARCHAR(MAX),
DIRECCI�N VARCHAR(MAX),
CONTRASE�A VARCHAR(MAX),
FECHA_NACIMIENTO varchar(50),
SEXO VARCHAR(25),
TELEFONO VARCHAR(12),
STATUS VARCHAR(9) DEFAULT 'ACTIVO'
)

CREATE TABLE COMPUTADORAS
(
ID_COMPUTADORA INT IDENTITY(3000,1) PRIMARY KEY NOT NULL,
TIPO VARCHAR(25),
PROVEEDOR VARCHAR(MAX)
)

CREATE TABLE SALAS
(
ID_SALAS INT IDENTITY (4000,1) PRIMARY KEY NOT NULL, 
NUM_SALA INT,
MAX_PERSONAS INT,
TIPO_EVENTOS VARCHAR(100),
)

CREATE TABLE PRESTAMO_LIBROS(
ID_PRESTAMO INT IDENTITY(5000,1) PRIMARY KEY NOT NULL,
ID_MIEMBRO INT FOREIGN KEY (ID_MIEMBRO) REFERENCES MEMBRESIA (ID_MIEMBRO) NOT NULL,
ID_LIBRO INT FOREIGN KEY (ID_LIBRO) REFERENCES LIBROS (ID_LIBRO) NOT NULL,
ID_EMPLEADO INT FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO (ID_EMPLEADO) NOT NULL,
FECHA_PRESTAMO varchar(50) NOT NULL,
FECHA_ENTREGA varchar(50) NOT NULL,
)

CREATE TABLE PRESTAMO_COMPUTADORA
(
ID_PRESTAMOC INT IDENTITY(6000,1) PRIMARY KEY NOT NULL, 
ID_MIEMC INT FOREIGN KEY (ID_MIEMC) REFERENCES MEMBRESIA (ID_MIEMBRO),
NOMBRE_M VARCHAR(MAX),
APELLIDO VARCHAR(MAX),
OCUPACION VARCHAR(50),
ID_COMP INT FOREIGN KEY (ID_COMP) REFERENCES COMPUTADORAS (ID_COMPUTADORA),
TIPO VARCHAR(25),
HORA_ENTRADA VARCHAR(5),
HORA_SALIDA VARCHAR(5),
STATUS VARCHAR(14) DEFAULT 'DISPONIBLE',
ID_EMP INT FOREIGN KEY (ID_EMP) REFERENCES EMPLEADO (ID_EMPLEADO)
)

CREATE TABLE PRESTAMO_SALAS
(
ID_PRESTAMOE INT IDENTITY(7000,1) PRIMARY KEY NOT NULL, 
NOMBRE_EVENTO VARCHAR(100),
NOMBRE_ENCARGADO VARCHAR(150),
FECHA_EVENTO VARCHAR(50),
DURACION VARCHAR(50),
NUM_ASISTENTES INT,
ID_SE INT FOREIGN KEY (ID_SE) REFERENCES SALAS (ID_SALAS),
NUM_SALA INT,
STATUS VARCHAR(14) DEFAULT 'DISPONIBLE',
ID_EMPL INT FOREIGN KEY (ID_EMPL) REFERENCES EMPLEADO (ID_EMPLEADO)
)

insert into empleado  (NOMBRE, APELLIDOS, DIRECCI�N, FECHA_NACIMIENTO, SEXO, TELEFONO, CONTRASE�A)
 values ('Alejandro', 'Garcia Carballo', 'Venecia #99 Fracc. Villa Dorada', '22/09/1995' , 'Masculino', '6621811797', '123')

 select * from empleado