-- s1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- s2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- s1
BEGIN;

-- s2
BEGIN;

-- s1
SELECT SUM(rating) FROM pizzeria;

-- s2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);

-- s2
COMMIT;

-- s1
SELECT SUM(rating) FROM pizzeria;

-- s1
COMMIT;

-- s1
SELECT SUM(rating) FROM pizzeria;

-- s2
SELECT SUM(rating) FROM pizzeria;