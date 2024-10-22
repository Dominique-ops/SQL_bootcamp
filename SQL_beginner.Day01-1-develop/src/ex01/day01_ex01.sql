select object_name from(
SELECT name AS object_name, 1 AS sort_order
FROM person
UNION ALL
SELECT pizza_name AS object_name, 2 AS sort_order
FROM menu
ORDER BY sort_order, object_name
) as uion
