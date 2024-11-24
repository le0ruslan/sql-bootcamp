WITH volume_sum AS (
    SELECT user_id, type, balance.currency_id, SUM(money) AS volume
    FROM balance
    GROUP BY user_id, type, currency_id
)
SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type,
    volume,
    COALESCE(cur_last_updated.name, 'not defined') AS currency_name,
    COALESCE((
                 SELECT rate_to_usd
                 FROM currency
                 WHERE currency.id = cur_last_updated.id AND currency.updated = cur_last_updated.last_updated
             ), 1
    ) AS last_rate_to_usd,
    volume_sum.volume * COALESCE((SELECT rate_to_usd
                                  FROM currency
                                  WHERE currency.id = cur_last_updated.id AND currency.updated = cur_last_updated.last_updated
                                 ), 1
                        ) AS total_volume_in_usd
FROM
    volume_sum
        FULL JOIN "user" ON volume_sum.user_id = "user".id
        FULL JOIN (
        SELECT
            currency.id,
            currency.name,
            MAX(currency.updated) AS last_updated
        FROM
            currency
        GROUP BY
            id, name
    ) AS cur_last_updated ON cur_last_updated.id = volume_sum.currency_id
ORDER BY
    name DESC, lastname, type;