-- ------------------------------------------------------------------
-- PostgreSQL 9.3
-- ------------------------------------------------------------------


CREATE DATABASE pg_demo_93;

CREATE SCHEMA _01_namespaces
    CREATE TABLE _01_namespaces.films (title text);

CREATE SCHEMA _02_data_types;
    CREATE TYPE my_test_enum AS ENUM ('sad', 'ok', 'happy');
    CREATE TYPE my_test_obj  AS (x double precision, y double precision);
    CREATE TABLE _02_data_types.demo (
        -- Numeric types
        numeric_smallint    smallint,
        numeric_integer     integer,
        numeric_bigint      bigint,
        numeric_decimal     decimal,
        numeric_numeric     numeric,
        numeric_real        real,
        numeric_smallserial smallserial,
        numeric_serial      serial,
        numeric_bigserial   bigserial,
        -- Money types
        money_money         money,
        -- Character Types
        character_char_v    character varying,
        character_char      character,
        character_text      text,
        -- Binary Data Types
        bin_bytea           bytea,
        -- Date/Time Types
        date_timestamp      timestamp,
        date_date           date,
        date_time           time,
        date_interval       interval,
        -- Boolean Type
        bool_boolean        boolean,
        -- Enum Type
        enum_enum           my_test_enum,
        -- Geometric Types
        geo_point           point,
        geo_line            line,
        geo_lseg            lseg,
        geo_box             box,
        geo_path            path,
        geo_polygon         polygon,
        geo_circle          circle,
        -- Network Address Types
        net_cidr            cidr,
        net_inet            inet,
        net_macaddr         macaddr,
        -- Text Search Types
        search_tsvector     tsvector,
        search_tsquery      tsquery,
        -- UUID
        uuid_uuid           uuid,
        -- XML
        xml_xml             xml,
        -- JSON
        json_json           json,
        -- Arrays
        array_int           int[],
        array_real          real[],
        -- Complex
        complex_obj         my_test_obj,
        -- Range
        range_int4range     int4range,
        range_int8range     int8range,
        range_numrange      numrange,
        range_tsrange       tsrange,
        range_tstzrange     tstzrange,
        range_daterange     daterange
    );

CREATE SCHEMA _03_inheritance;

CREATE SCHEMA _04_foreign_data_wrappers;

CREATE EXTENSION mysql_fdw;
CREATE EXTENSION mongo_fdw;

CREATE SERVER mysql_server FOREIGN DATA WRAPPER mysql_fdw OPTIONS (host '127.0.0.1', port '3306');
CREATE USER MAPPING FOR postgres SERVER mysql_server OPTIONS (username 'root', password '');
CREATE FOREIGN TABLE _04_foreign_data_wrappers.mysql_test
    (id int, title text, amount real)
SERVER mysql_server  OPTIONS 
    (dbname 'pg_demo', table_name 'test');

CREATE SERVER mongo_server FOREIGN DATA WRAPPER mongo_fdw OPTIONS (address '127.0.0.1', port '27017');
CREATE FOREIGN TABLE _04_foreign_data_wrappers.mongo_test
(
    _id NAME,
    date TIMESTAMP,
    domain TEXT,
    stats TEXT
)
SERVER mongo_server OPTIONS (database 'test', collection 'Sites');

CREATE SCHEMA _05_window_function_calls;
    CREATE TABLE _05_window_function_calls.blog (id int, title text);
    CREATE TABLE _05_window_function_calls.post (id int, blog_id int, body text);

    INSERT INTO _05_window_function_calls.blog VALUES (1, 'joelonsoftware');
    INSERT INTO _05_window_function_calls.blog VALUES (2, 'Visual C++ Team Blog');
    INSERT INTO _05_window_function_calls.post VALUES (1, 1, 'Stack Exchange Raises $40m');
    INSERT INTO _05_window_function_calls.post VALUES (2, 1, 'Trello, Inc.');
    INSERT INTO _05_window_function_calls.post VALUES (3, 2, 'C++ Compiler Front-End Fixes In VS2015');
    INSERT INTO _05_window_function_calls.post VALUES (4, 2, 'Hyperlapse cross-platform mobile development with Visual C++ and Xamarin');
    INSERT INTO _05_window_function_calls.post VALUES (5, 2, 'Format Specifiers Checking');
    INSERT INTO _05_window_function_calls.post VALUES (6, 2, 'C++11/14/17 Features In VS 2015 RTM');

CREATE SCHEMA _06_set_returning_functions
    CREATE TABLE _06_set_returning_functions.project (id int, title text, installment int, started_at timestamp);

    INSERT INTO _06_set_returning_functions.project VALUES (1, 'project 1', 2, '2015-03-01');
    INSERT INTO _06_set_returning_functions.project VALUES (2, 'project 2', 4, '2015-04-22');

