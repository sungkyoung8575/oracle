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

-- inner join - ����
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s,pp p
where s.no = p.no;
/* �ٸ� ǥ���
select s.no, s.name, p.no,p.e_name, p.e_point
from stu s
inner join pp p
on s.no = p.no;
*/

-- inner join - �񵿵�
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
/* ������ �� �л����� �̸��� ����,������ ����Ͻÿ� */
--2���� ���̺��� ���ľ���=���� , ���� �÷��� ��ģ��=�̳�����
select s.name, p.e_name,p.e_point
from stu s, pp p
where s.no = p.no;
-- ȫ�浿�� �̸��� ����� ������ ��� / �̳������ʿ�
select s.name, p.e_name,p.e_point
from stu s, pp p
where s.no = p.no and s.name='hong';
-- ������ ġ���� ���� �л����� �̸��� ��� // �̳����ο� �������� ��
select s.name
from stu s
left outer join pp p
on s.no=p.no
where p.no is null;


