SELECT name,rating FROM pizzeria
WHERE rating <=5 AND rating >= 3.5
ORDER BY rating

UNION

SELECT name,rating FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;
