drop table if exists mentors;
create table mentors(
                        id Int generated always as identity,
                        first_name varchar(40) not null,
                        last_name varchar(40) not null,
                        primary key (id)
);
--will use this table to keep all data
drop table if exists mentor_audit;
create table mentor_audit(
                             id Int generated always as identity,
                             mentor_id int not null,
                             last_name varchar(40) not null,
                             changed_on timestamp(6) not null
);

insert into mentors(first_name, last_name) values ('Mike', 'Smith');
insert into mentors(first_name, last_name) values ('Tom', 'Hanks');

create or replace function log_last_name_changes()
returns trigger
language plpgsql
as
    $$
    declare
begin
            if new.last_name <> old.last_name then
                insert into mentor_audit(mentor_id, last_name, changed_on) values
                (old.id, old.last_name, now());
end if;
return new;
end
    $$;

create trigger last_name_change
    before update
    on mentors
    for each row
    execute procedure log_last_name_changes();

create trigger last_name_change2
    before update
    on mentors
    for each row
    execute procedure log_last_name_changes();

update mentors
set last_name='XYZ'
where id =2;

select *
from pg_trigger;

drop trigger if exists last_name_change2 on mentors;