
begin tran;
go

select * from dbo.curso;
go

insert into dbo.curso 
values('C777','A','Curso de la suerte');
go

select * from dbo.curso;
go

-- En este momento se corta el fluido
-- electrico y se apaga el servidor.

