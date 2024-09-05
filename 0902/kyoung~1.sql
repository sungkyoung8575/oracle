create table hm (
no number (3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1,'홍길동',45,'서울시',default);
insert into hm values (2,'일지매',50,'수원',default);
insert into hm values (3,'이지매',43,'서울',default);

select * from hm; 
select no,name from hm;

select count(*) from hm;

--문제1 : 모든 사람의 이름과 점수만 출력하시오.
select name 이름,point  --name을 이름으로 표시할때 , 실제 테이블은 변경되지않음 /별칭지정
from hm;

--문제2 : 점수가 50점 이하인 사람의 이름과 점수를 출력하시오.
select name,point 
from hm 
where point <50;

--문제3 : 점수가 50점 이하인 사람은 모두 몇명인가요?
select count(*) 
from hm 
where point <50;

--문제4 : 홍길동의 점수는 몇점 인가요?
select point 
from hm 
where name='홍길동';

--문제5: 일지매의 모든 정보를 출력하세요.
select * 
from hm 
where name='일지매';

--문제6 : 모든 회원을 출력하되 가입 순서대로 출력하시오.
select *
from hm
order by indate asc;

--Q1 . 모든 학생의 이름과 포인트를 출력. 
--포인트는 현재 포인트에서 10점 올려서 출력
select name 이름,point+10 가산포인트
from hm;

--Q2. 모든 학생의 이름과 포인트를 출력.
--출력은
--이름  현재포인트   가산포인트
-- 이름은 학생의 이름 , 현재포인트는 저장된 포인트, 가산포인트는 +10점 올린 포인트
select name 이름,point 현재포인트,point+10 가산포인트
from hm;

--------------------------------------------------------------------------
-- update hm set point=100, name='김티처';  << 모든 튜플이 다 변경됨
-- update hm set point=100, name='김티처' where name='홍길동'; << 홍길동이있는 튜플 내용이 변경

--홍길동이 퇴사함 / 삭제하려면?
delete from hm where name='홍길동';

select concat('이름','님') 이름 from dual;   --concat함수(매개변수) , dual < 오라클에서 제공하는 임시테이블같은거 
select sysdate from dual;

select indate from hm;



commit;

