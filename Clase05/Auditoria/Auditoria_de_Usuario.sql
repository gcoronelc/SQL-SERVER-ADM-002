

declare @n int;
EXEC @n = sp_audit_write 
     @user_defined_event_id =  27 ,   
     @succeeded =  0 ,
     @user_defined_information = N'Se ha modificado la factura 001-567.' ;
print @n;
GO

select * from dbo.Profesor;
GO

