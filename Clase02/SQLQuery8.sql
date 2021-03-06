USE [EduTec]
GO

CREATE APPLICATION ROLE RolDemo 
WITH PASSWORD = N'secreto#2020'
GO

grant select on dbo.empleado to RolDemo;
grant select on dbo.curso to RolDemo;
grant select on dbo.profesor to RolDemo;
GRANT EXECUTE ON dbo.sp_empledos TO gustavo
GO


CREATE LOGIN panchito 
WITH
	PASSWORD='panchito', 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
GO

USE [EduTec]
GO
CREATE USER [panchito] FOR LOGIN [panchito]
GO

-- Panchito

USE [EduTec]
GO

sp_setapprole 'RolDemo', 'secreto#2020'
go

select * from dbo.Empleado;
go






