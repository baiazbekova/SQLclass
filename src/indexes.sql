
--parallel scan sequence
explain analyse
select *
from towns
where name = '2965228955cb1342dd66c841d116eb29';


create index idx_towns_name
on towns (name);

drop index if exists idx_towns_name;


explain analyse
select *
from towns
where id = '123';
--index scan

SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
        schemaname = 'public'
ORDER BY
    tablename,
    indexname;