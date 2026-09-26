# Enterprise Upgrade — v2

## What changed
1. Root GitHub Pages dashboard now reads `data/sales_fact.csv`.
2. KPIs are calculated from the actual transaction dataset.
3. Region, category and channel filters are interactive.
4. Customer RFM segmentation is provided as a reproducible analytical dataset.
5. Monthly KPI and revenue forecast assets are included.
6. Python ETL validates the source and generates analytics-ready outputs.
7. SQL, Power BI/DAX, Excel and case-study assets remain part of the project.

## Verified dataset metrics
- Transactions: 12,000
- Customers: 6,620
- Revenue: ₹13,207,911.85
- Profit: ₹3,965,150.03
- Profit margin: 30.02%
- Duplicate orders: 0
- Null order IDs: 0
- Negative revenue records: 0

## Deployment
Keep `index.html` at repository root and keep `data/sales_fact.csv` at `data/sales_fact.csv`.
Enable GitHub Pages from the `main` branch and repository root.
