SELECT
    p.name name,
    COUNT(p.name) count_of_orders,
    ROUND(AVG(m.price), 2) average_price,
    MAX(m.price) max_price,
    MIN(m.price) min_price
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria p ON m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY p.name;