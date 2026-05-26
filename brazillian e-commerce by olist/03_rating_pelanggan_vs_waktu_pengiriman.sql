-- Query 3: Rating Pelanggan VS Waktu Pengiriman
SELECT 
  r.review_score AS rating,
  COUNT(r.review_id) AS total_review,
  ROUND(AVG(DATE_DIFF(DATE(o.order_delivered_customer_date), 
  DATE(o.order_estimated_delivery_date), DAY)), 2) AS avg_keterlambatan_hari
FROM `olist-portofolio.olist.reviews` r
JOIN `olist-portofolio.olist.orders` o ON r.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY rating
ORDER BY rating DESC;