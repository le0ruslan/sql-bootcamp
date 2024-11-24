CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE(
                     id BIGINT,
                     name VARCHAR,
                     age INTEGER,
                     gender VARCHAR,
                     address VARCHAR
                 ) AS $$
SELECT *
FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons('male');

SELECT *
FROM fnc_persons();