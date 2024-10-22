-- Session 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
BEGIN;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';