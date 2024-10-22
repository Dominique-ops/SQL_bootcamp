with pizzas as(
select pizza_name,price,pizzeria_id from menu
where pizza_name = 'mushroom pizza' or pizza_name= 'pepperoni pizza'
)
select pizza_name,pizzeria.name,price from pizzas
join pizzeria on pizzeria_id=pizzeria.id
order by 1,2