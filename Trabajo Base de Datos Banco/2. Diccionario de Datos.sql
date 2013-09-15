-----------PARTE EDUU-------------------------------------------------------------------------
--TABLA TRANSACCION.MOVIMIENTO
USE Banco
go

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador unico de la entidad Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Cantidad del Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'cantidadMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Fecha del Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'fechaMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'ID de la Sucursal asociada a la Entidad .Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idSucursal'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'ID de la Cuenta asociada a la Entidad Movimiento',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idCuenta'
GO

--TABLA TRANSACCION.MOVIMIENTO_TRANSFERENCIA

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad Movimiento_Transferencia',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO_TRANSFERENCIA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Entidad Movimiento_Transferencia',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO_TRANSFERENCIA',
	@level2type = N'COLUMN', @level2name= 'idMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Cuenta de Destino enlazada a la Entidad MOVIMIENTO_TRANSFERENCIA',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO_TRANSFERENCIA',
	@level2type = N'COLUMN', @level2name= 'idCuentaDestino'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Descripcion de la Transferencia',
	@level0type = N'SCHEMA', @level0name = 'Transaccion',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO_TRANSFERENCIA',
	@level2type = N'COLUMN', @level2name= 'descripcion'
GO


--Tabla Person.TIPO_DOCUMENTO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad TIPO_DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_DOCUMENTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del tipo de documento de la entidad TIPO_DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'idTipoDocumento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Descripcion del tipo de documento de la entidad TIPO_DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'descripcion'
GO

--Tabla Person.DOCUMENTO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'DOCUMENTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del documento de la entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'idDocumento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Valor del documento de la entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'valorDocumento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Persona que va enlazada a esta la DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'idPersona'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del Tipo de Documento que va enlazada a la entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'DOCUMENTO',
	@level2type = N'COLUMN', @level2name= 'idTipoDocumento'
GO

--Tabla Person.TIPO_MEDIO_CONTACTO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad TIPO_MEDIO_CONTACTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_MEDIO_CONTACTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del Tipo de Medio de Contacto',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'idTipoMedioContacto'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Descripcion del Tipo de Medio de Contacto',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'TIPO_MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'descripcion'
GO

--Tabla Person.MEDIO_CONTACTO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad MEDIO_CONTACTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'MEDIO_CONTACTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del Medio de Contacto de la tabla MEDIO_CONTACTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'idMedioContacto'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Valor del Medio de Contacto de la tabla MEDIO_CONTACTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'valorMedioContacto'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Persona que va enlazada a la entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'idPersona'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico del Tipo de Medio de Contacto que va enlazada a la entidad DOCUMENTO',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'MEDIO_CONTACTO',
	@level2type = N'COLUMN', @level2name= 'idTipoMedioContacto'
GO

-- Tabla Person.ASIGNACIONDIRECCION
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad ASIGNACIONDIRECCION',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONDIRECCION'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Persona que va enlazada a la entidad ASGINACIONDIRECCION',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONDIRECCION',
	@level2type = N'COLUMN', @level2name= 'idPersona'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador Unico de la Direccion que va enlazada a la entidad ASGINACIONDIRECCION',
	@level0type = N'SCHEMA', @level0name = 'Person',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONDIRECCION',
	@level2type = N'COLUMN', @level2name= 'idDireccion'
GO


--------------PARTE BRISEIDA----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--TABLA PERSONA

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene datos de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idPersona es el codigo de la tabla persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN',@level2name='idPersona'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='indActivo Indica si esta activo o no',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='indActivo'


GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='fecRegistro registra la fecha de registro de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='fechaRegistro'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='codUsuario es el codigo de usuario',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='codUsuario'
GO
---------------------------------------------------------------------------------------
--TABLA PERSONA_JURIDICA

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene datos de persona juridica',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_JURIDICA'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idPersona es el codigo de persona juridica',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_JURIDICA',
@level2type=N'COLUMN',@level2name='idPersona'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='razonSocial a la que pertenece la persona juridica',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_JURIDICA',
@level2type=N'COLUMN', @level2name='razonSocial'

GO


EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='descripcion de la persona juridica',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_JURIDICA',
@level2type=N'COLUMN', @level2name='descripcion'
GO
----------------------------------------------------------------------------------------
--TABLA PERSONA_NATURAL
EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene datos de persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idPersona es el codigo de persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN',@level2name='idPersona'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='primer Nombre de la persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN', @level2name='primerNombre'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='segundo Nombre de la persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN', @level2name='segundoNombre'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='apellido Paterno de la persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN', @level2name='apellidoPaterno'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='apellido Materno de la persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN', @level2name='apellidoMaterno'
GO


EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='sexo de la persona natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='PERSONA_NATURAL',
@level2type=N'COLUMN', @level2name='sexo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene el cargo de la persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='CARGO'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idPersona es el codigo de Cargo',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='CARGO',
@level2type=N'COLUMN',@level2name='idCargo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='nombre de cargo de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='CARGO',
@level2type=N'COLUMN', @level2name='nombreCargo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Codigo del empleado',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='CARGO',
@level2type=N'COLUMN', @level2name='codigoEmpleado'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='descripcion del cargo',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='CARGO',
@level2type=N'COLUMN', @level2name='descripcionCargo'
GO


----

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene el tipo de cargo de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='TIPO_CARGO'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idCargo es el codigo de Cargo',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='TIPO_CARGO',
@level2type=N'COLUMN',@level2name='idTipoCargo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='nombre de tipo de cargo de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='TIPO_CARGO',
@level2type=N'COLUMN', @level2name='nombreTipoCargo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='descripcion de tipo de cargo de persona',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='TIPO_CARGO',
@level2type=N'COLUMN', @level2name='descripcionTipoCargo'
GO


--------------------------------------------------------------------------------------------------------------
-----------PARTE EDUU-----------------------------------------------------------------------------------------
--TABLA PERSONA (HISTORIAL)

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene datos de Persona (Historial)',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idHistorialPersona es el codigo del Historial de la Persona ',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN',@level2name='idHistorialPersona'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='idPersona es el codigo de la tabla persona',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN',@level2name='idPersona'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='indActivo Indica si esta activo o no',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='indActivo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='fecRegistro registra la fecha de registro de persona',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='fechaRegistro'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='codUsuario es el codigo de usuario',
@level0type=N'SCHEMA', @level0name='Historial',
@level1type=N'TABLE', @level1name='PERSONA',
@level2type=N'COLUMN', @level2name='codUsuario'
GO


--Tabla EMPLEADO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Tabla que contiene datos del EMPLEADO',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='ID de  Persona Natural',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='idPersonaNatural'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='ID del Jefe',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='idJefe'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='ID del Cargo',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='idCargo'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Codigo del Empleado',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='codigoEmpleado'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Fecha de ingreso del empleado',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='fechaIngreso'
GO

EXEC sys.sp_addextendedproperty
@name='MS_Description', @value='Fecha de salida del empleado',
@level0type=N'SCHEMA', @level0name='Person',
@level1type=N'TABLE', @level1name='EMPLEADO',
@level2type=N'COLUMN', @level2name='fechaSalida'
GO

--TABLA MOVIMIENTO (HISTORIAL)

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Entidad Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador unico del Historial de Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idHistorialMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Identificador unico de la entidad Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Cantidad del Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'cantidadMovimiento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'Fecha del Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'fechaMovimiento'
GO


EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'ID de la Sucursal asociada a la Entidad Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idSucursal'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value = 'ID de la Cuenta asociada a la Entidad Movimiento del Esquema Historial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'MOVIMIENTO',
	@level2type = N'COLUMN', @level2name= 'idCuenta'
GO


----------------------PARTE DEIVI Y RONALD-----------------------------------------------------------------------------------------

/*********************esquema ubicacion***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Esquema de entidades que agrupa las tablas referentes a la ubicacion de la persona',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion'
GO

/*******************TABLA DIRECCION********************TODOS LOS DE ESTE DISEÑO SON RONALD***/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene registros de cada direccion',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada direccion',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION',
	@level2type = N'COLUMN', @level2name = 'idDireccion'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Descripcion exacta de la direccion',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION',
	@level2type = N'COLUMN', @level2name = 'ubicacionDireccion'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo de la tabla ciudad',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION',
	@level2type = N'COLUMN', @level2name = 'idCiudad'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Indicador de estado de actividad de la direccion',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION',
	@level2type = N'COLUMN', @level2name = 'indActivo'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Fecha que se realizo el registro',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DIRECCION',
	@level2type = N'COLUMN', @level2name = 'fecRegistro'
