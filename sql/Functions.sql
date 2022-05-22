--Functions

--function que checa se o sensor está ativo.
create function dbo.fc_sensor_ativo(@id_sensor int)
returns int
as
begin
	if not exists (select Nivel from Registros where idSensor = @id_sensor and DataHora > dateadd(mi, -10, getdate()))
		return 0
	
	return 1
end

select id, dbo.fc_sensor_ativo(id) Ativo from Sensores