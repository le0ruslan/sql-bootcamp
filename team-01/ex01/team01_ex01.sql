WITH currency_past_future AS (SELECT
    balance.user_id,
    currency.id,
    currency.name,
    balance.money,
    (SELECT currency.rate_to_usd FROM currency
     WHERE currency.id = balance.currency_id
       AND currency.updated < balance.updated
     ORDER BY rate_to_usd LIMIT 1
    ) AS rate_in_past,
    (SELECT currency.rate_to_usd FROM currency
     WHERE currency.id = balance.currency_id
       AND currency.updated > balance.updated
     ORDER BY rate_to_usd LIMIT 1
    ) AS rate_in_future
FROM currency
         JOIN balance ON currency.id = balance.currency_id
GROUP BY
    balance.money,
    currency.name,
    currency.id,
    balance.updated,
    balance.currency_id,
    balance.user_id
    ORDER BY rate_in_past DESC, rate_in_future
    )
SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       currency_past_future.name AS currency_name,
       currency_past_future.money * COALESCE(currency_past_future.rate_in_past, currency_past_future.rate_in_future) AS currency_in_usd
FROM currency_past_future
LEFT JOIN "user" ON currency_past_future.user_id="user".id
ORDER BY name DESC, lastname, currency_name;