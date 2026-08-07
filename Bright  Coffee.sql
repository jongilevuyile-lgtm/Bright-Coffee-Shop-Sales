--- Remove decimals and create total amount column---

SELECT
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id,
    CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS unit_price,
    product_category,
    product_type,
    product_detail,
    transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS total_amount
FROM bright_coffee

---TRANSACTION TIME BUCKETS---

SELECT *,
CASE
WHEN HOUR(transaction_time) BETWEEN 6 AND 8 THEN '06:00-08:59'
WHEN HOUR(transaction_time) BETWEEN 9 AND 11 THEN '09:00-11:59'
WHEN HOUR(transaction_time) BETWEEN 12 AND 14 THEN '12:00-14:59'
WHEN HOUR(transaction_time) BETWEEN 15 AND 17 THEN '15:00-17:59'
WHEN HOUR(transaction_time) BETWEEN 18 AND 20 THEN '18:00-20:59'
ELSE 'OTHER'
END AS transaction_time_bucket
FROM bright_coffee

--- Best selling product---
SELECT
product_detail,
SUM(transaction_qty) AS total_sold
FROM bright_coffee
GROUP BY product_detail
ORDER BY total_sold DESC;

---REVENUE BY PRODUCT CATAGORY---

SELECT
product_category,
SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) AS total
FROM bright_coffee
GROUP BY product_category
ORDER BY total DESC;

---REVENUE BY PRODUCT TYPE---

SELECT
product_type,
SUM(total_amount) AS  transaction_qty*CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))
FROM bright_coffee
GROUP BY product_type
ORDER BY total_revenue DESC;

---PEAK SALES TIME---

SELECT *,
    CASE
        WHEN HOUR(transaction_time) BETWEEN 6 AND 8 THEN '06:00-08:59'
        WHEN HOUR(transaction_time) BETWEEN 9 AND 11 THEN '09:00-11:59'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 14 THEN '12:00-14:59'
        WHEN HOUR(transaction_time) BETWEEN 15 AND 17 THEN '15:00-17:59'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 20 THEN '18:00-20:59'
        ELSE 'OTHER'
    END AS transaction_time_bucket
FROM bright_coffee;


---REVENUE BY STORE---

SELECT
store_location,
SUM(CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) AS revenue
FROM bright_coffee
GROUP BY store_location
ORDER BY revenue DESC;

---BEST SELLING PRODUCT---

SELECT
product_detail,
SUM(transaction_qty) AS total_sold
FROM bright_coffee
GROUP BY product_detail
ORDER BY total_sold DESC;

---ADD TOTAL AMOUNT AND TRANSACTION TIME BUCK COLUMNS---

SELECT
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id,
    unit_price,
    product_category,
    product_type,
    product_detail,
    ((REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS unit_price,
    product_category,
    product_type,
    product_detail,
    transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) AS total_amount,
     CASE
        WHEN HOUR(transaction_time) BETWEEN 6 AND 8 THEN '06:00-08:59'
        WHEN HOUR(transaction_time) BETWEEN 9 AND 11 THEN '09:00-11:59'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 14 THEN '12:00-14:59'
        WHEN HOUR(transaction_time) BETWEEN 15 AND 17 THEN '15:00-17:59'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 20 THEN '18:00-20:59'
        ELSE 'OTHER'
    END AS transaction_time_bucket
FROM bright_coffee;

SELECT *
FROM bright_coffee
LIMIT 5;

---ADD TOTAL AMOUNT AND TRANSACTION TIME BUCKET COLUMNS---

SELECT
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id,
    unit_price,
    product_category,
    product_type,
    product_detail,
    transaction_qty*CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS total_amount,
    CASE
        WHEN HOUR(transaction_time) BETWEEN 6 AND 8 THEN '06:00-08:59'
        WHEN HOUR(transaction_time) BETWEEN 9 AND 11 THEN '09:00-11:59'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 14 THEN '12:00-14:59'
        WHEN HOUR(transaction_time) BETWEEN 15 AND 17 THEN '15:00-17:59'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 20 THEN '18:00-20:59'
        ELSE 'OTHER'
    END AS transaction_time_bucket
FROM bright_coffee;

--- NO DECIMAL, TRANS_TIME_BUCK, TOTAL AMOUNT---


SELECT
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id,
     CASE
        WHEN HOUR(transaction_time) BETWEEN 6 AND 8 THEN '06:00-08:59'
        WHEN HOUR(transaction_time) BETWEEN 9 AND 11 THEN '09:00-11:59'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 14 THEN '12:00-14:59'
        WHEN HOUR(transaction_time) BETWEEN 15 AND 17 THEN '15:00-17:59'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 20 THEN '18:00-20:59'
        ELSE 'OTHER'
    END AS transaction_time_bucket,
    CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS unit_price,
    product_category,
    product_type,
    product_detail,
    transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS total_amount
FROM bright_coffee
