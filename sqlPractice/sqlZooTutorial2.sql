1. Show the name, continent and population of all countries.

SELECT name, continent, population
FROM world

2. Show the name for the countries that have a population of at least 200 million

SELECT name FROM world
WHERE population >= 200000000

3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

5. Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name In ('France', 'Germany', 'Italy')

6. Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE '%United%'

7. Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

8. Exclusive OR (XOR). Show the countries that are big by area or big by population but NOT both. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

9. For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, Round(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

11. Show the name and capital WHERE the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE Left(name,5) = Left(capital,5)

12. Show the name and the capital WHERE the first letters of each match. Don't include countries WHERE the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE name <> capital AND Left(name, 1) = Left(capital, 1)

13. Find the country that has all the vowels and no spaces in its name.

SELECT name
   FROM world
WHERE name LIKE '%a%'
And name LIKE '%e%'
And name LIKE '%i%'
And name LIKE '%o%'
And name LIKE '%u%'
And name NOT LIKE '% %'