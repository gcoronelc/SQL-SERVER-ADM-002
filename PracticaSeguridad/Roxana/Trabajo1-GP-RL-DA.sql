--Pregunta 1
--Creación del usuario administrador
USE [master]
GO
CREATE LOGIN [LAPTOP-MB0GODFL\gp] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [LAPTOP-MB0GODFL\gp]
GO
use [master];
GO
use [Northwind];
GO
USE [master]
GO
CREATE USER [LAPTOP-MB0GODFL\gp] FOR LOGIN [LAPTOP-MB0GODFL\gp]
GO
USE [master]
GO
ALTER USER [LAPTOP-MB0GODFL\gp] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [LAPTOP-MB0GODFL\gp] FOR LOGIN [LAPTOP-MB0GODFL\gp]
GO
USE [Northwind]
GO
ALTER USER [LAPTOP-MB0GODFL\gp] WITH DEFAULT_SCHEMA=[dbo]
GO


-- Pregunta 2
--Creando Usario para acceso a tablas (AFULLER)
USE [master]
GO
CREATE LOGIN [AFULLER] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [AFULLER]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [AFULLER] FOR LOGIN [AFULLER]
GO

--Otorgando Permisos
USE [Northwind]
GO
CREATE USER [AFULLER] FOR LOGIN [AFULLER] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT ALTER ON [dbo].[Employees] TO [AFULLER]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Employees] TO [AFULLER]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Employees] TO [AFULLER]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Employees] TO [AFULLER]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Employees] TO [AFULLER]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [AFULLER]
GO

--pregunta 3 

-- [jleverling]

USE [master]
GO
CREATE LOGIN [jleverling] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [jleverling]
GO
USE [Northwind]
GO
CREATE USER [jleverling] FOR LOGIN [jleverling]
GO


CREATE USER [jleverling] FOR LOGIN [jleverling] WITH DEFAULT_SCHEMA=[dbo]
GO

--[mpeacock]

USE [master]
GO
CREATE LOGIN [mpeacock] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [mpeacock]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [mpeacock] FOR LOGIN [mpeacock]
GO

CREATE USER [mpeacock] FOR LOGIN [mpeacock] WITH DEFAULT_SCHEMA=[dbo]
GO

--Dando Permisos

use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [mpeacock]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [mpeacock]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [mpeacock]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [mpeacock]
GO

GRANT DELETE ON [dbo].[Orders] TO [jleverling]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [jleverling]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [jleverling]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [jleverling]
GO

--Pergunta 4

USE [master]
GO
CREATE LOGIN [sbuchanan] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [sbuchanan]
GO
USE [Northwind]
GO
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan]
GO
--Dando Permisos
USE [Northwind]
GO
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Products] TO [sbuchanan]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Products] TO [sbuchanan]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Products] TO [sbuchanan]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Products] TO [sbuchanan]
GO

--	Pregunta 5

USE [master]
GO
CREATE LOGIN [msuyama] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [msuyama]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [msuyama] FOR LOGIN [msuyama]
GO

USE [master]
GO
CREATE LOGIN [rking] WITH PASSWORD=N'sql' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [rking] FOR LOGIN [rking]
GO


USE [master]
GO
CREATE LOGIN [adodsworth] WITH PASSWORD=N'sql' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [adodsworth]
GO
USE [Northwind]
GO
CREATE USER [adodsworth] FOR LOGIN [adodsworth]
GO


-- Permisos ORDERS

USE [Northwind]
GO
CREATE USER [msuyama] FOR LOGIN [msuyama] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [msuyama]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [msuyama]
GO

USE [Northwind]
GO
CREATE USER [rking] FOR LOGIN [rking] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [rking]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [rking]
GO

USE [Northwind]
GO
CREATE USER [adodsworth] FOR LOGIN [adodsworth] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [adodsworth]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [adodsworth]
GO

--Permisos Gerente
USE [Northwind]
GO
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [sbuchanan]
GO

-- Permisos CLientes

USE [Northwind]
GO
CREATE USER [msuyama] FOR LOGIN [msuyama] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Customers] TO [msuyama]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Customers] TO [msuyama]
GO

USE [Northwind]
GO
CREATE USER [rking] FOR LOGIN [rking] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Customers] TO [rking]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Customers] TO [rking]
GO

USE [Northwind]
GO
CREATE USER [adodsworth] FOR LOGIN [adodsworth] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Customers] TO [adodsworth]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Customers] TO [adodsworth]
GO

--Pregunta 6

USE [master]
GO
CREATE LOGIN [lcallahan] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [lcallahan]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [lcallahan] FOR LOGIN [lcallahan]
GO

--Permisos Productos
USE [Northwind]
GO
CREATE USER [lcallahan] FOR LOGIN [lcallahan] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Products] TO [lcallahan]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Products] TO [lcallahan]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Products] TO [lcallahan]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Products] TO [lcallahan]
GO

--Permisos Transportistas
USE [Northwind]
GO
CREATE USER [lcallahan] FOR LOGIN [lcallahan] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Shippers] TO [lcallahan]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Shippers] TO [lcallahan]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Shippers] TO [lcallahan]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Shippers] TO [lcallahan]
GO

--Pregunta 7

USE [master]
GO
CREATE LOGIN [uperez] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [uperez]
GO
USE [Northwind]
GO
CREATE USER [uperez] FOR LOGIN [uperez]
GO

USE [master]
GO
CREATE LOGIN [gsmith] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [gsmith]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [gsmith] FOR LOGIN [gsmith]
GO

USE [master]
GO
CREATE LOGIN [pvannels] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [pvannels]
GO
use [Northwind];
GO
use [master];
GO
USE [Northwind]
GO
CREATE USER [pvannels] FOR LOGIN [pvannels]
GO

USE [master]
GO
CREATE LOGIN [pmartinez] WITH PASSWORD=N'sql', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [pmartinez]
GO
USE [Northwind]
GO
CREATE USER [pmartinez] FOR LOGIN [pmartinez]
GO

--Permisos Pedidos

USE [Northwind]
GO
CREATE USER [uperez] FOR LOGIN [uperez] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [uperez]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [uperez]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [uperez]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [uperez]
GO


USE [Northwind]
GO
CREATE USER [gsmith] FOR LOGIN [gsmith] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [gsmith]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [gsmith]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [gsmith]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [gsmith]
GO

USE [Northwind]
GO
CREATE USER [pvannels] FOR LOGIN [pvannels] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [pvannels]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [pvannels]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [pvannels]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [pvannels]
GO

USE [Northwind]
GO
CREATE USER [pmartinez] FOR LOGIN [pmartinez] WITH DEFAULT_SCHEMA=[dbo]
GO
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [pmartinez]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [pmartinez]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [pmartinez]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [pmartinez]
GO

