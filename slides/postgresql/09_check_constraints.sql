CREATE TABLE products (
    name   text,
    price  numeric CHECK (price > 0),
    fee    numeric CHECK (fee > 0),
    CHECK (price > fee)
);

INSERT INTO products VALUES ('product 1', 100, 99);
INSERT INTO products VALUES ('product 1', 100, 100);
INSERT INTO products VALUES ('product 1', 0, 100);
INSERT INTO products VALUES ('product 1', 100, 0);
SELECT * FROM products;