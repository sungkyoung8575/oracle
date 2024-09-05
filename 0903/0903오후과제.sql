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
insert into muser values(muser_no.nextval,'870205-1','이승진',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','박이진',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','최이수',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','류진아',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','오현식',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','정승우',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','이재수',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','박지영',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','정은아',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','정재영',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','이신수',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','이발끈',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','이욱이',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','지승아',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','현진수',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','최이런',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','이천안',1,10000,31);

select *from muser;
----------------------------------------------------------------------------------

--1 grade가 3인 사람은 모두 몇명인가요?
select count(*)     --원하는 값은 인원수 컬럼수식으로 불가 함수사용
from muser
where grade=3;      -- 튜플의 선정조건 grade 3
----------------------------------------------------------------------------------
--2 grade가 1,2,4인 사람들의 salary의 평균을 구하시오.
select grade,avg(salary)
from muser
where grade =1 or grade =2 or grade =4;
group by grade;

--선생님풀이=> 1,2,4 모두의 평균을 구하는거라 그룹바이 안써도됨
select avg(salary)
from muser
where grade in (1,2,4);     -- in 연산자는 or 의 의미가 있다. 
----------------------------------------------------------------------------------
--3 salary가 20000 미만인 사람은 총 몇명입니까?
select count(*)
from muser
where salary <20000;
----------------------------------------------------------------------------------
--4 salary가 30000 이상인 사람의 salary 평균을 구하시오.
select avg(salary)
from muser
where salary >= 30000;
----------------------------------------------------------------------------------
--5 77년생 중에  salary가 가장 적은 사람의 이름과 나이와 salary를 출력하시오.
select name, 
case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end 나이,salary
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary) 
    from muser 
    where substr(reg_num,1,2)=77);


--선생님풀이=>
select  --이름과 나이와 salary
from muser
where   --77년생 중에
--group by
--order by

/* 77년생 테스트 시작*/
select substr(reg_num,1,2) from muser;  --중간단계
--본쿼리에 적용
where substr(reg_num,1,2)='77'
/* 77년생 테스트 끝*/

--77년생중 제일 적은 salary
select min(salary)
from muser
where substr(reg_num,1,2)='77';
-- 가장 작은 salary를 알면 가장 작은 salary를 조건으로 튜플을 선정할수있다
select name,reg_num,salary
from muser
where substr(reg_num,1,2)='77' and salary = 10000;      -- 10000(상수)을 쓰면 안됨 , 서브쿼리 생각 // 결론은 나랑 똑가틈
-- 나이를 출력하라고했음 
--컬럼으로 해결가능?수식?함수?서브쿼리?? >> 수식과 함수가 필요
select 1900+substr(reg_num,1,2) from muser; 
-- 분석 상수로 1900을 보정하면 2000년 이후 출생자는 오류데이터가 됨
-- 조건에 따라 1900 또는 2000을 플러스 해줘야한다
--검색 - 오라클 조건문  >> decode
select substr(reg_num,8,1) from muser;
select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b
from muser;

select substr(reg_num,8,1) a,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b,
       decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)+substr(reg_num,1,2) c
from muser;

/* ★ 최종 ★ */        --다중행과 단일행은 성격이다름 오류남 
select name 이름, 
    (extract (year from sysdate))-
    (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)+substr(reg_num,1,2)) 나이
    ,salary 급여
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary) 
    from muser 
    where substr(reg_num,1,2)=77);
----------------------------------------------------------------------------------

--6 모든 사람의 이름과, 생일(월과 일 예를들어 0205)를 출력하시오.
select name,substr(reg_num,3,4) 생일
from muser;
----------------------------------------------------------------------------------
--7 남자의 평균 급여를 구하시오.
/*  모름 */
select avg(salary)남자평균급여 --평균급여
from muser
where substr(reg_num,8,1) in ('1','3');-- 남자? 컬럼으로 안됨 수식과 함수사용해야겟네


----------------------------------------------------------------------------------

--8 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여를 출력하시오
select name,salary
from muser
where salary > (select avg(salary) from muser);

/*
select name,salary
from muser
where  -- 평균급여보다 높은 급여를 받는 사람의 튜플
       -- 컬럼 자체로 해결?수식?함수?서브쿼리? ==> 평균급여의 결과값으로 조건을완성->서브쿼리 
*/

----------------------------------------------------------------------------------
--9 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여, 평균급여를 출력하시오
select name,salary,
    (select avg(salary) from muser) 평균급여 -- 수식?함수?서브쿼리  ==> 스칼라 서브쿼리 (주의 계속 반복됨) , 대안책-조인
