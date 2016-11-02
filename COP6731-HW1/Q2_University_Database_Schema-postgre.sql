---------------------------------------------------------
---------------------------------------------------------
--Q2: University Database
---------------------------------------------------------
---------------------------------------------------------

CREATE SCHEMA clg;
Go

--Professor Table
CREATE TABLE clg.Professor
  (
     prof_ssn CHAR(9) NOT NULL,
     prof_name VARCHAR(300) NOT NULL,
     prof_age INT NULL,
     [rank] VARCHAR(100) NOT NULL,
     re_speciality VARCHAR(100) NOT NULL
     
	 CONSTRAINT pk_prof_ssn PRIMARY KEY (prof_ssn)
  );
 
 -- Projects Table
 CREATE TABLE clg.Projects
  (
     proj_no INT NOT NULL,
	 proj_name VARCHAR(300) NOT NULL,
     spon_name VARCHAR(300) NOT NULL CHECK(spon_name IN ('NSF', 'NIH')),
     [start_date] DATE NOT NULL,
     end_date DATE NULL,
     budget VARCHAR(50) NULL
     
	 CONSTRAINT pk_proj_no PRIMARY KEY (proj_no)
  );

  --Department Table
  CREATE TABLE clg.Department
  (
     dept_no INT NOT NULL,
	 dept_name VARCHAR(300) NOT NULL,
     dept_office VARCHAR(300) NOT NULL,
     chair_prof_ssn CHAR(9) NOT NULL
	      
	 CONSTRAINT pk_dept_no PRIMARY KEY (dept_no),
	 CONSTRAINT fk_prof_dep FOREIGN KEY (chair_prof_ssn) REFERENCES clg.Professor(prof_ssn) ON DELETE CASCADE 
  );

  --Students Table
  CREATE TABLE clg.Student
  (
     stu_ssn CHAR(9) NOT NULL,
	 stu_name VARCHAR(300) NOT NULL,
     stu_age INT NULL,
     deg_program CHAR(3) NOT NULL CHECK(deg_program IN ('MS', 'PhD')),
     dept_no INT NULL,
     advisor_stu_ssn CHAR(9) NOT NULL
     
	 CONSTRAINT pk_stu_ssn PRIMARY KEY (stu_ssn),
	 CONSTRAINT fk_stu_dept FOREIGN KEY (dept_no) REFERENCES clg.Department(dept_no)
  );

  --Project Managers Table
  CREATE TABLE clg.Project_Managers
  (
     proj_no INT NOT NULL,
	 prof_ssn CHAR(9) NOT NULL
     
	 CONSTRAINT fk_man_proj FOREIGN KEY (proj_no) REFERENCES clg.Projects(proj_no),
	 CONSTRAINT fk_man_proff FOREIGN KEY (prof_ssn) REFERENCES clg.Professor(prof_ssn),
	 CONSTRAINT pk_proj_managers PRIMARY KEY (proj_no)
  );

  --Project Members Table
  CREATE TABLE clg.Project_Members
  (
     proj_no INT NOT NULL,
	 stu_ssn CHAR(9) NOT NULL,
	 sup_prof_ssn CHAR(9) NOT NULL UNIQUE
     
	 CONSTRAINT fk_mem_proj FOREIGN KEY (proj_no) REFERENCES clg.Projects(proj_no),
	 CONSTRAINT fk_mem_stu FOREIGN KEY (stu_ssn) REFERENCES clg.Student(stu_ssn),
	 CONSTRAINT fk_mem_proff FOREIGN KEY (sup_prof_ssn) REFERENCES clg.Professor(prof_ssn),
	 CONSTRAINT pk_proj_members PRIMARY KEY (proj_no, stu_ssn)
  );

    --Department Members Table
  CREATE TABLE clg.Dept_Members
  (
     dept_no INT NOT NULL,
	 prof_ssn CHAR(9) NOT NULL,
	 [start_date] DATE NOT NULL,
	 end_date DATE NULL
	 
	 CONSTRAINT fk_deptMem_dept FOREIGN KEY (dept_no) REFERENCES clg.Department(dept_no),
	 CONSTRAINT fk_deptMem_proff FOREIGN KEY (prof_ssn) REFERENCES clg.Professor(prof_ssn),
	 CONSTRAINT pk_dept_members PRIMARY KEY (dept_no, prof_ssn)
  );

  --Professor project working relation table.
  CREATE TABLE clg.professor_works
  (
	proj_no INT NOT NULL,
	prof_ssn CHAR(9) NOT NULL,

	CONSTRAINT fk_profWorks_proj FOREIGN KEY (proj_no) REFERENCES clg.Projects(proj_no),
	CONSTRAINT fk_profWorks_proff FOREIGN KEY (prof_ssn) REFERENCES clg.Professor(prof_ssn),
	CONSTRAINT pk_proffworks_members PRIMARY KEY (proj_no, prof_ssn)
  );