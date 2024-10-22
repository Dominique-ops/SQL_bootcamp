create or replace function fnc_person_visits_and_eats_on_date(
IN pperson varchar  default 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
returns table(name varchar) as $$
Begin
return query
    SELECT DISTINCT pi.name
    FROM (
        SELECT pv.person_id, pv.pizzeria_id
        FROM person_visits pv
        WHERE pv.visit_date = pdate
        UNION
        SELECT po.person_id, m.pizzeria_id
        FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        WHERE po.order_date = pdate AND m.price < pprice
    ) AS visits_and_orders
    JOIN person p ON visits_and_orders.person_id = p.id AND p.name = pperson
    JOIN pizzeria pi ON visits_and_orders.pizzeria_id = pi.id;

end;
$$
LANGUAGE plpgsql;