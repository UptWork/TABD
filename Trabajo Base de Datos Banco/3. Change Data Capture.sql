USE Banco

EXEC sp_cdc_enable_db
GO

--Se crea un SCHEMA con nombre 'CDC' y un user de la BD con nombre 'cdc'

--Se debe iniciar el SQLServerAgent

--Consulta si se habilito el CDC en nuestra base de datos Banco--

SELECT name,is_cdc_enabled from sys.databases where name = 'Banco'

--Elegimos las tablas sobre las cuales se realizara el Change Data Capture

--Tenemos 3 parametros
--@source_schame = Nombre del Schema al cual queremos habilitar el CDC
--@source_name = Nombre de la tabla a la cual queremos habilitar el CDC
--@role_name = Es usado para restringir el acceso a ciertos usuarios si es null sera accesible para todos
--@supports_net_changes = Puede tener 0 ( si deseamos seguir todos los cambios ) o 1 ( si deseamos seguir todos los cambios y tambien los de red )


EXEC sys.sp_cdc_enable_table
@source_schema ='Person',
@source_name ='PERSONA',
@role_name =NULL,
@supports_net_changes = 1
GO

EXEC sys.sp_cdc_enable_table
@source_schema ='Cuentas',
@source_name ='CUENTA',
@role_name =NULL,
@supports_net_changes = 1
GO

EXEC sys.sp_cdc_enable_table
@source_schema ='Transaccion',
@source_name ='MOVIMIENTO',
@role_name =NULL,
@supports_net_changes = 1
GO

--Realizamos una consulta para saber si las tablas fueron habilitadas correctamente
--Recordemos que tenemos 2 tablas CUENTA,MOVIMIENTO y PERSONA pero con distinto schema
--entonces si el resultado es correcto nos saldran 2 tablas con el mismo nombre pero en una si esta habilitado
--y en otro no

SELECT name,is_tracked_by_cdc FROM sys.tables
WHERE name ='CUENTA' or name='MOVIMIENTO' or name='PERSONA'
GO

--Luego de esto se han creado 3 tablas auxiliares cdc.Person_PERSONA_CT,cdc.Cuentas_CUENTA_CT,cdc.Transaccion_MOVIMIENTO_CT
--las cuales contendran toda la informacion con respecto a los cambios que se hagan en las tablas

--En cada una de estas tablas tenemos ciertos campos
--__$start_lsn
--__$end_lsn
--__$seqval
--__$operation
--__$update_mask

--La columna __$operation es la mas importante para la captura de informacion.
--Puede tener valores 1,2,3 y 4 a continuacion la explicacion

--Valor		Operacion
--1			Delete
--2			Insert
--3			Value before update
--4			Value after update

--Adicionalmente si nos fijamos en el SQLServerAgent en la parte de "Jobs" podemos ver
--que tenemos 2 Jobs
--cdc.ChangeDataCaptureDB_capture: Lee la informacion del archivo .ldf y guarda todos los cambios de la tabla
--cdc.ChangeDataCaptureDB_cleanup: Limpia la informacion antigua, por defecto cada 3 dias

--PAra iniciar las pruebas seleccionaremos la tabla original y la tabla CDC creada

SELECT * FROM Person.PERSONA
SELECT * FROM cdc.Person_PERSONA_CT
GO

SELECT * FROM Cuentas.CUENTA
SELECT * FROM cdc.Cuentas_CUENTA_CT
GO

SELECT * FROM Transaccion.MOVIMIENTO
SELECT * FROM cdc.Transaccion_MOVIMIENTO_CT
GO

--Ahora haremos cambios a nuestra tabla un insert y un update

insert into Person.PERSONA(indActivo) values('A')
GO

--Seleccionamos ambas tablas y observamos que se grabo correctamente en la tabla original
--y tambien en la CDC, como observacion podemos ver que _$operation se grabo como "2" ya que fue un insert

SELECT * FROM Person.PERSONA
SELECT * FROM cdc.Person_PERSONA_CT
GO

--Ahora modifiquemos el registro para ver que tipo de cambio se realiza en ambas tablas

update Person.PERSONA set indActivo='N' where idPersona=1
GO
SELECT * FROM Person.PERSONA
SELECT * FROM cdc.Person_PERSONA_CT
GO

--Podemos ver que nos inserto 2 registros en la tabla CDC pero PORQUE ? si solo hicimos una operacion,
--bueno recordemos la tabla, cuando se hace un update se insertan 2 registros un antes y un despues,
--los cuales se identifican por sus valores, en este caso 3 y 4 respectivamente
--en conclusion el primer registro representan los valores antes del update y el siguiente despues del update


