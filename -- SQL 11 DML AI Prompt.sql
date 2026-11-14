 SQL 11 DML AI Prompt

/*
I'm a data analyst at Music Company. I need two DML statements.
One: Update the email for customer_id 15 to '[correct.email@email.com](mailto:correct.email@email.com)'.
Two: Insert a new customer: name 'Jordan Lee', region 'West', email '[jordan.lee@pixelmetrics.com](mailto:jordan.lee@pixelmetrics.com)'.
The table is customers, with fields customer_id, customer_name, region, email.

*/


-- OUTPUT of chatGPT
UPDATE customers
SET email = 'correct.email@email.com'
WHERE customer_id = 15;

-- INSERT INTO customers gives us error because there is no Exsist first_name, last_name, SO, we shuold mannually insert before customer_name and then insert city. And then match the values. 
INSERT INTO customers (customer_name, region, email)
VALUES ('Jordan Lee', 'West', 'jordan.lee@pixelmetrics.com');


-- Description: Display the structure of the customers table, including its column names, data types, and primary key.

-- In the editor we can  Check the database schema area in SQLite Editor --> https://sqleditor.wsdalearning.ai/

-- Show full table information
PRAGMA table_info(customers);

-- Show the full customers teble

SELECT *
FROM customers
ORDER BY customer_id;


-- First we should run a SELECT on this first to confirm the record even exists before we attempt to update it. Before we run any DML statement or any data altering statement we goonna run the SELECT statement to observe the result.
SELECT
 	customer_id,
    customer_name,
    	region,
        email
From customers
WHERE customer_id = 15;

--  If there is not available customer_id = 15 , so insert now 

INSERT INTO customers (customer_id, first_name, last_name, customer_name, city, region, email, Zip_Code )
VALUES (15,'Jordan', 'Lee', 'Jordan Lee', 'Los Angeles', 'West', 'jordan.lee@pixelmetrics.com', '14567');


-- After verify the customer_id = 15 We can UPDATE email

UPDATE customers
SET email = 'correct.email@email.com'
WHERE customer_id = 15;

-- Prompt Correct statement: Now we insert first_name, last_name, before customer_name and then insert city, Now this is match with the VALUES that is go into each one of these fields.

INSERT INTO customers (first_name, last_name, customer_name, city, region, email)
VALUES ('Jordan', Lee', 'Jordan Lee', 'Los Angeles' 'West', 'jordan.lee@pixelmetrics.com');
