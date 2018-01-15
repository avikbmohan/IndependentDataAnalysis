---1. Show the total number of prizes awarded.

SELECT COUNT(winner)
FROM nobel

---2. List each subject - just once

Select Distinct subject
From nobel

---3. Show the total number of prizes awarded for Physics.

SELECT Count(subject)
FROM nobel
WHERE subject = 'Physics'

---4. For each subject show the subject and the number of prizes.

SELECT subject, Count(winner)
FROM nobel
GROUP BY subject

---5. For each subject show the first year that the prize was awarded.

SELECT subject, min(yr)
FROM nobel
GROUP BY subject

---6. For each subject show the number of prizes awarded in the year 2000.

SELECT subject, Count(winner)
FROM nobel
WHERE yr = 2000
GROUP BY subject

---7. Show the number of different winners for each subject.

SELECT subject, Count(DISTINCT winner)
FROM nobel
GROUP BY subject

---8. For each subject show how many years have had prizes awarded.

SELECT subject, Count(DISTINCT yr)
FROM nobel
GROUP BY subject

---9. Show the years in which three prizes were given for Physics.

SELECT DISTINCT yr
FROM nobel x
WHERE 3 = 
	(SELECT Count(winner)
	FROM nobel y
	WHERE subject = 'Physics' AND x.yr = y.yr)

---10. Show winners who have won more than once.

SELECT DISTINCT winner
FROM nobel x
WHERE 1 < 
	(SELECT Count(winner)
	FROM nobel y
	WHERE x.winner = y.winner)

---11. Show winners who have won more than one subject.

SELECT DISTINCT winner
FROM nobel x
WHERE 1 <
(SELECT Count(DISTINCT subject)
FROM nobel y
WHERE x.winner = y.winner)

---12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards.

SELECT DISTINCT yr, subject
FROM nobel x
WHERE yr >= 2000 AND 3 = 
(SELECT Count(winner)
FROM nobel y
WHERE x.subject = y.subject AND x.yr = y.yr)