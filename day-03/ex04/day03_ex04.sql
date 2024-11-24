WITH sum_table AS (
    SELECT pizzeria.name AS pizzeria_name, person.gender, person_order.person_id
    FROM person
    INNER JOIN person_order ON person.id = person_order.person_id
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id

),
male AS (SELECT pizzeria_name
               FROM sum_table
               WHERE sum_table.gender = 'male'),
female AS (SELECT pizzeria_name
                 FROM sum_table
                 WHERE sum_table.gender = 'female')

(SELECT pizzeria_name
FROM female
EXCEPT
SELECT pizzeria_name
FROM male)
UNION
(SELECT pizzeria_name
 FROM male
 EXCEPT
 SELECT pizzeria_name
 FROM female)
ORDER BY pizzeria_name