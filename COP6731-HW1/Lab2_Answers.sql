--Lab 2

--Q5
--16 Records
SELECT S.first_name 
FROM   eng08.student S, 
       eng08.enrollment E, 
       eng08.section SEC, 
       eng08.instructor I 
WHERE  S.student_id = E.student_id 
       AND E.section_id = SEC.section_id 
       AND SEC.instructor_id = I.instructor_id 
       AND I.first_name = 'Anita' 
       AND I.last_name = 'Morris'

--Q6 
--2 Records
SELECT S.first_name
FROM    eng08.student S ,
        eng08.instructor I ,
        eng08.enrollment E ,
        eng08.section SEC
WHERE   S.student_id = E.student_id
        AND E.section_id = SEC.section_id
        AND SEC.instructor_id = I.instructor_id
        AND I.zip = S.zip

--OR - Some data have different zip code but same cities.

SELECT DISTINCT S.FIRST_NAME 
FROM   eng08.STUDENT S, 
       eng08.INSTRUCTOR I, 
       eng08.ENROLLMENT E, 
       eng08.SECTION SEC, 
       eng08.ZIPCODE Z1, 
       eng08.ZIPCODE Z2 
WHERE  S.STUDENT_ID = E.STUDENT_ID 
       AND I.INSTRUCTOR_ID = SEC.INSTRUCTOR_ID 
       AND SEC.SECTION_ID = E.SECTION_ID 
       AND I.ZIP = Z1.ZIP 
       AND Z2.ZIP = S.ZIP 
       AND Z1.CITY = Z2.CITY 
--Q7
--103 Records
SELECT  COUNT(S.first_name) students_not_enrolled
FROM    eng08.student S
        LEFT JOIN eng08.enrollment E ON S.student_id = E.student_id
WHERE   E.student_id IS NULL

--Q8
--1 Record
SELECT S.FIRST_NAME 
FROM   eng08.STUDENT S 
WHERE  NOT EXISTS((SELECT C.COURSE_NO 
                   FROM   eng08.COURSE C 
                   WHERE  C.COST > 1700) 
                  EXCEPT 
                  ((SELECT C.COURSE_NO 
                    FROM   eng08.COURSE C, 
                           eng08.SECTION SEC, 
                           eng08.ENROLLMENT E 
                    WHERE  C.COURSE_NO = SEC.COURSE_NO 
                           AND SEC.SECTION_ID = E.SECTION_ID 
                           AND E.STUDENT_ID = S.STUDENT_ID))) 
			
--Q9
--8 Records
SELECT I.FIRST_NAME        InstructorName, 
       Count(S.STUDENT_ID) NumberOfStudents 
FROM   eng08.STUDENT AS S 
       JOIN eng08.ENROLLMENT AS E 
         ON S.STUDENT_ID = E.STUDENT_ID 
       JOIN eng08.SECTION AS SEC 
         ON SEC.SECTION_ID = E.SECTION_ID 
       JOIN eng08.INSTRUCTOR AS I 
         ON I.INSTRUCTOR_ID = SEC.INSTRUCTOR_ID 
GROUP  BY I.FIRST_NAME 
HAVING Count(SEC.COURSE_NO) >= 1

