SELECT
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM orders;


-- Revenue by region, ranked
SELECT
    region,
    ROUND(SUM(order_total), 2) AS regional_revenue
FROM orders
JOIN customers USING (customer_id)
GROUP BY region
ORDER BY regional_revenue DESC;

/* 
-- Results Query 1
total_customers  total_revenue  avg_order_value
225              96796.23       104.53

-- Results Query 2
region  regional_revenue
West    26428.36
South   24614.07
East    23360.29
North   22393.51
*/