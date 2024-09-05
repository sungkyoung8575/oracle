create table a(
aa number(2));
commit;
create table b(
aa number(2));
insert into b values (2);
drop table a;
drop table b;
