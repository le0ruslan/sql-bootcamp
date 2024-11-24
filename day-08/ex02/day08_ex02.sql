-- s1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- s2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- s1
BEGIN;

-- s2
BEGIN;

-- s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- s1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- s2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- s1
COMMIT;

-- s2
COMMIT;

-- s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
