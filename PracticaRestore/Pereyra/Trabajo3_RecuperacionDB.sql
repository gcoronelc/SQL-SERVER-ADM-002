/*
Se realizara una simulacion de una copia de respaldo y restauracion de una Base de datos
siguiendo un plan estrategico

Lunes : - Copia de Seguridad de la base de datos
		- Copia de log1
		- Copia de log2
		- Copia de log3
		- Copia de log4

Martes : - Copia Diferencial
		 - Copia de Log1
		 - Error / Copia Log2
		 - Restauracion
*/

use master
go

-- 1. Creamos la base de datos
create database EmpresaMudanzaSA
go


--2. Cambiamos al modo de recuperacion completa
alter database EmpresaMudanzaSA
	set recovery FULL
go

select DATABASEPROPERTYEX('EmpresaMudanzaSA','Recovery')
go

--3. Creamos el Dispositivo de Almacenamiento
exec sp_addumpdevice 'disk', 'EMSABack', 'C:\Users\gerson\Desktop\SQL 3\Recursos\EmsaBackup.bak'
go

select * from master.dbo.sysdevices
go

--4. Creamos data de prueba

create table EmpresaMudanzaSA..test(
	id Int Identity Primary Key,
	dato varchar(30)
)
go

--5. Cargamos datos

declare @k int
set @k = 0
while (@k < 10)
	begin
	begin tran
	insert into EmpresaMudanzaSA..test(dato) values('Backup de la base de datos')
	commit tran
	set @k = @k + 1
	end
go

select * from EmpresaMudanzaSA..test
go

--6. Realizamos el Backup de la base de datos completa
backup database EmpresaMudanzaSA
	to EMSABack
	with
	format,
	name = 'BACKUP_DB',
	description = 'Backup de la base de datos completa'
go

restore headeronly from EMSABack
go

--7. Realizamos el backup del Log1

-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('Ingreso datos antes del Log1')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup log EmpresaMudanzaSA
to EMSABack
	with
	no_truncate,
	name = 'BakLog1',
	description = 'Backup del log1.'
go

restore headeronly from EMSABack
go

--8. Realizamos el backup del Log2
-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('Ingreso datos antes del Log2')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup log EmpresaMudanzaSA
to EMSABack
	with
	no_truncate,
	name = 'BakLog2',
	description = 'Backup del log2.'
go

restore headeronly from EMSABack
go

--9. Realizamos el backup del Log3
-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('Ingreso datos antes del Log3')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup log EmpresaMudanzaSA
to EMSABack
	with
	no_truncate,
	name = 'BakLog3',
	description = 'Backup del log3.'
go

restore headeronly from EMSABack
go

--10. Realizamos el backup del Log4
-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('Ingreso datos antes del Log4')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup log EmpresaMudanzaSA
to EMSABack
	with
	no_truncate,
	name = 'BakLog4',
	description = 'Backup del log4.'
go

restore headeronly from EMSABack
go

--11. Realizamos el backup del diferencial
-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('Ingreso datos antes del diff')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup database EmpresaMudanzaSA
to EMSABack
with
differential,
name = 'BackupDiff1',
description = 'Backup de Diff - Martes'
go

restore headeronly from EMSABack
go


--7. Realizamos el backup del Log1 - Martes

-- Activiad Previa
declare @k int
set @k = 0
while (@k < 10)
begin
begin tran
insert into EmpresaMudanzaSA..test(dato) values('datos antes del Log1-Mar')
commit tran
set @k = @k + 1
end
go

select * from EmpresaMudanzaSA..test
go

--Limpieza de log 

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY SIMPLE
GO

use EmpresaMudanzaSA
DBCC SHRINKFILE ('EmpresaMudanzaSA_log',1)
GO

ALTER DATABASE EmpresaMudanzaSA 
SET RECOVERY FULL
GO

--Hacemos Backup del log

backup log EmpresaMudanzaSA
to EMSABack
	with
	no_truncate,
	name = 'BakLog1-Mar',
	description = 'Backup del log1-Martes.'
go

restore headeronly from EMSABack
go

use master

drop database EmpresaMudanzaSA
go

--Restauramos

-- Restaurar el FULL
RESTORE DATABASE EmpresaMudanzaSA
FROM EMSABack
WITH file=1, NORECOVERY;
go

-- Restaurar el DIFF Martes
RESTORE DATABASE EmpresaMudanzaSA
FROM EMSABack
WITH file=6, NORECOVERY;
go

--REstauramos el primer log de Martes
RESTORE LOG EmpresaMudanzaSA
FROM EMSABack
WITH file=7, RECOVERY;
go

use EmpresaMudanzaSA