WITH orders AS (SELECT name, COUNT(name) AS count
 FROM person_order
          INNER JOIN menu ON person_order.menu_id = menu.id
          INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 GROUP BY name
 ORDER BY count DESC),
 visits AS
(SELECT name, COUNT(name) AS count
 FROM person_visits
          INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
 GROUP BY name
 ORDER BY count DESC, name),
    orders_and_visits AS (
        SELECT *
        FROM orders
        UNION ALL
        SELECT *
        FROM visits
    )
SELECT orders_and_visits.name AS name, SUM(orders_and_visits.count) AS total_count
FROM orders_and_visits
GROUP BY name
ORDER BY total_count DESC, name