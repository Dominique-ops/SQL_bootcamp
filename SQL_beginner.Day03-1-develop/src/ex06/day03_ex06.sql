with main as (
    select m.pizza_name,
           pi.name as pizzeria_name,
           m.price,
           pi.id
    from menu m
    join pizzeria pi on m.pizzeria_id = pi.id
)
select q1.pizza_name,
       q1.pizzeria_name pizzeria_name_1,
       main.pizzeria_name pizzeria_name_2,
       q1.price
from main q1
join main on q1.price = main.price
         and q1.pizza_name = main.pizza_name
         and q1.id > main.id
order by q1.pizza_name;