GO

/*******************TABLA SUCURSAL***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los registros de cada sucursal',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'SUCURSAL'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada sucursal',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'SUCURSAL',
	@level2type = N'COLUMN', @level2name = 'idSucursal'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Nombre descriptivo de la sucursal',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'SUCURSAL',
	@level2type = N'COLUMN', @level2name = 'nombreSucursal'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico proveniente de la tabla direccion',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'SUCURSAL',
	@level2type = N'COLUMN', @level2name = 'idDireccion'
GO


/*******************TABLA CIUDAD***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los registros de cada sucursal',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'CIUDAD'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada ciudad',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'CIUDAD',
	@level2type = N'COLUMN', @level2name = 'idCiudad'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Nombre de la ciudad',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'CIUDAD',
	@level2type = N'COLUMN', @level2name = 'nombreCiudad'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico de la tabla departamento',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'CIUDAD',
	@level2type = N'COLUMN', @level2name = 'idDepartamento'
GO

/*******************TABLA DEPARTAMENTO***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los registros de cada departamento',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DEPARTAMENTO'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada departamento',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DEPARTAMENTO',
	@level2type = N'COLUMN', @level2name = 'idDepartamento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Nombre del departamento',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DEPARTAMENTO',
	@level2type = N'COLUMN', @level2name = 'nombreDepartamento'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico proveniento de la tabla pais',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'DEPARTAMENTO',
	@level2type = N'COLUMN', @level2name = 'idPais'
GO

/*******************TABLA PAIS***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los registros de cada pais',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'PAIS'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada pais',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'PAIS',
	@level2type = N'COLUMN', @level2name = 'idPais'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Nombre del pais en registro',
	@level0type = N'SCHEMA', @level0name = 'Ubicacion',
	@level1type = N'TABLE', @level1name = 'PAIS',
	@level2type = N'COLUMN', @level2name = 'nombrePais'
GO

/*******************TABLA TIPO DE TARJETA***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los registros de cada tipo de tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TIPO_TARJETA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada tipo de tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TIPO_TARJETA',
	@level2type = N'COLUMN', @level2name = 'idTipoTarjeta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Descripcion del tipo de la tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TIPO_TARJETA',
	@level2type = N'COLUMN', @level2name = 'descripcion'
GO

/*******************TABLA CUENTA***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los datos historiales de las cuentas',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada tipo de historial de la cuenta',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'idHistorialCuenta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico proveniente de la tabla cuenta',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'idCuenta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico proveniente de la tabla persona',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'idPersona'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Cantidad de saldo del cuenta',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'saldo'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Cantidad del interes cobrado de la cuenta',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'interes'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Indicador de estado de actividad de la cuenta',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'indCuentaActivo'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Fecha que se realizo el registro',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'fechaRegistro'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Codigo unico foraneo proveniente de la tabla persona',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'codUsuario'
GO

/*******************TABLA SERIAL***********************/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene los numeros autoincrementables para las tablas transaccionales',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'SERIAL'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador unico para cada serial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'SERIAL',
	@level2type = N'COLUMN', @level2name = 'idSerial'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Identificador foraneo unico proveniente de la tabla tipo serial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'SERIAL',
	@level2type = N'COLUMN', @level2name = 'idTipoSerial'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo nombreTipoSerial de la entidad SERIAL',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'SERIAL',
	@level2type = N'COLUMN', @level2name = 'valor'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fechaModificacion de la entidad SERIAL',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'SERIAL',
	@level2type = N'COLUMN', @level2name = 'fechaModificacion'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de las tarjetas',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador unico de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'idTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo valor de tarjeta de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'valorTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo codigo de verificacion de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'codigoVerificacion'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fecha emision de la entindad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'fechaEmision'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fecha vencimiento de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'fecVencimiento'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='llave foranea idTipotarjeta en de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'idTipoTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='llave foranea idMarcaTarjeta en de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'idMarcaTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='llave foranea idEstadoTarjeta en de la entidad tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'TARJETA',
	@level2type = N'COLUMN', @level2name = 'idEstadoTarjeta'
