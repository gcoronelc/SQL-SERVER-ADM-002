--Auditoria de Servidor
USE [master]

GO

CREATE SERVER AUDIT [AUDITORIA_MARTEL_MARQUEZ]
TO FILE 
(	FILEPATH = N'E:\HD1'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
)

GO

--Especificacion de la auditoria del Servidor

USE [master]

GO

CREATE SERVER AUDIT SPECIFICATION [AuditoriaServidor]
FOR SERVER AUDIT [AUDITORIA_MARTEL_MARQUEZ]
ADD (LOGIN_CHANGE_PASSWORD_GROUP)

GO

--NOTA: Habilitar la Auditoria y Especificación de Auditoría

USE [EDUTEC2]

GO

CREATE DATABASE AUDIT SPECIFICATION [EspecificacionDatabase]
FOR SERVER AUDIT [Auditoria Semana X]
ADD (DELETE ON OBJECT::[dbo].[Alumno] BY [dbo]),
ADD (INSERT ON OBJECT::[dbo].[Alumno] BY [dbo]),
ADD (UPDATE ON OBJECT::[dbo].[Alumno] BY [dbo])

GO


--Especificación de la auditoria de Base de datos

--Trigger para auditoria
USE master
GO

CREATE DATABASE [TAREA04]
GO

USE [TAREA04]
GO

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   DOCUMENTO            char(13)             not null,
   NOMBRES              char(70)             not null,
   APELLIDOS            char(70)             not null,
   DIRECCION            char(30)             not null,
   TELEFONO             char(15)             not null,
)

GO

/*==============================================================*/
/* Table: ESPECIALIDAD                                              */
/*==============================================================*/
create table ESPECIALIDAD (
   CODIGO_ES            char(1)             not null,
   DIA_HOR              char(10)             null,
   DESCRIPCION_ES       char(30)             not null,
)
GO
/*==============================================================*/
/* Table: AUDITORIA                                              */
/*==============================================================*/
CREATE TABLE AUDITORIA(
	CODIGO_AU INT IDENTITY(1,1)  PRIMARY KEY,
	USUARIO_AU VARCHAR(20) NOT NULL,
	TABLA VARCHAR(20) NOT NULL,
	ACCION VARCHAR(20) NOT NULL,
	REGISTRO VARCHAR(12) NOT NULL,
	NOMBRE VARCHAR(70) NOT NULL,
	DESCRIPCION VARCHAR(50),
	FECHA_HORA DATETIME NOT NULL
)
GO	
/*==============================================================*/
/* Trigger: Insertar                                              */
/*==============================================================*/
	CREATE trigger [TR_Auditoriap_Inseratr]
	ON PACIENTE
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','PACIENTE','INSERTÓ',DOCUMENTO,RTRIM(NOMBRES)+' '+RTRIM(APELLIDOS), 
		'NINGUNA',GETDATE() from inserted
		END;

GO
/*==============================================================*/
/* Trigger: Actualizar                                          */
/*==============================================================*/
	CREATE trigger [TR_Auditoriap_Actualizar]
	ON PACIENTE
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','PACIENTE','ACTUALIZÓ',DOCUMENTO,RTRIM(NOMBRES)+' '+RTRIM(APELLIDOS), 
		(select RTRIM(NOMBRES)+' '+RTRIM(APELLIDOS) from deleted),GETDATE() from inserted
		END;

GO
/*==============================================================*/
/* Trigger: Eliminar                                              */
/*==============================================================*/
		CREATE trigger [TR_AuditoriaP_Eliminar]
	ON PACIENTE
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','PACIENTE','ELIMINÓ',DOCUMENTO,RTRIM(NOMBRES)+' '+RTRIM(APELLIDOS), 
		'NINGUNA',GETDATE() from deleted
		END;
GO
/*==============================================================*/
/* Trigger: Insertar                                              */
/*==============================================================*/
	CREATE trigger [TR_AuditoriaE_Inseratr]
	ON ESPECIALIDAD
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','ESPECIALIDAD','INSERTÓ',CODIGO_ES,DESCRIPCION_ES,'NINGUNA', 
		GETDATE() from inserted
		END;

GO
/*==============================================================*/
/* Trigger: Actualizar                                          */
/*==============================================================*/
	CREATE trigger [TR_AuditoriaE_Actualizar]
	ON ESPECIALIDAD
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','ESPECIALIDAD','ACTUALIZÓ',CODIGO_ES,DESCRIPCION_ES, 
		(select DESCRIPCION_ES from deleted),GETDATE() from inserted
		END;

GO
/*==============================================================*/
/* Trigger: Eliminar                                              */
/*==============================================================*/
		CREATE trigger [TR_AuditoriaE_Eliminar]
	ON ESPECIALIDAD
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','ESPECIALIDAD','INSERTÓ',CODIGO_ES,DESCRIPCION_ES, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
/*==============================================================*/
/* SE INSERTA EN LA TABLA PACIENTE                              */
/*==============================================================*/
INSERT PACIENTE VALUES ('12345','CRISTIAN CAMILO','MOSQUERA LOPEZ','XXXXX','998877')
GO
UPDATE PACIENTE SET NOMBRES='XXXXXXX',APELLIDOS='XXXXXXXX'
					WHERE DOCUMENTO='12345'
GO
DELETE FROM PACIENTE WHERE DOCUMENTO='12345'
GO
/*==============================================================*/
/* SE INSERTA EN LA TABLA ESPECIALIDAS                          */
/*==============================================================*/
INSERT ESPECIALIDAD VALUES ('1','LUNES','CARDIOANGIOLOGIA')
GO
UPDATE ESPECIALIDAD SET DIA_HOR='xxxxx', DESCRIPCION_ES='xxxx'
						WHERE CODIGO_ES='1'
GO
DELETE FROM ESPECIALIDAD WHERE CODIGO_ES='1'
GO

SELECT * FROM DBO.AUDITORIA;
GO
