--Course
ALTER TABLE eng08.course 
ALTER COLUMN course_no SET NOT NULL;

ALTER TABLE eng08.course
ADD CONSTRAINT pk_course_key PRIMARY KEY (course_no);

--ZipCode
ALTER TABLE eng08.zipcode 
ALTER COLUMN zip SET NOT NULL;

ALTER TABLE eng08.zipcode
ADD CONSTRAINT pk_zipcode_key PRIMARY KEY (zip);

--Student
ALTER TABLE eng08.student 
ALTER COLUMN student_id SET NOT NULL;

ALTER TABLE eng08.student
ADD CONSTRAINT pk_student_key PRIMARY KEY (student_id),
ADD CONSTRAINT fk_student_zip FOREIGN KEY (zip) REFERENCES eng08.zipcode (zip);

--Grade type
ALTER TABLE eng08.grade_type 
ALTER COLUMN grade_type_code SET NOT NULL;

ALTER TABLE eng08.grade_type
ADD CONSTRAINT pk_gradeType_key PRIMARY KEY (grade_type_code);  

--Grade Conversion
ALTER TABLE eng08.grade_conversion 
ALTER COLUMN letter_grade SET NOT NULL;

ALTER TABLE eng08.grade_conversion
ADD CONSTRAINT pk_gradeConv_key PRIMARY KEY (letter_grade);  

--Instructor
ALTER TABLE eng08.instructor 
ALTER COLUMN instructor_id SET NOT NULL;

ALTER TABLE eng08.instructor
ADD CONSTRAINT pk_instructor_key PRIMARY KEY (instructor_id),
ADD CONSTRAINT fk_student_zip FOREIGN KEY (zip) REFERENCES eng08.zipcode (zip);

--Section
ALTER TABLE eng08.section 
ALTER COLUMN section_id SET NOT NULL;

ALTER TABLE eng08.section 
ADD CONSTRAINT pk_section_key PRIMARY KEY (section_id),
ADD CONSTRAINT fk_section_course FOREIGN KEY (course_no) REFERENCES eng08.course (course_no),
ADD CONSTRAINT fk_section_instructor FOREIGN KEY (instructor_id) REFERENCES eng08.instructor (instructor_id);


--Enrollment
ALTER TABLE eng08.enrollment
ALTER COLUMN student_id SET NOT NULL;

ALTER TABLE eng08.enrollment
ALTER COLUMN section_id SET NOT NULL;

ALTER TABLE eng08.enrollment
ADD CONSTRAINT fk_enroll_student FOREIGN KEY (student_id) REFERENCES eng08.student(student_id),
ADD CONSTRAINT fk_enroll_sect FOREIGN KEY (section_id) REFERENCES eng08.section (section_id),
ADD CONSTRAINT pk_enrollment PRIMARY KEY (student_id, section_id);

--Grade
ALTER TABLE eng08.grade
ALTER COLUMN student_id SET NOT NULL;

ALTER TABLE eng08.grade
ALTER COLUMN section_id SET NOT NULL;

ALTER TABLE eng08.grade
ALTER COLUMN grade_type_code SET NOT NULL;

ALTER TABLE eng08.grade
ALTER COLUMN grade_code_occurrence SET NOT NULL;

ALTER TABLE eng08.grade
ADD CONSTRAINT fk_grade_student FOREIGN KEY (student_id) REFERENCES eng08.student(student_id),
ADD CONSTRAINT fk_grade_sect FOREIGN KEY (section_id) REFERENCES eng08.section (section_id),
ADD CONSTRAINT fk_grade_grdType FOREIGN KEY (grade_type_code) REFERENCES eng08.grade_type(grade_type_code),
ADD CONSTRAINT pk_grade PRIMARY KEY (student_id, section_id, grade_type_code, grade_code_occurrence);

--Grade_type_weight
ALTER TABLE eng08.grade_type_weight
ALTER COLUMN section_id SET NOT NULL;

ALTER TABLE eng08.grade_type_weight 
ALTER COLUMN grade_type_code SET NOT NULL;

ALTER TABLE eng08.grade_type_weight
ADD CONSTRAINT fk_grade_sect FOREIGN KEY (section_id) REFERENCES eng08.section (section_id),
ADD CONSTRAINT fk_grade_typecode FOREIGN KEY (grade_type_code) REFERENCES eng08.grade_type(grade_type_code),
ADD CONSTRAINT pk_grade_type_weight PRIMARY KEY (section_id, grade_type_code);