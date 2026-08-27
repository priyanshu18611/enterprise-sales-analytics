-- =========================================================================
-- ADVANCED SALES & CUSTOMER COHORT SQL ENGINE
-- =========================================================================

-- 1. Month-over-Month (MoM) Growth & 3-Month Moving Average
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(OrderDate, '%Y-%m') AS sale_month,
        ROUND(SUM(NetRevenue), 2) AS monthly_revenue
    FROM fact_sales
    WHERE DeliveryStatus = 'Delivered'
    GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
)
SELECT 
    sale_month,
    monthly_revenue,
    LAG(monthly_revenue, 1) OVER (ORDER BY sale_month) AS prev_month_rev,
    ROUND(((monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY sale_month)) / LAG(monthly_revenue, 1) OVER (ORDER BY sale_month)) * 100, 2) AS mom_growth_pct,
    ROUND(AVG(monthly_revenue) OVER (ORDER BY sale_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3m
FROM MonthlySales;

-- 2. Pareto Analysis (80/20 Rule) on Product Categories
WITH CategorySpend AS (
    SELECT 
        Category,
        ROUND(SUM(NetRevenue), 2) AS category_revenue
    FROM fact_sales
    WHERE DeliveryStatus = 'Delivered'
    GROUP BY Category
),
ParetoEngine AS (
    SELECT 
        Category,
        category_revenue,
        SUM(category_revenue) OVER () AS total_revenue,
        SUM(category_revenue) OVER (ORDER BY category_revenue DESC) AS running_rev
    FROM CategorySpend
)
SELECT 
    Category,
    category_revenue,
    ROUND((running_rev / total_revenue) * 100, 2) AS cumulative_share_pct,
    CASE 
        WHEN (running_rev / total_revenue) <= 0.80 THEN 'Core Driver (A-Tier)' 
        ELSE 'Long Tail (B/C-Tier)' 
    END AS pareto_class
FROM ParetoEngine;

