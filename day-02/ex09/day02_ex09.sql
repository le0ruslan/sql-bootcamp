(SELECT person.name
 FROM menu
          INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
          INNER JOIN person_order ON person_order.menu_id = menu.id
          INNER JOIN person ON person.id = person_order.person_id
 WHERE person.gender = 'female' AND pizza_name = 'pepperoni pizza')
INTERSECT
(SELECT person.name
FROM menu
         INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         INNER JOIN person_order ON person_order.menu_id = menu.id
         INNER JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'female' AND pizza_name = 'cheese pizza')
ORDER BY name;