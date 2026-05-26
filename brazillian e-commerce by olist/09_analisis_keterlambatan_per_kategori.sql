-- Query 9: Analisis Keterlambatan per Kategori
SELECT 
  ct.string_field_1 AS kategori,
  COUNT(o.order_id) AS total_order,
  ROUND(AVG(DATE_DIFF(
    DATE(o.order_delivered_customer_date),
    DATE(o.order_estimated_delivery_date), DAY)), 2) AS avg_selisih_hari,
  CASE
    WHEN AVG(DATE_DIFF(DATE(o.order_delivered_customer_date),
    DATE(o.order_estimated_delivery_date), DAY)) > 0 THEN 'Sering Terlambat'
    WHEN AVG(DATE_DIFF(DATE(o.order_delivered_customer_date),
    DATE(o.order_estimated_delivery_date), DAY)) > -5 THEN 'Tepat Waktu'
    ELSE 'Lebih Cepat'
  END AS status_pengiriman
FROM `olist-portofolio.olist.orders` o
JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
JOIN `olist-portofolio.olist.products` p ON oi.product_id = p.product_id
JOIN `olist-portofolio.olist.category_translation` ct ON p.product_category_name = ct.string_field_0
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY kategori
ORDER BY avg_selisih_hari DESC
LIMIT 10;