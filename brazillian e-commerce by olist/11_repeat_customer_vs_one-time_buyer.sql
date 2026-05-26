-- Query 11: Repeat Customer vs One-Time Buyer
SELECT 
  CASE 
    WHEN total_order = 1 THEN 'One-Time Buyer'
    WHEN total_order = 2 THEN 'Returning Customer'
    ELSE 'Loyal Customer'
  END AS customer_type,
  COUNT(*) AS total_pelanggan,
  ROUND(AVG(total_spending), 2) AS rata_rata_spending
FROM (
  SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_order,
    SUM(oi.price) AS total_spending
  FROM `olist-portofolio.olist.customers` c
  JOIN `olist-portofolio.olist.orders` o ON c.customer_id = o.customer_id
  JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
  GROUP BY c.customer_unique_id
)
GROUP BY customer_type
ORDER BY total_pelanggan DESC;