-- Data Engineering

-- Drop tables if they exist

DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "dept_emp";
DROP TABLE IF EXISTS "dept_manager";
DROP TABLE IF EXISTS "Employees";
DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";

-- Create Departments table

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(30) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_no")
);

Select * from "Departments";

-- Create Employees table

CREATE TABLE "Employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(30) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(1) NOT NULL, 
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY ("emp_no")
);

Select * from "Employees";


-- Create Salaries table

CREATE TABLE "Salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY ("emp_no")
);

Select * from "Salaries";

-- Create Titles table

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30) NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY ("title_id")
);

Select * from "Titles";


-- Create dept_emp table

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no")
);

Select * from "dept_emp";


-- Create dept_manager table

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no")
);

Select * from "dept_manager";


-- Add foreign key constraints

ALTER TABLE "dept_emp" 
    ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no")
    REFERENCES "Employees" ("emp_no");

ALTER TABLE "dept_emp" 
    ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no")
    REFERENCES "Departments" ("dept_no");

ALTER TABLE "dept_manager" 
    ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no")
    REFERENCES "Departments" ("dept_no");

ALTER TABLE "dept_manager" 
    ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no")
    REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" 
    ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY ("emp_title_id")
    REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" 
    ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY ("emp_no")
    REFERENCES "Employees" ("emp_no");