import pandas as pd

df = pd.read_csv("Dataset.csv")

print(df.head())
print(df.info())


print(df.isnull().sum())

df = df.drop_duplicates()

df['Order Date'] = pd.to_datetime(df['Order Date'], dayfirst=True)
print(df.dtypes)


print("Total Sales:", df['Sales'].sum())

print("Total Orders:", df['Order ID'].nunique())


top_products = df.groupby('Sub-Category')['Sales'].sum()

print(top_products.sort_values(ascending=False).head(10))


region_sales = df.groupby('Region')['Sales'].sum()

print(region_sales)

df['Month'] = df['Order Date'].dt.month
monthly_sales = df.groupby('Month')['Sales'].sum()

print(monthly_sales)

import matplotlib.pyplot as plt

monthly_sales.plot()

plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Sales")
plt.show()


region_sales.plot(kind='bar')

plt.title("Region Wise Sales")
plt.show()


df.to_csv("cleaned_sales.csv", index=False)
