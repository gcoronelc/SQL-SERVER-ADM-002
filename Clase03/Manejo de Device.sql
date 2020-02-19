USE master;
go

EXEC sp_addumpdevice 'disk', 'mybackupfile', 
	 'G:\EGCC\BAK\MyBackupFile.bak';
GO

BACKUP DATABASE EduTec 
TO  mybackupfile
WITH FORMAT, INIT,  
NAME = 'Copia de seguridad completa de EDUTEC'
GO

BACKUP DATABASE Northwind 
TO  mybackupfile
WITH NOFORMAT, NOINIT,  
NAME = 'Copia de seguridad completa de NORTHWIND'
GO

BACKUP DATABASE RH 
TO  mybackupfile
WITH NOFORMAT, NOINIT,  
NAME = 'Copia de seguridad completa de RH'
GO

restore headeronly from mybackupfile
go



