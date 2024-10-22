select p.name,m.pizza_name,m.price,ROUND(m.price*(100-pd.discount)/100,2) as discount_price,pz.name
from person p
join person_order po on po.person_id=p.id
join menu m on po.menu_id=m.id
join pizzeria pz on m.pizzeria_id = pz.id
join person_discounts pd on pd.person_id=p.id AND pz.id = pd.pizzeria_id
order by 1,2