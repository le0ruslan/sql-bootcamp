SELECT (SELECT name FROM person WHERE person.id = pv.person_id) AS person_name ,  -- this is an internal query in a main SELECT clause
       (SELECT name FROM pizzeria WHERE pizzeria.id = pv.pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT * FROM person_visits WHERE (EXTRACT(DAY FROM visit_date) BETWEEN 7 AND 9) ) AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name, pizzeria_name DESC;