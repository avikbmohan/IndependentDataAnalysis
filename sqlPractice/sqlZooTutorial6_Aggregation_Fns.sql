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



---7. Show the number of different winners for each subject.



---8. For each subject show how many years have had prizes awarded.



---9. Show the years in which three prizes were given for Physics.



---10. Show winners who have won more than once.



---11. Show winners who have won more than one subject.



---12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards.

