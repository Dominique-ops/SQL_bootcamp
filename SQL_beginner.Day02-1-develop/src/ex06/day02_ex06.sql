with prs as (
select menu_id,person_id from
person_order po
join person p on po.person_id = p.id where p.name = 'Denis' or p.name = 'Anna'
)
select pizza_name,pizzeria.name as pizzeria_name from prs
join menu on menu_id = menu.id
join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1,2