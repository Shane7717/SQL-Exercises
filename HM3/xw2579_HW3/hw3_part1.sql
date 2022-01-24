select CS.candidate, JS.job, JS.grade
from Jobs_Skills JS, Candidates_Skills CS
where JS.skill = CS.skill
and CS.years >= JS.years
group by CS.candidate, JS.job, JS.grade
having count(*) >= 2
order by CS.candidate, JS.job, JS.grade;



select distinct C.candidate, P.company
from Candidates C, Positions P
where (C.salary is null) or (C.salary <= P.salary)
order by C.candidate, P.company;



select distinct CS.candidate
from Jobs_Skills JS, Candidates_Skills CS
where JS.skill = CS.skill
and JS.job = 'DEV'
and JS.grade = 3
and CS.years >= JS.years
order by CS.candidate;



select C1.candidate as candidate1, C2.candidate as candidate2
from Candidates C1, Candidates_Skills CS1, Candidates C2, Candidates_Skills CS2
where C1.candidate = CS1.candidate
and C2.candidate = CS2.candidate
and C1.candidate in
(select candidate from Candidates_Skills where skill = 'DB' INTERSECT
select candidate from Candidates_Skills where skill = 'python')
and C2.candidate in 
(select candidate from Candidates_Skills where skill = 'DB' INTERSECT
select candidate from Candidates_Skills where skill = 'python' )
and C1.salary is not null
and C2.salary is not null
and (CS1.skill = 'python' Or CS1.skill = 'DB')
and (CS2.skill = 'python' Or CS2.skill = 'DB')
group by candidate1, candidate2
having sum(CS1.years) > sum(CS2.years)
and C1.salary < C2.salary
order by candidate1, candidate2;



select CS.skill, min(CS.years) as min_years, max(CS.years) as max_years,
	cast(avg(CS.years) as decimal(10, 1)) as avg_years,
	min(C.salary) as min_salary, max(C.salary) as max_salary,
	cast(avg(C.salary) as decimal(10, 1)) as avg_salary
from Candidates_Skills CS, Candidates C
where CS.candidate = C.candidate
group by CS.skill
order by CS.skill;



select P1.job as job1, P1.grade as grade1, P1.company as company1,
P2.job as job2, P2.grade as grade2, P2.company as company2
from Positions P1, Jobs_Skills JS1, Positions P2, Jobs_Skills JS2
where P1.job = JS1.job and P1.grade = JS1.grade
and P2.job = JS2.job and P2.grade = JS2.grade
and JS1.skill = 'Linux' and JS2.skill = 'Linux'
and P1.job||P1.grade||P1.company > P2.job||P2.grade||P2.company
order by job1, grade1, company1, job2, grade2, company2;