-- Query 5: Kota dengan Order Terbanyak
SELECT 
  c.customer_city AS kota,
  c.customer_state AS negara_bagian,
  COUNT(o.order_id) AS total_order,
  ROUND(SUM(oi.price), 2) AS total_revenue
FROM `olist-portofolio.olist.orders` o
JOIN `olist-portofolio.olist.customers` c ON o.customer_id = c.customer_id
JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
GROUP BY c.customer_city, c.customer_state
ORDER BY total_order DESC
LIMIT 10;