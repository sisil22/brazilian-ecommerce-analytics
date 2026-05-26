-- Query 13: Seller Paling Sering Terlambat
SELECT 
  s.seller_id,
  s.seller_city,
  s.seller_state,
  COUNT(oi.order_id) AS total_order,
  COUNTIF(DATE(o.order_delivered_customer_date) > DATE(o.order_estimated_delivery_date)) AS total_terlambat,
  ROUND(COUNTIF(DATE(o.order_delivered_customer_date) > DATE(o.order_estimated_delivery_date)) / COUNT(oi.order_id) * 100, 2) AS pct_terlambat
FROM `olist-portofolio.olist.sellers` s
JOIN `olist-portofolio.olist.order_items` oi ON s.seller_id = oi.seller_id
JOIN `olist-portofolio.olist.orders` o ON oi.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY s.seller_id, s.seller_city, s.seller_state
HAVING COUNT(oi.order_id) > 30
ORDER BY pct_terlambat DESC
LIMIT 10;