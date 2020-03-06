-- CONSULTA

use edutec;
go


select * from edutec.dbo.CursoProgramado;
go

CREATE VIEW DBO.V_RESUMEN_VENTAS
AS
With
v1 as (
	select 
		idciclo, IdCurso,
		count(1) Secciones, 
		sum(Matriculados) Matriculados,
		sum(Matriculados * PreCursoProg) Ingresos
	from edutec.dbo.CursoProgramado
	where Activo = 1
	group by idciclo, IdCurso
)
select 
	v1.IdCiclo, v1.IdCurso, c.NomCurso, 
	v1.Secciones, v1.Matriculados, v1.Ingresos
from EduTec.dbo.Curso c
join v1 on c.IdCurso = v1.IdCurso;
GO

-- Consultando la vista
SELECT * FROM DBO.V_RESUMEN_VENTAS;
GO

-- CREACION DE LA TABLA
SELECT * INTO DBO.TB_RESUMEN_VENTAS
FROM DBO.V_RESUMEN_VENTAS
WHERE IdCiclo = '12345';
GO

-- LIMPIA LA TABLA
TRUNCATE TABLE DBO.TB_RESUMEN_VENTAS;
GO

SELECT * FROM DBO.TB_RESUMEN_VENTAS;
GO


