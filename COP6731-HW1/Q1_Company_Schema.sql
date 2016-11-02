CREATE SCHEMA company;

--Employees Table
CREATE TABLE company.employees
  (
     emp_no     INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR(50) NOT NULL,
     last_name  VARCHAR(50) NOT NULL,
     gender     CHAR(1) CHECK(gender IN ('M', 'F')),
     hire_date  DATE NOT NULL,
     CONSTRAINT pk_empno PRIMARY KEY (emp_no)
  );

--Departments Table
CREATE TABLE company.departments
  (
     dept_no   INT NOT NULL,
     dept_name VARCHAR(300) NOT NULL,
     CONSTRAINT pk_deptno PRIMARY KEY (dept_no)
  );

--Dept_Manager Table
CREATE TABLE company.dept_manager
  (
     emp_no    INT NOT NULL,
     dept_no   INT NOT NULL,
     from_date DATE NOT NULL,
     to_date   DATE NOT NULL,
     CONSTRAINT fk_deptmgr_emp FOREIGN KEY (emp_no) REFERENCES
     company.employees(emp_no) ON DELETE CASCADE,
     CONSTRAINT fk_deptmgr_dept FOREIGN KEY (dept_no) REFERENCES
     company.departments(dept_no) ON DELETE CASCADE,
     CONSTRAINT pk_deptmgr PRIMARY KEY (emp_no, dept_no)
  );

--Dept_Emp Table
CREATE TABLE company.dept_emp
  (
     emp_no    INT NOT NULL,
     dept_no   INT NOT NULL,
     from_date DATE NOT NULL,
     to_date   DATE NULL,
     CONSTRAINT fk_deptemp_emp FOREIGN KEY (emp_no) REFERENCES company.employees
     (emp_no) ON DELETE CASCADE,
     CONSTRAINT fk_deptemp_dept FOREIGN KEY (dept_no) REFERENCES
     company.departments (dept_no) ON DELETE CASCADE,
     CONSTRAINT pk_deptemp_emp PRIMARY KEY (emp_no, dept_no)
  );

--Titles Table
CREATE TABLE company.titles
  (
     emp_no    INT NOT NULL,
     title     VARCHAR(50) NOT NULL,
     from_date DATE NOT NULL,
     to_date   DATE NULL,
     CONSTRAINT fk_titles_emp FOREIGN KEY (emp_no) REFERENCES company.employees
     (emp_no) ON DELETE CASCADE,
     CONSTRAINT pk_titles PRIMARY KEY (emp_no, title, from_date)
  );

--Salaries Table
CREATE TABLE company.salaries
  (
     emp_no    INT NOT NULL,
     salary    INT NOT NULL,
     from_date DATE NOT NULL,
     to_date   DATE NULL,
     CONSTRAINT fk_sal_emp FOREIGN KEY (emp_no) REFERENCES company.employees (
     emp_no) ON DELETE CASCADE,
     CONSTRAINT pk_sal PRIMARY KEY (emp_no, from_date)
  ); 