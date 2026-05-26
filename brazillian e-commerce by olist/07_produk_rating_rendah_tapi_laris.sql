-- Query 7: Produk Rating Rendah tapi Laris
SELECT 
  ct.string_field_1 AS kategori,
  COUNT(oi.order_id) AS total_terjual,
  ROUND(AVG(r.review_score), 2) AS avg_rating,
  CASE
    WHEN AVG(r.review_score) < 3 THEN 'Perlu Perbaikan Urgent'
    WHEN AVG(r.review_score) < 4 THEN 'Perlu Diperhatikan'
    ELSE 'Bagus'
  END AS status_kualitas
FROM `olist-portofolio.olist.order_items` oi
JOIN `olist-portofolio.olist.products` p ON oi.product_id = p.product_id
JOIN `olist-portofolio.olist.category_translation` ct ON p.product_category_name = ct.string_field_0
JOIN `olist-portofolio.olist.orders` o ON oi.order_id = o.order_id
JOIN `olist-portofolio.olist.reviews` r ON o.order_id = r.order_id
GROUP BY kategori
HAVING COUNT(oi.order_id) > 500
ORDER BY avg_rating ASC
LIMIT 10;