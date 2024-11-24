SELECT DISTINCT person_id FROM person_visits
WHERE (EXTRACT(DAY FROM visit_date) BETWEEN 6 AND 9) OR pizzeria_id = '2'
ORDER BY person_id DESC;