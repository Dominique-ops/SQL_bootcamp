select m.pizza_name, m.price, pz.name as pizzeria_name, pv.visit_date
from person_visits pv
join person p on pv.person_id = p.id
join pizzeria pz on pv.pizzeria_id = pz.id
join menu m on pz.id = m.pizzeria_id
where p.name = 'Kate' and m.price between 800 and 1000
order by m.pizza_name, m.price, pizzeria_name;

