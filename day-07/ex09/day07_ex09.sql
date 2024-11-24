WITH tmp AS (SELECT person.address, ROUND(ROUND(MAX(age),2) - ROUND(MIN(age),2)/ROUND(MAX(age), 2),2) AS formula, ROUND(AVG(age), 2) AS average
FROM person
GROUP BY person.address
ORDER BY  address)

SELECT address, formula, average, formula>average AS comparison
    FROM tmp
ORDER BY address