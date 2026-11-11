-- 1) Description: Analyze and Explore Relational Data Using JOINS 

Select * 
FROM
Invoice
INNER JOIN
 Customer
 ON
 Invoice.CustomerId= Customer.CustomerId
 ORDER BY
  Customer.CustomerId

-- Simplifying JOINS
Select 
 c.LastName,
 c.FirstName,
 i.InvoiceId ,
 i.CustomerId,
 i.InvoiceDate,
 i.total
FROM
Invoice AS i
INNER JOIN
 Customer  AS c
 ON
 i.CustomerId= c.CustomerId
 ORDER BY
  c.CustomerId


--2) Description: JOINS on more than two tables | Which employees are responsible for the 10 highest individual sales?

SELECT 
    e.FirstName,
    e.LastName,
    e.EmployeeId,
    c.LastName,
    c.FirstName,
    c.SupportRepId,
    i.InvoiceId,
    i.CustomerId,
    i.total
FROM Invoice AS i
INNER JOIN Customer AS c
    ON i.CustomerId = c.CustomerId
INNER JOIN Employee AS e
    ON c.SupportRepId = e.EmployeeId
ORDER BY i.total DESC
LIMIT 10;

-- 3) Description: Invoice line item detail report for WSDA Music accounting team
SELECT
    il.InvoiceId,
    il.InvoiceLineId,
    t.Name,
    il.Unitprice

FROM InvoiceLine AS il

INNER JOIN Track AS t
ON 
il.TrackId=t.TrackId
ORDER BY il.InvoiceId, il.InvoiceLineId
LIMIT 25;

/*

I'm a data analyst at PixelMetrics. I need a query showing every customer and every order they've placed. Tables: customers with fields customer_id and customer_name. Orders with fields order_id, customer_id, order_date, and order_total. Can you write the SQL?
CHATGPT response below: RUN this code not in the database; just run it https://sqleditor.wsdalearning.ai/ becuase there is customers and orders tables available 
*/

-- Show all customers and their orders.
-- Include customers who have not placed any orders.

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_total
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;

-- CHATGPT responcse with INNER JOIN but we need LEFT JOIN 

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_total
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;
