--Triggers

create trigger trg_deleta_sensor on Regiao
instead of delete as
begin
	declare @idRegiao int = (select id from deleted)

	declare cursorIds cursor Forward_Only for 
	select id from Sensores where idRegiao = @idRegiao

	begin transaction

	declare @id int

	open cursorIds

	fetch next from cursorIds
	into @id

	while @@FETCH_STATUS = 0
	begin
		delete from Registros where idSensor = @id

		fetch next from cursorIds
		into @id
	end

	delete from Sensores where idRegiao = @idRegiao

	delete from Regiao where id = @idRegiao

	commit transaction
	close cursorIds
	deallocate cursorIds

end

delete from Regiao where id = 1

