SELECT * FROM Department
SELECT * FROM Employee

/* Assignment -- 3 ( Q-1 ) */

SELECT d.dept_name, e.emp_name, e.Salary
FROM Department d
JOIN Employee e
ON e.dept_id = d.dept_id 
AND e.Salary = (SELECT MAX(Salary) 
               FROM Employee e2
               WHERE e2.dept_id= d.dept_id);

/* Assignment -- 3 ( Q-2 ) */

SELECT s.dept_name, s.employees
FROM (
		SELECT dept_name, ISNULL(count,0) as employees
		FROM Department d
		LEFT JOIN(
					SELECT dept_id,COUNT(emp_id) as count
					FROM Employee
					GROUP BY dept_id) e
										ON d.dept_id = e.dept_id
										) s
										WHERE s.employees<3


/* Assignment -- 3 ( Q-3 ) */

SELECT dept_name,Department.dept_Id, COUNT(*) AS totalEmployees
FROM Employee
LEFT JOIN Department
ON Employee.dept_id = Department.dept_id
GROUP BY dept_name,Department.dept_Id

/* Assignment -- 3 ( Q-4 ) */

SELECT dept_name, ISNULL(count,0) as employees
		FROM Department d
		LEFT JOIN(
					SELECT dept_id,sum(emp_id) as count
					FROM Employee
					GROUP BY dept_id) e
										ON d.dept_id = e.dept_id
										