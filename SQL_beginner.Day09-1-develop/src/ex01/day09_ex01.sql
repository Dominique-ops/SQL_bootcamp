create or replace function fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
BEGIN
	    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address,type_event)
        VALUES (old.id, old.name, old.age, old.gender, old.address,'U');
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();


UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;