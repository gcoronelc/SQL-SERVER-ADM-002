USE [master]
GO

-- Modelo de recuperacion simple
ALTER DATABASE [EduTec] 
SET RECOVERY SIMPLE WITH NO_WAIT
GO

-- Modelo de recuperacion registro masivo
ALTER DATABASE [EduTec] 
SET RECOVERY BULK_LOGGED WITH NO_WAIT
GO

-- Modelo de recuperacion completo
ALTER DATABASE [EduTec] 
SET RECOVERY FULL WITH NO_WAIT
GO