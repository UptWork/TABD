CREATE DATABASE BancoDW
GO
USE BancoDW
GO
CREATE TABLE DimCuenta (
	cuentaSK BIGINT identity not null,
	idCuenta BIGINT not null,
	primerNombre varchar(30) not null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30) not null,
	fechaNacimiento date not null,
	sexo varchar(1) not null,
	fechaInicio datetime not null,
	fechaFin datetime not null,
	indicadorActivo bit,
	constraint PK_DimCuenta primary key (CuentaSK)
)
GO
CREATE TABLE DimEmpleado (
	empleadoSK BIGINT identity not null,
	idEmpleado BIGINT not null,
	primerNombre varchar(30) not null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30) not null,
	fechaNacimiento date not null,
	sexo varchar(1) not null,
	fechaInicio datetime not null,
	fechaFin datetime not null,
	indicadorActivo bit,
	constraint PK_DimEmpleado primary key (EmpleadoSK)
)
GO
CREATE TABLE DimTiempo(
	tiempoSK DATETIME not null,
	anio SMALLINT,
	numeroMes TINYINT,
	nombreMes VARCHAR(20),
	numeroDia TINYINT,
	nombreDia VARCHAR(20),
	constraint PK_DimTiempo primary key (TiempoSK)
)
GO
CREATE TABLE DimSucursal(
	sucursalSK BIGINT identity not null,
	idSucursal BIGINT not null,
	nombreSucursal varchar(50) not null,
	Direccion varchar(100) not null,
	fechaInicio datetime not null,
	fechaFin datetime not null,
	indicadorActivo bit,
	constraint PK_DimSucursal primary key (SucursalSK)
)
GO

CREATE TABLE FactMovimiento(
	idMovimiento BIGINT not null,
	cantidadMovimiento decimal(8,2) not null,
	tiempoSK DATETIME not null,
	sucursalSK BIGINT not null,
	cuentaSK BIGINT not null,
	empleadoSK bigint not null,
	constraint PK_FactMovimiento primary key(idMovimiento),
	constraint FK_DimCuenta_FactMovimiento foreign key(cuentaSK) references DimCuenta(CuentaSK),
	constraint FK_DimSucursal_FactMovimiento foreign key(sucursalSK) references DimSucursal(SucursalSK),
	constraint FK_DimTiempo_FactMovimiento foreign key(tiempoSK) references DimTiempo(TiempoSK),
	constraint FK_DimEmpleado_FactMovimiento foreign key(empleadoSK) references DimEmpleado(EmpleadoSK)
)
GO


--Tablas temporales

CREATE TABLE TMPDimCuenta (
	idCuenta BIGINT not null,
	primerNombre varchar(30) not null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30) not null,
	fechaNacimiento date not null,
	sexo varchar(1) not null
)
GO

CREATE TABLE TMPDimEmpleado (
	idEmpleado BIGINT not null,
	primerNombre varchar(30) not null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) not null,
	apellidoMaterno varchar(30) not null,
	fechaNacimiento date not null,
	sexo varchar(1) not null
)

GO

CREATE TABLE TMPDimSucursal(
	idSucursal BIGINT not null,
	nombreSucursal varchar(50) not null,
	Direccion varchar(100) not null
)
GO

CREATE TABLE TMPFactMovimiento(
	idMovimiento BIGINT not null,
	cantidadMovimiento decimal(8,2) not null,
	tiempoSK DATETIME not null,
	sucursalSK BIGINT not null,
	cuentaSK BIGINT not null,
	empleadoSK bigint not null
)
GO


--PROCEDIMIENTOS ALMACENADOS PARA EXTRACCION DE DATOS -- RNLD

CREATE PROCEDURE sprExtraerDatosEmpleados
as
begin
set nocount on
select pe.codigoEmpleado, ppn.primerNombre, ppn.segundoNombre,ppn.apellidoPaterno,ppn.apellidoMaterno,ppn.fechaNacimiento,ppn.sexo  from Person.EMPLEADO pe
inner join Person.PERSONA_NATURAL ppn on ppn.idPersona = pe.idPersonaNatural
set nocount off
end
go

/**/
CREATE PROCEDURE sprExtraerDatosSucursal
as
begin
set nocount on
select us.idSucursal,us.nombreSucursal, ud.ubicacionDireccion from Ubicacion.SUCURSAL us
inner join Ubicacion.DIRECCION ud on ud.idDireccion = us.idDireccion
set nocount off
end
go

