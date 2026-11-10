-- Topic 1 List_Database_Tables.sql
-- Topic 1: List Database Tables
-- Display the names of all tables in the SQLite database.
-- sqlite_master stores information about database objects.
-- WHERE type = 'table' filters the results to tables only.
-- ORDER BY name sorts table names alphabetically.


SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

-- Topic 2: Inspect the Customers Table
-- What does the customers table look like?
-- Check the actual columns and data types in the customers table.
-- PRAGMA table_info shows the table's column information.

-- What does the customers table look like?
-- Check the actual columns and data types
-- in the customers table.
PRAGMA table_info(customers);




-- Topic 3: View Orders and Database Tables
-- Show the first 5 records from the orders table.
-- SELECT * means select all columns.
-- FROM orders means get data from the orders table.
-- LIMIT 5 means display only 5 rows.

SELECT *
FROM orders
LIMIT 5;
-- What tables exist in the database?
-- List all table names alphabetically.
SELECT name
FROM sqlite_master
WHERE type ='table'
order by name;
