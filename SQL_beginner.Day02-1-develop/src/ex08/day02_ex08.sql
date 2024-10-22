with prs as (
select name,id from person
where (address = 'Moscow' or address = 'Samara') and gender = 'male'
)
select distinct name from prs
join person_order on person_order.person_id = prs.id
join menu on pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
order by 1 desc