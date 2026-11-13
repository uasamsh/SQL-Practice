--SQL 9 Nesting Queries, Subqueries and aggregate functions Inner Query and Outer Query

-- Description : Subqueries| Can you gather about all invoices that are less than this average?

-- SELECT
-- ROUND(AVG(total),2) AS [TOTAL AVERAGE]
-- From Invoice
-- ORDER BY [TOTAL AVERAGE]

-- There is available Condition like less than, In this condition we can write subquery in WHERE clause, without condition this subquery compose inside the SELECT clause  
SELECT
 CustomerId
 InvoiceDate,
 BillingAddress,
 BillingCity,
 Total
From Invoice

WHERE  Total < 
(select avg(total) from invoice)
ORDER BY Total DESC

--Description: Subqueries in the SELECT | How is each individual city performing against the global average sales?

-- Without condition this subquery compose inside the SELECT clause 

SELECT
 BillingCity,
 Round(AVG(Total),2) AS [City Average],
Round((select avg(total) from invoice),2) AS [Global Average]


--Description: Subqueries without Aggregate functions, Get a list to InvoiceDate  WHERE the InvoiceId greater than 251.


-- We shuold run first to check the non aggregate subquery which is inner query, that gives us return a single value of InvoiceDate, if this is run correctly then Compose the outer query.

SELECT
 InvoiceDate
 From Invoice
WHERE InvoiceId = 251
 
-- Now we Compose with inner and  Outer Query

SELECT
 InvoiceDate,
 BillingAddress,
 BillingCity,
 Total
From Invoice
WHERE InvoiceDate >
(Select InvoiceDate from Invoice
WHERE InvoiceId = 251)
ORDER BY InvoiceDate DESC



--Description: Return multiple values from a Subquery.

-- We use IN clause subquery.

SELECT
 InvoiceDate
 From Invoice
WHERE InvoiceId IN (251, 252, 254)
 
-- Now compose with outer query, For additional information of the purchases made on these particular days, we can either start a brand new quey or we can use our existing query hare as a Subquery.


SELECT
 InvoiceDate,
 BillingAddress,
 BillingCity,
 Total
From Invoice
WHERE InvoiceDate IN
(Select InvoiceDate from Invoice
WHERE InvoiceId IN (251, 252, 254))
ORDER BY InvoiceDate DESC


-- Description: Subqueries and DISTINCT clause | Which tracks are not selling?

-- Run this code and check the return values. TrackId appears more than once (and check for nulls). 
-- If we take a close look, we don't see any value for track number 7. So, track number 7 has not been purchased.

SELECT
    TrackId
FROM InvoiceLine
ORDER BY TrackId;

-- Now we are going to discover: Which tracks are not selling?
-- We can use the DISTINCT clause to remove redundant/duplicate information.

SELECT
    TrackId, 
    Composer,
    Name
FROM Track
WHERE TrackId NOT IN (
    SELECT DISTINCT TrackId 
    FROM InvoiceLine
    ORDER BY TrackId
);