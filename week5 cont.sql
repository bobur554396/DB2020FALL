-- Lecture 5 cont. samples

SELECT format('ID: %s, name: %s', product_id, product_name) AS name
FROM products;

SELECT format('INSERT INTO %I VALUES(%L)', 'my products', E'test');

SELECT *
FROM products;

SELECT *
FROM products
WHERE product_name LIKE 'Trek_R%16';


SELECT
  product_name,
  char_length(product_name),
  CASE
  WHEN char_length(product_name) <= 15
    THEN 'short size name'
  WHEN char_length(product_name) BETWEEN 15 AND 30
    THEN 'medium size name'
  ELSE 'long size name'
  END AS "Product name size"
FROM products;

SELECT customer_id, phone
FROM customers;


SELECT customer_id, coalesce(phone, 'not set')
FROM customers;

SELECT nullif(7, 7);

SELECT greatest(1, 2, 3, 4), least(1, 2, 3, 4);

SELECT ARRAY[1, 2] || ARRAY[1, 2, 3];


SELECT numrange(2, 3) <@ numrange(1, 6);


SELECT
  count(*),
  min(list_price),
  max(list_price),
  to_char(avg(list_price), '9999.999')
FROM products
WHERE brand_id = 9;


SELECT to_char(1234, '9999.999');


SELECT *
FROM products
WHERE exists(
  SELECT *
  FROM products
  WHERE brand_id = 99
);

SELECT *
FROM products
WHERE product_id IN (
  SELECT product_id
  FROM products
  WHERE list_price > 1000
);


SELECT *
FROM products
WHERE product_id > SOME (
  SELECT product_id
  FROM products
  WHERE list_price > 6000
);

-- 51
-- 149
-- 155
-- 156
-- 157
-- 169

SELECT *
FROM products
WHERE product_id < ALL (
  SELECT product_id
  FROM products
  WHERE list_price > 6000
);

SELECT product_id
  FROM products
  WHERE list_price > 6000