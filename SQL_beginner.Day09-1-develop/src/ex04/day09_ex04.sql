CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(person_id bigint,
    person_name varchar,
    person_age integer,
    person_gender varchar,
    person_address varchar) AS $$
    SELECT id, name, age, gender,address
    FROM person
    WHERE gender = 'female';
$$ LANGUAGE sql;


CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(person_id bigint,
    person_name varchar,
    person_age integer,
    person_gender varchar,
    person_address varchar) AS $$
    SELECT id, name, age, gender,address
    FROM person
    WHERE gender = 'male';
$$ LANGUAGE sql;
