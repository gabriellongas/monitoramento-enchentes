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

INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Jamil Zarif' , 'Rua Jamil João Zarif' , 1378 , 'Jardim Santa Vicencia' , 'Guarulhos' , 'São Paulo' , '07143-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('23 de Maio' , 'Avenida 23 de Maio' , 2952 , 'Vila Mariana' , 'São Paulo' , 'São Paulo' , '04008-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Brás' , 'Avenida Alcântara Machado' , 400 , 'Brás' , 'São Paulo' , 'São Paulo' , '03102-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Dr Luis' , 'Rua Dr. Luís Aires' , 787 , 'Artur Alvim' , 'São Paulo' , 'São Paulo' , '03568-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Bresser' , 'Rua Besser' , 12 , 'Mooca' , 'São Paulo' , 'São Paulo' , '03017-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Aricanduva' , 'Avenida Aricanduva' , 555 , 'Aricanduva' , 'São Paulo' , 'São Paulo' , '03930-110')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Anhaia Mello' , 'Avenida Professor Luiz Ignácio Anhaia Mello' , 3850 , 'Jardim Independência' , 'São Paulo' , 'São Paulo' , '03294-100')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Celso Garcia' , 'Avenida Celso Garcia' , 4815 , 'Tatuapé' , 'São Paulo' , 'São Paulo' , '03063-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Avenida do Estado SP' , 'Avenida dos Estado' , 5566 , 'Mooca' , 'São Paulo' , 'São Paulo' , '03105-003')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Avenida do Estado SA' , 'Avenida dos Estado' , 584 , 'Utinga' , 'Santo André' , 'São Paulo' , '09290-520')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Praça da Bandeira' , 'Praça da Bandeira' , 328 , 'Centro Histórico de São Paulo' , 'São Paulo' , 'São Paulo' , '01007-070')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Marginal Pinheiros' , 'Marginal Pinheiros' , 14500 , 'Real Parque' ,  'São Paulo' , 'São Paulo' , '04533-085')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Marquês de São Vicente' , 'Avenida Marquês de São Vicente' , 230 , 'Barra Funda' , 'São Paulo' , 'São Paulo' , '01139-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Santo Amaro' , 'Avenida Santo Amaro' , 3131 , 'Brooklin' , 'São Paulo' , 'São Paulo'  , '04555-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Abraão de Morais' , 'Avenida Professor Abraão de Morais' , 1845 , 'Vila da Saúde' , 'São Paulo' , 'São Paulo' , '04123-011')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Corifeu de Azevedo' , 'Avenida Corifeu de Azevedo Marques' , 4160 , 'Butantã' , 'São Paulo' , 'São Paulo' , '05339-003')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Kenkiti Simomoto' , 'Avenida Kenkiti Simomoto' , 80 , 'Jaguaré' , 'São Paulo' , 'São Paulo' , '05347-010')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Rudge' , 'Avenida Rudge' , 300 , 'Bom Retiro' , 'São Paulo' , 'São Paulo' , '11340-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Nações Unidas' , 'Avenida das Nações Unidas' , 14261 , 'Chácara Santo Antônio' , 'São Paulo' , 'São Paulo' , '04794-000')
INSERT INTO Regiao (Nome, Endereco, Numero, Bairro, Cidade, Estado, CEP) VALUES ('Brigadeiro Luís Antônio' , 'Avenida Brigadeiro Luís Antônio' , 4910 , 'Jardim Paulista' , 'São Paulo' , 'São Paulo' , '01402-002')

select * from Regiao
