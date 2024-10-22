select p.name,count(person_id) as count_s from person_visits pv
join person p on p.id=pv.person_id
group by p.name
having count(*)>3
