/*
CS373: Quiz #26 (5 pts)
*/

/* -----------------------------------------------------------------------
 1. Write the MySQL query to obtain the intersection of R and S on
    attribute A using an inner join.
    Write it again using a subquery.
    (4 pts)

A
3
5
*/

use downing_test;

drop table if exists R;
drop table if exists S;

create table R (A int, B int);
create table S (A int, C int);

insert into R values (2, 1);
insert into R values (3, 2);
insert into R values (4, 3);
insert into R values (5, 4);
insert into R values (6, 5);

insert into S values (7, 1);
insert into S values (3, 2);
insert into S values (8, 3);
insert into S values (5, 4);
insert into S values (9, 5);

select A from R inner join S using (A);
select A from R where A in (select A from S);

drop table if exists R;
drop table if exists S;

exit
