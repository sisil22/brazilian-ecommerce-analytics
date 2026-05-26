-- Query 4: Metode Pembayaran
SELECT 
  payment_type AS metode_pembayaran,
  COUNT(order_id) AS total_transaksi,
  ROUND(SUM(payment_value), 2) AS total_nilai,
  ROUND(AVG(payment_value), 2) AS rata_rata_nilai
FROM `olist-portofolio.olist.payments`
GROUP BY metode_pembayaran
ORDER BY total_transaksi DESC;