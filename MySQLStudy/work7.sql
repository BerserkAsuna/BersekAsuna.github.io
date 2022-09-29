-- 1  emm
SELECT dname,ss FROM dept ,(SELECT COUNT(deptno) ss,deptno FROM emp
	GROUP BY deptno )AS a
	WHERE dept.deptno=a.deptno
-- 2	
SELECT ename FROM emp
	WHERE sal>(SELECT sal FROM emp
			WHERE ename='SMITH')
-- 3			
SELECT e1.ename 
	FROM emp AS e1,emp AS e2
	WHERE e1.mgr=e2.empno AND e1.`hiredate`>e2.`hiredate`
-- 4  emm
SELECT ename,dname FROM dept LEFT JOIN emp
	ON emp.`deptno`=dept.`deptno`
	ORDER BY dname
-- 5	
SELECT ename,dname,job FROM emp,dept
	WHERE emp.`deptno`=dept.`deptno` AND job='CLERK'
-- 6
SELECT MIN(sal) AS a,job FROM emp
	GROUP BY job
	HAVING a>1500
-- 7
SELECT ename,dname FROM emp,dept
	WHERE emp.`deptno`=dept.deptno AND dname='SALES'
-- 8
SELECT * FROM emp
	WHERE sal>(SELECT AVG(SAL) FROM emp)
-- 9
SELECT *
	FROM emp
	WHERE job=(SELECT job FROM emp WHERE ename='SCOTT')
-- 10 
SELECT ename,sal
	FROM emp
	WHERE sal>(SELECT MAX(sal) FROM emp WHERE deptno=30)
-- 11
SELECT deptno,COUNT(deptno),AVG(sal),AVG(DATEDIFF(NOW(),hiredate))
	FROM emp
	GROUP BY deptno
-- 12
SELECT ename,dname,sal
	FROM emp,dept
	WHERE emp.`deptno`=dept.`deptno`
-- 13
SELECT dept.*,部门人数
	FROM dept,(SELECT COUNT(deptno) 部门人数,deptno
			FROM emp
			GROUP BY emp.deptno) a
	WHERE dept.deptno=a.deptno
-- 14
SELECT MIN(sal),job
	FROM emp
	GROUP BY job
-- 15
SELECT MIN(sal) FROM emp WHERE job='MANAGER'
-- 16
SELECT (sal+IF(comm!=NULL,comm,0))*12 年工资,LCASE(ename) 
	FROM emp
	ORDER BY 年工资
	
	
	