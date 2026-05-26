-- Query 2: Kategori Produk Terlaris
SELECT 
  ct.string_field_1 AS kategori,
  COUNT(oi.order_id) AS total_terjual,
  ROUND(SUM(oi.price), 2) AS total_revenue
FROM `olist-portofolio.olist.order_items` oi
JOIN `olist-portofolio.olist.products` p ON oi.product_id = p.product_id
JOIN `olist-portofolio.olist.category_translation` ct ON p.product_category_name = ct.string_field_0
GROUP BY kategori
ORDER BY total_terjual DESC
LIMIT 10;