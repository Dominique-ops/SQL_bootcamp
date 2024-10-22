create view v_price_with_discount as
select p.name,
		m.pizza_name,
		m.price,
		m.price * 0.9 as discount_price
		from person_order po
join person p on po.person_id=p.id
join menu m on m.id=po.menu_id
order by p.name,m.pizza_name