SELECT id, name
FROM pizzeria p
WHERE NOT EXISTS (
    SELECT 1 
    FROM person_visits pv
    WHERE p.id = pv.pizzeria_id
);
