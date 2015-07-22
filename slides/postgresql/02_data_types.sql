-- -------------------------------------------------------

CREATE SEQUENCE demo_seq MINVALUE 2 MAXVALUE 4 CYCLE;
CREATE TABLE demo_serial (
    id integer NOT NULL DEFAULT nextval('demo_seq')
);

-- -------------------------------------------------------

SELECT age('2014-01-03 12:13', '2014-01-01');
SELECT date_part('day', age('2014-01-03 12:13', '2014-01-01'));

-- -------------------------------------------------------

SELECT 
         TRUE 
    AND 't' 
    AND 'true' 
    AND 'y' 
    AND 'yes' 
    AND 'on' 
    AND '1';
SELECT 
        FALSE 
    OR 'f' 
    OR 'false' 
    OR 'n' 
    OR 'no' 
    OR 'off' 
    OR '0';

-- -------------------------------------------------------

CREATE TABLE demo_xml (
    val xml NOT NULL
);

INSERT INTO demo_xml VALUES ('<r><foo>f1</foo><bar>b1</bar></r>');
INSERT INTO demo_xml VALUES ('<r><foo>f1</foo><bar>b2</bar></r>');
INSERT INTO demo_xml VALUES ('<r><foo>f2</foo><bar>b3</bar></r>');
INSERT INTO demo_xml VALUES ('<r><foo>f1</foo><bar>b4</bar></r>');

SELECT xmlagg(val) FROM demo_xml;
SELECT * FROM demo_xml WHERE xpath('/r/foo/text()', val)::text[] = ARRAY['f1'];
SELECT xpath('/r/foo/text()', val)::text[] FROM demo_xml;

-- -------------------------------------------------------

CREATE TABLE demo_json (
    val json NOT NULL
);
INSERT INTO demo_json VALUES ('{"r":{"foo":"f1","bar":"b1"}}');
INSERT INTO demo_json VALUES ('{"r":{"foo":"f1","bar":"b2"}}');
INSERT INTO demo_json VALUES ('{"r":{"foo":"f2","bar":"b3"}}');
INSERT INTO demo_json VALUES ('{"r":{"foo":"f1","bar":"b4"}}');

SELECT val->'r'->>'foo' as foo, val->'r'->>'bar' as bar FROM demo_json;
SELECT * FROM demo_json WHERE val->'r'->>'foo' = 'f1';

-- -------------------------------------------------------

CREATE TABLE demo_array (
    val int[]
);

INSERT INTO demo_array VALUES ('{1,2,3}');
INSERT INTO demo_array VALUES ('{1,2,3,4}');
INSERT INTO demo_array VALUES ('{2,3,4,5}');
INSERT INTO demo_array VALUES ('{4,5,5,6}');

SELECT * FROM demo_array;
SELECT * FROM demo_array WHERE val[1] = 1;
SELECT * FROM demo_array WHERE 4 = ANY(val);

-- -------------------------------------------------------

CREATE TYPE demo_complex_type AS (
    x       double precision,
    y       double precision
);

CREATE TABLE demo_complex (
    val demo_complex_type
);

INSERT INTO demo_complex values ('("25", "25")');
INSERT INTO demo_complex values ('("25", "30")');
INSERT INTO demo_complex values ('("25", "45")');
INSERT INTO demo_complex values ('("30", "50")');
INSERT INTO demo_complex values ('("30", "60")');

SELECT * FROM demo_complex;
SELECT (dc.val).x as x, (dc.val).y as y FROM demo_complex as dc;
SELECT * FROM demo_complex as dc WHERE (dc.val).x = 25;

