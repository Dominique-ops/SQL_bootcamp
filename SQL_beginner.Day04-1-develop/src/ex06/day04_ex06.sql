CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name as pizzeria_name
FROM pizzeria pz
  INNER JOIN menu m ON m.pizzeria_id = pz.id
  INNER JOIN person_visits pv ON pz.id = pv.pizzeria_id
  INNER JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800
