CREATE TABLE post (id int, category character varying, name character varying, body text);

CREATE 
   UNIQUE INDEX index_name ON post (name)
   WHERE (category = 'web');

INSERT INTO post VALUES (1, 'programming', 'post_1', 'Stack Exchange Raises $40m');
INSERT INTO post VALUES (2, 'programming', 'post_1', 'Stack Exchange Raises $40m');
INSERT INTO post VALUES (3, 'web', 'post_1', 'Stack Exchange Raises $40m');
INSERT INTO post VALUES (4, 'web', 'post_1', 'Stack Exchange Raises $40m');
