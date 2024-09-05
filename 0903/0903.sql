
select *
from users;

select grade, count(*) �ο���
from users
group by grade;

--����1, �׷캰 �ο����� ����ϵ� �г��� ������������ ����
select grade, count(*) �ο���
from users
group by grade
order by grade asc;

--����2, �׷캰 �ְ����� �������� ����Ͻÿ�
select grade,max(point) �ְ���,min(point) ������
from users
group by grade;

--����3, �׷캰 �ְ����� ȹ���� ����� �̸���?
--select grade,max(point) �ְ���,name from users group by grade  --���ķ��� / ������ name�� �׷�ȭ ��������.

--Ȯ�ι���
--1. 3�г�� 4�г� ���� �׷��� �ο��� ���
select grade,count(*) �ο���
from users
where grade=3 or grade=4
group by grade;

--2. 1�г�� 2�г��� �ְ����� �������� ���� ���̸� ���
select grade,max(point)-min(point) ��������
from users
where grade=1 or grade=2
group by grade;

--3. �ֹι�ȣ 2 �ڸ��� ��� �⵵�̴�. ���� �⵵�� �¾ ����� ī�����Ͻÿ�
--   �̶� �¾ �⵵�� �ο����� ����Ѵ�.

select substr(jumin,1,2) �¾�⵵,count(*)�ο���
from users
group by substr(jumin,1,2);

-- ��������
-- �׷��� ���� �� �׷캰 ������ �����Ҽ��ִ�. ���� ��� �׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�
-- �� ���û����� �׷캰�� �ο��� ī�����ϰ� �׷��߿� �ο����� 3���� �׷츸 �����ϴ� �ǹ�
--�׷쿡 ������ �����ϴ� ����� ã�ƺ�����

select grade, count(*)
from users
group by grade
having count(*)>=3;

-- ��ü ��հ� �׷������ ���ϰ� ��ü ��պ��� ���� �׷�� ����� ���
--select avg(point) from users; << �ϴ� ��ü��ձ��ϰ� ����� �Է��ص���
select grade, avg(point)
from users
group by grade
having avg(point)>=(select avg(point) from users); -- ��������

--�ڡ�
select m.name, m.addr
from (select * from users) m;   -- �����������̺��� ��Ī, ����users���̺��� ���硤�ӽ����̺� ���� / �������ȿ����� ��ȿ��

--���� ���� ������ ȹ���� ����� �̸��� ������?
select name,point
from users
where point = (select max(point) from users);
commit;
