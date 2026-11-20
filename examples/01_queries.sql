CREATE DATABASE IF NOT EXISTS lab;
USE lab;

CREATE TABLE IF NOT EXISTS orders (
    order_id BIGINT,
    customer_id BIGINT,
    country STRING,
    total DOUBLE,
    ordered_at TIMESTAMP
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

SELECT country, COUNT(*) AS orders, SUM(total) AS revenue
FROM orders
GROUP BY country
ORDER BY revenue DESC;

SELECT customer_id, SUM(total) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;

-- After the cube is built, Kylin rewrites this aggregation to the pre-computed cube.
SELECT country, SUM(total) AS revenue
FROM orders
GROUP BY country;
