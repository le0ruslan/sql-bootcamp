CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, CAST(m.price - m.price*0.1 AS INTEGER) AS discount_price
FROM person
INNER JOIN person_order po ON person.id = po.person_id
INNER JOIN menu m ON m.id = po.menu_id
ORDER BY name, pizza_name
