--Seleccionamos la base de datos creada en el Laboratorio
USE Banco
GO
--Primero habilitamos la base de datos para Service Broker
ALTER DATABASE Banco SET ENABLE_BROKER

--Define el nombre del mensaje y el tipo de informacion que el mensaje contiene. 
--Estos mensajes deben ser creados en ambas partes de la conversacion
--Los posibles valores para VALIDATION son:
--NONE: no se realiza ninguna validación
--EMPTY: El cuerpo del mensaje debe tener valor NULO
--WELL_FORMED_XML: Debe contener un XML bien formado
--VALID_XML WITH SCHEMA COLLECTION: El contenido del XML debe cumplir con el XML SCHEMA señalado

CREATE MESSAGE TYPE ServiceBrokerMensaje
VALIDATION = NONE
GO

--Ahora crearemos un contrato el cual define los tipos de mensajes que un servicio puede utilizar en 
--una conversación y la dirección en que los mensajes pueden ser enviados
--Los posibles valores para SENT BY son:
--INITIATOR: indica que solo el iniciador puede enviar dicho tipo de mensaje
--TARGET: Indica que solo el destino puede enviar dicho tipo de mensaje
--ANY: Indica que tanto el iniciador y el destino pueden enviar dicho tipo de mensaje

CREATE CONTRACT ServiceBrokerContrato
(ServiceBrokerMensaje SENT BY INITIATOR)
GO

--Ahora crearemos una cola la cual define la ubicación donde se almacenaran los mensajes hasta que un servicio 
--este disponible para atender los mensajes

CREATE QUEUE ServiceBrokerColaEnvio
GO

--Tambien creamos una cola de recibido

CREATE QUEUE ServiceBrokerColaRecibido
GO

--Creamos un servicio que relacione las cola de envio con el contrato

CREATE SERVICE ServiceBrokerEnvio
ON QUEUE ServiceBrokerColaEnvio (ServiceBrokerContrato)
GO

--Creamos un servicio que relacione la cola de recibido con el contrato

CREATE SERVICE ServiceBrokerRecibido
ON QUEUE ServiceBrokerColaRecibido (ServiceBrokerContrato)
GO

--Ahora algo muy importante, para comenzar a usar los servicios se deben establecer 
--una conversación. Estos son los pasos para establecer una conversación.
--Crear la variable que identificara de manera única la conversación y Iniciar la conversación

DECLARE @ServiceBrokerDialogo uniqueidentifier
DECLARE @Mensaje NVARCHAR(128)
BEGIN DIALOG CONVERSATION @ServiceBrokerDialogo
FROM SERVICE ServiceBrokerEnvio
TO SERVICE 'ServiceBrokerRecibido'
ON CONTRACT ServiceBrokerContrato
WITH ENCRYPTION = OFF

--Ahora utilizo el dialogo y envio un mensaje

SET @Mensaje = 'Primer Mensaje Test';
SEND ON CONVERSATION @ServiceBrokerDialogo
MESSAGE TYPE ServiceBrokerMensaje (@Mensaje)
SET @Mensaje = N'Segundo Mensaje Test';
SEND ON CONVERSATION @ServiceBrokerDialogo
MESSAGE TYPE ServiceBrokerMensaje (@Mensaje)
SET @Mensaje = N'Tercer Mensaje Test';
SEND ON CONVERSATION @ServiceBrokerDialogo
MESSAGE TYPE ServiceBrokerMensaje (@Mensaje)
GO
-- Hacemos la consulta para ver los mensajes recibidos
SELECT CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM ServiceBrokerColaRecibido
GO
-- Hacemos la consulta para ver los mensajes recibidos
RECEIVE TOP(1) CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM ServiceBrokerColaRecibido
GO
-- Hacemos la consulta para ver los mensajes recibidos
RECEIVE CONVERT(NVARCHAR(MAX), message_body) AS Message
FROM ServiceBrokerColaRecibido
GO

