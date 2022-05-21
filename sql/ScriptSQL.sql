CREATE DATABASE db_sme
go

use db_sme
go

CREATE TABLE TipoUser (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	desc_tipoUser varchar (max) NOT NULL,
);

INSERT INTO TipoUser (desc_tipoUser) VALUES('Admin')
INSERT INTO TipoUser (desc_tipoUser) VALUES('Usuário')

CREATE TABLE Usuarios (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(max) NOT NULL,
	Email varchar(max) NOT NULL,
	Senha varchar(max) NOT NULL,
	Imagem varbinary(max) NULL,
	DataCriacao date NOT NULL,
	TipoUsuario int NOT NULL FOREIGN KEY REFERENCES TipoUser(id)
);

CREATE TABLE Regiao (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(max) NOT NULL,
	Endereco varchar(max) NOT NULL,
	Numero int NOT NULL,
	Bairro varchar(max) NOT NULL,
	Cidade varchar(max) NOT NULL,
	Estado varchar(max) NOT NULL,
	CEP varchar (max) NOT NULL
);

CREATE TABLE Sensores (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idRegiao int NOT NULL FOREIGN KEY REFERENCES Regiao(id)
);

CREATE TABLE Registros (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idSensor int NOT NULL FOREIGN KEY REFERENCES Sensores(id),
	Nivel int NOT NULL,
	DataHora datetime NOT NULL
);

CREATE TABLE Usuario_Regiao (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idUsuario int NOT NULL FOREIGN KEY REFERENCES Usuarios(id),
	idRegiao int NOT NULL FOREIGN KEY REFERENCES Regiao(id)
);


---------------------------------------------------------------------------------------------------------
---> Procedures genéricas

create procedure spDelete
(
	@id int ,
	@tabela varchar(max)
)
as
begin
	declare @sql varchar(max);
	set @sql = ' delete ' + @tabela +
	' where id = ' + cast(@id as varchar(max))
	exec(@sql)
end
GO

create procedure spConsulta
(
	@id int ,
	@tabela varchar(max)
)
as
begin
	declare @sql varchar(max);
	set @sql = 'select * from ' + @tabela +
	' where id = ' + cast(@id as varchar(max))
	exec(@sql)
end
GO

create procedure spListagem
(
 @tabela varchar(max),
 @ordem varchar(max)
 )
as
begin
	exec('select * from ' + @tabela +
	' order by ' + @ordem)
end
GO

create procedure spProximoId
(
	@tabela varchar(max)
)
as
begin
	exec('select isnull(max(id) +1, 1) as MAIOR from '
	+ @tabela)
end
GO

------------------------------------------------------------------------------------------------------------
-- Procedures usuário

create procedure spInsert_Usuarios
(
	@Nome varchar(max),
	@Email varchar(max),
	@Senha varchar(max),
	@Imagem varbinary(max),
	@TipoUsuario int 
)
as
begin
	insert into Usuarios
	(Nome, Email, Senha, Imagem, TipoUsuario)
	values
	(@Nome, @Email, @Senha, @Imagem, @TipoUsuario)
end
GO

create procedure spUpdate_Usuarios
(
	@Id int,
	@Nome varchar(max),
	@Email varchar(max),
	@Senha varchar(max),
	@Imagem varbinary(max),
	@TipoUsuario int 
)
as
begin
	update Usuarios set
		Nome = @nome,
		Email = @Email,
		Senha = @Senha,
		TipoUsuario = @TipoUsuario
	where Id = @id 
end
GO

create procedure spConsulta_PorEmail
(
	@email varchar(max)
)
as
begin
	select * from Usuarios where Email = @email
end
GO

------------------------------------------------------------------------------------------------------------
--Procedures Sensores
create procedure spInsert_Registros
(
	@idSensor int,
	@Nivel int,
	@DataHora datetime	
)
as
begin
	insert into Registros 
	(idSensor, Nivel, DataHora)
	values
	(@idSensor, @Nivel, @DataHora)
end
