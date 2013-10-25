/*
CS373: Quiz #22 (5 pts)
*/

/* -----------------------------------------------------------------------
 1. What is the output of the following?
    (4 pts)

A	B	C	D
1	4	1	6
1	4	1	7

A	B	C	D
1	4	1	6
1	4	1	7
2	5	NULL	NULL

A	B	C	D
1	4	1	6
1	4	1	7
NULL	NULL	3	8
NULL	NULL	3	9
*/

use downing_test;

drop table if exists R;
drop table if exists S;

create table R (A int, B int);
create table S (C int, D int);

insert into R values (1, 4);
insert into R values (2, 5);

insert into S values (1, 6);
insert into S values (1, 7);
insert into S values (3, 8);
insert into S values (3, 9);

select * from R inner join S on R.A = S.C;
select * from R left  join S on R.A = S.C;
select * from R right join S on R.A = S.C;

drop table if exists R;
drop table if exists S;

exit
