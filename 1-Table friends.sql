create table friends (id integer, name string, birthday date);

insert into friends (id,name) values (1,"Ororo Munroe");
select * from friends;

insert into friends values (5, "manolo", "15/02/1999");
insert into friends values (7, "jose", "16/02/1919");
insert into friends values (4, "pepe", "17/02/1939");

select * from friends;

update friends set name="storm" where name="Ororo Munroe";
select * from friends;

alter table friends add column email string;

UPDATE friends 
SET email = 'storm@codecademy.com'
WHERE id = 1;

select * from friends;

delete from friends where id=1;
select * from friends;
