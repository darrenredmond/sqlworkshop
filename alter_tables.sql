
create table emp2 as (select * from employees);

alter table emp2
modify employee_id primary key;

alter table emp2
add constraint emp2_mgr_fk
  foreign key(manager_id)
  references emp2(employee_id);