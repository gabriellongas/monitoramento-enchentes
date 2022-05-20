CREATE TABLE Regiao (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nome varchar(max) NOT NULL,
	Endereco varchar(max) NOT NULL,
	Numero int NOT NULL,
	Bairro varchar(max) NOT NULL,
	Cidade varchar(max) NOT NULL,
	Estado varchar(max) NOT NULL,
	CEP varchar (max) NOT NULL,
	);

INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Jamil Zarif' , 'Rua Jamil Jo�o Zarif' , 1378 , 'Jardim Santa Vicencia' , 'Guarulhos' , 'S�o Paulo' , '07143-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('23 de Maio' , 'Avenida 23 de Maio' , 2952 , 'Vila Mariana' , 'S�o Paulo' , 'S�o Paulo' , '04008-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Br�s' , 'Avenida Alc�ntara Machado' , 400 , 'Br�s' , 'S�o Paulo' , 'S�o Paulo' , '03102-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Dr Luis' , 'Rua Dr. Lu�s Aires' , 787 , 'Artur Alvim' , 'S�o Paulo' , 'S�o Paulo' , '03568-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Bresser' , 'Rua Besser' , 12 , 'Mooca' , 'S�o Paulo' , 'S�o Paulo' , '03017-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Aricanduva' , 'Avenida Aricanduva' , 555 , 'Aricanduva' , 'S�o Paulo' , 'S�o Paulo' , '03930-110')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Anhaia Mello' , 'Avenida Professor Luiz Ign�cio Anhaia Mello' , 3850 , 'Jardim Independ�ncia' , 'S�o Paulo' , 'S�o Paulo' , '03294-100')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Celso Garcia' , 'Avenida Celso Garcia' , 4815 , 'Tatuap�' , 'S�o Paulo' , 'S�o Paulo' , '03063-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Avenida do Estado SP' , 'Avenida dos Estado' , 5566 , 'Mooca' , 'S�o Paulo' , 'S�o Paulo' , '03105-003')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Avenida do Estado SA' , 'Avenida dos Estado' , 584 , 'Utinga' , 'Santo Andr�' , 'S�o Paulo' , '09290-520')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Pra�a da Bandeira' , 'Pra�a da Bandeira' , 328 , 'Centro Hist�rico de S�o Paulo' , 'S�o Paulo' , 'S�o Paulo' , '01007-070')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Marginal Pinheiros' , 'Marginal Pinheiros' , 14500 , 'Real Parque' ,  'S�o Paulo' , 'S�o Paulo' , '04533-085')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Marqu�s de S�o Vicente' , 'Avenida Marqu�s de S�o Vicente' , 230 , 'Barra Funda' , 'S�o Paulo' , 'S�o Paulo' , '01139-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Santo Amaro' , 'Avenida Santo Amaro' , 3131 , 'Brooklin' , 'S�o Paulo' , 'S�o Paulo'  , '04555-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Abra�o de Morais' , 'Avenida Professor Abra�o de Morais' , 1845 , 'Vila da Sa�de' , 'S�o Paulo' , 'S�o Paulo' , '04123-011')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Corifeu de Azevedo' , 'Avenida Corifeu de Azevedo Marques' , 4160 , 'Butant�' , 'S�o Paulo' , 'S�o Paulo' , '05339-003')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Kenkiti Simomoto' , 'Avenida Kenkiti Simomoto' , 80 , 'Jaguar�' , 'S�o Paulo' , 'S�o Paulo' , '05347-010')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Rudge' , 'Avenida Rudge' , 300 , 'Bom Retiro' , 'S�o Paulo' , 'S�o Paulo' , '11340-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Na��es Unidas' , 'Avenida das Na��es Unidas' , 14261 , 'Ch�cara Santo Ant�nio' , 'S�o Paulo' , 'S�o Paulo' , '04794-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Brigadeiro Lu�s Ant�nio' , 'Avenida Brigadeiro Lu�s Ant�nio' , 4910 , 'Jardim Paulista' , 'S�o Paulo' , 'S�o Paulo' , '01402-002')

select * from Regiao
