-- Databricks notebook source
CREATE TABLE IF NOT EXISTS smartphones
(id INT, name STRING, brand STRING, year INT);

INSERT INTO smartphones
VALUES(1, 'iPhone 14', 'Apple', 2022),
      (2, 'iPhone 13', 'Apple', 2021),
      (3, 'iPhone 6', 'Apple', 2014),
      (4, 'iPad Air', 'Apple', 2013),
      (5, 'Galaxy s22', 'Samsung', 2022),
      (6, 'Galaxy Z Fold', 'Samsung', 2022),
      (7, 'Galaxy s9', 'Samsung', 2016),
      (8, '12 Pro', 'Xiaomi', 2022),
      (9, 'Redmi 11T Pro', 'Xiaomi', 2022),
      (10, 'Redmi Note 11', 'Xiaomi', 2021)

-- COMMAND ----------

SHOW TABLES;

-- COMMAND ----------

CREATE VIEW view_apple_phones
AS SELECT * FROM smartphones
            WHERE brand = 'Apple';

-- COMMAND ----------

SELECT * FROM view_apple_phones;

-- COMMAND ----------

CREATE TEMP VIEW temp_view_phone_brands
AS SELECT DISTINCT brand
    FROM smartphones;

SELECT * FROM temp_view_phone_brands;

-- COMMAND ----------

SHOW TABLES;

-- COMMAND ----------

CREATE GLOBAL TEMPORARY VIEW global_temp_view_latest_phones
AS SELECT * FROM smartphones
    WHERE year > 2020
    ORDER BY year DESC;

-- COMMAND ----------

SELECT * FROM global_temp.global_temp_view_latest_phones;

-- COMMAND ----------

SHOW TABLES;

-- COMMAND ----------

SHOW TABLES IN global_temp

-- COMMAND ----------

DROP TABLE smartphones;

-- COMMAND ----------

DROP VIEW view_apple_phones;

-- COMMAND ----------

DROP TABLE temp_view_phone_brands; --dropped also when session ends 
DROP TABLE global_temp.global_temp_view_latest_phones; --dropped also when cluster restarts

-- COMMAND ----------


