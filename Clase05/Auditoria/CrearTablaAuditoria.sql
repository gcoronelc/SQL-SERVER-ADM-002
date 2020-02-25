

CREATE DATABASE PruebaAuditoria;
go

USE PruebaAuditoria;
go

CREATE TABLE Producto(
	IdProducto integer PRIMARY KEY,
	Nombre varchar(50) not null,
	Presentacion varchar(30) not null,
	PrecioUnitario money null,
	Stock int null 
);
go

CREATE TABLE DBO.Auditoria(
	AuditID UNIQUEIDENTIFIER RowGUIDCol NOT NULL
	CONSTRAINT DF_AuditID DEFAULT (NEWID())
	CONSTRAINT PK_Auditoria PRIMARY KEY NONCLUSTERED (AuditID),
	AuditFecha DATETIME NOT NULL,
	LoginName VARCHAR(50) NOT NULL,
	Aplicacion VARCHAR(50) NOT NULL,
	Tabla VARCHAR(50)NOT NULL,
	Operacion CHAR(1) NOT NULL,
	PrimaryKey VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(50) NULL,
	Columna VARCHAR(50) NOT NULL,
	ValorAnterior VARCHAR(50) NULL,
	ValorNuevo VARCHAR(50) NULL 
);
go


