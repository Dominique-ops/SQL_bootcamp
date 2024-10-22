insert into person_order(id, person_id, menu_id, order_date)
select generate_series(max(po.id) + 1, max(po.id) + (select count(*) from person p)),
	generate_series((select min(p.id) from person p), (select max(p.id) from person p)),
	(select m.id from menu m where m.pizza_name = 'greek pizza'),
	timestamp '2022-02-25'	
from person_order po;