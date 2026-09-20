# 📊 Enterprise Sales Analytics — End-to-End Data Analytics Project

<div align="center">

### **Turning Raw Business Data into Actionable Intelligence**

**SQL • Python • Power BI • Excel • Tableau-ready Analytics • Business Intelligence**

<br>

[![Python](https://img.shields.io/badge/Python-Data%20Analytics-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-Analytics-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-DAX-F2C811?style=for-the-badge&logo=powerbi&logoColor=111111)](https://powerbi.microsoft.com/)
[![Excel](https://img.shields.io/badge/Excel-Reporting-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/microsoft-365/excel)
[![GitHub Pages](https://img.shields.io/badge/Portfolio-Live-222222?style=for-the-badge&logo=github)](https://priyanshu18611.github.io/enterprise-sales-analytics/)

</div>

---

## 🚀 Project Overview

**Enterprise Sales Analytics** is an end-to-end business intelligence project designed to demonstrate how transactional sales data can move through a complete analytics workflow:

```text
Raw Business Data
       ↓
Python ETL & Data Quality
       ↓
SQL Data Modeling & Analytics
       ↓
Business Metrics & DAX
       ↓
Power BI / Excel Reporting
       ↓
Interactive Executive Dashboard
       ↓
Business Insights
```

The project combines **data preparation, database analytics, KPI development, visualization, reporting and business interpretation** into one portfolio-ready workflow.

> **Dataset note:** The included dataset is synthetic and created for portfolio demonstration. It does not represent production customer or company data.

---

## 🎯 Business Objective

The goal is to build an analytics system that helps answer questions such as:

- How much revenue and profit are being generated?
- Which regions contribute the most revenue?
- Which product categories perform strongly?
- How does profit change with revenue?
- How can customer-level data support segmentation and retention analysis?
- How can raw transactional data be transformed into BI-ready information?
- How can data-quality checks improve reporting reliability?

---

# 📌 Executive Snapshot

| Metric | Project Value |
|---|---:|
| Transaction Records | **12,000+** |
| Customers | **6,620** |
| Revenue | **~₹13.21M** |
| Profit | **~₹3.97M** |
| Modeled Profit Margin | **~30%** |
| Data Quality Layer | **Included** |
| SQL Analytics | **Included** |
| Python ETL / EDA | **Included** |
| Power BI / DAX Layer | **Included** |
| Excel Dashboard | **Included** |
| Tableau Workflow | **Tableau-ready** |

---

# 🧠 Analytics Architecture

```text
                    ┌──────────────────────┐
                    │   Synthetic Sales    │
                    │       Dataset        │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Python ETL + EDA     │
                    │ Pandas / NumPy       │
                    │ Validation / Cleaning│
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ SQL Analytics Layer  │
                    │ MySQL / Star Schema  │
                    └──────────┬───────────┘
                               │
                 ┌─────────────┼─────────────┐
                 ▼             ▼             ▼
          ┌────────────┐ ┌────────────┐ ┌────────────┐
          │  Power BI  │ │   Excel    │ │  Tableau   │
          │   + DAX    │ │ Reporting  │ │   Ready    │
          └─────┬──────┘ └─────┬──────┘ └─────┬──────┘
                └──────────────┼──────────────┘
                               ▼
                    ┌──────────────────────┐
                    │ Executive Dashboard  │
                    │ & Business Insights  │
                    └──────────────────────┘
```

---

# 🛠️ Technology Stack

### Data Analytics
- Python
- Pandas
- NumPy
- Matplotlib / visualization workflow

### Database
- SQL
- MySQL
- Analytical aggregations
- Star-schema concepts

### Business Intelligence
- Power BI
- DAX
- KPI modeling
- Executive reporting

### Spreadsheet Analytics
- Microsoft Excel
- Dashboard-style reporting
- Business KPI presentation

### Visualization
- Chart.js interactive web dashboard
- Tableau-ready analytical structure

### Development
- HTML5
- CSS3
- JavaScript
- Git
- GitHub
- GitHub Pages

---

# 📂 Project Structure

```text
enterprise-sales-analytics/
│
├── 📁 data/
│   ├── sales_fact.csv
│   ├── dim_customer.csv
│   ├── dim_product.csv
│   └── dim_date.csv
│
├── 📁 sql/
│   ├── 01_schema.sql
│   └── 02_analytics_queries.sql
│
├── 📁 python/
│   ├── 01_eda_and_etl.py
│   └── requirements.txt
│
├── 📁 powerbi/
│   ├── measures.dax
│   └── README_POWERBI.md
│
├── 📁 excel/
│   └── Enterprise_Sales_Analytics_Dashboard.xlsx
│
├── 📁 dashboard/
│   └── index.html
│
├── 📁 docs/
│   ├── CASE_STUDY.md
│   └── RESUME_BULLETS.md
│
├── index.html
└── README.md
```

---

# 🔄 End-to-End Workflow

## 1️⃣ Data Layer

The project uses a dimensional structure containing:

- Sales fact data
- Customer dimension
- Product dimension
- Date dimension

This structure supports analytical slicing across customers, products, dates and business regions.

---

## 2️⃣ Python ETL & EDA

Python is used as the preparation and analytical layer.

### Workflow

```text
Load
 ↓
Inspect
 ↓
Validate
 ↓
Clean
 ↓
Transform
 ↓
Analyze
 ↓
Prepare BI-ready data
```

### Validation examples

- Missing-value checks
- Data-type validation
- Duplicate checks
- Basic consistency checks
- KPI preparation

### Libraries

```text
Pandas
NumPy
Matplotlib
```

---

# 🗄️ SQL Analytics

The SQL layer demonstrates analytical querying over sales data.

### Example

```sql
SELECT
    region,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_fact
GROUP BY region
ORDER BY total_revenue DESC;
```

### Analytical areas

- Revenue aggregation
- Profit analysis
- Regional performance
- Product/category analysis
- Customer analytics
- KPI calculations
- Business reporting queries

---

# 📊 Power BI & DAX

The Power BI layer is designed around reusable business measures.

### Core Measures

```DAX
Total Revenue =
SUM ( Sales[Revenue] )
```

```DAX
Total Profit =
SUM ( Sales[Profit] )
```

```DAX
Profit Margin =
DIVIDE (
    [Total Profit],
    [Total Revenue],
    0
)
```

### BI concepts demonstrated

- KPI cards
- Measures
- Star-schema modeling
- Business dimensions
- Revenue / profit analysis
- Executive reporting

---

# 📗 Excel Analytics

The project also includes an Excel executive dashboard:

```text
excel/
└── Enterprise_Sales_Analytics_Dashboard.xlsx
```

The workbook is designed for:

- KPI reporting
- Category analysis
- Executive summaries
- Business trend analysis
- Spreadsheet-based reporting workflows

---

# 📈 Tableau-Ready Visualization

The analytical structure is also suitable for building Tableau visualizations around:

- Revenue trends
- Profit trends
- Regional performance
- Product/category performance
- Customer segmentation
- Executive KPI reporting

**Important:** This repository describes the workflow as **Tableau-ready** and does not claim that a Tableau workbook has been publicly published.

---

# 🌐 Interactive Analytics Portfolio

The project includes a premium web-based command center.

### Dashboard Highlights

- Animated KPI cards
- Revenue & profit trend
- Regional mix
- Power BI intelligence section
- DAX examples
- Data-model visualization
- Python ETL workflow
- SQL analytics lab
- Enterprise architecture
- Business insight engine
- Analyst profile
- Responsive design

### Live Portfolio

👉 **https://priyanshu18611.github.io/enterprise-sales-analytics/**

---

# 💡 Business Insight Framework

The dashboard is designed around four major insight areas:

### 01 — Profitability
Understand revenue-to-profit relationships and modeled margin.

### 02 — Regional Performance
Compare revenue contribution across business regions.

### 03 — Customer Intelligence
Use customer-level data as a foundation for segmentation, retention and cohort-style analysis.

### 04 — Operational Data Quality
Use validation and ETL steps to create a more reliable reporting pipeline.

---

# 🔍 Data Quality Approach

A major part of the project is treating data quality as part of analytics—not an afterthought.

```text
Source
  ↓
Schema Check
  ↓
Null Check
  ↓
Duplicate Check
  ↓
Type Validation
  ↓
Business Consistency
  ↓
Analytics Ready
```

This makes the workflow more suitable for repeatable reporting and business intelligence use cases.

---

# 📊 Key KPIs

The project focuses on metrics commonly used in sales analytics:

| KPI | Purpose |
|---|---|
| Revenue | Measures sales generated |
| Profit | Measures modeled business profitability |
| Profit Margin | Profit relative to revenue |
| Orders | Measures transaction volume |
| Customers | Measures customer base |
| Regional Revenue | Compares geographic contribution |
| Category Revenue | Compares product/category performance |

---

# 🧪 How to Run the Python Pipeline

Clone the repository:

```bash
git clone https://github.com/priyanshu18611/enterprise-sales-analytics.git
cd enterprise-sales-analytics
```

Install dependencies:

```bash
pip install -r python/requirements.txt
```

Run the ETL/EDA script:

```bash
python python/01_eda_and_etl.py
```

---

# 🗄️ SQL Setup

Open:

```text
sql/01_schema.sql
```

Create the required database/table structure in MySQL.

Then execute:

```text
sql/02_analytics_queries.sql
```

for the analytical queries.

---

# 📁 Project Deliverables

| Deliverable | Location |
|---|---|
| Synthetic Dataset | `/data` |
| SQL Schema | `/sql/01_schema.sql` |
| Analytics Queries | `/sql/02_analytics_queries.sql` |
| Python ETL/EDA | `/python/01_eda_and_etl.py` |
| Python Dependencies | `/python/requirements.txt` |
| DAX Measures | `/powerbi/measures.dax` |
| Power BI Documentation | `/powerbi/README_POWERBI.md` |
| Excel Dashboard | `/excel` |
| Web Dashboard | `/dashboard` |
| Case Study | `/docs/CASE_STUDY.md` |
| Resume Bullets | `/docs/RESUME_BULLETS.md` |

---

# 🎓 What This Project Demonstrates

This project demonstrates practical ability across the analytics lifecycle:

```text
Data Collection
      ↓
Data Cleaning
      ↓
Data Validation
      ↓
ETL
      ↓
SQL Analytics
      ↓
Data Modeling
      ↓
KPI Development
      ↓
BI Reporting
      ↓
Visualization
      ↓
Business Insights
```

It is intentionally structured as an **end-to-end analytics case study**, rather than only a visualization project.

---

# 👨‍💻 About the Developer

## Priyanshu Kumar

**Data Analytics | Software Engineering | Full Stack Development**

B.Tech — Computer Science & Engineering

### Core Areas

- Data Analytics
- SQL
- Python
- Power BI
- Excel
- Business Intelligence
- Data Engineering fundamentals
- Machine Learning
- Software Development

### Connect

- 🔗 GitHub: https://github.com/priyanshu18611
- 🔗 LinkedIn: https://www.linkedin.com/in/priyanshuroy18/
- 🌐 Portfolio: https://priyanshu18611.github.io/portfolio/

---

# ⭐ Why This Project Matters

Modern analytics work is not only about creating charts.

A useful analytics workflow connects:

**Data → Quality → Engineering → SQL → Metrics → Visualization → Business Decisions**

This project demonstrates that complete workflow in a single portfolio project.

---

# 📜 License

This project is intended for educational and portfolio demonstration purposes.

The included dataset is synthetic and should not be interpreted as real company or customer information.

---

<div align="center">

### Built with data, code & curiosity.

**Priyanshu Kumar • 2026**

⭐ If you find this project useful, consider starring the repository.

</div>
