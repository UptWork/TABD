USE [master]
GO

--Creacion de la Auditoria del Servidor
--Se creo en la ubicacion C:\ para no tener problemas solo con motivos de prueba
--entendemos que esta no es la mejor ubicacion

CREATE SERVER AUDIT [Auditoria_Servidor_BD]
TO FILE 
(	FILEPATH = N'C:\'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
)

GO

--Inmediatamente luego de ser creada la habilitamos con el sgte comando T-SQL

ALTER SERVER AUDIT [Auditoria_Servidor_BD]
WITH (STATE = ON);
GO

--Adicionalmente crearemos una especificacion para nuestra auditoria

CREATE SERVER AUDIT SPECIFICATION [Especificacion_Auditoria_Servidor_BD]
FOR SERVER AUDIT [Auditoria_Servidor_BD]
ADD (FAILED_LOGIN_GROUP)
WITH (STATE = ON)
GO

--Cambiamos a la BD Banco

USE Banco
GO


--creacion de la especificacion para la auditoria de la base de datos BANCO sobre las tablas principales
--Person.PERSONA, Cuentas.CUENTA y Transaccion.MOVIMIENTO

CREATE DATABASE AUDIT SPECIFICATION [Especificacion_AuditoriaBD_Banco]
FOR SERVER AUDIT [Auditoria_Servidor_BD]
ADD (DELETE ON OBJECT::[Person].[PERSONA] By [dbo]),
ADD (INSERT ON OBJECT::[Person].[PERSONA] By [dbo]),
ADD (UPDATE ON OBJECT::[Person].[PERSONA] By [dbo]),
ADD (DELETE ON OBJECT::[Transaccion].[MOVIMIENTO] By [dbo]),
ADD (INSERT ON OBJECT::[Transaccion].[MOVIMIENTO] By [dbo]),
ADD (UPDATE ON OBJECT::[Transaccion].[MOVIMIENTO] By [dbo]),
ADD (DELETE ON OBJECT::[Cuentas].[CUENTA] BY [dbo]),
ADD (INSERT ON OBJECT::[Cuentas].[CUENTA] BY [dbo]),
ADD (UPDATE ON OBJECT::[Cuentas].[CUENTA] BY [dbo])
WITH (STATE = ON)
GO