--Views


--View de sensores ativos
create view vw_sensores as 
	select id, dbo.fc_sensor_ativo(id) Ativo from Sensores

select * from vw_sensores