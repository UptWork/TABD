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
	constraint PK_DimCuenta primary key (CuentaSK),
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
	constraint PK_DimEmpleado primary key (EmpleadoSK),
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
	sucursalSK BIGINT not null,
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
	idMovimiento BIGINT identity not null,
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
