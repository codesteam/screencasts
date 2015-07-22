SELECT * FROM post;
SELECT * FROM post_archive;

WITH moved_rows AS (
    DELETE FROM post WHERE id < 3
    RETURNING *
)
INSERT INTO post_archive
SELECT *, NOW() FROM moved_rows;

SELECT * FROM post;
SELECT * FROM post_archive;
SELECT * FROM ONLY post;

-- -------------------------------------------------------

WITH RECURSIVE t(n) AS (
    SELECT 1

    UNION ALL

    SELECT n+1 FROM t WHERE n < 10
)
SELECT n FROM t;

-- -------------------------------------------------------

WITH RECURSIVE comments_tmp ("id","comment", path, level) AS (
    SELECT c.id, c.comment, CAST (c.id AS VARCHAR (50)) as path, 1 as level
    FROM comment c 
    WHERE c.parent_id IS NULL

    UNION

    SELECT c.id, c.comment, CAST (cp.path || '/' || c.id AS VARCHAR(50)), level + 1
    FROM comment c
        INNER JOIN comments_tmp cp
            ON cp.id= c.parent_id
)
SELECT * FROM comments_tmp ORDER BY path;

-- -------------------------------------------------------

WITH RECURSIVE projects_tmp ("id","next_payment", "month") AS (
    SELECT p.id, DATE(p.started_at + ('1 month')::interval) as next_payment, 1
    FROM project p 

    UNION

    SELECT p.id, DATE(p.started_at + ((month + 1) || ' month')::interval), month + 1
    FROM project p
        JOIN projects_tmp pt
            ON pt.id = p.id
    WHERE (month + 1) < p.installment
)
SELECT * FROM projects_tmp ORDER BY id, next_payment;