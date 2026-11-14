-- SQL 10: Sorted Queries, Create View, Edit JOINS, and Delete Views
/*
 Description: 
View: A saved SQL query that can be reused whenever needed or used in other SQL queries.

*/

-- CREATE VIEW 
CREATE VIEW V_AvgTotal AS
SELECT
 ROUND(AVG(Total),2) AS [Average TOTAL]
 FROM
 Invoice


 -- Edit views 
-- Now we can use VIEW to join and save tables like V_CustomerInvoices 

-- Description: Create a view that combines customer names with their invoice details using an INNER JOIN.

CREATE VIEW V_CustomerInvoices AS
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.BillingCity,
    i.Total
FROM Invoice AS i
INNER JOIN Customer AS c
 ON i.CustomerId = c.CustomerId;
 
 
-- Description: Retrieve all customer invoice records for New York from the saved view. 
 SELECT *
 FROM V_CustomerInvoices
 WHERE BillingCity = 'New York'
 
-- JOINS views V_CustomerInvoices and 
 -- Description: Create a view that joins invoice line items with track details using an INNER JOIN and deleting VIEW.
 CREATE VIEW V_TracksInvoiceLine AS
SELECT
    il.InvoiceId,
    il.UnitPrice,
    il.Quantity,
    t.Name,
    t.Composer,
    t.Milliseconds
FROM
    InvoiceLine AS il
INNER JOIN
    Track AS t
ON
    il.TrackId = t.TrackId;
	
-- 1st Method Description: Join four tables (Customer, Invoice, InvoiceLine, and Track) to view customer purchases with track names.

SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceDate,
    t.Name AS TrackName,
    il.UnitPrice
FROM Customer c
INNER JOIN Invoice i 
    ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine il 
    ON i.InvoiceId = il.InvoiceId
INNER JOIN Track t 
    ON il.TrackId = t.TrackId;
	
	
-- 	
--2nd Method Description: Retrieve specific invoice and track columns  FROM the V_TracksInvoiceLine VIEW Created for joining 3 tables.
-- Description: Query specific columns directly from the saved V_TracksInvoiceLine virtual table (view) without repeating the JOIN.
SELECT
    InvoiceId,
    UnitPrice,
    Quantity,
    Name
FROM
    V_TracksInvoiceLine;
SELECT
    tl.InvoiceId,
    tl.UnitPrice,
    tl.Quantity,
    tl.Name,
	i.BillingAddress,
	i.Total
FROM
    V_TracksInvoiceLine AS tl
INNER JOIN
 Invoice AS i
 ON tl.InvoiceId = i.InvoiceId
 
 -- DELETE views 
 -- DROP VIEW IF EXISTS "main"."V_AvgTotal";
 
 DROP VIEW V_AvgTotal; -- Now execute/RUN this query to DELETE view
 
	
