-- join --

create table stu(
no number,
name varchar2(5 char),
tel varchar2(13));

create table pp(
no number,
e_name varchar2(4),
e_point number(3));

insert into stu values (1,'hong','1111');
insert into stu values (2,'kim','2222');
insert into stu values (3,'lee','3333');

insert into pp values (1,'java',70);
insert into pp values (1,'html',90);
insert into pp values (3,'java',80);
commit;
-----------------------------------------------------------------------------
select * from stu;
select * from pp;

--full join
select s.no, s.name, s.tel, p.no,p.e_name,p.e_point
from stu s,pp p;

-- inner join - 동등
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s,pp p
where s.no = p.no;
/* 다른 표기법
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s
inner join pp p
on s.no = p.no;
*/

-- inner join - 비동등
select s.no, s.name,p.no,p.e_name, p.e_point
from stu s,pp p
where s.no != p.no;

-- outer join  -- left outer join left table: stu
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s
left outer join pp p   
on s.no = p.no;

-- outer join  -- rigth outer join rigth table: pp
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s
right outer join pp p
on s.no = p.no;

-----------------------------------------------------------------------------
/* 시험을 본 학생들의 이름과 과목,점수를 출력하시오 */
--2개의 테이블을 합쳐야함=조인 , 같은 컬럼을 합친다=이너조인
select s.name, p.e_name,p.e_point
from stu s, pp p
where s.no = p.no;
-- 홍길동의 이름과 과목과 점수를 출력 / 이너조인필요
select s.name, p.e_name,p.e_point
from stu s, pp p
where s.no = p.no and s.name='hong';
-- 시험을 치루지 않은 학생들의 이름을 출력 // 이너조인에 참여하지 않
select s.name
from stu s
left outer join pp p
on s.no=p.no
where p.no is null;


