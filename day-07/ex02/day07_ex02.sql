(SELECT name, COUNT(name) AS count, 'order' AS action_type
FROM person_order
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
UNION ALL
(SELECT name, COUNT(name) AS count, 'visit' AS action_type
FROM person_visits
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC, name
LIMIT 3)
