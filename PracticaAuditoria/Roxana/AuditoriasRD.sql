--CREACION DE UNA AUDITORIA A NIVEL DE SERVIDOR

USE [master]

GO

CREATE SERVER AUDIT [AuditoriaRD]
TO FILE 
(	FILEPATH = N'E:\SQL3\Auditoria'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
)

GO

-- ESPECIFICACION DE AUDITORIA A NIVEL DE SERVIDOR
USE [master]

GO

CREATE SERVER AUDIT SPECIFICATION [ServerAuditSpecification-20200227-003046]
FOR SERVER AUDIT [AuditoriaRD]
ADD (DATABASE_OBJECT_CHANGE_GROUP), --> el evento ocurre cuando se crea, modifica ó elimina un objeto de la base de datos
ADD (FAILED_LOGIN_GROUP) --> el evento ocurre cuando una entidad de seguridad intenta iniciar una sesión SQL Server y no lo consigue

GO

--EJEMPLOS:
CREATE TABLE T1 (
ID INT
)

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

--CREACION DE UNA AUDITORIA A NIVEL DE BASE DE DATOS
USE [master]

GO

CREATE SERVER AUDIT [AuditoriaDRNorthwind]
TO FILE 
(	FILEPATH = N'E:\SQL3\Auditoria'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
)
WITH
(	QUEUE_DELAY = 1000
	,ON_FAILURE = CONTINUE
)

GO

-- CREACION DE ESPECIFICACIONES DE AUDITORIA A NIVEL DE BASE DE DATOS
USE [EduTec]

GO

CREATE DATABASE AUDIT SPECIFICATION [DatabaseAuditSpecification-20200227-004716]
FOR SERVER AUDIT [AuditoriaDRNorthwind]
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (DELETE ON OBJECT::[dbo].[Alumno] BY [dbo]),
ADD (INSERT ON OBJECT::[dbo].[Profesor] BY [dbo]),
ADD (UPDATE ON OBJECT::[dbo].[Tarifa] BY [dbo])

GO

--EJEMPLOS:
CREATE TABLE T2 (
ID INT
) 

DELETE FROM [Profesor] WHERE IdAlumno='A0001'
GO

INSERT INTO Profesor VALUES ('P043','AVALOS','ALMENDRA','SMP','NONE','NONE')
GO

UPDATE Tarifa SET PreTarifa=1500
--SELECT	*
FROM Tarifa WHERE IdTarifa='E'