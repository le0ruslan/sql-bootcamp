COMMENT ON TABLE person_discounts IS 'Таблица person_discounts хранит персональные скидки для клиентов в пиццериях.';
COMMENT ON COLUMN person_discounts.id IS 'Идентификатор данных в таблице.';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, ссылается на таблицу person.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пицерии, ссылается на таблицу pizzeria.';
COMMENT ON COLUMN person_discounts.discount IS 'Размер персональной скидки в процентах';
