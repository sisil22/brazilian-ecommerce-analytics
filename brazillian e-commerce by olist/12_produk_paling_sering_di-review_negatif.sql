-- Query 12: Produk Paling Sering Di-review Negatif
SELECT 
  ct.string_field_1 AS kategori,
  COUNT(r.review_id) AS total_review_negatif,
  ROUND(AVG(r.review_score), 2) AS avg_rating,
  ROUND(AVG(DATE_DIFF(
    DATE(o.order_delivered_customer_date),
    DATE(o.order_estimated_delivery_date), DAY)), 2) AS avg_selisih_hari
FROM `olist-portofolio.olist.reviews` r
JOIN `olist-portofolio.olist.orders` o ON r.order_id = o.order_id
JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
JOIN `olist-portofolio.olist.products` p ON oi.product_id = p.product_id
JOIN `olist-portofolio.olist.category_translation` ct ON p.product_category_name = ct.string_field_0
WHERE r.review_score <= 2
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY kategori
ORDER BY total_review_negatif DESC
LIMIT 10;