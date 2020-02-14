
SELECT CONVERT(char(20), SERVERPROPERTY('productlevel')) ; 
GO

-- Consultar las tablas de la BD

select * from INFORMATION_SCHEMA.TABLES
go

select * from sys.sql_logins
go

select 
	name "LOGIN", 
	default_database_name "DATABASE", 
	default_language_name "LANGUAGE" 
from sys.sql_logins 
where name = 'panchito'; 
go




