SELECT name , COUNT(person_id) AS count_of_visits
FROM person_visits
INNER JOIN person ON person_visits.person_id = person.id
GROUP BY name
HAVING COUNT(person_id) > 3
ORDER BY count_of_visits DESC, count_of_visits