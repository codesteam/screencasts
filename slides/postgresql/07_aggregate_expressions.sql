SELECT * FROM post;
SELECT
 COUNT(*) as total,
 COUNT(*) FILTER (WHERE blog_id = 1) as blog_1,
 COUNT(*) FILTER (WHERE blog_id = 2) as blog_2
FROM post;