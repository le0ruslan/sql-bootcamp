UPDATE menu
SET price = price - menu.price * 0.1
WHERE pizza_name = 'greek pizza'