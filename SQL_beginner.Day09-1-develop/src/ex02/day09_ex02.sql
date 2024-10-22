create or replace function fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
	    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address,type_event)
        VALUES (old.id, old.name, old.age, old.gender, old.address,'D');
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;