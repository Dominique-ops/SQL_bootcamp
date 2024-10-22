CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYZE
SELECT pd.person_id, pd.pizzeria_id, pd.discount
FROM person_discounts pd
WHERE pd.person_id = 1 AND pd.pizzeria_id = 1;