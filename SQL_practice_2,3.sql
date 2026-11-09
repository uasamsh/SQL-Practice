SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

-- What does the customers table look like?
-- Check the actual columns and data types
-- in the customers table.
PRAGMA table_info(customers);

-- Show the first 5 records from the orders table.
-- SELECT * means select all columns.
-- FROM orders means get data from the orders table.
-- LIMIT 5 means display only 5 rows.

SELECT *
FROM orders
LIMIT 5;

-- What tables Exists in database?
SELECT name
FROM sqlite_master
WHERE type ='table'
order by name;
