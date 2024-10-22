CREATE SEQUENCE seq_person_discounts;

SELECT setval('seq_person_discounts', (SELECT COALESCE(MAX(id), 0) + 1 FROM person_discounts));

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (5, 3, 15);