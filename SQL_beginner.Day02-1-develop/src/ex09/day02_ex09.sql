SELECT name
FROM person p
  INNER JOIN person_order po ON po.person_id = p.id
  INNER JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female'
  AND m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name
FROM person p
  INNER JOIN person_order po ON po.person_id = p.id
  INNER JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female'
  AND m.pizza_name = 'cheese pizza'