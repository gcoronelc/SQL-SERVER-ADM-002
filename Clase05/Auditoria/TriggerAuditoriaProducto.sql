
USE PruebaAuditoria;
go

CREATE TRIGGER DBO.tg_Auditoria_Producto
	ON DBO.Producto
	AFTER Insert, Update
	NOT	FOR REPLICATION
AS
DECLARE @Operacion CHAR(1)
IF EXISTS(SELECT * FROM Deleted)
	SET @Operacion = 'U'
ELSE
	SET @Operacion = 'I'

IF UPDATE(PrecioUnitario)
BEGIN
	INSERT Auditoria(AuditFecha, LoginName, Aplicacion, Tabla,
		Operacion, PrimaryKey, Descripcion, Columna,
		ValorAnterior, ValorNuevo)
	SELECT GetDate(), suser_sname(), APP_NAME(), 'Producto',
		@Operacion, Inserted.IdProducto, Inserted.Nombre, 'PrecioUnitario',
		Deleted.PrecioUnitario, Inserted.PrecioUnitario
		FROM Inserted LEFT OUTER JOIN Deleted
		ON Inserted.IdProducto = Deleted.IdProducto
END
go

SELECT * FROM DBO.PRODUCTO;
GO

INSERT INTO DBO.PRODUCTO(IDPRODUCTO,NOMBRE,PRESENTACION,PRECIOUNITARIO,STOCK)
VALUES(1000,'Producto 1','CAJA',60.0,100);

UPDATE DBO.PRODUCTO 
SET PRECIOUNITARIO = 100
WHERE IDPRODUCTO = 1000;
GO

SELECT * FROM DBO.Auditoria;
GO

