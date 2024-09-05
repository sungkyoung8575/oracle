create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));

insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');

select * from users;

/* ����Ǯ��
���κ��� ���� ������ Ǯ��, ������ ������ ���� ���纸��
������ ������ ��ŭ ����� �ۼ��Ͽ� ���κ��� �����մϴ�.

��ǥ����  
�˻��� : ����Ŭ where ����*/

--1. ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�.  
select name,point,jumin from users;

--2. 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.
select name,addr,point 
from users
where point >= 80;
/*�� �̷��� Ǭ ���� ��
 users�����̼��� �����Ͽ�  point�÷��� 80�̻� �������� Ʃ���� ��󳻼� �̸��ּ����� �����
 =������Ǯ��=>������̺��� users 80���̻��� ����� �����ϴ°��� Ʃ���� ����-where�ʿ�
 �������� ������ �Ӽ��� ���Ǽ��� where point>=80
 ���ϴ� ���� �̸��� �ּ� ���� �̹Ƿ� select�� �ʿ� ���⿡ ��Ī�Ǵ� �÷��� name,addr,point
*/
--3. �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҿ� ������ �˻��Ͻÿ�.
select name,addr,point
from users
where name like 'kim%';
/*LIKE '%��'�� ������ ������ ��쿡�� ��������
LIKE '��%'�� ������ �����ϴ� ��쿡�� ��������
LIKE '%��%'�� ���� ��������� �������� �ȴ�*/

--4. ���� �������� +10���� ������ ������ ����Ͻÿ�.
--   ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.
select name,point+10
from users;

--5. 1�г��� ������ +1���� �÷��� ����ϼ���. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select point+1
from users
where grade=1;
/*�� �̷��� Ǭ ���� ��
=������Ǯ��=>������̺�users
1�г��� ������°��� Ʃ���� ����>where grade=1
���ϴ� ���� �����ε� �׳� ���� �ƴϰ� +1 > �������� �ذ� select point+1
*/

--6. B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ��� (B��� 80�� �̻� 90�� �̸��Դϴ�)
select name,addr,point
from users
where point >=80 and point <90;
/*�� �̷��� Ǭ ���� ��
point �÷��� 80�̻�� �ص�� 90�̸� ������ �ְ� Ʃ���� ��󳻾� �����
*/

--7. ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
--   �ּҸ� �Է����� ���� �л��� �̸���, �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���
select *
from users
where addr is null;
/* null�� �񱳿����� ���Ұ�*/

--8. 4�г��� ������ 10%�� �ø� ������ ����ϼ���.
--   (��, ���������ʹ� �ݿ����� �ʴ´�)
select name,point+(point*0.1)--select point*1.1
from users
where grade=4;
/*�� �̷��� Ǭ ���� ��

*/

--9. ������ ���� �л����� ����ϼ���.  ��ȣ, �̸�, �ּ�, ����Ʈ
select no,name,addr,point
from users
order by point asc;
/*�� �̷��� Ǭ ���� ��
..point ������������ ������..
*/

--10. �г��� ������������ �����Ͻÿ�, �� �г��� ���� �� ��� ����Ʈ�� ���� ����� ���� ��µ˴ϴ�.
--     ����� ��ȣ, �̸�, �г�, ����Ʈ 
select no,name,grade,point
from users
order by grade asc, point desc;
/*�� �̷��� Ǭ ���� ��
������ �ΰ� ������ ������� ����ȴٰ� �˰ԵǾ� �г⺰ ������ ����Ʈ ������������ ������
=������Ǯ��=>������̺� users
Ʃ�ü������� ����
���ϴ� �÷� ��ȣ,�̸�,�г�,����Ʈ select
���� oredr by
*/

--11. ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.?
select name,point �⺻����,point-10 ��������
from users
where point-10>=80;
/*�� �̷��� Ǭ ���� ��

*/

