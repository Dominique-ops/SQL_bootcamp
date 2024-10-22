SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id;

SET enable_seqscan TO off;

EXPLAIN ANALYZE
SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id;