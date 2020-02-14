
-- Creación del inicio de sesión
USE master
GO

CREATE LOGIN gustavo 
WITH
	PASSWORD='gustavo', 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
GO

-- El siguiente script se debe ejecutar con el inicio de sesión sa 

USE EduTec 
GO 

CREATE USER gustavo FOR LOGIN gustavo 
GO

-- El siguiente script se debe ejecutar con el inicio de sesión gustavo: 

USE EduTec 
GO 

select * from dbo.curso 
GO


-- El siguiente script se debe ejecutar con el inicio de sesión sa 

use EduTec 
GO 

GRANT SELECT ON dbo.Curso TO public 
GO

-- El siguiente script se debe ejecutar con el inicio de sesión gustavo: 

USE EduTec 
GO 

select * from dbo.curso 
GO
