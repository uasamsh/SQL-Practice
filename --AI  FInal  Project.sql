-- SQL 12 AI Prompt

/*
I'm a data analyst at  RGB company. Write a SQL query showing total revenue and average order value by product category, 
ranked from highest to lowest. Tables: orders and products, joined on product_id.


*/

/*
Description: Show total revenue and average order value
for each product category, sorted from highest to lowest.
*/

SELECT
    p.category AS Product_Category,
    ROUND(SUM(o.order_total), 2) AS Total_Revenue,
    ROUND(AVG(o.order_total), 2) AS Average_Order_Value

FROM orders AS o

INNER JOIN products AS p
    ON o.product_id = p.product_id

GROUP BY p.category

ORDER BY Total_Revenue DESC;


/*
By using the AVG() function on the order_total column in the orders table, we can calculate the company's overall average order value.

After running the SQL query, we can see that the company's average order value is $104.53.

Now, let's compare the average order values across different product categories: Premium, Starter, Add-on, Standard, and Training.

Looking at the results, the Training category has an average order value of $99, while the Standard category has an average of $94.

Both categories have average order values below the company's overall average of $104.53.
These results show that the Training and Standard categories are not just ranked lower in sales performance. Their average order values are also below the company's overall average.

This means both categories are underperforming compared to the company's average order value.

This comparison is an important validation step in data analysis. It helps us confirm our findings using actual data rather than relying only on rankings.


# Insights:
Premium:  $27,204 - avg $127
Starter:  $23,727 - avg $108
Add-on:   $21,090 - avg $106
Standard: $20,534 - avg $94
Training: $12,831 - avg $99
*/
/*This means both categories are underperforming compared to the company's average order value.

This comparison is an important validation step in data analysis. It helps us confirm our findings using actual data rather than relying only on rankings.


*/
-- 2nd step) Company-wide average order value
SELECT ROUND(AVG(order_total), 2) AS company_avg
FROM orders;


/*  2nd AI Prompt , For getting a Summary
I'm a data analyst at RGB company . Here are validated product category results: 
Premium:  $27,204 - avg $127
Starter:  $23,727 - avg $108
Add-on:   $21,090 - avg $106
Standard: $20,534 - avg $94
Training: $12,831 - avg $99

 The company-wide average order value is $104.53. Training and Standard fall below that baseline. The audience is the RGB company  board. 
 Write a 3-sentence summary – one sentence on overall category performance, 
 one on which categories are underperforming and why it matters,
 one clear recommendation the board can act on.
 
# Summary
 Output :
 Premium leads in revenue at $27,204, followed by Starter at $23,727 and Add-on at $21,090, showing strong overall performance in these categories.

Training ($99) and Standard ($94) have average order values below the company average of $104.53, which shows they are underperforming and may be limiting revenue growth.

The board should review pricing and sales strategies for these two categories to improve their average order values and increase revenue.
 
*/