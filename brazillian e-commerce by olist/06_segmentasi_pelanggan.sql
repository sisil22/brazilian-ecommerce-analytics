-- Query 6: Segmentasi Pelanggan
SELECT 
  customer_segment,
  COUNT(*) AS total_pelanggan,
  ROUND(AVG(total_spending), 2) AS rata_rata_spending
FROM (
  SELECT 
    c.customer_unique_id,
    SUM(oi.price) AS total_spending,
    COUNT(o.order_id) AS total_order,
    CASE 
      WHEN SUM(oi.price) >= 500 THEN 'High Value'
      WHEN SUM(oi.price) >= 200 THEN 'Medium Value'
      ELSE 'Low Value'
    END AS customer_segment
  FROM `olist-portofolio.olist.orders` o
  JOIN `olist-portofolio.olist.customers` c ON o.customer_id = c.customer_id
  JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
  GROUP BY c.customer_unique_id
) 
GROUP BY customer_segment
ORDER BY rata_rata_spending DESC;