--12. 2�г��� ��� �л��� ����Ͻÿ� . ��� �÷�����
--    �̸� �ּ� �г����� ����Ͻÿ�. ���⼭ �̸��� name�÷�, �ּҴ� addr�÷�, �г��� grade�÷��� �ǹ�
select name �̸�,addr �ּ�,grade �г�
from users;

--�߰�����  -- ����Ŭ �Լ��� �˻��� ������

--13. �л��� �� ����Դϱ�? 
select count(*)
from users;

--14. 1�г��� �� ����Դϱ�?
select count(*)
from users
where grade=1;

--15. ��� �л��� �̸��� �г��� ����Ͻÿ�. �� �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�. 
select lower(name),grade
from users;
/*�� �̷��� Ǭ ���� ��
������̺�usert Ʃ�ü������Ǿ���
���ϴ°�(�÷�)�� �̸��� �г� ��, ��� �ҹ��ڷ� ���
name ���� �ҹ��ڷθ�?���İ����Ѱ�?�Ұ� �Լ��ΰ����Ѱ�? �˻��غ�
����Ŭ���� �����ϴ� �����Լ��� ����Ͽ� Ǯ�����ϴ�~
(�Լ��� ���� �����������)
*/

--16. 2�г� �л��� �̸��� �г��� ����Ͻÿ�. ������ ���ؼ� �ּҴ� �ձ��� 2���ڸ� ����Ͻÿ�.
select name,grade,substr(addr,1,2)
from users
where grade=2;
/*
���ڰ� �ڸ��� ���
SUBSTR('��','������ġ',����)
INSTR('��','Ư������')
=������Ǯ��=> ������̺� users ,2�г� �л��� �̸��� Ʃ�ü������� where grade=2
���ϴ� ��(�÷�)�� �̸��� �г� name,grade �ε� ��2���ڸ� ��� �������δ� �Ұ�

*/

--17. ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�. - �ݿø� ���� (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
/*
ROUND �Լ� (�ݿø�) -- ROUND(N, �ݿø��� ��ġ) (round �Լ��� ��¥�� �ݿø��� �����ϴ�.)
CEIL �Լ� (�ø�) -- CEIL(N)
FLOOR �Լ� (����) -- FLOOR(N)
TRUNC �Լ� (����) -- TRUNC(N,���� ��ġ)
*/
select name,trunc(point,-1)
from users;
/*�� �̷��� Ǭ ���� ��

*/

--18. ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select name,round(point,-1)
from users;

--19. 2�г��� ��� ����Դϱ�?
select count(*)
from users
where grade=2;

--20. 1�г��� 80�� �̻��� ����Դϱ�?
select count(*)
from users
where grade=1 and point >=80;

--21. 3�г��� ����� �����Դϱ�?
select avg(point)
from users
where grade=3;

--22. ��ü �л� �� �ְ����� �����Դϱ�?
select max(point)
from users;
--23. 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
select min(point)
from users
where grade=2;

--��Ǫ�� ����
/*24. ������ ���ؼ� �ּҸ� ��� ������� �ʰ� ���� �� ���ڸ� ����ϰ� �ڿ� *�� �ϳ� ������.
   (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
   ��)suwon  >> su* */
   select concat(SUBSTR(addr,1,2),'*')
   from users;
--25. �̸��� �� �տ� *�� �� �ڿ���*�� ������ ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select concat(concat('*',name),concat(name,'*'))
from users;

--26. ��������� �״�� ������� ����
--    xx �� xx �� xx �� �������� ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�. ������ �����Ѵ�)
select to_date(substr(jumin,1,6),'yymmdd') -- 81/07/15  �̷��� ����.. 
from users;

select to_char(to_date(substr(jumin,1,6),'yymmdd'),'yy"��"mm"��"dd"��"') -- �ذ�
from users;

--27. �̸�, ����Ʈ, �г�, �������, ������ �߰��Ѵ�. ������ ������Ϸ� �Ǵ��ϸ� ������ ���ڰ�1�̸� ��
--    2�̸� ����� ǥ���Ѵ�. 

alter table users add gender varchar2(3);
select * from users;

--  substr(jumin,8)  1�ƴϸ� 2 ����
