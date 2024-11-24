SELECT person.name
FROM menu
         INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         INNER JOIN person_order ON person_order.menu_id = menu.id
         INNER JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'male' AND (person.address = 'Moscow' OR person.address= 'Samara') AND (pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza')
ORDER BY person.name DESC;