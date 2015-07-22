-- -------------------------------------------------------

CREATE TABLE animals (
    name       text,
    color      text
);
CREATE TABLE cats (
    lives      smallint
) INHERITS (animals);

-- -------------------------------------------------------

INSERT INTO animals VALUES ('dog', 'black');
INSERT INTO animals VALUES ('mouse', 'gray');
INSERT INTO cats VALUES ('Tiger', 'gray', 9);
INSERT INTO cats VALUES ('Simba', 'white', 7);
INSERT INTO cats VALUES ('Sebastian', 'black', 2);

-- -------------------------------------------------------

SELECT * FROM animals;
SELECT * FROM ONLY animals;
SELECT a.*, p.relname as table
FROM animals a
    JOIN pg_class p
        ON a.tableoid = p.oid;
SELECT * FROM cats;