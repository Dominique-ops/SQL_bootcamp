DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

create or replace function fnc_persons(pgender varchar default 'female')
RETURNS TABLE(person_id bigint,
    person_name varchar,
    person_age integer,
    person_gender varchar,
    person_address varchar) AS $$
    SELECT id, name, age, gender,address
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE sql;