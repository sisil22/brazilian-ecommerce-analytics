-- Query 8: Seller Performance
SELECT 
  s.seller_id,
  s.seller_city,
  COUNT(oi.order_id) AS total_order,
  ROUND(SUM(oi.price), 2) AS total_revenue,
  ROUND(AVG(r.review_score), 2) AS avg_rating,
  CASE
    WHEN AVG(r.review_score) >= 4 AND SUM(oi.price) >= 10000 THEN 'Top Seller'
    WHEN AVG(r.review_score) >= 3 THEN 'Good Seller'
    ELSE 'Need Improvement'
  END AS seller_status
FROM `olist-portofolio.olist.sellers` s
JOIN `olist-portofolio.olist.order_items` oi ON s.seller_id = oi.seller_id
JOIN `olist-portofolio.olist.orders` o ON oi.order_id = o.order_id
JOIN `olist-portofolio.olist.reviews` r ON o.order_id = r.order_id
GROUP BY s.seller_id, s.seller_city
HAVING COUNT(oi.order_id) > 50
ORDER BY total_revenue DESC
LIMIT 10;