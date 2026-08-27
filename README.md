# ⚡ Enterprise Sales Intelligence & Customer Analytics Engine

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-Advanced%20CTEs%20%26%20Window%20Functions-orange.svg)](https://www.postgresql.org/)
[![PowerBI](https://img.shields.io/badge/PowerBI-DAX%20%7C%20Time%20Intelligence-yellow.svg)](https://powerbi.microsoft.com/)
[![Scikit-Learn](https://img.shields.io/badge/ML-RFM%20K--Means%20Clustering-red.svg)](https://scikit-learn.org/)

An enterprise-grade data analytics platform implementing Star Schema data architecture, unsupervised machine learning (K-Means RFM segmentation), advanced SQL cohort retention matrices, and time-intelligence DAX KPIs.

---

## 🏛️ Analytical Architecture
```text
Raw Transaction Streams
        │
        ▼
[ Python Star Schema ETL ] ────► Normalization (dim_customers, dim_products, dim_date, fact_sales)
        │
        ├──────────────────────► [ K-Means RFM Engine ] ──► Behavioral Clustering (VIP, Loyal, Churn)
        │
        ├──────────────────────► [ SQL Analytics Suite ] ──► Cohort Matrices & Pareto (80/20) Analysis
        │
        ▼
[ Power BI Data Model ] ───────► Dynamic Executive KPIs & Time-Intelligence DAX
