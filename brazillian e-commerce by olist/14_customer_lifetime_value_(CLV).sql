-- Query 14: Customer Lifetime Value (CLV)
SELECT 
  customer_segment,
  COUNT(*) AS total_pelanggan,
  ROUND(AVG(total_spending), 2) AS avg_clv,
  ROUND(AVG(total_order), 2) AS avg_order,
  ROUND(AVG(total_spending / total_order), 2) AS avg_order_value
FROM (
  SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_order,
    ROUND(SUM(oi.price), 2) AS total_spending,
    CASE
      WHEN SUM(oi.price) >= 1000 THEN 'Platinum'
      WHEN SUM(oi.price) >= 500 THEN 'Gold'
      WHEN SUM(oi.price) >= 200 THEN 'Silver'
      ELSE 'Bronze'
    END AS customer_segment
  FROM `olist-portofolio.olist.customers` c
  JOIN `olist-portofolio.olist.orders` o ON c.customer_id = o.customer_id
  JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
  GROUP BY c.customer_unique_id
)
GROUP BY customer_segment
ORDER BY avg_clv DESC;