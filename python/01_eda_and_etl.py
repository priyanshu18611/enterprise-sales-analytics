# 01_eda_and_etl.py
# Enterprise Sales Analytics
import pandas as pd
import numpy as np

INPUT = "../data/sales_fact.csv"
OUTPUT = "../data/sales_analytics_ready.csv"

df = pd.read_csv(INPUT, parse_dates=["Order_Date"])

# ---------- Data validation ----------
required = ["Order_ID","Order_Date","Region","Category","Revenue","Cost","Profit","Customer_ID"]
missing_columns = [c for c in required if c not in df.columns]
assert not missing_columns, f"Missing columns: {missing_columns}"

quality = {
    "rows": len(df),
    "duplicate_order_ids": int(df["Order_ID"].duplicated().sum()),
    "null_order_ids": int(df["Order_ID"].isna().sum()),
    "negative_revenue": int((df["Revenue"] < 0).sum()),
    "profit_gt_revenue": int((df["Profit"] > df["Revenue"]).sum()),
}
print("QUALITY CHECKS")
for k,v in quality.items():
    print(f"{k}: {v}")

# ---------- Feature engineering ----------
df["Year"] = df["Order_Date"].dt.year
df["Month"] = df["Order_Date"].dt.month
df["Year_Month"] = df["Order_Date"].dt.to_period("M").astype(str)
df["Profit_Margin"] = np.where(df["Revenue"] != 0, df["Profit"]/df["Revenue"], 0)

# ---------- KPI table ----------
kpis = pd.DataFrame([{
    "Revenue": df["Revenue"].sum(),
    "Profit": df["Profit"].sum(),
    "Orders": df["Order_ID"].nunique(),
    "Customers": df["Customer_ID"].nunique(),
    "Profit_Margin": df["Profit"].sum()/df["Revenue"].sum()
}])
print("\nKPI SUMMARY\n", kpis)

# ---------- Analytics tables ----------
monthly = df.groupby("Year_Month", as_index=False).agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum"),
    Orders=("Order_ID","nunique")
)

regional = df.groupby("Region", as_index=False).agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum"),
    Customers=("Customer_ID","nunique")
).sort_values("Revenue", ascending=False)

category = df.groupby(["Category","Sub_Category"], as_index=False).agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum"),
    Orders=("Order_ID","nunique")
)
category["Margin"] = category["Profit"]/category["Revenue"]

top_customers = df.groupby(["Customer_ID","Customer_Name"], as_index=False).agg(
    Revenue=("Revenue","sum"),
    Profit=("Profit","sum"),
    Orders=("Order_ID","nunique")
).sort_values("Revenue", ascending=False).head(10)

# ---------- Export ----------
df.to_csv(OUTPUT, index=False)
monthly.to_csv("../data/monthly_kpis.csv", index=False)
regional.to_csv("../data/regional_kpis.csv", index=False)
category.to_csv("../data/category_kpis.csv", index=False)
top_customers.to_csv("../data/top_customers.csv", index=False)

print("\nETL complete. Analytics-ready files written to /data.")
