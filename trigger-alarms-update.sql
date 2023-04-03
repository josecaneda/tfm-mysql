use monitor;

delimiter //
create trigger alarms_update
after update on status
for each row
begin
	declare rows_found int;
    if	new.active is true
		or
        new.ack_timestamp is null
    then
		select * from alarms where b1 = new.b1 and b2 = new.b2 and b3 = new.b3 and element = new.element;
        select FOUND_ROWS() into @rows_found;
        if  @rows_found > 0 then
			delete from alarms where b1 = new.b1 and b2 = new.b2 and b3 = new.b3 and element = new.element;
		end if;
        insert into alarms (b1, b2, b3, elem, monstate, monstatetext, constate, constatetext, monvalue, quality, opcquality, timestamp, ack_timestamp, active)
        values (new.b1, new.b2, new.b3, new.elem, new.monstate, new.monstatetext, new.constate, new.constatetext, new.monvalue, new.quality, new.opcquality, new.timestamp, new.ack_timestamp, new.active);
	end if;
    if 	new.active is false
		and
        new.ack_timestamp is not null
	then
		delete from alarms where b1 = new.b1 and b2 = new.b2 and b3 = new.b3 and element = new.element;
	end if;
end//