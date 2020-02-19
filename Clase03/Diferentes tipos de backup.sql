USE MASTER;
GO

BACKUP DATABASE EduTec 
TO  DISK = 'G:\EGCC\BAK\CS-EDUTEC.BAK'
WITH NAME = 'EduTec-Completa Base de datos Copia de seguridad';
GO

BACKUP DATABASE EduTec
TO  DISK = 'G:\EGCC\BAK\CS-EDUTEC.BAK' 
WITH DIFFERENTIAL, 
	 NAME = 'EduTec-Diferencial Copia de seguridad'
GO


BACKUP LOG EduTec 
TO  DISK = 'G:\EGCC\BAK\CS-EDUTEC.BAK' 
WITH NAME = 'EduTec-Log Copia de seguridad'
GO

restore headeronly from disk = 'G:\EGCC\BAK\CS-EDUTEC.BAK';
go






