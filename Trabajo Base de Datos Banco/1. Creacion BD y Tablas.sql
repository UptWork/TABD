--CREACION DE BASE DE DATOS--
--Creacion de Filegroups (Se utilizo la ubicacion C:\ para evitar problemas al testearlo por el docente
--entendemos que estos archivos deben estar aislados y separados para mayor productividad y seguridad....
CREATE DATABASE Banco
ON PRIMARY (
NAME = N'Banco',
FILENAME = N'C:\Banco.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB),
FILEGROUP FG_PERSON(
NAME = N'Person',
FILENAME = N'C:\Person.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB), 
FILEGROUP FG_CUENTAS (
NAME = N'Cuentas',
FILENAME = N'C:\Cuentas.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB),
FILEGROUP FG_UBICACION(
NAME = N'Ubicacion',
FILENAME = N'C:\Ubicacion.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB) 
,FILEGROUP FG_TRANSACCION(
NAME = N'Transaccion',
FILENAME = N'C:\Transaccion.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB)
,FILEGROUP FG_HISTORIAL(
NAME = N'Historial',
FILENAME = N'C:\Historial.mdf',
SIZE = 50MB,
FILEGROWTH = 10MB) 
LOG ON (
NAME = N'Banco_log',
FILENAME = N'C:\Banco_log.ldf',
SIZE = 100MB,
FILEGROWTH = 10MB)
GO

--Uso de la base de datos "Banco"	
USE Banco
GO

---------------------------------------------------------------------------------------------
--Creacion del Esquema "Person"
CREATE SCHEMA Person AUTHORIZATION dbo
GO

--Creacion de la tabla Persona la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.PERSONA (
	idPersona BIGINT IDENTITY not null,
	indActivo VARCHAR(1) not null
		CONSTRAINT default_persona_indActivo default 'A',
	fechaRegistro DATETIME not null
		constraint default_persona_fecRegistro default GETDATE(),
	codUsuario varchar(30) not null
		constraint default_persona_codUsuario default suser_name(),
	constraint PK_Person_PERSONA primary key (idPersona)
)
GO

--Creacion de la tabla PERSONA_NATURAL la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.PERSONA_NATURAL (
	idPersona BIGINT not null,
	primerNombre varchar(30) not null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30) not null,
	fechaNacimiento date not null,
	sexo varchar(1) not null,
	constraint PK_Person_PERSONA_NATURAL primary key (idPersona),
	constraint FK_Person_PERSONA_X_PERSONA_NATURAL foreign key(idPersona) references Person.PERSONA(idPersona)
)
GO

----Creacion de la tabla PERSONA_JURIDICA la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.PERSONA_JURIDICA (
	idPersona BIGINT not null,
	razonSocial varchar(50) not null,
	descripcion varchar(100) null,
	constraint PK_Person_PERSONA_JURIDICA primary key(idPersona),
	constraint FK_Person_PERSONA_X_PERSONA_JURIDICA foreign key(idPersona) references Person.PERSONA(idPersona)
)
GO

--Creacion de la tabla TIPO_DOCUMENTO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.TIPO_DOCUMENTO (
	idTipoDocumento smallint not null,
	descripcion varchar(50) not null,
	constraint PK_Person_TIPO_DOCUMENTO primary key(idTipoDocumento)
)
GO

--Creacion de la tabla DOCUMENTO la cual se encuenttra dentro del Esquema Person
CREATE TABLE Person.DOCUMENTO (
	idDocumento BIGINT not null,
	valorDocumento varchar(50) not null,
	idPersona BIGINT not null,
	idTipoDocumento smallint not null
	constraint PK_Person_DOCUMENTO primary key(idDocumento),
	constraint FK_Person_PERSONA_X_DOCUMENTO foreign key(idPersona) references Person.PERSONA(idPersona),
	constraint FK_Person_TIPO_DOCUMENTO_X_DOCUMENTO foreign key(idTipoDocumento) references Person.TIPO_DOCUMENTO(idTipoDocumento)
)
GO

--Creacion de la tabla TIPO_MEDIO_CONTACTO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.TIPO_MEDIO_CONTACTO (
	idTipoMedioContacto smallint not null,
	descripcion varchar(50) not null,
	constraint PK_Person_TIPO_MEDIO_CONTACTO primary key(idTipoMedioContacto)
)
GO

--Creacion de la tabla MEDIO_CONTACTO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.MEDIO_CONTACTO (
	idMedioContacto BIGINT not null,
	valorMedioContacto varchar(100) not null,
	idPersona bigint not null,
	idTipoMedioContacto smallint not null,
	constraint PK_Persona_MEDIO_CONTACTO primary key(idMedioContacto),
	constraint FK_Persona_PERSONA_X_MEDIO_CONTACTO foreign key (idPersona) references Person.PERSONA(idPersona),
	constraint FK_Persona_TIPO_MEDIO_CONTACTO_X_MEDIO_CONTACTO foreign key (idTipoMedioContacto) references Person.TIPO_MEDIO_CONTACTO(idTipoMedioContacto)
)
GO

--Creacion de la tabla TIPO_CARGO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.TIPO_CARGO
(
	idTipoCargo smallint not null,
	nombreTipoCargo varchar(50) not null,
	descripcionTipoCargo varchar(100) not null,
	constraint PK_Person_TIPO_CARGO primary key(idTipoCargo)
)
GO

--Creacion de la tabla CARGO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.CARGO
(
	idCargo smallint not null,
	idTipoCargo smallint not null,
	nombreCargo varchar(50) not null,
	codigoEmpleado as 'CRG-'+replace(str(idCargo,5),' ','0'),
	descripcionCargo varchar(100) not null,
	constraint PK_Person_CARGO primary key(idCargo),
	constraint FK_Person_TIPO_CARGO_X_CARGO foreign key(idTipoCargo) references Person.TIPO_CARGO(idTipoCargo)
)
GO

--Creacion de la tabla EMPLEADO la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.EMPLEADO (
	idPersonaNatural bigint not null,
	idJefe bigint not null,
	idCargo smallint not null,
	codigoEmpleado as 'EMP-'+replace(str(idPersonaNatural,5),' ','0'),
	fechaIngreso date not null constraint check_fechaingreso_empleado check(fechaIngreso > '01/01/1990'),
	fechaSalida date not null,
	constraint PK_Person_EMPLEADO primary key(idPersonaNatural),
	constraint FK_Person_PERSONA_NATURAL_X_EMPLEADO foreign key(idPersonaNatural) references Person.PERSONA_NATURAL(idPersona),
	constraint FK_Person_CARGO_X_EMPLEADO foreign key(idCargo) references Person.CARGO(idCargo)
)
GO


--Creacion de Restricción Check - Fecha de Ingreso a la tabla EMPLEADO 
--dentro la cual se encuentra dentro del Esquema Person
alter table Person.EMPLEADO
add constraint ceck_fecha_salida check(fechaIngreso > fechaIngreso)
GO

--Creacion de llave foránea idJefe ==> idPersonaNatural ambos campos de la misma Tabla Empleado la
--cual se encuentra dentro del Esquema Person
alter table Person.EMPLEADO
add constraint FK_Person_EMPLEADO_X_EMPLEADO 
foreign key(idJefe) 
references Person.EMPLEADO(idPersonaNatural)
go


---------------------------------------------------------------------------------------------
--Creacion del Esquema "Ubicacion"
CREATE SCHEMA Ubicacion AUTHORIZATION dbo
go

--Creación de la tabla PAIS la cual se encuentra dentro del Esquema Ubicacion
CREATE TABLE Ubicacion.PAIS (
	idPais INT not null,
	nombrePais varchar(100) not null unique,
	constraint PK_Ubicacion_PAIS primary key(idPais)
)
GO

--Creación de la tabla DEPARTAMENTO la cual se encuentra dentro del Esquema Ubicacion
CREATE TABLE Ubicacion.DEPARTAMENTO (
	idDepartamento INT not null,
	nombreDepartamento varchar(100) not null,
	idPais INT not null,
	constraint PK_Ubicacion_DEPARTAMENTO primary key(idDepartamento),
	constraint FK_Ubicacion_PAIS_X_DEPARTAMENTO foreign key (idPais) references Ubicacion.PAIS(idPais)
)
GO

--Creación de la tabla CIUDAD la cual se encuentra dentro del Esquema Ubicacion
CREATE TABLE Ubicacion.CIUDAD (
	idCiudad int not null,
	nombreCiudad varchar(100) not null,
	idDepartamento INT not null,
	constraint PK_Ubicacion_CIUDAD primary key(idCiudad),
	constraint FK_Ubicacion_DEPARTAMENTO_X_CIUDAD foreign key(idDepartamento) references Ubicacion.DEPARTAMENTO(idDepartamento)
)
GO

--Creación de la tabla DIRECCION la cual se encuentra dentro del Esquema Ubicacion
CREATE TABLE Ubicacion.DIRECCION
(
	idDireccion BIGINT Identity not null,
	ubicacionDireccion varchar(100) not null,
	idCiudad int not null,
	indActivo VARCHAR(1) not null
		CONSTRAINT default_persona_indActivo default 'A',
	fecRegistro DATETIME not null
		constraint default_persona_fecRegistro default GETDATE(),
	constraint PK_Ubicacion_DIRECCION primary key (idDireccion),
	constraint FK_Ubicacion_CIUDAD_X_DIRECCION foreign key(idCiudad) references Ubicacion.CIUDAD(idCiudad),
)
GO
--Creacion de la tabla SUCURSAL la cual se encuentra dentro del Esquema Ubicacion
CREATE TABLE Ubicacion.SUCURSAL (
	idSucursal BIGINT identity not null,
	nombreSucursal varchar(100) not null,
	idDireccion BIGINT not null,
	constraint FK_Ubicacion_DIRECCION_X_SUCURSAL foreign key(idDireccion) references Ubicacion.DIRECCION(idDireccion),
	constraint PK_Person_SUCURSAL primary key (idSucursal),
)
GO

--NOTA IMPORTANTE: La tabla ASIGNACIONDIRECCION del Esquema "Person" necesariamente tiene que estar en esta posición
--para que no surgan errores mas adelante a la hora de ejecutar el script, ya que la tabla "ASIGNACIONDIRECCION"
--necesita de la tabla DIRECCION la cual se encuentra dentro del Esquema "Ubicacion"

--Creacion de la tabla ASIGNACIONDIRECCION la cual se encuentra dentro del Esquema Person
CREATE TABLE Person.ASIGNACIONDIRECCION
(
	idPersona bigint not null,
	idDireccion bigint not null,
	constraint FK_Person_PERSONA_X_ASIGNACIONDIRECCION foreign key(idPersona) references Person.PERSONA(idPersona),
	constraint FK_Ubicacion_DIRECCION_X_ASIGNACIONDIRECCION foreign key(idDireccion) references Ubicacion.DIRECCION(idDireccion)
)
GO

---------------------------------------------------------------------------------------------
--Creacion del Esquema "Cuentas"

CREATE SCHEMA Cuentas AUTHORIZATION dbo
GO

--Creacion de la tabla CUENTA la cual se encuentra dentro del Esquema Cuentas

CREATE TABLE Cuentas.CUENTA (
	idCuenta BIGINT identity not null,
	idPersona bigint not null,
	saldo decimal(8,2) not null default 0,
	interes decimal(8,2) not null,
	indCuentaActivo varchar(1) not null default 'A',
	fecRegistro date constraint default_fecha_cuenta default getdate(),
	codUsuario varchar(30) not null
		constraint default_persona_codUsuario default suser_name(),
	constraint PK_Cuentas_CUENTA primary key (idCuenta),
	constraint FK_Cuentas_PERSONA_X_CUENTA foreign key(idPersona) references Person.PERSONA(idPersona)
)
GO

--Creacion de la tabla CUENTA_PLAZO_FIJO la cual se encuentra dentro del Esquema "Cuentas"

CREATE TABLE Cuentas.CUENTA_PLAZO_FIJO (
	idCuenta BIGINT not null,
	fechaInicio date not null constraint default_fechaInicio_cuenta_plazo_fijo default getdate(),
	fechaTermino date not null,
	cantidadInicial decimal(8,2) not null,
	cantidadFinal decimal(8,2) not null,
	constraint PK_Cuentas_CUENTA_PLAZO_FIJO primary key (idCuenta),
	constraint FK_Cuentas_CUENTA_X_CUENTA_PLAZO_FIJO foreign key(idCuenta) references Cuentas.CUENTA(idCuenta)
)
GO
--Creacion de la tabla TIPO_TARJETA la cual se encuentra dentro del Esquema "Cuentas"
CREATE TABLE Cuentas.TIPO_TARJETA
(
	idTipoTarjeta smallint not null,
	descripcion varchar(100) not null,
	constraint PK_Cuentas_TIPO_TARJETA primary key(idTipoTarjeta)
)
GO

--Creacion de la tabla MARCA_TARJETA la cual se encuentra dentro del Esquema "Cuentas"

CREATE TABLE Cuentas.MARCA_TARJETA
(
	idMarcaTarjeta tinyint not null,
	nombreMarca varchar(100) not null,
	constraint PK_Cuentas_MARCA_TARJETA primary key(idMarcaTarjeta)
)
GO

--Creacion de la tabla ESTADO_TARJETA la cual se encuentra dentro del Esquema "Cuentas"

CREATE TABLE Cuentas.ESTADO_TARJETA
(
	idEstadoTarjeta tinyint not null,
	estadoTarjeta varchar(50) constraint default_estadotarjeta_estado_tarjeta default 'Tarjeta Normal',
	descripcion varchar(100) not null,
	constraint PK_Cuentas_ESTADO_TARJETA primary key(idEstadoTarjeta),
)
GO

--Creacion de la tabla TARJETA la cual se encuentra dentro del Esquema "Cuentas"

CREATE TABLE Cuentas.TARJETA
(
	idTarjeta BIGINT not null,
	valorTarjeta varchar(15) not null unique,
	codigoVerificacion varchar(3) not null,
	fechaEmision date constraint default_fechaEmision_tarjeta default getdate(),
	fecVencimiento date not null,
	idTipoTarjeta smallINT not null,
	idMarcaTarjeta tinyINT not null,
	idEstadoTarjeta tinyint not null,
	constraint PK_Cuentas_TARJETA primary key (idTarjeta),
	constraint FK_Cuentas_ESTADO_TARJETA_X_TARJETA foreign key(idEstadoTarjeta) references Cuentas.ESTADO_TARJETA(idEstadoTarjeta),
	constraint FK_Cuentas_TIPO_TARJETA_X_TARJETA foreign key(idTipoTarjeta) references Cuentas.TIPO_TARJETA(idTipoTarjeta),
	constraint FK_Cuentas_MARCA_TARJETA_X_TARJETA foreign key(idMarcaTarjeta) references Cuentas.MARCA_TARJETA(idMarcaTarjeta)
)
GO

--Creacion de la tabla ASIGNACIONTARJETA la cual se encuentra dentro del Esquema "Cuentas"

CREATE TABLE Cuentas.ASIGNACIONTARJETA
(
	idTarjeta bigint not null,
	idCuenta bigint not null,
	constraint FK_Cuentas_TARJETA_X_ASIGNACIONTARJETA foreign key(idTarjeta) references Cuentas.TARJETA(idTarjeta),
	constraint FK_Cuentas_CUENTA_X_ASIGNACIONTARJETA foreign key(idCuenta) references Cuentas.CUENTA(idCuenta),
)
GO
---------------------------------------------------------------------------------------------
--Creacion del Esquema "Transaccion"

CREATE SCHEMA Transaccion AUTHORIZATION dbo
GO


--Creacion de la tabla MOVIMIENTO la cual se encuentra dentro del Esquema "Transaccion"

CREATE TABLE Transaccion.MOVIMIENTO (
	idMovimiento BIGINT identity not null,
	cantidadMovimiento decimal(8,2) not null,
	fechaMovimiento date not null constraint default_fechamovimiento_movimiento default getdate(),
	idSucursal BIGINT not null,
	idCuenta BIGINT not null,
	idEmpleado bigint not null,
	constraint PK_Transaccion_MOVIMIENTO primary key(idMovimiento),
	constraint FK_Transaccion_CUENTA_MOVIMIENTO foreign key(idCuenta) references Cuentas.CUENTA(idCuenta),
	constraint FK_Transaccion_SUCURSAL_X_MOVIMIENTO foreign key(idSucursal) references Ubicacion.SUCURSAL(idSucursal),
	constraint FK_Transaccion_EMPLEADO_X_MOVIMIENTO foreign key(idEmpleado) references Person.EMPLEADO(idPersonaNatural)
)
GO

--Creacion de la tabla MOVIMIENTO_TRANSFERENCIA la cual se encuentra dentro del Esquema "Transaccion"

CREATE TABLE Transaccion.MOVIMIENTO_TRANSFERENCIA (
	idMovimiento BIGINT not null,
	idCuentaDestino bigint not null,
	descripcion varchar(100) not null,
	constraint PK_Transaccion_MOVIMIENTO_TRANSFERENCIA primary key (idMovimiento),
	constraint PK_Transaccion_MOVIMIENTO_X_MOVIMIENTO_TRANSFERENCIA foreign key(idMovimiento) references Transaccion.MOVIMIENTO(idMovimiento),
	constraint PK_Transaccion_CUENTA_X_MOVIMIENTO_TRANSFERENCIA foreign key(idCuentaDestino) references Cuentas.CUENTA(idCuenta)
)
GO

---------------------------------------------------------------------------------------------
--Creacion del Esquema "Historial"

CREATE SCHEMA Historial AUTHORIZATION dbo
GO

--Creacion de la tabla PERSONA la cual se encuentra dentro del Esquema "Historial"

CREATE TABLE Historial.PERSONA
(
	idHistorialPersona BIGINT identity not null,
	idPersona BIGINT not null,
	indActivo VARCHAR(1) not null,
	fechaRegistro DATETIME not null,
	codUsuario varchar(30) not null,
	constraint PK_Historial_PERSONA primary key (idHistorialPersona)
)
GO

--Creacion de la tabla CUENTA la cual se encuentra dentro del Esquema "Historial"

CREATE TABLE Historial.CUENTA
(
	idHistorialCuenta BIGINT identity not null,
	idCuenta BIGINT not null,
	idPersona bigint not null,
	saldo decimal(8,2) not null,
	interes decimal(8,2) not null,
	indCuentaActivo varchar(1) not null,
	fechaRegistro date constraint default_fecharegistro_cuenta default getdate(),
	codUsuario varchar(30) not null,
	constraint PK_Historial_CUENTA primary key (idHistorialCuenta),
	constraint FK_Historial_PERSONA_X_CUENTA foreign key(idPersona) references Person.PERSONA(idPersona)
)
GO

--Creacion de la tabla MOVIMIENTO la cual se encuentra dentro del Esquema "Historial"

CREATE TABLE Historial.MOVIMIENTO
(
	idHistorialMovimiento BIGINT identity not null,
	idMovimiento BIGINT not null,
	cantidadMovimiento decimal(8,2) not null,
	fechaMovimiento date not null constraint default_fechamovimiento_movimiento default getdate(),
	idSucursal BIGINT not null,
	idCuenta BIGINT not null,
	idEmpleado bigint not null,
	constraint PK_Historial_MOVIMIENTO primary key(idHistorialMovimiento),
	constraint FK_Historial_CUENTA_MOVIMIENTO foreign key(idCuenta) references Cuentas.CUENTA(idCuenta),
	constraint FK_Historial_SUCURSAL_X_MOVIMIENTO foreign key(idSucursal) references Ubicacion.SUCURSAL(idSucursal),
	constraint FK_Historial_EMPLEADO_X_MOVIMIENTO foreign key(idEmpleado) references Person.EMPLEADO(idPersonaNatural)
)
GO

--Creacion de la tabla TIPO_SERIAL la cual se encuentra dentro del Esquema "Historial"

CREATE TABLE Historial.TIPO_SERIAL
(
	idTipoSerial int identity not null,
	nombreTipoSerial varchar(50) not null,
	descripcion varchar(100) not null,
	constraint PK_Historial_TIPO_SERIAL primary key(idTipoSerial)
)
GO

--Creacion de la tabla SERIAL la cual se encuentra dentro del Esquema "Historial"

CREATE TABLE Historial.SERIAL
(
	idSerial smallint identity not null,
	idTipoSerial int not null,
	valor bigint not null,
	fechaModificacion date not null constraint default_fechamodificacion_serial default getdate(),
	constraint PK_Historial_SERIAL primary key(idSerial),
	constraint FK_Historial_TIPO_SERIAL_X_SERIAL foreign key(idTipoSerial) references Historial.TIPO_SERIAL(idTipoSerial)
)
GO