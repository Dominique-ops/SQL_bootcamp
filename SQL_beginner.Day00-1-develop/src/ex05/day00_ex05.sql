SELECT 
    (SELECT name from person where person.id = person_order.person_id  ) AS NAME
FROM person_order
WHERE (menu_id = 13 and order_date = '2022-01-07') or (menu_id = 14  and order_date = '2022-01-07') or (menu_id = 18 and order_date = '2022-01-07')


