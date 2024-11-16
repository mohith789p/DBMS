Write SQL Queries for the following:
	
1) Display all the records in emp table.
select *  
From emp;

2) Display all the records in emp table where employee belongs to deptno 10.
select *  
From emp 
Where deptno = 10;

3) Display all the records in emp table where employee does not belong to deptno 30.
select *  
From emp 
Where deptno <> 30

4) Display total number of records in Emp table.
select count(*) 
From emp;

5) Display emp table with salary descending order.
select * 
From emp 
order by sal desc

6) Display first five records in employee table.
select *
from emp
where rownum < 6;

or 

select *
from emp
fetch first 5 rows only;

7) Display all the records in emp table order by ascending deptno, descending salary.
select * 
From emp 
order by deptno ,sal desc

8) Display all employees those who were joined in year 1981.
select * 
From emp 
where hiredate between '01-Jan-1981' and '01-Jan-1982'

9) Display employee information who don’

10) Display the records in emp table where MGR in 7698,7566 and sal should be greater then 1500
select * 
From emp 
where hiredate between '01-Jan-1981' and '01-Jan-1982'

11) Display all employees where their salary is less then the Ford’s salary?
select ename
from emp
where sal < (select sal 
    		    from emp
    		    where ename = 'FORD');

12) Display all the records in EMP table along with the rowed.
select rownum SNo,emp.*
from emp;

13) Write a query to display current date.
select sysdate 
from dual;

14) Display distinct job from emp table.
select distinct job
from emp;

15) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J, A, or M.
select upper(substr(ename,1,1)) || lower(substr(ename,2)) as name
from emp
where ename like 'J%' or ename like 'A%' or ename like 'M%';

16) Write a query to display the employee name, department name of all employees who earn a commission.
select ename, dname
from emp e,dept d
where e.deptno = d.deptno and comm is not null;

17) Display the empno, ename, sal, and salary increased by 15%.
select empno,ename,sal, sal * 1.15 increasedSalary
from emp;

18) Display employee names and corresponding manager names
select emp.ename employee, mng.ename manager
from emp , emp mng
where emp.mgr = mng.empno;

19) Display all the departments where employee salary greater than average salary of that department.
SELECT DISTINCT DNAME
FROM DEPT NATURAL JOIN EMP
WHERE SAL > ANY(SELECT AVG(SAL)
    		FROM EMP
    		GROUP BY DEPTNO);

20) Display employees where length of ename is 5
select ename
from emp
where length(ename) = 5;

21) Display all employees where ename start with J and ends with S
select ename
from emp
where upper(ename) like 'J%S';

22) Display all employees where employee does not belong to 10,20,40
select *
from emp
where deptno<>10 and deptno<>20 and deptno<>40;

23) Display all employees where jobs does not belong to PRESIDENT and MANAGER.
select *
from emp
where job not in ('PRESIDENT', 'MANAGER');

24) Display the maximum salary in the emp table
select MAX(SAL) as max
from emp;

25) Display average salary for job SALESMAN
select avg(SAL) as avearge
from emp
where job = 'SALESMAN';

26) Display all ename where first character could be anything, but second character should be L.
SELECT ENAME
FROM EMP
WHERE ENAME like '_L%';

27) Display nth highest and nth lowest salary in emp table.


28) Display all the departments where department has 3 employees.
select dname
from emp natural join dept
group by dname
having count(empno) = 3;

29) Display sum of salary for each department.
select dept.dname, COALESCE(sum(emp.sal),0) "TOTAL SALARY"
from emp right join dept
    on dept.deptno = emp.deptno
group by dept.dname;

30) Display all department with Minimum salary and maximum salary?
select dname, min(sal) as minimum, max(sal) as maximum
from dept natural join emp
group by dname;

31) Display all ename, empno, dname, loc from emp, dept table.
select ename, empno, dname, loc 
from emp natural join dept;

32) Display all the departments where department does not have any employees
select dname 
from dept 
where deptno in (select deptno from dept 
				minus
				select deptno from emp)

33) Display all the departments where department does have atleast one employee
select dname 
from dept 
where deptno in (select distinct deptno from emp);

34) Display all employees those who are not managers.
select ename
from emp
where empno not in (select distinct mgr
				from emp
    			where mgr is not null);

35) Display ename, deptno from emp table with format of {ename} belongs to {deptno}
SELECT ename || ' belongs to ' || deptno as works
FROM emp;

36) Display all the records in emp table. The ename should be lower case. The job first character should be upper case and rest of the character in job field should be lower case.
select ename,initcap(job) as job
from emp;

3 7) Create table emp1 and copy the emp table for deptno 10 while creating the table
create table emp1 as 
select * from emp;

38) Create table emp2 with same structure of emp table. Do not copy the data


39) Display all the records for deptno which belongs to employee name JAMES.
select *
from emp
where deptno = (select deptno 
    from emp
    where ename = 'JAMES');

40) Display all the records in emp table where salary should be less than or equal to ADAMS salary.
select *
from emp
where sal <= (select sal 
    from emp
    where ename = 'ADAMS');

41) Display all subordinate those who are working under BLAKE.
select * from emp
where mgr = (select empno from emp where ename ='BLAKE');

42) Display who is making highest commission.
select *
from emp
where comm =(select MAX(comm)
    		from emp);
	
43) Display ename, sal, grade, dname, loc for each employee.


44) Display all employee whose location is DALLAS.
select *
from emp natural join dept
where loc = 'DALLAS';
45) Delete emp records for detpno 10 and 20.
	delete from emp where deptno = 10 or deptno = 20;

46) Delete all employees those are not getting any commission.
delete 
from emp 
where comm is null

47) Delete the employees where employee salary is greater than average salary of his/her department.
delete from emp
where sal > (select avg(sal) 
    		from emp);

48) Rename the employee name JONES to ANDY
update emp
set ename = 'ANDY'
where ename = 'JONES';

49) Increase the salary 5% for employee those who are earning commission less then 1000
update emp set sal = sal + sal * 0.05
where comm < 1000;


50) Increase 100$ for employee who is making more then averge salary of his department.
UPDATE emp
SET sal = sal + 100
WHERE sal > (
    SELECT AVG(sal)
    FROM emp e
    WHERE e.deptno = emp.deptno
    GROUP BY deptno
);


51) Increase 1% salary for employee who is making lowest salary in dept 10
update emp set sal = sal*1.01
    where sal in (select min(sal) 
    			from emp 
    			where deptno = 10);

52) Increase commission 10$ for employees those who are located in NEW YORK.
update emp set sal = sal + 10
where deptno in (select deptno
    from dept where loc = 'NEW YORK');
