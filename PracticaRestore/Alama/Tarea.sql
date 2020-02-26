--DE DICIEMBRE A FEBRERO

-- Paso 1: Preparar el ambiente de trabajo

use master;
go

drop database MPS;
go

create database MPS;
go

alter database MPS
set recovery FULL
go

select databasepropertyex( 'MPS','Recovery' )
go


-- PASO 2.- Crear el Dispositivo de Almacenamiento

SELECT * FROM sys.backup_devices;
GO

exec sp_addumpdevice 'disk', 'MPS', 'C:\EGCC\BAK\MPS.bak'
go


-- PASO 3.- Crear la Tabla de Prueba


create table MPS..test(
	id Int Identity Primary Key,
	dato varchar(30)
)
go

declare @k int
set @k = 0
while (@k < 20)
begin
	begin tran
	insert into MPS..test(dato) values('Backup de Base de Datos')
	commit tran
	set @k = @k + 1
end
go

SELECT count(1) FROM MPS..test;
GO


-- PASO 4: (1ER DÍA DEL MES-DOMINGO) FULL BACKUP

backup database MPS
to MPS
with
	format,
	name = 'FULL Backup',
	description = 'FULL Backup de la base de datos.'
go

restore headeronly from MPS;
go


-- PASO 5.- (LUNES) Realizar un Primer Backup Diferencial

-- Actividad del lunes (MATRICULAS)
declare @k int
set @k = 0
while (@k < 15)
begin
	begin tran
	insert into perudev..test(dato) values('Actividad del lunes.')
	commit tran
	set @k = @k + 1
end
go

ALTER DATABASE MPS 
SET RECOVERY SIMPLE
GO

use MPS
DBCC SHRINKFILE ('MPS_log' )
GO

ALTER DATABASE MPS 
SET RECOVERY FULL
GO

backup database MPS
to MPS
with
	differential,
	name = 'BackupDiferencial1',
	description = 'Primer  backup diferencial dela base de datos(Lunes)'
go

restore headeronly from MPS
go

-- PASO 6.- Realizar un Segundo Backup Diferencial (Martes)

-- Actividad del día (Matriculados)
declare @k int
set @k = 0
while (@k < 5)
begin
	begin tran
	insert into MPS..test(dato) values('(Martes) 2do. Backup Dif.')
	commit tran
	set @k = @k + 1
end
go

ALTER DATABASE MPS
SET RECOVERY SIMPLE
GO

use MPS
DBCC SHRINKFILE ('MPS_log' )
GO

ALTER DATABASE MPS
SET RECOVERY FULL
GO


backup database MPS
to MPS
with
	differential,
	name = 'BackupDiferencial2',
	description = 'Segundo backup diferencial de la base de datos'
go

restore headeronly from MPS
go

-- Actividad del día Miercoles (Matriculados)
declare @k int
set @k = 0
while (@k < 5)
begin
	begin tran
	insert into MPS..test(dato) values('(Miercoles) 3er. Backup Dif.')
	commit tran
	set @k = @k + 1
end
go

ALTER DATABASE MPS
SET RECOVERY SIMPLE
GO

use MPS
DBCC SHRINKFILE ('MPS_log' )
GO

ALTER DATABASE MPS
SET RECOVERY FULL
GO


backup database MPS
to MPS
with
	differential,
	name = 'BackupDiferencial3',
	description = 'Tercer backup diferencial de la base de datos'
go

restore headeronly from MPS
go

-- Actividad del día jueves (Matriculados)
declare @k int
set @k = 0
while (@k < 25)
begin
	begin tran
	insert into MPS..test(dato) values('(Jueves) 4to. Backup Dif.')
	commit tran
	set @k = @k + 1
end
go

ALTER DATABASE MPS
SET RECOVERY SIMPLE
GO

use MPS
DBCC SHRINKFILE ('MPS_log' )
GO

ALTER DATABASE MPS
SET RECOVERY FULL
GO


backup database MPS
to MPS
with
	differential,
	name = 'BackupDiferencial4',
	description = 'Cuarto backup diferencial de la base de datos'
go

restore headeronly from MPS
go
-- Paso 7: Actividad del viernes 10 am (Matriculados)

declare @k int
set @k = 0
while (@k < 10)
begin
	begin tran
	insert into perudev..test(dato) values('Dia de viernes.')
	commit tran
	set @k = @k + 1
end
go


-- Paso 8: Error a las 6 pm del viernes
-- Backup del log

backup log MPS
to MPS
with
	no_truncate,
	name = 'BakLog',
	description = 'Backup del log despues del error.'
go

restore headeronly from perudev
go


-- PROCESO DE RESTAURACION

-- CASO 1: SOLO BASE DE DATOS

USE master;
DROP DATABASE MPS;
GO

restore headeronly from MPS
go

RESTORE DATABASE MPS
FROM MPS
WITH file=1;
go

SELECT COUNT(1) FROM MPS..TEST;
GO

-- CASO 2:

USE master;
DROP DATABASE MPS;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE MPS
FROM MPS
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=2, RECOVERY;
go

SELECT COUNT(1) FROM MPS..TEST;
GO

SELECT * FROM  MPS..TEST;
GO

-- CASO 3: Hasta el Martes

USE master;
DROP DATABASE MPS;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE MPS
FROM MPS
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=3, RECOVERY;
go

SELECT * FROM MPS..TEST;
GO

--CASO 4:Hasta el miércoles
USE master;
DROP DATABASE MPS;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE MPS
FROM MPS
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=4, RECOVERY;
go

SELECT * FROM MPS..TEST;
GO

--CASO 5:Hasta el jueves
USE master;
DROP DATABASE MPS;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE MPS
FROM MPS
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=5, RECOVERY;
go

SELECT * FROM MPS..TEST;
GO

-- CASO 6: Hasta el momento del error (Viernes)

USE master;
DROP DATABASE MPS;
GO

restore headeronly from MPS
go

-- Restaurar el FULL
RESTORE DATABASE MPSPeruDev
FROM MPS
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=2, NORECOVERY;
go
-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=3, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE MPS
FROM MPS
WITH file=4, NORECOVERY;
go
-- Restaurar el LOG
RESTORE LOG MPS
FROM MPS
WITH file=5, RECOVERY;
go

SELECT * FROM MPS..TEST;
GO


