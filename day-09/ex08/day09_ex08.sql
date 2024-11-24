CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS TABLE (a BIGINT) AS $$
WITH RECURSIVE fibonacci_cte(a, b) AS (
    SELECT 0, 1
    UNION ALL
    SELECT b, a + b
    FROM fibonacci_cte
    WHERE b < pstop
)
SELECT a FROM fibonacci_cte;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();