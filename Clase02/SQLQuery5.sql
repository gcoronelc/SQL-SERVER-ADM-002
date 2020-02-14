-- Como SA

create procedure dbo.sp_empledos
as
select * from dbo.Empleado
go

-- Como Gustavo

select * from dbo.empleado 
go


-- Como SA

use [EduTec]
GO
GRANT EXECUTE ON [dbo].[sp_empledos] TO [gustavo]
GO


-- Como Gustavo

select * from dbo.empleado 
go


dbo.sp_empledos
go


DENY alter any table TO gustavo
GO

USE EduTec;
DENY ALTER SCHEMA TO GUSTAVO;
GO

use edutec
go

select * from dbo.Matricula
go






