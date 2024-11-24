WITH sum_table AS (
    SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price, pizzeria_id
    FROM menu
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)

SELECT st1.pizza_name, st2.pizzeria_name AS pizzeria_name_1, st1.pizzeria_name AS pizzeria_name_2, st1.price
FROM (SELECT *
      FROM sum_table) st2
INNER JOIN sum_table st1 ON st1.pizza_name = st2.pizza_name
WHERE st1.price = st2.price AND st1.pizzeria_id < st2.pizzeria_id
ORDER BY pizza_name

