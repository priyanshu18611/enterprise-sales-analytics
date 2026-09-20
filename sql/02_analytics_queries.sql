-- 02_analytics_queries.sql
USE enterprise_sales_analytics;

-- KPI summary
SELECT
    COUNT(DISTINCT Order_ID) AS orders,
    COUNT(DISTINCT Customer_ID) AS customers,
    ROUND(SUM(Revenue),2) AS revenue,
    ROUND(SUM(Profit),2) AS profit,
    ROUND(SUM(Profit)/NULLIF(SUM(Revenue),0)*100,2) AS profit_margin_pct
FROM sales_fact;

-- Monthly trend
SELECT Year, Month, Month_Name,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit
FROM sales_fact
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;

-- Regional performance
SELECT Region,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit,
       COUNT(DISTINCT Customer_ID) AS customers
FROM sales_fact
GROUP BY Region
ORDER BY revenue DESC;

-- Category performance
SELECT Category, Sub_Category,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Revenue),0)*100,2) AS margin_pct
FROM sales_fact
GROUP BY Category, Sub_Category
ORDER BY revenue DESC;

-- Channel performance
SELECT Channel,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit,
       COUNT(*) AS orders
FROM sales_fact
GROUP BY Channel
ORDER BY revenue DESC;

-- Top 10 customers by revenue
SELECT Customer_ID, Customer_Name,
       ROUND(SUM(Revenue),2) AS revenue,
       ROUND(SUM(Profit),2) AS profit
FROM sales_fact
GROUP BY Customer_ID, Customer_Name
ORDER BY revenue DESC
LIMIT 10;

-- Cohort-style first purchase month
WITH first_purchase AS (
    SELECT Customer_ID, DATE_FORMAT(MIN(Order_Date), '%Y-%m-01') AS cohort_month
    FROM sales_fact
    GROUP BY Customer_ID
)
SELECT fp.cohort_month,
       DATE_FORMAT(sf.Order_Date, '%Y-%m-01') AS activity_month,
       COUNT(DISTINCT sf.Customer_ID) AS active_customers
FROM first_purchase fp
JOIN sales_fact sf ON fp.Customer_ID = sf.Customer_ID
GROUP BY fp.cohort_month, activity_month
ORDER BY fp.cohort_month, activity_month;

-- Data-quality checks
SELECT 'NULL_ORDER_ID' AS check_name, COUNT(*) AS failures
FROM sales_fact WHERE Order_ID IS NULL
UNION ALL
SELECT 'NEGATIVE_REVENUE', COUNT(*) FROM sales_fact WHERE Revenue < 0
UNION ALL
SELECT 'PROFIT_GT_REVENUE', COUNT(*) FROM sales_fact WHERE Profit > Revenue
UNION ALL
SELECT 'INVALID_DISCOUNT', COUNT(*) FROM sales_fact WHERE Discount < 0 OR Discount > 1;
