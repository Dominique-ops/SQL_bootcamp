with people as (
    select p.gender, pi.name pizzeria_name
    from person_order po
    join person p on po.person_id = p.id
    join menu m on po.menu_id = m.id
    join pizzeria pi on m.pizzeria_id = pi.id
)
, combined as (
    select distinct pizzeria_name, gender
    from people
)
, pizzerias_gender as (
    select pizzeria_name
    from combined
    group by pizzeria_name
    having count(distinct gender) = 1
)
select pizzeria_name
from pizzerias_gender
order by pizzeria_name;