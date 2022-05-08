CREATE DATABASE db_sme

USE db_sme

CREATE TABLE TipoUser (
	id_TipoUser int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	desc_tipoUser varchar (max) NOT NULL,
);

INSERT INTO TipoUser (desc_tipoUser) VALUES('Admin')
INSERT INTO TipoUser (desc_tipoUser) VALUES('Usu�rio')

CREATE TABLE Usuarios (
	id_Usuario int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(max) NOT NULL,
	Email varchar(max) NOT NULL,
	Senha varchar(max) NOT NULL,
	Imagem varbinary(max) NULL,
	DataCadastro date NOT NULL,
	TipoUsuario int NOT NULL FOREIGN KEY REFERENCES TipoUser(id_tipoUser)
);

CREATE TABLE TipoVias (
	id_TipoVia int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Descricao varchar (max) NOT NULL,
);

INSERT INTO TipoVias (Descricao) VALUES('Rua')
INSERT INTO TipoVias (Descricao) VALUES('Avenida')
INSERT INTO TipoVias (Descricao) VALUES('Via')

CREATE TABLE Controladores (
	id_Controlador int IDENTITY(1,1) NOT NULL PRIMARY KEy,
	Nome varchar(max) NOT NULL,
	Endereco varchar(max) NOT NULL,
	Numero int NOT NULL,
	Bairro varchar(max) NOT NULL,
	Cidade varchar(max) NOT NULL,
	Estado varchar(max) NOT NULL,
	TipoVia int NOT NULL FOREIGN KEY REFERENCES TipoVias(id_TipoVia),
	CEP int NOT NULL,
	Latitude float NOT NULL,
	Longitude float NOT NULL
);

CREATE TABLE Registros (
	id_Registro int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Controlador int NOT NULL FOREIGN KEY REFERENCES Controladores(id_Controlador),
	Nivel int NOT NULL,
	DataHora datetime NOT NULL
);