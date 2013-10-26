CREATE DATABASE BancoDW
GO
USE BancoDW
GO
CREATE TABLE DimCuenta (
	cuentaSK BIGINT identity not null,
	idCuenta BIGINT null,
	primerNombre varchar(30) null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) null,
	apellidoMaterno varchar(30) null,
	fechaNacimiento date null,
	sexo varchar(1) null,
	fechaInicio datetime null,
	fechaFin datetime null,
	indicadorActivo bit,
	constraint PK_DimCuenta primary key (CuentaSK)
)
GO
CREATE TABLE DimEmpleado (
	empleadoSK BIGINT identity not null,
	idEmpleado BIGINT null,
	primerNombre varchar(30) null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) null,
	apellidoMaterno varchar(30) null,
	fechaNacimiento date null,
	sexo varchar(1) null,
	fechaInicio datetime null,
	fechaFin datetime null,
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
	idSucursal BIGINT null,
	nombreSucursal varchar(50) null,
	Direccion varchar(100) null,
	fechaInicio datetime null,
	fechaFin datetime ,
	indicadorActivo bit,
	constraint PK_DimSucursal primary key (SucursalSK)
)
GO

CREATE TABLE FactMovimiento(
	idMovimiento BIGINT not null,
	cantidadMovimiento decimal(8,2) not null,
	tiempoSK DATETIME null,
	sucursalSK BIGINT null,
	cuentaSK BIGINT null,
	empleadoSK bigint null,
	constraint PK_FactMovimiento primary key(idMovimiento),
	constraint FK_DimCuenta_FactMovimiento foreign key(cuentaSK) references DimCuenta(CuentaSK),
	constraint FK_DimSucursal_FactMovimiento foreign key(sucursalSK) references DimSucursal(sucursalSK),
	constraint FK_DimTiempo_FactMovimiento foreign key(tiempoSK) references DimTiempo(TiempoSK),
	constraint FK_DimEmpleado_FactMovimiento foreign key(empleadoSK) references DimEmpleado(EmpleadoSK)
)
GO


--Tablas temporales

CREATE TABLE TMPDimCuenta (
	fechaProceso DATETIME,
	idCuenta BIGINT not null,
	primerNombre varchar(30) null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) null,
	apellidoMaterno varchar(30) null,
	fechaNacimiento date null,
	sexo varchar(1) null
)
GO

CREATE TABLE TMPDimEmpleado (
	fechaProceso DATETIME,
	idEmpleado BIGINT null,
	primerNombre varchar(30) null,
	segundoNombre varchar(30) null,
	apellidoPaterno varchar(30) null,
	apellidoMaterno varchar(30) null,
	fechaNacimiento date null,
	sexo varchar(1) null
)

GO

CREATE TABLE TMPDimSucursal(
	fechaProceso DATETIME,
	idSucursal BIGINT null,
	nombreSucursal varchar(50) null,
	Direccion varchar(100) null
)
GO

CREATE TABLE TMPFactMovimiento(
	idMovimiento BIGINT null,
	cantidadMovimiento decimal(8,2) null,
	tiempoSK DATETIME null,
	sucursalSK BIGINT null,
	cuentaSK BIGINT null,
	empleadoSK bigint null
)
GO

--Creacion procedimientos almacenados
--alter table FactMovimiento
--check constraint FK_DimSucursal_FactMovimiento

CREATE PROC sprCargarSucursal
AS
BEGIN
	SET NOCOUNT ON
	INSERT DimSucursal (idSucursal, nombreSucursal, Direccion, fechaInicio, indicadorActivo)
	SELECT	idSucursal
			, nombreSucursal
			, Direccion
			, GETDATE()
			, 1
	FROM	(
		MERGE DimSucursal DS
		USING TMPDimSucursal TDS
		ON	DS.idSucursal = TDS.idSucursal
		AND DS.indicadorActivo = 1
		WHEN MATCHED AND (
			DS.nombreSucursal <> TDS.nombreSucursal
			OR DS.Direccion <> TDS.Direccion
			) THEN
		UPDATE SET fechaFin = GETDATE(), indicadorActivo = 0
		WHEN NOT MATCHED THEN
		INSERT (idSucursal, nombreSucursal, Direccion, fechaInicio, indicadorActivo)
		VALUES (TDS.idSucursal, TDS.nombreSucursal, TDS.Direccion, TDS.fechaProceso, 1)
		OUTPUT $action, TDS.idSucursal, TDS.nombreSucursal, TDS.Direccion
		) AS C (ACCION, idSucursal, nombreSucursal, Direccion)
	WHERE ACCION = 'UPDATE';
	SET NOCOUNT OFF
END
GO



--Procedimientos Extraer Datos EN OLTP 

CREATE PROC sprExtraerDatosFecha 
	@fecha DATETIME
AS
-- EXEC USP_EXTRAE_DATOS_TIEMPO '15/09/2013'
BEGIN
	SET NOCOUNT ON
	SET DATEFORMAT DMY
	SELECT	tiempoSK = @fecha
			, anio = YEAR(@fecha)
			, numeroMes = MONTH(@fecha)
			, nombreMes = DATENAME(MM,@fecha)
			, numeroDia = DAY(@fecha)
			, nombreDia = DATENAME(DW,@fecha)
	SET NOCOUNT OFF
END
GO

SELECT * FROM DimTiempo

go
CREATE PROC sprExtraerDatosSucursal 
(
	@fechaProceso DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
	select  fechaProceso = @fechaProceso,
			us.idSucursal,us.nombreSucursal, 
			ud.ubicacionDireccion 
			from Ubicacion.SUCURSAL us
	inner join Ubicacion.DIRECCION ud on ud.idDireccion = us.idDireccion
	SET NOCOUNT OFF
END
GO

CREATE PROCEDURE sprExtraerDatosEmpleados
as
begin
set nocount on
select pe.idPersonaNatural, ppn.primerNombre, ppn.segundoNombre,ppn.apellidoPaterno,ppn.apellidoMaterno,ppn.fechaNacimiento,ppn.sexo  from Person.EMPLEADO pe
inner join Person.PERSONA_NATURAL ppn on ppn.idPersona = pe.idPersonaNatural
set nocount off
end
go

CREATE PROCEDURE sprExtraerDatosCuenta
as
begin
set nocount on
select cc.idCuenta, ppn.primerNombre, ppn.segundoNombre, ppn.apellidoPaterno, ppn.apellidoMaterno, ppn.fechaNacimiento, ppn.sexo from Cuentas.CUENTA cc
inner join Person.PERSONA pp on pp.idPersona = cc.idPersona
inner join Person.PERSONA_NATURAL ppn on ppn.idPersona = pp.idPersona
set nocount off
end
go


SELECT * FROM DimSucursal
