INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date) values
((SELECT COALESCE(MAX(id), 0) FROM person_visits) + 1,
(select id from person where person.name = 'Dmitriy'),
(select id from pizzeria where pizzeria.name = 'DoDo Pizza'),
'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

