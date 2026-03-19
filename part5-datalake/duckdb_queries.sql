-- Q1: List all customers and their total number of orders
SELECT 
    c.customer_name, 
    COUNT(o.order_id) AS total_orders
FROM 'customers.csv' c
LEFT JOIN 'orders.json' o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Q2: Find the top 3 customers by total order value
SELECT 
    c.customer_name, 
    SUM(o.order_value) AS total_spent
FROM 'customers.csv' c
JOIN 'orders.json' o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products bought by customers from Bangalore
SELECT DISTINCT 
    p.product_name
FROM 'products.parquet' p
JOIN 'orders.json' o ON p.product_id = o.product_id
JOIN 'customers.csv' c ON o.customer_id = c.customer_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show the big picture
SELECT 
    c.customer_name, 
    o.order_date, 
    p.product_name, 
    o.quantity
FROM 'customers.csv' c
JOIN 'orders.json' o ON c.customer_id = o.customer_id
JOIN 'products.parquet' p ON o.product_id = p.product_id;