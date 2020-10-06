-- Lecture 6 samples

CREATE TABLE tmp_product (
  id    INTEGER NOT NULL, -- CHECK (id is NOT NULL)
  name  TEXT,
  price NUMERIC CONSTRAINT cons_name CHECK (price > 0),
  discount_price NUMERIC,
  CONSTRAINT valid_dos CHECK (discount_price > 0 AND price >= discount_price)
)
