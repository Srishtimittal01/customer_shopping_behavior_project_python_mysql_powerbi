use Customer_behaviour;
select * from customer;

SELECT 
    category,
    ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY category
order by total_revenue desc;


select season, ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY season
order by total_revenue desc;


select category,sum(purchase_amount) as total_revenue ,
ROUND(
        SUM(purchase_amount) * 100 / 
        (SELECT SUM(purchase_amount) FROM customer),
    2) AS contribution_percentage
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

SELECT 
    gender,
   round (SUM(purchase_amount),2) AS total_spending
FROM customer
GROUP BY gender;

SELECT customer_segment, COUNT(*) AS customer_count
FROM (
    SELECT 
        CASE 
            WHEN previous_purchases = 0 THEN 'New Customer'
            WHEN previous_purchases BETWEEN 1 AND 15 THEN 'Returning Customer'
            ELSE 'Loyal Customers'
        END AS customer_segment
    FROM customer
) t
GROUP BY customer_segment;
 
 
 SELECT 
    customer_id,
    SUM(purchase_amount) AS total_spent
FROM customer
GROUP BY customer_id
HAVING SUM(purchase_amount) > (
    SELECT AVG(purchase_amount)
    FROM customer
);


SELECT 
    item_purchased,
    COUNT(*) AS total_orders
FROM customer
GROUP BY item_purchased
ORDER BY total_orders DESC
LIMIT 1;
