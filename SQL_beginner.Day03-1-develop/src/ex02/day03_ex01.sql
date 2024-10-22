select pizza_name,price,pz.name as pizzeria_name from menu
join pizzeria pz on pizzeria_id=pz.id
where menu.id not in (select menu_id from person_order)
order by 1,2
