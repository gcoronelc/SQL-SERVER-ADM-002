-- Paso 1: Preparar el ambiente de trabajo

use master;
go

drop database perudev;
go

create database perudev;
go

alter database perudev
set recovery FULL
go

select databasepropertyex( 'perudev','Recovery' )
go


-- PASO 2.- Crear el Dispositivo de Almacenamiento

SELECT * FROM sys.backup_devices;
GO

EXEC sp_dropdevice 'PD';  
go

exec sp_addumpdevice 'disk', 'PERUDEV', 'G:\EGCC\BAK\PDDevice.bak'
go


-- PASO 3.- Crear la Tabla de Prueba

create table perudev..test(
	id Int Identity Primary Key,
	dato varchar(30)
)
go

declare @k int
set @k = 0
while (@k < 100)
begin
	begin tran
	insert into perudev..test(dato) values('Backup de Base de Datos')
	commit tran
	set @k = @k + 1
end
go

SELECT * FROM PERUDEV..test;
GO


-- PASO 4: (DOMINGO) FULL BACKUP

backup database perudev
to PERUDEV
with
	format,
	name = 'FULL Backup',
	description = 'FULL Backup de la base de datos.'
go

restore headeronly from perudev;
go


-- PASO 5.- (LUNES) Realizar un Primer Backup Diferencial

-- Actividad del lunes
declare @k int
set @k = 0
while (@k < 100)
begin
	begin tran
	insert into perudev..test(dato) values('Actividad del lunes.')
	commit tran
	set @k = @k + 1
end
go


backup database perudev
to perudev
with
	differential,
	name = 'BakDif01',
	description = 'Primer (Lunes) backup diferencial dela base de datos'
go

restore headeronly from perudev
go

-- PASO 6.- Realizar un Segundo Backup Diferencial

-- Actividad del día
declare @k int
set @k = 0
while (@k < 100)
begin
	begin tran
	insert into perudev..test(dato) values('(Martes) 2do. Backup Dif.')
	commit tran
	set @k = @k + 1
end
go


backup database perudev
to perudev
with
	differential,
	name = 'BakDif02',
	description = 'Segundo backup diferencial de la base de datos'
go

restore headeronly from perudev
go

-- Paso 7: Actividad del miercoles

declare @k int
set @k = 0
while (@k < 100)
begin
	begin tran
	insert into perudev..test(dato) values('Dia de Miercoles.')
	commit tran
	set @k = @k + 1
end
go


-- Paso 8: Error a las 11 AM del Miercoles
-- Backup del log

backup log perudev
to perudev
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
DROP DATABASE PERUDEV;
GO

restore headeronly from perudev
go

RESTORE DATABASE PeruDev
FROM perudev
WITH file=1;
go

SELECT * FROM PERUDEV..TEST;
GO

-- CASO 2:

USE master;
DROP DATABASE PERUDEV;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE PeruDev
FROM perudev
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE PeruDev
FROM perudev
WITH file=2, RECOVERY;
go

SELECT * FROM PERUDEV..TEST;
GO

-- CASO 3: Hasta el Martes

USE master;
DROP DATABASE PERUDEV;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE PeruDev
FROM perudev
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE PeruDev
FROM perudev
WITH file=3, RECOVERY;
go

SELECT * FROM PERUDEV..TEST;
GO



-- CASO 3: Hasta el momento del error (Miercoles)

USE master;
DROP DATABASE PERUDEV;
GO

restore headeronly from perudev
go

-- Restaurar el FULL
RESTORE DATABASE PeruDev
FROM perudev
WITH file=1, NORECOVERY;
go

-- Restaurar el DIF
RESTORE DATABASE PeruDev
FROM perudev
WITH file=3, NORECOVERY;
go

-- Restaurar el LOG
RESTORE LOG PeruDev
FROM perudev
WITH file=4, RECOVERY;
go

SELECT * FROM PERUDEV..TEST;
GO




