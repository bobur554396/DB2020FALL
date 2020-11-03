
CREATE TABLE test (
  id      INTEGER,
  content VARCHAR(255)
);

SELECT *
FROM test;

CREATE INDEX test_id_index
  ON test (id);
DROP INDEX test_id_index;

CREATE INDEX ttt
  ON test USING HASH (id);
DROP INDEX ttt;

SELECT *
FROM test
WHERE id = 123;

ANALYSE;

SELECT *
FROM pg_statistic;

SELECT *
FROM pg_indexes;

CREATE UNIQUE INDEX ttt
  ON test (id);

SELECT *
FROM test
WHERE lower(content) = 'content 1';


CREATE INDEX test_content_index
  ON test (lower(content));
DROP INDEX ttt;
DROP INDEX test_id_index;

SELECT count(*)
FROM test;

TRUNCATE test;


INSERT INTO test (id, content)
  SELECT
    i,
    'content_' || i
  FROM
        generate_series(1, 1000000) i;

SELECT count(*)
FROM test;

TRUNCATE test;

EXPLAIN ANALYSE SELECT *
                FROM test
                WHERE id = 436123;

CREATE INDEX test_id_index
  ON test (id);

ANALYZE;

SELECT *
FROM pg_statistic;

EXPLAIN ANALYSE SELECT *
                FROM test
                WHERE id = 4;


EXPLAIN ANALYSE SELECT *
                FROM test
                WHERE lower(content) = 'content_30';


CREATE INDEX test_content_index ON test(lower(content));
ANALYSE;


SELECT *
FROM pg_indexes;


