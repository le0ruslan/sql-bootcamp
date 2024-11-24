  DROP TABLE IF EXISTS TSP;

CREATE TABLE TSP (
       point1 VARCHAR NOT NULL
     , point2 VARCHAR NOT NULL
     , cost  INTEGER
);
INSERT INTO  TSP (point1, point2, cost)
VALUES ('a', 'b', 10), ('a', 'c', 15), ('a', 'd', 20),
       ('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25),
       ('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30),
       ('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);


WITH routes AS 
(  WITH RECURSIVE travel AS (
  SELECT point1 as places_chain
       , point1
       , point2
       , cost
       , 1 as count_city
    FROM TSP
   WHERE point1 = 'a'
   UNION
  SELECT CONCAT(travel.places_chain, ',', TSP.point1) AS places_chain
       , TSP.point1
       , TSP.point2
       , travel.cost + TSP.cost
       , count_city + 1
    FROM travel
    JOIN TSP ON travel.point2 = TSP.point1
   WHERE STRPOS(travel.places_chain, TSP.point1) = 0
  )
  SELECT cost AS total_cost
       , CONCAT('{', places_chain, ',', point2, '}') AS tour
    FROM travel
   WHERE point2 = 'a' AND count_city = 4
)

  SELECT *
    FROM routes
   WHERE total_cost = (SELECT MIN(total_cost) FROM routes)
   ORDER BY 1, 2;