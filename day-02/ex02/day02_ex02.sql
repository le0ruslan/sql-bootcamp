SELECT COALESCE(person.name, '-') AS person_name,
       COALESCE(to_char(tmp.visit_date, 'YYYY-MM-DD'), 'null'),
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT pizzeria_id, person_id, visit_date
      FROM person_visits
      WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03') tmp
    FULL JOIN pizzeria ON pizzeria.id = tmp.pizzeria_id
    FULL JOIN person ON person.id = tmp.person_id
ORDER BY person_name, visit_date, pizzeria_name;