-- AS SYS  
grant create user to hr;
grant create role to hr;
grant all privileges to hr;

-- AS HR  
create user movieadmin
identified by movieadmin;

create user movieguest
identified by movieguest;

create role moviemanager;
create role movienormal;

grant create table, create session, create view
    to moviemanager;

grant select on employees to movieguest;

grant connect, create session to movieguest;

select * from hr.employees;

select * from user_role_privs;

select * from user_sys_privs;

select * from user_tab_privs_recd;

