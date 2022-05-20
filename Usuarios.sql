CREATE TABLE TipoUser (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	desc_tipoUser varchar (max) NOT NULL,
);

INSERT INTO TipoUser (desc_tipoUser) VALUES('Admin')
INSERT INTO TipoUser (desc_tipoUser) VALUES('Usuário')

CREATE TABLE Usuarios (
	Nome varchar (max) NOT NULL,
	Email varchar(max) NOT NULL,
	Senha varchar(max) NOT NULL,
	Imagem varbinary(max) NULL,
	DataCriacao date NOT NULL,
	TipoUsuario int NOT NULL FOREIGN KEY REFERENCES TipoUser(id)
);

INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Miguel dos Santos' , 'miguel-santos@gmail.com' , 12345 , '2021-10-02', 1 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Sophia Maria' , 'sophia_maria@gmail.com' , 12345 , '2021-10-05' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Davi de Oliveira' , 'davi_oliv@gmail.com' , 12345 , '2021-10-08' , 2);		
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Alice Ferreira ' , 'alice.ferreira@gmail.com' , 12345 , '2021-10-12' , 2); 
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Arthur Moreira' , 'arth.moreira@gmail.com' , 12345 , '2021-10-12' , 2); 
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Julia Braga' , 'julia-b@gmail.com' , 12345 , '2021-10-14' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Pedro José' , 'Pedro.jose@gmail.com' , 12345 , '2021-10-16' , 2);	 
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Isabella Ferreira' , 'isabella.f@gmail.com' , 12345 ,' 2021-10-18' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Gabriel Anderson' ,' gabriel.anderson@gmail.com' ,12345 ,'2021-10-25' ,  2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Manuela Leticia' ,'manu_leticia@gmail.com' , 12345 ,' 2021-10-27' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Bernardo de Lima' ,' bernardo.lima@gmail.com' , 12345 ,' 2021-11-02' , 2 );	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Laura Pinheiro' ,' laura.pinheiro@gmail.com' , 12345 ,' 2021-11-05' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Lucas Alves' ,' lucas-alves98@gmail.com' , 12345 ,' 2021-11-07' , 2);	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Luiza Santos' ,' luiza.santos@gmail.com' , 12345 ,' 2021-11-08' , 1 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Matheus Antônio' ,' mat-antonio@gmail.com' , 12345 ,' 2021-11-09' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Rafael Luiz' ,' rafa.luiz@gmail.com' , 12345 ,' 2021-11-11' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Giovanna dos Santos' ,' giovanna-santos96@gmail.com' , 12345 ,' 2021-11-13' ,  2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Heitor Borges' ,' heitor_borges@gmail.com' , 12345 ,' 2021-11-18' , 2); 
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Guilherme Farias' ,' Guilherme-farias@gmail.com' , 12345 ,' 2021-11-26' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Beatriz Alencar' ,' beatriz-alencar22@gmail.com' , 12345 ,' 2021-11-29' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Nicolas Almeida' ,' nicolas_almeida@yahoo.com.br' , 12345 ,' 2021-12-02' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Maria Luiza' ,' malu_1998@yahoo.com.br' , 12345 ,' 2021-12-08' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Gustavo Amorim' ,' gust-amorim@yahoo.com.br' , 12345 ,' 2021-12-10' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Mariana Andrade' ,' mariana_andrade@yahoo.com.br' , 12345 ,' 2021-12-12' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Felipe Aguiar' ,' felipe_2000@yahoo.com.br' , 12345 ,' 2021-12-13' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Nicole Alcântara' ,' Nicole-Alcântara@yahoo.com.br ' , 12345 ,' 2021-12-15' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Samuel Abreu' ,' Samuel-abreu@yahoo.com.br' , 12345 ,' 2021-12-17' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Rafaela Antunes' ,' rafa_antunes@yahoo.com.br' , 12345 ,' 2021-12-19' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('João Pedro' ,' joão_p1518@yahoo.com.br' , 12345 ,' 2021-12-25' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Heloísa de Araújo' ,' helo-araujo@yahoo.com.br' , 12345 ,' 2021-12-29' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Daniel Soares' ,' dani_soares@yahoo.com.br' , 12345 ,' 2022-01-02' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Isadora Assis' ,' Isadora-assis@yahoo.com.br' , 12345 ,' 2022-01-03' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Vitor Ângelo' ,' vitor.angelo@yahoo.com.br' , 12345 ,' 2022-01-07' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Lívia Assis' ,' livia_1995@yahoo.com.br' , 12345 ,' 2022-01-09' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Leonardo Barbosa' ,' leo_barbosa@yahoo.com.br' , 12345 ,' 2022-01-11' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Henrique Ferreira' ,' ferreira-henrique@yahoo.com.br' , 	12345 ,' 2022-01-14' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Ana Clara' ,' ana_c2022@yahoo.com.br' , 12345 ,' 2022-01-16' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Theo Barreto' ,' theo_barreto@yahoo.com.br' , 12345 ,' 2022-01-18' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Lorena Barros' ,' lo_barro@yahoo.com.br' , 12345 ,' 2022-01-25' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Murilo Bastos' ,' murilo-bastos@yahoo.com.br' , 12345 ,' 2022-01-28' , 2);	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Gabriela Batista' ,' gabi.batista@hotmail.com' , 12345 ,' 2022-02-02' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Eduardo Leite' ,' eduardo.1998@hotmail.com' , 	12345 ,' 2022-02-03' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Yasmin Santos' ,' yasmin-santos@hotmail.com' , 12345 ,' 2022-02-04' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Pedro Henrique' ,' Pedro-ph@hotmail.com' , 12345 ,' 2022-02-08' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Pietro de Carvalho' ,' p-carvalho@hotmail.com' , 12345 ,' 2022-02-10' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Sarah Dias' ,' sarah_dias@hotmail.com' , 12345 ,' 2022-02-17' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Ana Julia' ,' ana-julia@hotmail.com' , 12345 ,' 2022-02-18' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Isaac Cardoso' ,' isaac.car@hotmail.com' , 12345 ,' 2022-02-21' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Letícia de Castro' ,' leh_castro@hotmail.com' , 12345 ,' 2022-02-27' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Caio Chaves' ,' caio.chaves@hotmail.com' , 12345 ,' 2022-02-28' , 2);	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Ana Luiza' ,' ana-luiza@hotmail.com' , 12345 ,' 2022-03-01' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Vinicius Linhares' ,' vini-lin@hotmail.com' , 12345 ,' 2022-03-03' , 2);	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Melissa Costa' ,' melissa.costa@hotmail.com' , 12345 ,' 2022-03-05' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Marina Duarte' ,' marina_duarte@hotmail.com' , 12345 ,' 2022-03-08' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' João Paulo' ,' joão-paulo@hotmail.com' , 12345 ,' 2022-03-10' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Clara Coelho' ,' clara.coelho@hotmail.com' , 12345 ,' 2022-03-11' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Cecília Dantas' ,' cecilia-dantas1998@hotmail.com' , 12345 ,' 2022-03-15' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Joaquim Delfino' ,' delfino_joaquim@hotmail.com'  , 12345 ,' 2022-03-16' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Rebeca Evangelista' ,' rebeca.evangelista@hotmail.com' , 12345 ,' 2022-03-22' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('João Vitor' ,' joão_vitor@hotmail.com' , 	12345 ,' 2022-03-28' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Ana Beatriz' ,' ana-beatriz@hotmail.com' , 12345 ,' 2022-04-01' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Thiago Souza' ,' Thiago.souza@hotmail.com' , 12345 ,' 2022-04-03' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Antônio Fagundes' ,' antonio.fagundes79@hotmail.com' , 12345 ,' 2022-04-10' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Vitória Farias' ,' vitória_farias@hotmail.com' , 12345 ,' 2022-04-12' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Davi Lucas' ,' davi.lucas@hotmail.com' , 12345 ,' 2022-04-15' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Bianca Fonseca' ,' bia_fonseca@yahoo.com.br' , 12345 ,' 2022-04-16' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Francisco Fontes' ,' chico-fontes@yahoo.com.br' , 12345 ,' 2022-04-17' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Catarina Figueiredo' ,' catarina-figueiredo@yahoo.com.br' , 12345 ,' 2022-04-18' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Larissa Gouveia' ,' Larissa_gouveia@yahoo.com.br' , 12345 ,' 2022-04-22' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Bruno Guimarães' ,' bruno-gui@yahoo.com.br' , 12345 ,	'2022-04-23' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Maria Fernanda' ,' maria_fer@yahoo.com.br' , 12345 ,' 2022-04-25' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Emanuel Lacerda' ,' Emanuel-lacerda@yahoo.com.br' , 12345 ,' 2022-04-29' , 2 );
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Fernanda Lima' ,' fer.lima94@gmail.com' , 12345 ,' 2022-05-01' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' João Gabriel' ,' joao.gabriel@gmail.com' , 12345 ,' 2022-05-08' , 1);	
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Amanda Lopes' ,' amanda_lopes@gmail.com' , 12345 ,' 2022-05-10' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES ('Davi Luiz' ,' davi.luiz20@gmail.com' , 12345 ,' 2022-05-12' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Carolina Pacheco' ,' carolina.pacheco@gmail.com' , 12345 ,' 2022-05-14' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Rodrigo Mesquita' ,' rodrigo_mesquita@gmail.com' , 12345 ,' 2022-05-16' , 1);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Agatha Paiva' ,' agatha_1996@gmail.com' , 12345 ,' 2022-05-17' , 2);
INSERT INTO Usuarios (Nome, Email, Senha, DataCriacao, TipoUsuario) VALUES (' Otávio Miranda' ,' otavio_miranda@gmail.com' , 12345 ,' 2022-05-18' , 2);

select * from Usuarios
