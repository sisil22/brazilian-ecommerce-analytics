-- Query 10: Revenue Bulanan + Growth Rate
SELECT 
  bulan,
  total_revenue,
  LAG(total_revenue) OVER (ORDER BY bulan) AS revenue_bulan_lalu,
  ROUND((total_revenue - LAG(total_revenue) OVER (ORDER BY bulan)) / 
  LAG(total_revenue) OVER (ORDER BY bulan) * 100, 2) AS growth_rate_pct
FROM (
  SELECT 
    FORMAT_DATE('%Y-%m', DATE(o.order_purchase_timestamp)) AS bulan,
    ROUND(SUM(oi.price), 2) AS total_revenue
  FROM `olist-portofolio.olist.orders` o
  JOIN `olist-portofolio.olist.order_items` oi ON o.order_id = oi.order_id
  GROUP BY bulan
)
ORDER BY bulan ASC;