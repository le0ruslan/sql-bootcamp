

SELECT name
FROM pizzeria
WHERE NOT EXISTS (
    SELECT 1
    FROM person_visits
    WHERE person_visits.pizzeria_id = pizzeria.id
);