GO
/*-------------------------------------------------------------------*/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de estado tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ESTADO_TARJETA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador unico de la entidad estado tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ESTADO_TARJETA',
	@level2type = N'COLUMN', @level2name = 'idEstadoTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo estado tarjeta de la entidad estado tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ESTADO_TARJETA',
	@level2type = N'COLUMN', @level2name = 'estadoTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo descripcion de la entidad estado tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ESTADO_TARJETA',
	@level2type = N'COLUMN', @level2name = 'descripcion'
GO
/*--------------------------------------*/

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de marca tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'MARCA_TARJETA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador unico de la entidad marca tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'MARCA_TARJETA',
	@level2type = N'COLUMN', @level2name = 'idMarcaTarjeta'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo  nombreMarca de la entidad marca tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'MARCA_TARJETA',
	@level2type = N'COLUMN', @level2name = 'nombreMarca'
GO

/*--------------------------------*/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de asignacion tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONTARJETA'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='llave foranea idTarjeta en asignacion tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONTARJETA',
	@level2type = N'COLUMN', @level2name = 'idTarjeta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='lleva foranea idCuenta en asignacion tarjeta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'ASIGNACIONTARJETA',
	@level2type = N'COLUMN', @level2name = 'idCuenta'
GO
/*-----------------------*/

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de asignacion Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador unico de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'idCuenta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='llave foranea idPersona en entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'idPersona'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo saldo de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'saldo'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo interes de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'interes'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo indCuentaActivo de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'indCuentaActivo'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fecRegistro de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'fecRegistro'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo codUsuario de la entidad Cuenta',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA',
	@level2type = N'COLUMN', @level2name = 'codUsuario'
GO

/*--------------------------*/
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de asignacion CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador foreneo idCuenta de la entidad CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO',
	@level2type = N'COLUMN', @level2name = 'idCuenta'
GO

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fechaInicio entidad CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO',
	@level2type = N'COLUMN', @level2name = 'fechaInicio'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo fechaTermino entidad CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO',
	@level2type = N'COLUMN', @level2name = 'fechaTermino'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo cantidadInicial entidad CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO',
	@level2type = N'COLUMN', @level2name = 'cantidadInicial'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo cantidadFinal entidad CUENTA_PLAZO_FIJO',
	@level0type = N'SCHEMA', @level0name = 'Cuentas',
	@level1type = N'TABLE', @level1name = 'CUENTA_PLAZO_FIJO',
	@level2type = N'COLUMN', @level2name = 'cantidadFinal'
GO

/*--------*/

EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='Tabla que contiene datos de asignacion TIPO_SERIAL',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'TIPO_SERIAL'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='identificador unico de la entidad idTipoSerial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'TIPO_SERIAL',
	@level2type = N'COLUMN', @level2name = 'idTipoSerial'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='campo nombreTipoSerial de la entidad idTipoSerial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'TIPO_SERIAL',
	@level2type = N'COLUMN', @level2name = 'nombreTipoSerial'
GO
EXEC sys.sp_addextendedproperty
	@name = 'MS_Description', @value='ca,po descripcion de la entidad idTipoSerial',
	@level0type = N'SCHEMA', @level0name = 'Historial',
	@level1type = N'TABLE', @level1name = 'TIPO_SERIAL',
	@level2type = N'COLUMN', @level2name = 'descripcion'
GO



--Visualizar El Diccionario de Datos

SELECT t.name
	   ,d1.value
	   , c.name
	   , c.column_id
	   , d2.value
	FROM sys.tables t
	INNER JOIN sys.columns c
	ON c.object_id = t.object_id
	INNER JOIN sys.extended_properties d1
		ON d1.major_id = t.object_id
	and d1.minor_id = 0
	INNER JOIN sys.extended_properties d2
		ON d2.major_id = t.object_id
	and d2.minor_id = c.column_id
	WHERE type = 'U'

	