-- Filtering/Alteration and analyzing the data suing WHERE clause

-- How many customers purchased two songs at $0.99 each?

-- 1)
/* 
Created By: Uzma Ejaz
Date: 11/9/2026
Description: Customers who purchased two songs at $0.99 each
*/

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  
FROM
 Invoice
 
WHERE
 total = 1.98
order by 
  InvoiceDate


-- 2)
 /* 
 
Description: How maany invoices exists between $1.98 and $5.00?
*/

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  
FROM
 Invoice
 
WHERE
 total between 1.98 AND 5.00
order by 
  InvoiceDate


-- 3) BETWEEN ... AND using for range of values, A complete range between two boundaries (all values from start to end, inclusive)
/* 
Created By: Uzma Ejaz
Date: 
Description: How maany invoices exists between $1.98 or $3.96?
*/
SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  
FROM
 Invoice
 
WHERE
 total IN (1.98,3.96)
order by 
  total

-- 4)
/* 
Description: How maany invoices were billed to the city of Brussels?
*/
SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  
FROM
 Invoice
 
WHERE
 BillingCity = 'Brussels'
order by 
  total

--5) IN using exact value 
 
  /* 

Description: How maany invoices were billed in cities of Brussels, Oriando or Paris?
*/

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 WHERE
 BillingCity IN('Brussels', 'Oriando','Paris')
order by 
  total

-- 6) Like using for partial values
 /*

Description: How maany invoices were billed in  cities that starts with B?
*/
-- % is a wild wlid card character like a junction with like operator , the % sign saying I don't care what comes next after B we just needs the cities that starts with B.
SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 WHERE
 BillingCity LIKE 'B%'
order by 
  total

 -- 7) Like using for partial values
 /*

Description: How maany invoices were billed in  cities that B anywhere in it's name?
*/
-- % i don't care before the B and after the B i just do care that there's a B somewhere in the billing city field using %B%.
SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 WHERE
 BillingCity LIKE '%B%'
order by 
  total

 -- 8) In the Invoice table, Data structure, the InvoiceDate column uses the DATETIME data type. When checking the data, the date for May 22, 2010 appears as 2010-05-22 00:00:00, which includes the time component like this 00:00:00.
 /*

Description: How many invoices were billed on 2010-05-22 00:00:00.?
*/

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 -- 2 methods avalaible, results will be same
 WHERE
InvoiceDate = '2010-05-22 00:00:00'
/* WHERE 
DATE (InvoiceDate)'2010-05-22' */
order by   total

-- 9) Using AND , OR operators
 /*

Description: Get a list of invoices were billed after  2010-05-22 and have a total of less than $3.00.?
*/

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 WHERE 
DATE (InvoiceDate)>'2010-05-22' AND total <3.00
ORDER BY 
InvoiceDate


-- 10) Using  OR operators, for % partial search using LIKE 
 
 -- Description: Get a list of invoices that are greate then 1.98 from any cities that starts with P or starts with D.

-- Order of operations is called PEMDAS () , BEMDAS [], Without using PEMDAS () , BEMDAS [] operations look at the out put there is in total column 0.99 exists in Dublin , Dijon, so NOW we use PEMDAS () , BEMDAS [] operations
--PEMDAS - Parentheses, Exponents, Multiplication/Division, Addition/Subtraction
--BEMDAS - Brackets, Exponents, Multiplication/Division, Addition/Subtraction

SELECT
  InvoiceDate,
  BillingAddress,
  BillingCity,
  total
  FROM
 Invoice
 WHERE 
-- total> 1.98 AND  BillingCity LIKE 'P%' OR BillingCity LIKE'D%'
total> 1.98 AND (BillingCity LIKE 'P%' OR BillingCity LIKE'D%')
ORDER BY 
total

/*
WSDA Sales Goal:
They want as many customers as possible to spend between $7.00 and $15.00


/Task:
Sales Categories:
A Baseline Purchase - Between $0.99 and $1.99
Low Purchase - Between $2.00 and $6.99
Target Purchase - Between $7.00 and $15.00
Top Performer - Above $15.00
*/

SELECT
    InvoiceDate,
    BillingAddress,
    BillingCity,
    total,
    CASE
        WHEN total < 2.00 THEN 'Baseline Purchase'
        WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
        WHEN total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
        ELSE 'Top Performer'
    END AS PurchaseType
FROM
    Invoice
WHEN 
PurchaseType = 'Top Performer'
ORDER BY
    BillingCity;



/*
WSDA Music - Early Hires Based in Calgary

WSDA Music's HR team is compiling a recognition report for
employees who joined the company during its early growth phase.

They want to identify staff members who were hired between 2002
and 2003 and are based in the Calgary office, the company's main
hub during that period.

Your job is to filter the employee records and produce a clean
report for the HR team.


Your Task:
Write a SQL query that returns the filtered employee list.


Result:
Your output should contain 4 columns and 5 rows.

FirstName - employee's first name
LastName  - employee's last name
Title     - their job title
HireDate  - the date they were hired


Requirements:
1. Select from the Employee table.
2. Use a BETWEEN operator to filter HireDate to the range
   '2002-01-01' and '2003-12-31'.
3. Use an AND operator to also filter where City = 'Calgary'.
4. Sort results by HireDate ascending.
5. Include a comment stating the purpose of the query.


Constraints and Hints:
1. Table to use: Employee
2. Fields to include: FirstName, LastName, Title, HireDate
3. Date values must be wrapped in single quotes.
4. Both conditions must be true - use AND to connect them.
5. Sort by HireDate ASC.


Expected Output:

FirstName | LastName | Title               | HireDate
----------------------------------------------------------
Jane      | Peacock  | Sales Support Agent | 2002-04-01
Nancy     | Edwards  | Sales Manager       | 2002-05-01
Margaret  | Park     | Sales Support Agent | 2003-05-03
Steve     | Johnson  | Sales Support Agent | 2003-10-17
Michael   | Mitchell | IT Manager          | 2003-10-17

Total: 5 Rows and 4 Columns
*/

/*  Name: Uzma Ejaz
Date :11/10/2026
 Description: WSDA Music early hires based in Calgary for HR Recognition report.
*/
SELECT
    FirstName,
    LastName,
    Title,
    HireDate

FROM Employee

WHERE HireDate BETWEEN '2002-01-01' AND '2003-12-31'

AND City = 'Calgary'

ORDER BY HireDate;


/*Question: Can you pull all orders from 2024 so I can see what we did last year?

AI Prompt:
I'm a data analyst at PixelMetrics. I need a SQL query that returns all orders from 2024. The table is orders. The fields are order_id, order_date, and order_total.

NOTE IT: AI might be skip this...
 ORDER BY 
 order_total DESC;
 Check always as a human loop
*/

SELECT
 order_id,
 order_date,
 order_total
FROM 
orders
WHERE order_date >= '2024-01-01' 
AND order_date < '2025-01-01'
ORDER BY 
 order_total DESC;