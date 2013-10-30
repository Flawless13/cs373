/*
CS373: Quiz #24 (5 pts)
*/

/* -----------------------------------------------------------------------
 1. What is the output of the following?
    (4 pts)

sID
1
4
5
5

sID
1
4
5

sID
1
5
*/

use downing_test;

drop table if exists Student;
drop table if exists Apply;

create table Student (sID int);
create table Apply   (sID int, Major text);

insert into Student values (1);
insert into Student values (2);
insert into Student values (3);
insert into Student values (4);
insert into Student values (5);
insert into Student values (6);

insert into Apply values (1, 'CS');
insert into Apply values (2, 'EE');
insert into Apply values (3, 'MB');
insert into Apply values (4, 'CS');
insert into Apply values (4, 'EE');
insert into Apply values (5, 'CS');
insert into Apply values (5, 'MB');
insert into Apply values (6, 'EE');
insert into Apply values (6, 'MB');

select R.sID
    from Apply as R
    inner join Apply as S using (sID)
    where R.major  = 'CS' and S.major != 'EE';

select distinct R.sID
    from Apply as R
    inner join Apply as S using (sID)
    where R.major  = 'CS' and S.major != 'EE';

select sID
    from Student
    where
        sID in     (select sID from Apply where major = 'CS')
        and
        sID not in (select sID from Apply where major = 'EE');

drop table if exists Student;
drop table if exists Apply;

exit
