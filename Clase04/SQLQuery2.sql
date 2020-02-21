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




