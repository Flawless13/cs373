/*
CS373: Quiz #27 (5 pts)
*/

/* -----------------------------------------------------------------------
 1. Write the MySQL query to obtain the average GPA of students applying
    to CS.
    (4 pts)

avg(GPA)
3.125

avg(GPA)
3
*/

use downing_test;

drop table if exists Student;
drop table if exists Apply;

create table Student (sID int, GPA   float);
create table Apply   (sID int, Major text);

insert into Student values (1, 1.5);
insert into Student values (2, 3.0);
insert into Student values (3, 2.0);
insert into Student values (4, 3.5);
insert into Student values (5, 4.0);
insert into Student values (6, 2.5);

insert into Apply values (1, 'CS');
insert into Apply values (2, 'EE');
insert into Apply values (3, 'MB');
insert into Apply values (4, 'CS');
insert into Apply values (4, 'CS');
insert into Apply values (5, 'CS');
insert into Apply values (5, 'MB');
insert into Apply values (6, 'EE');
insert into Apply values (6, 'MB');

# this is not right
# because of duplicates

select avg(GPA)
    from Student
    inner join Apply using (sID)
    where major = 'CS';

select avg(GPA)
    from Student
    where sID in (
        select sID
            from Apply
            where major = 'CS');

drop table if exists Student;
drop table if exists Apply;

exit
