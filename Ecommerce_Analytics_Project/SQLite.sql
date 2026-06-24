CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2)
);

SELECT ROUND(SUM(sales),2) AS Total_Sales
FROM sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM sales;

SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM sales;

SELECT category,
       ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY category
ORDER BY Revenue DESC;

SELECT region,
       ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY region
ORDER BY Revenue DESC;

SELECT product_name,
       ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY product_name
ORDER BY Revenue DESC
LIMIT 10;

SELECT customer_name,
       ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY customer_name
ORDER BY Revenue DESC
LIMIT 10;

SELECT ship_mode,
       COUNT(*) AS Orders_Count
FROM sales
GROUP BY ship_mode
ORDER BY Orders_Count DESC;