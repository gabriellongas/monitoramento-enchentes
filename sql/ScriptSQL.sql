CREATE DATABASE db_sme

USE db_sme

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
	DataCadastro date NOT NULL,
	TipoUsuario int NOT NULL FOREIGN KEY REFERENCES TipoUser(id)
);

CREATE TABLE TipoVias (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Descricao varchar (max) NOT NULL,
);

INSERT INTO TipoVias (Descricao) VALUES('Rua')
INSERT INTO TipoVias (Descricao) VALUES('Avenida')
INSERT INTO TipoVias (Descricao) VALUES('Via')

CREATE TABLE Controladores (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(max) NOT NULL,
	Endereco varchar(max) NOT NULL,
	Numero int NOT NULL,
	Bairro varchar(max) NOT NULL,
	Cidade varchar(max) NOT NULL,
	Estado varchar(max) NOT NULL,
	TipoVia int NOT NULL FOREIGN KEY REFERENCES TipoVias(id),
	CEP int NOT NULL,
	Latitude float NOT NULL,
	Longitude float NOT NULL
);

CREATE TABLE Registros (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Controlador int NOT NULL FOREIGN KEY REFERENCES Controladores(id),
	Nivel int NOT NULL,
	DataHora datetime NOT NULL
);

---------------------------------------------------------------------------------------------------------
---> Procedures genéricas
USE db_sme
  
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
	@Id int,
	@Nome varchar(max),
	@Email varchar(max),
	@Senha varchar(max),
	@Imagem varbinary(max),
	@DataCadastro date,
	@TipoUsuario int 
)
as
begin
	insert into Usuarios
	(id_Usuario , Nome, Email, Senha, Imagem, DataCadastro, TipoUsuario)
	values
	(@Id, @Nome, @Email, @Senha, @Imagem, @DataCadastro, @TipoUsuario)
end
GO

create procedure spUpdate_Usuarios
(
	@Id int,
	@Nome varchar(max),
	@Email varchar(max),
	@Senha varchar(max),
	@Imagem varbinary(max),
	@DataCadastro date,
	@TipoUsuario int 
)
as
begin
	update Usuarios set
		Nome = @nome,
		Email = @Email,
		Senha = @Senha,
		DataCadastro = @DataCadastro,
		TipoUsuario = @TipoUsuario
	where id_Usuario = @id 
end
GO