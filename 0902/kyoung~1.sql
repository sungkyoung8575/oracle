create table hm (
no number (3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1,'ȫ�浿',45,'�����',default);
insert into hm values (2,'������',50,'����',default);
insert into hm values (3,'������',43,'����',default);

select * from hm; 
select no,name from hm;

select count(*) from hm;

--����1 : ��� ����� �̸��� ������ ����Ͻÿ�.
select name �̸�,point  --name�� �̸����� ǥ���Ҷ� , ���� ���̺��� ����������� /��Ī����
from hm;

--����2 : ������ 50�� ������ ����� �̸��� ������ ����Ͻÿ�.
select name,point 
from hm 
where point <50;

--����3 : ������ 50�� ������ ����� ��� ����ΰ���?
select count(*) 
from hm 
where point <50;

--����4 : ȫ�浿�� ������ ���� �ΰ���?
select point 
from hm 
where name='ȫ�浿';

--����5: �������� ��� ������ ����ϼ���.
select * 
from hm 
where name='������';

--����6 : ��� ȸ���� ����ϵ� ���� ������� ����Ͻÿ�.
select *
from hm
order by indate asc;

--Q1 . ��� �л��� �̸��� ����Ʈ�� ���. 
--����Ʈ�� ���� ����Ʈ���� 10�� �÷��� ���
select name �̸�,point+10 ��������Ʈ
from hm;

--Q2. ��� �л��� �̸��� ����Ʈ�� ���.
--�����
--�̸�  ��������Ʈ   ��������Ʈ
-- �̸��� �л��� �̸� , ��������Ʈ�� ����� ����Ʈ, ��������Ʈ�� +10�� �ø� ����Ʈ
select name �̸�,point ��������Ʈ,point+10 ��������Ʈ
from hm;

--------------------------------------------------------------------------
-- update hm set point=100, name='��Ƽó';  << ��� Ʃ���� �� �����
-- update hm set point=100, name='��Ƽó' where name='ȫ�浿'; << ȫ�浿���ִ� Ʃ�� ������ ����

--ȫ�浿�� ����� / �����Ϸ���?
delete from hm where name='ȫ�浿';

select concat('�̸�','��') �̸� from dual;   --concat�Լ�(�Ű�����) , dual < ����Ŭ���� �����ϴ� �ӽ����̺����� 
select sysdate from dual;

select indate from hm;



commit;

