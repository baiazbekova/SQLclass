create or replace function get_department_count_by_name(dep_name varchar)
returns int
language plpgsql
as
$$
declare
department_count integer;
begin
    --logic
select count (*)
into department_count
from employees
where department=dep_name;

return department_count;
end;

$$

--running the function
select get_department_count_by_name('Toys');


create or replace function get_department(p_pattern varchar)
returns table(
    employee_name varchar,
    employee_email varchar
)
language plpgsql
as
$$
declare
begin
    return query
    select first_name, email
    from employees
    where department like p_pattern;

end;
$$

select * from get_department('%oth%');