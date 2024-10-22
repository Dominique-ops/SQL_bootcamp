-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE id = 2;

-- Session 2
BEGIN;
UPDATE pizzeria SET rating = 1 WHERE id = 3;

-- Session 1
UPDATE pizzeria SET rating = 1 WHERE id = 3;

-- Session 2
UPDATE pizzeria SET rating = 5 WHERE id = 2;

-- Session 1
COMMIT;

-- Session 2
COMMIT;