SELECT * FROM blog;
SELECT * FROM post;
SELECT id, body,
  MIN(id)   OVER() AS min_id,  
  MAX(id)   OVER() AS max_id
FROM post
ORDER BY id;

-- -------------------------------------------------------

SELECT * FROM blog;
SELECT * FROM post;
SELECT id, body, 
  LAG(id)   OVER(ORDER BY id) prev_post_id, 
  LEAD(id)  OVER(ORDER BY id) next_post_id
FROM post
ORDER BY id
LIMIT 2 OFFSET 1;

-- -------------------------------------------------------

SELECT * FROM blog;
SELECT * FROM post;
SELECT id, body, blog_id,
  row_number() OVER(
    PARTITION BY blog_id ORDER BY id
  ) AS number
FROM post
ORDER BY id

-- -------------------------------------------------------

SELECT * FROM blog;
SELECT * FROM post;
SELECT id, body, blog_id,
  row_number() OVER(
    PARTITION BY blog_id ORDER BY id
  ) AS number
FROM post
ORDER BY id
LIMIT 10 OFFSET 1
