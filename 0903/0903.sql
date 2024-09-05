
select *
from users;

select grade, count(*) 인원수
from users
group by grade;

--응용1, 그룹별 인원수를 출력하되 학년을 오름차순으로 정렬
select grade, count(*) 인원수
from users
group by grade
order by grade asc;

--응용2, 그룹별 최고점과 최저점을 출력하시오
select grade,max(point) 최고점,min(point) 최저점
from users
group by grade;

--응용3, 그룹별 최고점을 획득한 사람의 이름은?
--select grade,max(point) 최고점,name from users group by grade  --ㅇㅔ러남 / 이유는 name은 그룹화 되지않음.

--확인문제
--1. 3학년과 4학년 각각 그룹의 인원수 출력
select grade,count(*) 인원수
from users
where grade=3 or grade=4
group by grade;

--2. 1학년과 2학년의 최고점과 최저점의 점수 차이를 출력
select grade,max(point)-min(point) 점수차이
from users
where grade=1 or grade=2
group by grade;

--3. 주민번호 2 자리는 내어난 년도이다. 같은 년도에 태어난 사람을 카운팅하시오
--   이때 태어난 년도와 인원수로 출력한다.

select substr(jumin,1,2) 태어난년도,count(*)인원수
from users
group by substr(jumin,1,2);

-- 연구과제
-- 그룹을 만들 때 그룹별 조건을 지정할수있다. 예를 들어 그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오
-- 이 지시사항은 그룹별로 인원을 카운팅하고 그룹중에 인원수가 3명인 그룹만 선택하는 의미
--그룹에 조건을 지정하는 방법을 찾아보세요

select grade, count(*)
from users
group by grade
having count(*)>=3;

-- 전체 평균과 그룹평균을 구하고 전체 평균보다 높은 그룹과 평균을 출력
--select avg(point) from users; << 일단 전체평균구하고 수기로 입력해도됨
select grade, avg(point)
from users
group by grade
having avg(point)>=(select avg(point) from users); -- 서브쿼리

--★★
select m.name, m.addr
from (select * from users) m;   -- 서브쿼리테이블의 별칭, 실제users테이블의 복사·임시테이블 개념 / 본쿼리안에서만 유효함

--가장 높은 점수를 획득한 사람의 이름과 점수는?
select name,point
from users
where point = (select max(point) from users);
commit;
