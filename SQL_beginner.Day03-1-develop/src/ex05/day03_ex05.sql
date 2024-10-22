with visits as (
    select distinct piz.name pizzeria_name
    from person_visits pv
    join person p on pv.person_id = p.id
    join pizzeria piz on pv.pizzeria_id = piz.id
    where p.name = 'Andrey'
),
orders as (
    select distinct piz.name pizzeria_name
    from person_order po
    join person p on po.person_id = p.id
    join menu m on po.menu_id = m.id
    join pizzeria piz on m.pizzeria_id = piz.id
    where p.name = 'Andrey'
)
select pizzeria_name
from visits
except
select pizzeria_name
from orders;