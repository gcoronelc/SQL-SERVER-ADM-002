USE [master]
GO

CREATE LOGIN [panchito] 
WITH PASSWORD=N'secreto', 
	 DEFAULT_DATABASE=[master], 
	 CHECK_EXPIRATION=OFF, 
	 CHECK_POLICY=OFF
GO



