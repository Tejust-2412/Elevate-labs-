-- Using tomato data analysis dataset form sales trend analysis 
USE tomato_data_analysis ;
-- Viewing hall dataset 
SELECT * FROM order_details ;
-- Using EXRTACT function from exract month from created_at colunm for knowing the order month with order_id 
SELECT order_id , created_at , 
EXTRACT(MONTH FROM created_at ) as order_month 
FROM order_details ;
-- Finding total profit revenue  by using total_selling_price and total_buying_price 
SELECT SUM(total_selling_price) - SUM(total_buying_price) as total_revenue 
FROM order_details ;

-- calculates the total number of unique orders in the order_details table by using:
SELECT COUNT(DISTINCT order_id) AS total_orders 
FROM order_details ;

-- Finding the order details for month 7
SELECT *
FROM order_details
WHERE created_at >= '2020-07-01' AND created_at < '2020-08-01'
ORDER BY created_at ASC;

-- Finding the total order in year with that month 
SELECT 
    EXTRACT(YEAR FROM created_at) AS order_year,
    EXTRACT(MONTH FROM created_at) AS order_month,
    COUNT(*) AS total_orders
FROM order_details
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
