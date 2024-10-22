select 
    person.name AS person_name,
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
from person_order
join person_visits on person_order.person_id=person_visits.person_id and person_order.order_date=person_visits.visit_date
join person on person.id=person_order.person_id
join menu on menu.id=person_order.menu_id
join pizzeria on person_visits.pizzeria_id=pizzeria.id
ORDER BY 
    person_name ASC, 
    pizza_name ASC, 
    pizzeria_name ASC;
