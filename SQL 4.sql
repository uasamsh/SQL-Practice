/*Core query syntax
SELECT, FROM, WHERE,
JOIN, GROUP BY, ORDER
BY, LIMIT*/

-- 1st step Comment use for what is acctually had happen, What that query is doing

/* 
Name:
Date:
Description: The Structure of basic query, this query lists all from customers table  First name, Last name, and email address
*/
-- 2nd is query

SELECT 
 FirstName, 
 LastName,
 Email

FROM 
 customer

 -- in this lesson we learn HOw to compose SQL Quries professionally, Comments, Aliases, sorting, limitng, best practice make your work readable and trustworthy 
-- Alias keyword AS use for format column name like customer First Name Using [], and 2nd using in 'Customer Last Name' and for email update in capital like EMAIL


DB BROWSER / WSDA EDITOR (SQLITE) 2 types, 1 [] , 2 quotes ' '
 SELECT 
 FirstName AS [Customer First Name],
 LastName AS 'Customer Last Name',
 Email AS EMAIL
 FROM 
 customer
--  We coult write ASC its optional because that will be ASC by default but if we need DESC then we need to write DESC
 ORDER BY
  FirstName ASC,
  LastName DESC,
 LIMIT 10



TAsk:
-- SQL request(s)​​​​​‌​​​​‌​​‌​‌‌‌‌‌‌​‌‌‌‌‌​‌‌​ below: WSDA Music
-- Name: Uzma
-- Date: 
-- Description: This query lists the First Name, Last Name, city, country, and email address of the first 10 customers, sorted alphabetically by last name.

-- OR
 -- Description: Customer contact list for PivelMetrics sales team

--OR 
 -- Description: Customer contact directory for WSDA Music sales team outreach


-- FOR CODERPAD (MYSQL) quotes must " "
SELECT
    FirstName AS "First Name",
    LastName AS "Last Name",
    City AS "City",
    Country AS "Country",
    Email AS "Email Address"
FROM Customer
ORDER BY LastName ASC
LIMIT 10;


SELECT
FirstName AS "First Name" ,
LastName AS "Last Name" ,
Email AS Email
FROM Customer
LIMIT 10;

-- Name: Uzma
--Date: 
-- Show the 5 most expensive products, sorted by price from highest to lowest.

SELECT
product_name AS 'Product Name',
price AS 'Price'
From products
ORDER BY PRICE DESC
LIMIT 5

