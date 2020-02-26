-- Paso 1: Creacion de la Base de Datos REVISTA
use master
go

drop database REVISTA
go

create database REVISTA
go
-- PASO 2.- Crear el Dispositivo de Almacenamiento

SELECT * FROM sys.backup_devices;	--muestra dispositivos
GO

exec sp_addumpdevice 'disk', 'REVISTA', 'C:\BAKREVISTA\PDDevice.bak'
go

alter database REVISTA	--modelo de recuperacion
set recovery FULL
go

SELECT * FROM sys.backup_devices;
GO
-- PASO 3: (DOMINGO) FULL BACKUP

BACKUP DATABASE [REVISTA]
	TO  DISK = 'C:\BAKREVISTA\PDDevice.bak' 
	WITH
	format,
	NAME = 'REVISTA-Completa Base de datos Copia de seguridad'
GO

restore headeronly from REVISTA;
go

-- PASO 4.- (LUNES) Realizar un Primer Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Primer (Lunes) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go
--(MARTES) Realizar Segundo Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Segundo (Martes) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go

--(MIERCOLES) Realizar Tercer Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Tercer (Miercoles) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go

--(JUEVES) Realizar Cuarto Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Cuarto (Jueves) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go

--(VIERNES) Realizar Quinto Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Quinto (Viernes) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go

--(SÁBADO) Realizar Sexto Backup Diferencial

ALTER DATABASE REVISTA
SET RECOVERY SIMPLE
GO

use REVISTA
DBCC SHRINKFILE ('REVISTA_log' )--para reducir el archivo.
GO

/* Hora de la copia 10:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 13:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 17:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go
/* Hora de la copia 22:00 am */
backup log REVISTA
to REVISTA
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log.'
go

ALTER DATABASE REVISTA
SET RECOVERY FULL
GO

backup database REVISTA
to REVISTA
with
	differential,
	name = 'BakDif01',
	description = 'Sexto (Sábado) backup diferencial dela base de datos'
go

restore headeronly from REVISTA
go

--(DOMINGO) Realizar Backup Full

BACKUP DATABASE [REVISTA]
	TO  DISK = 'C:\BAKREVISTA\PDDevice.bak' 
	WITH
	format,
	NAME = 'REVISTA-Completa Base de datos Copia de seguridad (SEMANA 000024)'
GO

restore headeronly from REVISTA;
go

