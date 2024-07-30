-- Data Queries

--1.List the employee number, last name, first name, sex, and salary of each employee

Select e."emp_no",e."last_name",e."first_name",e."sex",s."salary" from "Employees" e
	join "Salaries" s on e."emp_no" = s."emp_no" 
	limit 10; 


--2. List the first name, last name, and hire date for the employees who were hired in 1986

Select e."first_name",e."last_name", e."hire_date" from "Employees" e
	where extract(year from e."hire_date") = 1986
	limit 10;


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name

Select dm."dept_no",d."dept_name", dm."emp_no",e."last_name",e."first_name" from "dept_manager" dm
	join "Departments" d on dm."dept_no" = d."dept_no" 
	join "Employees" e on dm."emp_no" = e."emp_no" 
	limit 10; 


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name

Select de."dept_no",e."emp_no", e."last_name",e."first_name", d."dept_name" from "dept_emp" de
	join "Employees" e on de."emp_no" = e."emp_no" 
	join "Departments" d on de."dept_no" = d."dept_no" 
	limit 10; 


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

Select e."first_name",e."last_name", e."sex" from "Employees" e
	where "first_name"  = 'Hercules'
	and "last_name" like 'B%'
	limit 10;


--6. List each employee in the Sales department, including their employee number, last name, and first name

Select e."emp_no",e."last_name",e."first_name" from "dept_emp" de
	join "Employees" e on de."emp_no" = e."emp_no" 
	join "Departments" d on de."dept_no" = d."dept_no"
	where d."dept_name" = 'Sales'
	limit 10; 


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

Select e."emp_no",e."last_name",e."first_name", d."dept_name" from "dept_emp" de
	join "Employees" e on de."emp_no" = e."emp_no" 
	join "Departments" d on de."dept_no" = d."dept_no"
	where d."dept_name" in ('Sales', 'Development')
	limit 10; 


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

Select e."last_name", count(*) as "count" from "Employees" e
	group by e."last_name"
	order by "count" desc
	limit 10;


