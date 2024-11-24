SELECT name, COUNT(pizzeria_id) AS count_of_orders, ROUND(AVG(price),2)
     AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
GROUP BY name
ORDER BY name