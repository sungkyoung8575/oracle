create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10
;
insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);

select *from muser;
----------------------------------------------------------------------------------

--1 grade�� 3�� ����� ��� ����ΰ���?
select count(*)     --���ϴ� ���� �ο��� �÷��������� �Ұ� �Լ����
from muser
where grade=3;      -- Ʃ���� �������� grade 3
----------------------------------------------------------------------------------
--2 grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select grade,avg(salary)
from muser
where grade =1 or grade =2 or grade =4;
group by grade;

--������Ǯ��=> 1,2,4 ����� ����� ���ϴ°Ŷ� �׷���� �Ƚᵵ��
select avg(salary)
from muser
where grade in (1,2,4);     -- in �����ڴ� or �� �ǹ̰� �ִ�. 
----------------------------------------------------------------------------------
--3 salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*)
from muser
where salary <20000;
----------------------------------------------------------------------------------
--4 salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.
select avg(salary)
from muser
where salary >= 30000;
----------------------------------------------------------------------------------
--5 77��� �߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select name, 
case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end ����,salary
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary) 
    from muser 
    where substr(reg_num,1,2)=77);


--������Ǯ��=>
select  --�̸��� ���̿� salary
from muser
where   --77��� �߿�
--group by
--order by

/* 77��� �׽�Ʈ ����*/
select substr(reg_num,1,2) from muser;  --�߰��ܰ�
--�������� ����
where substr(reg_num,1,2)='77'
/* 77��� �׽�Ʈ ��*/

--77����� ���� ���� salary
select min(salary)
from muser
where substr(reg_num,1,2)='77';
-- ���� ���� salary�� �˸� ���� ���� salary�� �������� Ʃ���� �����Ҽ��ִ�
select name,reg_num,salary
from muser
where substr(reg_num,1,2)='77' and salary = 10000;      -- 10000(���)�� ���� �ȵ� , �������� ���� // ����� ���� �Ȱ�ƴ
-- ���̸� ����϶������ 
--�÷����� �ذᰡ��?����?�Լ�?��������?? >> ���İ� �Լ��� �ʿ�
select 1900+substr(reg_num,1,2) from muser; 
-- �м� ����� 1900�� �����ϸ� 2000�� ���� ����ڴ� ���������Ͱ� ��
-- ���ǿ� ���� 1900 �Ǵ� 2000�� �÷��� ������Ѵ�
--�˻� - ����Ŭ ���ǹ�  >> decode
select substr(reg_num,8,1) from muser;
select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b
from muser;

select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)+substr(reg_num,1,2) c
from muser;

/* �� ���� �� */        --������� �������� �����̴ٸ� ������ 
select name �̸�, 
    (extract (year from sysdate))-
    (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)+substr(reg_num,1,2)) ����
    ,salary �޿�
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary) 
    from muser 
    where substr(reg_num,1,2)=77);
----------------------------------------------------------------------------------

--6 ��� ����� �̸���, ����(���� �� ������� 0205)�� ����Ͻÿ�.
select name,substr(reg_num,3,4) ����
from muser;
----------------------------------------------------------------------------------
--7 ������ ��� �޿��� ���Ͻÿ�.
/*  �� */
select avg(salary)������ձ޿� --��ձ޿�
from muser
where substr(reg_num,8,1) in ('1','3');-- ����? �÷����� �ȵ� ���İ� �Լ�����ؾ߰ٳ�


----------------------------------------------------------------------------------

--8 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�
select name,salary
from muser
where salary > (select avg(salary) from muser);

/*
select name,salary
from muser
where  -- ��ձ޿����� ���� �޿��� �޴� ����� Ʃ��
       -- �÷� ��ü�� �ذ�?����?�Լ�?��������? ==> ��ձ޿��� ��������� �������ϼ�->�������� 
*/

----------------------------------------------------------------------------------
--9 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�
select name,salary,
    (select avg(salary) from muser) ��ձ޿� -- ����?�Լ�?��������  ==> ��Į�� �������� (���� ��� �ݺ���) , ���å-����
from muser
where salary > 
    (select avg(salary) from muser);
    
    -- ������ ������.. �ֳ��ϸ� ������ select���� Ʃ���� 
    -- �ϳ��� �ϼ��� �������� ������ ���������� ��� �����ϱ� �����̴�.


----------------------------------------------------------------------------------

--10 �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�
select count(*)
from muser
where substr(reg_num,8,1) in ('2','4') and salary > (select avg(salary)������ձ޿� 
from muser
where substr(reg_num,8,1) in ('2','4'));



----------------------------------------------------------------------------------

--11 grade�� ��� �޿��� ����ϼ���..
select grade,avg(salary)
from muser
group by grade;
----------------------------------------------------------------------------------

--12 �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
select grade
from muser
group by grade
having avg(salary) > (select avg(salary) from muser);
----------------------------------------------------------------------------------

--13 �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time)
select name,grade*salary*time ����
from muser;
----------------------------------------------------------------------------------

--14 �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name,
        case
            when substr(reg_num,8)in ('1','3') then '��'
            when substr(reg_num,8)in ('2','4') then '��' -- else '��' ��� �ص���
        end ����
from muser;

-- decode �̿�
select name,decode(substr(reg_num,8,1),'1','��','3','��','��'/*1,3 ���� �������� ��*/) ����
from muser;
    
----------------------------------------------------------------------------------

--15 time�� �ٹ��ð��� �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.
select name
from muser
where time>=31;
----------------------------------------------------------------------------------

--16 ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻ�.
select name,reg_num
from muser
where mod(substr(reg_num,1,2),2)=0;
----------------------------------------------------------------------------------

--17 �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))
select name,to_char(to_date(substr(reg_num,1,6),'yymmdd'),'yy"��"mm"��"dd"��"') �������
from muser;
----------------------------------------------------------------------------------

--18 ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.
select name,reg_num,time,time+2 ��������
from muser
where substr(reg_num,8,1) in ('2','4');

----------------------------------------------------------------------------------

--19 ���̺� �ο����� ����Դϱ�
select case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end ����,count(*)
from muser
group by case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end
order by case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end asc;

----------------------------------------------------------------------------------

--20 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�
select grade,count(*)
from muser
where grade=2 or grade=4
group by grade;
----------------------------------------------------------------------------------

--�߰�����

--#1) ��� ����� �¾ �� ���ñ��� �� ���� �������� ����Ͻÿ�
--(�������: �̸�, �ֹι�ȣ, ���ݱ�����ƿ¿���)
select name,reg_num,months_between(sysdate,substr(reg_num,1,6))
from muser;

----------------------------------------------------------------------------------
--#2) time�� ���̷� ��. 30~31���� ��ƿ� ������ ��, 32�� �̻��� ��ƿ� ������ �� ���ϱ�

select 
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time in (30,31)) as �������,
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time >= 32) as ���� 
from dual;

----------------------------------------------------------------------------------
--#3) ���ɺ� �޿��� ��, over()�Լ� �̿�
select distinct time ����,
       sum(salary) over(partition by time) ����
from muser;
----------------------------------------------------------------------------------
--#4) ���ɺ� �ο���, over()�Լ� �̿�
select distinct time ����,count(*) over(partition by time) �ο���
from muser;
----------------------------------------------------------------------------------
--#5) ��޺� �޿��� �ְ�޿�, over()�Լ� �̿�
select distinct grade,max(salary) over(partition by grade)
from muser;

----------------------------------------------------------------------------------
--#6) ���۰˻��Ͽ� ����Ŭ �Լ� ����

----------------------------------------------------------------------------------





commit;
