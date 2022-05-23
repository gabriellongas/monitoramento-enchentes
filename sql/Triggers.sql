--Triggers

create trigger trg_deleta_regiao on Regiao
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


--Trigger para inserir novos sensores, checa se a região a ser inserido o sensor existe
create trigger trg_insere_sensor on Sensores
instead of insert as
begin
	declare @idRegiao int = (select idRegiao from inserted)

	if not exists (select id from Regiao where id = @idRegiao)
		rollback tran
	else
		insert into Sensores values(@idRegiao)
end

insert into Sensores values(2)
