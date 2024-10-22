with top_visits as(
select pz.name,count(person_id) as count_s,'visit' as action_type from person_visits pv
join pizzeria pz on pz.id=pv.pizzeria_id
group by pz.name
order by action_type asc,count_s desc
limit 3
), top_orders as (
select pz.name,count(person_id) as count_s,'order' as action_type from person_order po
join menu m on m.id = po.menu_id
join pizzeria pz on pz.id=m.pizzeria_id
group by pz.name
order by action_type asc,count_s desc
limit 3
)

select * from top_visits
union all
select * from top_orders
order by action_type asc,count_s desc