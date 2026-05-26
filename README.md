# 🛒 Brazilian E-Commerce Analytics
### Customer Retention & Operational Performance Analysis

> End-to-end SQL analytics project using Olist's Brazilian e-commerce dataset to uncover customer retention issues, operational bottlenecks, and revenue growth opportunities.

---

## 📌 Project Overview

Olist is Brazil's largest e-commerce marketplace. This project analyzes **100,000+ transaction records (2016–2018)** to answer three key business questions:

1. **Why are customers not returning?** — Quantifying loyalty leakage across customer tiers
2. **Where are the operational bottlenecks?** — Delivery performance and fulfillment analysis by region
3. **Where is the growth opportunity?** — Top-performing categories, cities, and time periods

---

## 🔑 Key Findings

| Metric | Value |
|--------|-------|
| Total Orders Analyzed | 112,650 |
| Total Revenue | 13.6M BRL |
| On-Time Delivery Rate | 91.89% |
| Average Delivery Time | 12.5 days |
| Average Review Score | 4.09 / 5 |
| One-Time Buyers | **97%** ⚠️ |
| Credit Card Payment Share | 73.9% |

### 🚨 Critical Finding
**97% of customers (92,640) are one-time buyers.** Only 2,780 customers (2.9%) returned for a second purchase — a massive untapped retention opportunity worth potentially millions in recurring revenue.

---

## 🗂️ SQL Query Files

| # | File | Description |
|---|------|-------------|
| 01 | `01_tren_order_per_bulan.sql` | Monthly order volume & revenue trend |
| 02 | `02_kategori_produk_terlaris.sql` | Top product categories by sales volume |
| 03 | `03_rating_pelanggan_vs_waktu_pengiriman.sql` | Customer rating vs delivery time correlation |
| 04 | `04_metode_pembayaran.sql` | Payment method distribution analysis |
| 05 | `05_kota_dengan_order_terbanyak.sql` | Top cities by order count and revenue |
| 06 | `06_segmentasi_pelanggan.sql` | Customer segmentation (Bronze/Silver/Gold/Platinum) |
| 07 | `07_produk_rating_rendah_tapi_laris.sql` | High-volume products with low ratings |
| 08 | `08_seller_performance.sql` | Seller performance metrics |
| 09 | `09_analisis_keterlambatan_per_kategori.sql` | Late delivery analysis by product category |
| 10 | `10_revenue_bulanan_+_growth_rate.sql` | Monthly revenue with MoM growth rate |
| 11 | `11_repeat_customer_vs_one-time_buyer.sql` | Repeat vs one-time buyer breakdown |
| 12 | `12_produk_paling_sering_di-review_negatif.sql` | Most negatively reviewed products |
| 13 | `13_seller_paling_sering_terlambat.sql` | Sellers with highest late delivery rate |
| 14 | `14_customer_lifetime_value_(CLV).sql` | Customer Lifetime Value calculation |
| 15 | `15_cohort_analysis.sql` | Cohort retention analysis |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Google BigQuery** | Cloud data warehouse & SQL execution |
| **SQL** | Data querying, transformation, cohort analysis |
| **Looker Studio** | Interactive multi-page dashboard |
| **Google Data Studio** | Data visualization & reporting |

---

## 📊 Dashboard

The Looker Studio dashboard covers 4 analytical pages:

- **Page 1 — Executive Overview**: Revenue trends, order volume, category performance, geographic distribution
- **Page 2 — Customer Segmentation**: CLV, customer tiers, one-time vs returning buyers
- **Page 3 — Delivery Performance**: On-time rate, delivery time trends, late delivery analysis
- **Page 4 — Customer Satisfaction**: Review score trends, satisfaction vs delivery time correlation

> 🔗 [View Live Dashboard](#) *(replace with your Looker Studio link)*

---

## 💡 Strategic Recommendations

### 🔴 High Priority
1. **Launch Customer Loyalty Program** — With 97% one-time buyers, a tiered reward system (Bronze → Platinum) with re-engagement campaigns could double revenue from returning customers with just 5% retention improvement.
2. **Optimize Logistics Outside São Paulo** — São Paulo shows the fastest delivery times. Expanding fulfillment centers in Rio, Minas Gerais, and Nordeste would reduce delivery time and improve nationwide satisfaction.

### 🟡 Medium Priority
3. **Expand Installment Payment Options** — 19% boleto usage signals price-sensitive segments. More installment plans for high-value items could reduce purchase friction.
4. **Invest in Health & Beauty Category** — High sales volume + strong review scores = maximum ROI opportunity for seller recruitment and promotional spending.

---

## 📁 Dataset

- **Source**: [Kaggle — Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Platform**: Google BigQuery
- **Size**: 112,650 orders | 95,420 unique customers | 8 relational tables
- **Period**: 2016 – 2018

---

## 👩‍💻 Author

**Sisilia Manullang** — Data Analyst | Business Intelligence

[![LinkedIn](https://img.shields.io/badge/LinkedIn-sisilia--manullang-blue?style=flat&logo=linkedin)](https://linkedin.com/in/sisilia-manullang)
[![Email](https://img.shields.io/badge/Email-sisiliamanullang565%40gmail.com-red?style=flat&logo=gmail)](mailto:sisiliamanullang565@gmail.com)

---

*Sisilia Manullang — Data Enthusiast*
