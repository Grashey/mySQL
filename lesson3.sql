SELECT *
	FROM geodata._cities city
	JOIN geodata._regions r ON city.region_id = r.id
	JOIN geodata._countries c ON city.country_id = c.id

SELECT *
	FROM geodata._regions r
	JOIN geodata._cities s
    ON r.id = s.region_id
    WHERE r.title = "Московская область"


SELECT dept_name, AVG(salary)
	FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
	JOIN salaries s ON de.emp_no = s.emp_no
	GROUP BY d.dept_name   

SELECT CONCAT(first_name, ' ', last_name) AS full_name, MAX(salary)
	FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
	GROUP BY e.emp_no

DELETE
	FROM employees
	WHERE emp_no = 
	(
	SELECT emp_no
	FROM salaries
	GROUP BY emp_no
	ORDER BY MAX(salary) DESC LIMIT 1
	)

SELECT COUNT(emp_no) AS emp_count
	FROM dept_emp

//'этот ответ точно неправильный'
SELECT d.dept_name, COUNT(de.emp_no) AS emp_count, SUM(s.salary) AS sum_salary
	FROM departments d
	JOIN dept_emp de ON d.dept_no = de.dept_no
	JOIN salaries s ON de.emp_no = s.emp_no
	GROUP BY d.dept_no



