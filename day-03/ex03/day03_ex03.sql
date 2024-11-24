WITH sum_table AS (
    SELECT pizzeria.name AS pizzzeria_name, person.gender
    FROM person
    INNER JOIN person_visits ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
),
male AS (SELECT pizzzeria_name
               FROM sum_table
               WHERE sum_table.gender = 'male'),
female AS (SELECT pizzzeria_name
                 FROM sum_table
                 WHERE sum_table.gender = 'female')

(SELECT pizzzeria_name
FROM female
EXCEPT ALL
SELECT pizzzeria_name
FROM male)
UNION ALL
(SELECT pizzzeria_name
 FROM male
 EXCEPT ALL
 SELECT pizzzeria_name
 FROM female)
ORDER BY pizzzeria_name