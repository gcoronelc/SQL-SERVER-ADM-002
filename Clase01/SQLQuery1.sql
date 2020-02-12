select @@version;
go

SELECT 
    DB_NAME(dbid) AS BaseDatos, 
    COUNT(dbid) AS Conexiones,
    loginame AS [Login]
FROM
    sys.sysprocesses
WHERE 
    dbid > 0
GROUP BY 
    dbid, loginame;
GO

SELECT status, memory_usage, cpu_time, 
last_request_start_time, last_request_end_time
FROM  
sys.dm_exec_sessions 
WHERE ((login_name = 'sa') and (status = 'sleeping'))