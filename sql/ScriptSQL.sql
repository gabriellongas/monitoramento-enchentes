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
	DataCriacao date NOT NULL,
	Imagem varbinary(max),
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
	@TipoUsuario int,
	@Imagem varbinary(max)
)
as
begin
	insert into Usuarios
	(Nome, Email, Senha, TipoUsuario, DataCriacao, Imagem)
	values
	(@Nome, @Email, @Senha, @TipoUsuario, GETDATE(), @Imagem)
end
GO

create procedure spUpdate_Usuarios
(
	@Id int,
	@Nome varchar(max),
	@Email varchar(max),
	@Senha varchar(max),
	@TipoUsuario int,
	@Imagem varbinary(max)
)
as
begin
	update Usuarios set
		Nome = @nome,
		Email = @Email,
		Senha = @Senha,
		TipoUsuario = @TipoUsuario,
		Imagem = @Imagem
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

---------------------------------------------------------------
-- Procedure região
create procedure spConsulta_PorNome
(
	@nome varchar(max)
)
as
begin
	select * from Regiao where Nome = @nome
end
GO

create procedure spConsulta_PorBairro
(
	@bairro varchar(max)
)
as
begin
	select * from Regiao where Bairro = @bairro
end
GO

create procedure spInsert_Regiao
(
	@Nome varchar(max),
	@Endereco varchar(max),
	@Numero int,
	@Bairro varchar(max),
	@Cidade varchar(max),
	@Estado varchar(max),
	@CEP varchar (max)
)
as
begin
	insert into Regiao
	(Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP)
	values
	(@Nome, @Endereco, @Numero, @Bairro, @Cidade, @Estado, @CEP)
end
GO

create procedure spUpdate_Regiao
(
	@Nome varchar(max),
	@Endereco varchar(max),
	@Numero int,
	@Bairro varchar(max),
	@Cidade varchar(max),	@Estado varchar(max),	@CEP varchar (max),	@Id int
)
as
begin
	update Regiao set
		Nome = @nome,
		Endereco = @Endereco,
		Numero = @Numero,
		Bairro = @Bairro,
		Cidade = @Cidade,
		Estado = @Estado,
		CEP = @CEP
	where Id = @id 
end
GO

alter procedure [dbo].[spConsultaAvancadaRegiao]
(
 @Nome varchar(max),
@numero int,
@bairro varchar(max),
@cep varchar(max))
as
begin
	print @nome
	print @numero
	print @bairro
	print @cep
	
	declare @sql varchar(max) = 'select * from Regiao r where 1 = 1'

	Declare @Aspas Char(4)
	Set @Aspas = ''''

	if (@Nome is not null) begin	
		set @sql += ' and r.Nome like'
		set @sql += @Aspas
		set @sql += ' "%'
		set @sql += @Nome
		set @sql += '%"'
		set @sql += @Aspas

	end

	if (@numero is not null) begin	
		set @sql += ' and r.Numero =' 
		set @sql += cast(@numero as varchar(max))
	end

	if (@bairro is not null) begin	
		set @sql += ' and r.Bairro like'
		set @sql += @Aspas
		set @sql += ' "%'
		set @sql += @bairro
		set @sql += '%"'
		set @sql += @Aspas
	end

	if (@cep is not null) begin	
		set @sql += ' and r.cep like "'
		set @sql += @Aspas
		set @sql += ' %'
		set @sql += @cep
		set @sql += '%"'
		set @sql += @Aspas
	end

	print(@sql)
	exec(@sql)
end

exec spConsultaAvancadaRegiao 'Jamil Zarif 2', null, null, null


select * from Regiao where nome  =1