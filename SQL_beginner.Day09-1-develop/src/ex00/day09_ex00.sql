create table person_audit (
created timestamp with time zone default current_timestamp not null,
type_event char(1) default 'I' not null,
row_id bigint NOT NULL,
name varchar,
age integer,
gender varchar,
address varchar,
CONSTRAINT ch_type_event CHECK (type_event  IN ('I', 'U', 'D'))
);

create or replace function fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
	    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