from muser
where salary > 
    (select avg(salary) from muser);
    
    -- 성능은 별로임.. 왜냐하면 본쿼리 select에서 튜플을 
    -- 하나씩 완성해 갈때마다 동일한 서브쿼리를 계속 실행하기 때문이다.


----------------------------------------------------------------------------------

--10 여직원의 평균급여보다 높은 남자직원은 모두 몇명입니까
select count(*)
from muser
where substr(reg_num,8,1) in ('2','4') and salary > (select avg(salary)여자평균급여 
from muser
where substr(reg_num,8,1) in ('2','4'));



----------------------------------------------------------------------------------

--11 grade별 평균 급여를 출력하세요..
select grade,avg(salary)
from muser
group by grade;
----------------------------------------------------------------------------------

--12 그룹별 평균급여가 전체 평균보다 높은 그룹을 출력하시오.
select grade
from muser
group by grade
having avg(salary) > (select avg(salary) from muser);
----------------------------------------------------------------------------------

--13 직원들의 월급 명세서를 출력하시오. (출력 형태는 이름, 월급(grade*salary*time)
select name,grade*salary*time 월급
from muser;
----------------------------------------------------------------------------------

--14 직원들의 성별을 출력하시오. (출력 형태 이름, 성별(성별은 남또는 여로 출력한다)
select name,
        case
            when substr(reg_num,8)in ('1','3') then '남'
            when substr(reg_num,8)in ('2','4') then '여' -- else '여' 라고 해도됨
        end 성별
from muser;

-- decode 이용
select name,decode(substr(reg_num,8,1),'1','남','3','남','여'/*1,3 빼고 나머지는 여*/) 성별
from muser;
    
----------------------------------------------------------------------------------

--15 time은 근무시간이 근무시간이 31이상인 사람의 이름을 출력하시오.
select name
from muser
where time>=31;
----------------------------------------------------------------------------------

--16 짝수년도에 태어난 사람들의 이름을 모두 출력하싱.
select name,reg_num
from muser
where mod(substr(reg_num,1,2),2)=0;
----------------------------------------------------------------------------------

--17 직원들의 생년월일을 출력하시오. (출력 형태는 이름과 생년월일(97년1월2일))
select name,to_char(to_date(substr(reg_num,1,6),'yymmdd'),'yy"년"mm"월"dd"일"') 생년월일
from muser;
----------------------------------------------------------------------------------

--18 여직원들의 육아를 지원하기 위한 정책으로 time을 2시간가산하기로 했다. 이를 처리 하시오.
select name,reg_num,time,time+2 육아지원
from muser
where substr(reg_num,8,1) in ('2','4');

----------------------------------------------------------------------------------

--19 나이별 인원수는 몇명입니까
select case
    when substr(reg_num,8)in ('1','2') then 2024-concat('19',substr(reg_num,1,2))
    when substr(reg_num,8)in ('3','4') then 2024-concat('20',substr(reg_num,1,2))
    end 나이,count(*)
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

--20 2학년그룹과 4학년 그룹은 모두 몇명입니까
select grade,count(*)
from muser
where grade=2 or grade=4
group by grade;
----------------------------------------------------------------------------------

--추가문제

--#1) 모든 사람이 태어난 후 오늘까지 몇 달이 지났는지 출력하시오
--(출력형태: 이름, 주민번호, 지금까지살아온월수)
select name,reg_num,months_between(sysdate,substr(reg_num,1,6))
from muser;

----------------------------------------------------------------------------------
--#2) time을 나이로 봄. 30~31세의 살아온 월수의 합, 32세 이상의 살아온 월수의 합 구하기

select 
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time in (30,31)) as 삼공삼일,
  (select trunc(sum(months_between(sysdate,substr(reg_num,1,6)))) 
   from muser where time >= 32) as 삼이 
from dual;

----------------------------------------------------------------------------------
--#3) 연령별 급여의 합, over()함수 이용
select distinct time 연령,
       sum(salary) over(partition by time) 총합
from muser;
----------------------------------------------------------------------------------
--#4) 연령별 인원수, over()함수 이용
select distinct time 연령,count(*) over(partition by time) 인원수
from muser;
----------------------------------------------------------------------------------
--#5) 등급별 급여의 최고급여, over()함수 이용
select distinct grade,max(salary) over(partition by grade)
from muser;

----------------------------------------------------------------------------------
--#6) 구글검색하여 오라클 함수 정리

----------------------------------------------------------------------------------





commit;
