-- Query 15: Cohort Analysis
SELECT
  cohort_month,
  order_month,
  COUNT(DISTINCT customer_unique_id) AS total_pelanggan,
  DATE_DIFF(DATE(CONCAT(order_month, '-01')), DATE(CONCAT(cohort_month, '-01')), MONTH) AS bulan_ke
FROM (
  SELECT
    c.customer_unique_id,
    first_order.cohort_month,
    FORMAT_DATE('%Y-%m', DATE(o.order_purchase_timestamp)) AS order_month
  FROM `olist-portofolio.olist.orders` o
  JOIN `olist-portofolio.olist.customers` c ON o.customer_id = c.customer_id
  JOIN (
    SELECT 
      c2.customer_unique_id,
      FORMAT_DATE('%Y-%m', MIN(DATE(o2.order_purchase_timestamp))) AS cohort_month
    FROM `olist-portofolio.olist.orders` o2
    JOIN `olist-portofolio.olist.customers` c2 ON o2.customer_id = c2.customer_id
    GROUP BY c2.customer_unique_id
  ) first_order ON c.customer_unique_id = first_order.customer_unique_id
)
GROUP BY cohort_month, order_month
ORDER BY cohort_month, bulan_ke;