CREATE SCHEMA _07_aggregate_expressions;
    CREATE TABLE _07_aggregate_expressions.blog (id int, title text);
    CREATE TABLE _07_aggregate_expressions.post (id int, blog_id int, body text);

    INSERT INTO _07_aggregate_expressions.blog VALUES (1, 'joelonsoftware');
    INSERT INTO _07_aggregate_expressions.blog VALUES (2, 'Visual C++ Team Blog');
    INSERT INTO _07_aggregate_expressions.post VALUES (1, 1, 'Stack Exchange Raises $40m');
    INSERT INTO _07_aggregate_expressions.post VALUES (2, 1, 'Trello, Inc.');
    INSERT INTO _07_aggregate_expressions.post VALUES (3, 2, 'C++ Compiler Front-End Fixes In VS2015');
    INSERT INTO _07_aggregate_expressions.post VALUES (4, 2, 'Hyperlapse cross-platform mobile development with Visual C++ and Xamarin');
    INSERT INTO _07_aggregate_expressions.post VALUES (5, 2, 'Format Specifiers Checking');
    INSERT INTO _07_aggregate_expressions.post VALUES (6, 2, 'C++11/14/17 Features In VS 2015 RTM');

CREATE SCHEMA _08_partial_indexes;

CREATE SCHEMA _09_check_constraints;

CREATE SCHEMA _10_with_queries;
    CREATE TABLE _10_with_queries.blog (id int, title text);
    CREATE TABLE _10_with_queries.post (id int, blog_id int, body text);
    CREATE TABLE _10_with_queries.post_archive (archived_at timestamp) INHERITS (_10_with_queries.post);
    CREATE TABLE _10_with_queries.comment (id int, comment text, parent_id int);

    INSERT INTO _10_with_queries.blog VALUES (1, 'joelonsoftware');
    INSERT INTO _10_with_queries.blog VALUES (2, 'Visual C++ Team Blog');
    INSERT INTO _10_with_queries.post VALUES (1, 1, 'Stack Exchange Raises $40m');
    INSERT INTO _10_with_queries.post VALUES (2, 1, 'Trello, Inc.');
    INSERT INTO _10_with_queries.post VALUES (3, 2, 'C++ Compiler Front-End Fixes In VS2015');
    INSERT INTO _10_with_queries.post VALUES (4, 2, 'Hyperlapse cross-platform mobile development with Visual C++ and Xamarin');
    INSERT INTO _10_with_queries.post VALUES (5, 2, 'Format Specifiers Checking');
    INSERT INTO _10_with_queries.post VALUES (6, 2, 'C++11/14/17 Features In VS 2015 RTM');
    INSERT INTO _10_with_queries.comment VALUES (1, 'top 1', NULL);
    INSERT INTO _10_with_queries.comment VALUES (2, 'sub top 11', 1);
    INSERT INTO _10_with_queries.comment VALUES (3, 'sub top 12', 1);
    INSERT INTO _10_with_queries.comment VALUES (4, 'sub top 13', 1);
    INSERT INTO _10_with_queries.comment VALUES (5, 'sub top 121', 3);
    INSERT INTO _10_with_queries.comment VALUES (6, 'sub top 122', 3);


-- ------------------------------------------------------------------
-- PostgreSQL 9.4
-- ------------------------------------------------------------------


CREATE DATABASE pg_demo_94;

CREATE SCHEMA _07_aggregate_expressions;
    CREATE TABLE _07_aggregate_expressions.blog (id int, title text);
    CREATE TABLE _07_aggregate_expressions.post (id int, blog_id int, body text);

    INSERT INTO _07_aggregate_expressions.blog VALUES (1, 'joelonsoftware');
    INSERT INTO _07_aggregate_expressions.blog VALUES (2, 'Visual C++ Team Blog');
    INSERT INTO _07_aggregate_expressions.post VALUES (1, 1, 'Stack Exchange Raises $40m');
    INSERT INTO _07_aggregate_expressions.post VALUES (2, 1, 'Trello, Inc.');
    INSERT INTO _07_aggregate_expressions.post VALUES (3, 2, 'C++ Compiler Front-End Fixes In VS2015');
    INSERT INTO _07_aggregate_expressions.post VALUES (4, 2, 'Hyperlapse cross-platform mobile development with Visual C++ and Xamarin');
    INSERT INTO _07_aggregate_expressions.post VALUES (5, 2, 'Format Specifiers Checking');
    INSERT INTO _07_aggregate_expressions.post VALUES (6, 2, 'C++11/14/17 Features In VS 2015 RTM');