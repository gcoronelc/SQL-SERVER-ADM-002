
-- Ejercicio 01

/*
Paso 1
Exportar la tabla de profesores
al archivo PROFESORES_A.DAT
*/

/*
bcp edutec.dbo.Profesor out G:\bcp\Profesores_A.dat -c -Usa -Psql
*/

  
/*
Paso 2
Crear una tabla de profesores 
de nombre PROFESORES2, vacia.
*/

USE EduTec; 
GO 

SELECT * INTO dbo.Profesor2 
FROM dbo.Profesor
WHERE 1=2; 
GO

SELECT * FROM dbo.Profesor2;
GO

/*
Paso 3
Importar el archivo PROFESORES_A.DAT 
a la tabla PROFESORES2.
*/

/*
bcp edutec.dbo.Profesor2 in G:\bcp\Profesores_A.dat -T -c
*/  
 
SELECT * FROM dbo.Profesor2;
GO


 
  