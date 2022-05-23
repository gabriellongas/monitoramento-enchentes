--Procedures

--Procedure usada para pegar o top 10 locais com mais enchentes
CREATE procedure sp_top10_enchentes(@Range int)
as
begin
	select top 10 rg.Bairro, count(r.id) qtd_enchentes from Registros r
	left join Sensores s on r.idSensor = s.id
	left join Regiao rg on s.idRegiao = rg.id
	where DataHora > DATEADD(day, (@Range * -1), GETDATE())
	group by rg.Bairro
	order by qtd_enchentes desc
end

exec sp_top10_enchentes 50

--Procedure usada para pegar a quantidade de usuários por data
create procedure sp_qtd_usuarios(@Range int)
as begin
	select DataCriacao, count(*) qtd_Usuarios from Usuarios
	where DataCriacao > DATEADD(day, (@Range * -1), GETDATE())
	group by DataCriacao
end

exec sp_qtd_usuarios 60

--Procedure que pega os usuários de acordo com o tipo
create procedure sp_usuarios(@tipo varchar(8))
as begin
	select u.Nome, u.Email, t.desc_tipoUser from Usuarios u
	left join TipoUser t on t.id = u.TipoUsuario
	where t.desc_tipoUser = @tipo
end

exec sp_usuarios 'Usuário'

--Procedure que pega o histórico de nível de uma região em um range de datas
create procedure sp_historico(@range int, @idRegiao int)
as
begin
	select r.Nivel, r.DataHora from Registros r
	left join Sensores s on s.id = r.idSensor
	where s.idRegiao = @idRegiao and r.DataHora > DATEADD(day, (@range * -1), GETDATE())
end

exec sp_historico 200, 1


--Procedure que pega a quantidade de niveis de uma região em um range de datas
create procedure sp_niveis(@range int, @idRegiao int) as
begin
	select r.Nivel, count(r.id) qtd_dados from Registros r
	left join Sensores s on s.id = r.idSensor
	where s.idRegiao = @idRegiao and r.DataHora > DATEADD(day, (@range * -1), GETDATE())
	group by r.Nivel
end

exec sp_niveis 200, 1


--Procedure que executa a function fc_sensor_ativo que checa se o sensor enviou algum dado nos ultimos 10 minutos, se nao marca como inativo.
create procedure sp_sensores_ativos as
begin
	exec sp_refreshview 'vw_sensores'
	select * from vw_sensores
end

exec sp_sensores_ativos

--Procedure que insere dados na tabela de UsuarioRegiao
create procedure spInsert_UsuarioRegiao
(
	@idUsuario int,
	@idregiao int,
	@Nome varchar(max)
)
as
begin
	insert into Usuario_Regiao 
	(idUsuario, idRegiao, Nome)
	values
	(@idUsuario, @idregiao, @Nome)
end


--Procedure que procura dados na tabela de UsuarioRegiao de um usuário
create procedure spConsultaUsuarioRegiao(@IdUsuario int)
as begin
	select *  from Usuario_Regiao
	where idUsuario = @idUsuario
end

--Procedure que procura dados na de uma UsuarioxRegião
create procedure spConsulta_UsuarioRegiao(@IdUsuario int, @IdRegiao int)
as begin
	select *  from Usuario_Regiao
	where idUsuario = @idUsuario and idRegiao = @idRegiao
end