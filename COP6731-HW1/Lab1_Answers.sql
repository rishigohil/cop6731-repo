--Question 1
--9 Records
SELECT A.NAME 
FROM   eng07.ACTOR A, 
       eng07.CASTING C, 
       eng07.MOVIE M 
WHERE  A.actor_id = C.actor_id 
       AND C.movie_id = M.movie_id 
       AND M.title = 'The Great Gatsby' 

--Question 2
--80 Rows
SELECT A.NAME, 
       M.title 
FROM   eng07.ACTOR A, 
       eng07.CASTING C, 
       eng07.MOVIE M 
WHERE  A.actor_id = C.actor_id 
       AND M.movie_id = C.movie_id 
       AND M.yr = 1994 
       AND C.ord = 1 

--Question 3
--2 Records
SELECT M.title 
FROM   eng07.ACTOR A, 
       eng07.CASTING C, 
       eng07.MOVIE M 
WHERE  a.actor_id = c.actor_id 
       AND c.movie_id = m.movie_id 
       AND A.NAME = M.director 
