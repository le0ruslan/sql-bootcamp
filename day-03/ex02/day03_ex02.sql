WITH cte_ex01 AS (SELECT id AS menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order)
SELECT pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM cte_ex01
    LEFT JOIN menu ON menu_id =  menu.id
    INNER JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;



