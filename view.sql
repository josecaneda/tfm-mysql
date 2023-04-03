use monitor;

create view alarms_view as 
select
    status.b1,
    b1.b1text,
    status.b2,
    b2.b2text,
    status.b3,
    b3.b3text,
    status.elem,
    elements.elemtext,
    status.monstate,
    status.monstatetext,
    status.constate,
    status.constatetext,
    status.monvalue,
    status.quality,
    status.opcquality,
    status.timestamp,
    status.ack_timestamp,
    status.active
from status
join b1 on status.b1 = b1.b1
join b2 on status.b2 = b2.b2
join b3 on status.b3 = b3.b3
join elements on status.elem = elements.elem
where  ack_timestamp is null or active is true
order by ack_timestamp desc
with cascaded check option;



create trigger events_changes
after update on status
for each row
begin
    if (new.monstate <> old.monstate or new.constate <> old.constate or new.timestamp <> old.timestamp or new.ack_timestamp <> old.ack_timestamp) then
        insert into events (b1, b2, b3, elem, monstate, monstatetext, constate, constatetext, monvalue, quality, opcquality, timestamp, ack_timestamp, active)
        values (new.b1, new.b2, new.b3, new.elem, new.monstate, new.monstatetext, new.constate, new.constatetext, new.monvalue, new.quality, new.opcquality, new.timestamp, new.ack_timestamp, new.active);
    end if;
end;




create view events_view as
select
    status.b1,
    b1.b1text,
    status.b2,
    b2.b2text,
    status.b3,
    b3.b3text,
    status.elem,
    elements.elemtext,
    status.monstate,
    status.monstatetext,
    status.constate,
    status.constatetext,
    status.monvalue,
    status.quality,
    status.opcquality,
    status.timestamp,
    status.ack_timestamp,
    status.active
from status
join b1 on status.b1 = b1.b1
join b2 on status.b2 = b2.b2
join b3 on status.b3 = b3.b3
join elements on status.elem = elements.elem;




