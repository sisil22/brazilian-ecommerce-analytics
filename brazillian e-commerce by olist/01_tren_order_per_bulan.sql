-- Query 1: Tren Order per Bulan
SELECT 
  FORMAT_DATE('%Y-%m', DATE(order_purchase_timestamp)) AS bulan,
  COUNT(order_id) AS total_order,
  COUNTIF(order_status = 'delivered') AS total_delivered,
  COUNTIF(order_status = 'canceled') AS total_canceled
FROM `olist-portofolio.olist.orders`
GROUP BY bulan
ORDER BY bulan ASC;