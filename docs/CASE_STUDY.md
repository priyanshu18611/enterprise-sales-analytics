# Case Study — Enterprise Sales Analytics

## 1. Business Context
The organization needs a reliable analytics layer for monitoring sales performance, customer contribution, regional performance and profitability.

## 2. Data Pipeline
**CSV source → Python validation/ETL → MySQL star schema → Power BI semantic model → dashboards**

## 3. Data Model
### Fact
`sales_fact`
- Order_ID
- Order_Date
- Customer_ID
- Region
- Segment
- Category
- Sub_Category
- Channel
- Quantity
- Revenue
- Cost
- Profit
- Profit_Margin

### Dimensions
- `dim_date`
- `dim_customer`
- `dim_product`

## 4. Analytics Layers
### SQL
SQL is used for KPI aggregation, monthly trends, region/category/channel performance, top customers, cohort-style analysis and data-quality checks.

### Python
Python handles validation, feature engineering, KPI tables and export of analytics-ready datasets.

### Power BI
Power BI is used for executive reporting with DAX measures and time-intelligence metrics.

### Excel
Excel provides a portable executive reporting dashboard for quick stakeholder review.

## 5. Dashboard Pages
1. Executive Sales Overview
2. Product & Customer Intelligence
3. Regional & Channel Analysis

## 6. Skills Demonstrated
SQL querying, data validation, ETL, data modeling, KPI design, dashboarding, DAX, Python analytics, Excel reporting, documentation and Git-based project organization.

## 7. Important Note
The dataset is synthetic and created for portfolio demonstration. It should not be represented as proprietary company data or as a real employer dataset.
