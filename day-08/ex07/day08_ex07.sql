-- s1
BEGIN;

-- s2
BEGIN;

-- s1
UPDATE pizzeria SET rating = 2 WHERE id = 1;

-- s2
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- s1
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- s2
UPDATE pizzeria SET rating = 2 WHERE id = 1;

-- s1
COMMIT;

-- s2
COMMIT;