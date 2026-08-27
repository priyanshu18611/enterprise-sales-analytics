import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

# 1. Advanced Star Schema Simulation
np.random.seed(42)
N = 3000

cust_ids = [f"CUST_{i:04d}" for i in range(1, 401)]
categories = ['Electronics', 'Furniture', 'Office Supplies']
regions = ['North', 'South', 'East', 'West']

df = pd.DataFrame({
    'OrderID': [f"ORD_{2024000+i}" for i in range(N)],
    'CustomerID': np.random.choice(cust_ids, N),
    'OrderDate': pd.date_range(start='2024-01-01', end='2024-12-31', periods=N),
    'Category': np.random.choice(categories, N, p=[0.45, 0.35, 0.20]),
    'Region': np.random.choice(regions, N),
    'Quantity': np.random.randint(1, 5, N),
    'UnitPrice': np.random.choice([499, 1499, 4999, 12999, 45999], N),
    'DiscountPct': np.random.choice([0.0, 0.05, 0.10, 0.15, 0.25], N),
    'DeliveryStatus': np.random.choice(['Delivered', 'Returned'], N, p=[0.92, 0.08])
})

# Feature Engineering
df['GrossRevenue'] = df['Quantity'] * df['UnitPrice']
df['NetRevenue'] = df['GrossRevenue'] * (1 - df['DiscountPct'])
valid_sales = df[df['DeliveryStatus'] == 'Delivered'].copy()

# 2. Machine Learning: RFM Customer Segmentation (K-Means)
snapshot_date = valid_sales['OrderDate'].max() + pd.Timedelta(days=1)
rfm = valid_sales.groupby('CustomerID').agg({
    'OrderDate': lambda x: (snapshot_date - x.max()).days,
    'OrderID': 'nunique',
    'NetRevenue': 'sum'
}).rename(columns={'OrderDate': 'Recency', 'OrderID': 'Frequency', 'NetRevenue': 'Monetary'})

# Log Transform & Standardize
rfm_scaled = StandardScaler().fit_transform(np.log1p(rfm))
kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)
rfm['Cluster'] = kmeans.fit_predict(rfm_scaled)

segment_names = {0: 'Champions (High Value)', 1: 'Potential Loyalists', 2: 'At Risk', 3: 'Hibernating'}
rfm['CustomerSegment'] = rfm['Cluster'].map(segment_names)

print("--- Executive Metrics ---")
print(f"Total Net Sales: INR {valid_sales['NetRevenue'].sum():,.2f}")
print(f"Delivered Orders: {valid_sales['OrderID'].nunique()}")
print(f"Unique Customers: {rfm.shape[0]}")
print("\n--- ML RFM Customer Segments ---")
print(rfm['CustomerSegment'].value_counts())
