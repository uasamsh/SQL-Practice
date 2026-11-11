/* Types of Functions, DATA Cleaning 
Standard Query (PostgreSQL, Snowflake, BigQuery, Oracle)
If your database supports INITCAP and CONCAT_WS:

GEMINI AI PROMPT:

I'm a data analyst at PixelMetrics. I need to clean a customer contact list. First and last name need to be combined into one field with consistent capitalization. Email needs to be standardized to all lowercase. Table is customers with fields first_name, last_name, email. What SQL string functions would I use and can you show me the query?

OUTPUT:

SELECT
    -- Combine first and last name, trim whitespace, and format as Title Case
    INITCAP(TRIM(CONCAT_WS(' ', first_name, last_name))) AS full_name,
    
    -- Strip trailing/leading spaces and convert email to lowercase
    LOWER(TRIM(email)) AS standardized_email
FROM customers;



Updating the Table Directly
If you are modifying the existing table rather than projecting cleaned values:

UPDATE customers
SET
    first_name = INITCAP(TRIM(first_name)),
    last_name  = INITCAP(TRIM(last_name)),
    email      = LOWER(TRIM(email));

    
*/
-- What does the raw customer data look like?

SELECT
    first_name,
    last_name,
    email
FROM customers
LIMIT 10;



/*
Name: Walter Shields
Date: mm/dd/yyyy
Description: Create a Mailing List of US Customers
*/

-- For concatenation  in SQL (SQLite, PostgreSQL, aur Oracle) we can use double pipe sign like || , create a new fielf/column, concatenation FirstName ||  LastName
-- For using space in between FirstName and  LastName include a space like || ' ' || 

SELECT
    FirstName,
    LastName,
    Address,
	FirstName || ' ' ||   LastName  || ', ' ||  Address  || ', ' || City || ' ' || State  || ', ' || PostalCode  AS [Mailing Address]
FROM
    Customer
WHERE
    Country = 'USA';

-- For Truncate: We can remove Zip plus four code we use new function SUBSTR(PostalCode 1,5) AS Zip Code just need 1 to digit ,
--we can use function, LENGTH(PostalCode) for length of postal code,


SELECT
    FirstName,
    LastName,
    Address,
    FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || SUBSTR(PostalCode, 1, 5) AS [Mailing Address],
    LENGTH(PostalCode),
    SUBSTR(PostalCode, 1, 5) AS [Zip Code]
FROM
    Customer
WHERE
    Country = 'USA';

-- UPPER AND LOWER Functions

SELECT
    FirstName,
    LastName,
    Address,
    FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || SUBSTR(PostalCode, 1, 5) AS [Mailing Address],
    LENGTH(PostalCode),
    SUBSTR(PostalCode, 1, 5) AS [Zip Code],
	UPPER(FirstName) AS [First Name],
	Lower( LastName) AS [Last Name]
	
FROM
    Customer
WHERE
    Country = 'USA';


-- String Fuctions , For  Date Fnnctions using Birthdate no time code we use STRFTIME('%y-%m-%d')

SELECT
    FirstName,
    LastName,
	BirthDate,
    STRFTIME('%Y-%m-%d',BirthDate) AS [BirthDate],
	STRFTIME('%Y-%m-%d','now') - STRFTIME('%Y-%m-%d',BirthDate) AS Age
	
FROM
    Employee

-- Description: Aggregate Funtions |  WHat are our all times GLobal sales?
*/

-- Aggregate Funtions (SUM, AVG, MAX MIN , COUNT(), COUNT(DISTINCT ...), GROUP_CONCAT(), standard deviation STDEV() / STDDEV(), VAR ()/ VARIANCE()) turn a range of numbers into a single point of data base on a variety of Mathematical Operations.
-- Calculate the grand total 

SELECT
    SUM(total)AS [Total Sales],
	AVG(total)AS [Average Sales],
	MAX(total)AS [Maximum Sales],
	MIN(total)AS [Minimum Sales],
	COUNT(*) AS [Sales Count]
FROM
    Invoice

-- Nesting Function (ROUND ) 

SELECT
    SUM(total)AS [Total Sales],
	ROUND(AVG(total),2)AS [Average Sales],
	MAX(total)AS [Maximum Sales],
	MIN(total)AS [Minimum Sales],
	COUNT(*) AS [Sales Count]
FROM
    Invoice