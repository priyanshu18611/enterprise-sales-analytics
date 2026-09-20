# Power BI Dashboard Build Guide

## Page 1 — Executive Sales Overview
Cards:
- Total Revenue
- Total Profit
- Profit Margin %
- Total Orders
- Total Customers

Visuals:
1. Line chart: Revenue by Year-Month
2. Clustered column: Revenue & Profit by Region
3. Bar chart: Revenue by Category
4. Donut: Revenue by Channel
5. Slicers: Year, Region, Segment, Category, Channel

## Page 2 — Product & Customer Intelligence
- Top 10 Customers by Revenue
- Category/Sub-category matrix
- Profit Margin by Category
- Revenue vs Profit scatter
- Customer/Segment slicers

## Page 3 — Regional & Channel Analysis
- Map or filled map by Region (optional)
- Revenue and Profit by Region
- Channel performance
- Segment performance
- Monthly regional trend

## Data model
Use a simple star schema:
dim_date -> sales_fact
dim_customer -> sales_fact
dim_product -> sales_fact (or use Category/Sub_Category directly if you prefer a single product dimension)

## Theme
Use a clean enterprise analytics theme, consistent fonts, KPI cards, restrained colors, and clear titles.
