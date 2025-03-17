![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/49adf32692fcb7c8cb4ca555ec8c8dfa7404148f/Maven_Toys.png)

# MavenToysAnalytics
Data-driven analysis of Maven Toys &amp; Games to boost sales, profitability, and inventory using Pandas. Uncovers trends in performance, demand, and efficiency with actionable insights.    #DataAnalysis #BusinessIntelligence #RetailAnalytics #InventoryManagement #Python #Pandas #SalesForecasting #ProfitOptimization

# Project Content :

 # 1. 🔍 Project Overview :
Maven Toys, a retail chain specializing in toys and games, 
operates multiple stores across various cities. Despite having a wide range of 
products and a growing number of stores, the company is struggling 
with inefficient inventory management, unclear sales performance 
trends, and suboptimal profitability. The management lacks actionable 
insights to make informed decisions about stock replenishment, product 
pricing, and store performance. This has led to issues such as overstocking, 
stockouts, and missed sales opportunities, ultimately affecting the company's 
bottom line. 
The goal of this project is to analyze sales data, inventory levels, and 
product performance to identify key trends, inefficiencies, and 
opportunities for improvement.
![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/f293d5978d68cb2fcae46900eeaa311d0ac14bad/Maven%20Toys%20%26%20Games%20Business%20Problem%20Statement.pdf)

 # 2. 🎯 Project Objectives :
 By leveraging data-driven insights, Maven 
Toys aims to:

            1. Optimize inventory management to reduce overstocking and 
             stockouts. 
            2. Improve sales performance by identifying high-performing products 
             and stores. 
            3. Enhance profitability by analyzing product margins and pricing 
             strategies. 
            4. Forecast demand to better align inventory with customer needs. 
            5. Identify regional trends to tailor product offerings and marketing 
            strategies.
![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/f293d5978d68cb2fcae46900eeaa311d0ac14bad/Maven%20Toys%20%26%20Games%20Analytical%20business%20Problems%20for%20Analysis.pdf)

# 3. 🔧 Tools and Technologies :
- **Python**: Core programming language.
- **Pandas**: Data manipulation and analysis.
- **Matplotlib & Seaborn**: For Data visualization.
- **Jupyter Notebook**: Interactive analysis environment.

# 4. 💾  Datasets :
- Sales: Transaction data with units sold and dates.
- Inventory: Stock levels by store and product.
- Products: Cost, price, and category details.
- Stores: City , Location and opening date information.
- Calendar: Time-based data for trend & Time Series analysis.
  ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/0dfa6369cf8651ba212a29830e238d8f62c48029/Datasets.zip)

# 5. ℹ️ Metadata Information :
 ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/394b211aa28eee80132d392c2d1984116debfac1/Maven%20Toys%20%26%20Games%20Metadata%20document.txt)
 

# 6. 🔗 Data Model :
The ER Diagram below illustrates the relationships between the datasets (Sales, Inventory, Products, Stores, and Calendar).

![ER Diagram](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/348ba3d5699b339caadabe16001e9c1fc5b90c18/Maven%20Toys%20%26%20Games%20ER%20Diagram.png)
*Figure: Entity-Relationship Diagram (Data Model) of Maven Toys & Games datasets.*  

# 7. ⚙️ Installation :
1. Clone the repository:
   ```bash
   git clone https://github.com/Coderbiswajit24/MavenToysAnalytics.git

# 8. 🚀 Usage :
- Open `Maven Toys & Games Retail Analysis.ipynb` ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/163c6b1c2d223bc66f0d14673f6dfcdf74969ede/Maven%20Toys%20%26%20Games%20Retail%20Analysis.ipynb)
in Jupyter Notebook.
- Run all cells to generate sales, inventory, and profitability insights.
- View visualizations like the sales forecast chart.

# 9. 📊  Results & Insights : 
   # (a). Sales Performace Analysis Insights: 
   #  Question 1 : 
   - What are the total sales revenue and profit generated by each store?

             # Merge the 'stores' and 'sales' tables on the 'Store_ID' column using an inner join.
             # This combines store information with sales data for each store.
             store_sales = stores.merge(sales, how='inner', on='Store_ID')

             # Merge the resulting DataFrame with the 'products' table on the 'Product_ID' column using an inner join.
             # This adds product information (e.g., price, cost) to the sales data.
             store_sales_revenue = store_sales.merge(products, how='inner', on='Product_ID')

             # Calculate the revenue for each sale by multiplying the product price by the number of units sold.
             # This creates a new column called 'Revenue' in the DataFrame.
              store_sales_revenue['Revenue'] = (store_sales_revenue['Product_Price'] * store_sales_revenue['Units'])

             # Calculate the profit for each sale by subtracting the total cost from the total revenue.
             # The total cost is calculated by multiplying the product cost by the number of units sold.
             # This creates a new column called 'Profit' in the DataFrame.
             store_sales_revenue['Profit'] = (store_sales_revenue['Revenue'] - (store_sales_revenue['Product_Cost'] * store_sales_revenue['Units']))
             
             # Group the DataFrame by 'Store_Name' and calculate the total revenue for each store.
             # The result is a new DataFrame with two columns: 'Store_Name' and the sum of 'Revenue' for each store.
             df = store_sales_revenue.groupby('Store_Name')['Revenue'].sum().reset_index()
             
             # Rename the columns in the resulting DataFrame for clarity.
             # The 'Revenue' column is renamed to 'Total_Sales_Revenue(US Dollars $)'.
             df.columns = ['Store_Name', 'Total_Sales_Revenue(US Dollars $)']
             
             # Sort the DataFrame by the 'Total_Sales_Revenue(US Dollars $)' column in descending order.
             # This shows the stores with the highest total sales revenue at the top.
             df.sort_values(by='Total_Sales_Revenue(US Dollars $)', ascending=False)

  # Results : For Sales Revenue

           # Calculating Top 10 Stores Based on Sales Revenue
             top_10_stores = df.sort_values(by = 'Total_Sales_Revenue(US Dollars $)' , ascending = False).head(10)
             top_10_stores
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/0e909997588badf6c5191f1302322ad2462f3c48/Top%2010%20Stores%20Based%20On%20Sales%20Revenue(USD).png)

   # For Profit :
          # Calculate Top 10 Stores Based on Profit
          df1 = store_sales_revenue.groupby('Store_Name')['Profit'].sum().reset_index()
          df1.columns = ['Store_Name' , 'Total_Profit(US Dollars $)']
          top_10_profitable_stores = df1.sort_values(by = 'Total_Profit(US Dollars $)' , ascending = False).head(10)
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/54cae88dcf5e7bfc540952c967a6dea5e9451117/Top%2010%20Stores%20Based%20On%20Profit(USD).png)
   # Question 2 : Which products are the top-selling and least-selling across all stores? 
          # Merge the 'sales' and 'products' tables on the 'Product_ID' column using an inner join.
          # This combines sales data with product information for each product sold.
          product_sales = sales.merge(products, how='inner', on='Product_ID')
          
          # Group the merged DataFrame by 'Product_Name' and calculate the total units sold for each product.
          # The result is a new DataFrame with two columns: 'Product_Name' and the sum of 'Units' sold for each product.
          product_units_sold = product_sales.groupby('Product_Name')['Units'].sum().reset_index()
          
          # Rename the columns in the resulting DataFrame for clarity.
          # The 'Units' column is renamed to 'Total_Quantity_Sold'.
          product_units_sold.columns = ['Product_Name', 'Total_Quantity_Sold']
          
          # Sort the DataFrame by 'Total_Quantity_Sold' in descending order and select the top 10 products.
          # This gives the top 10 best-selling products based on the total quantity sold.
          top_selling_products = product_units_sold.sort_values(by='Total_Quantity_Sold', ascending=False).head(10)
          
          # Display the resulting DataFrame containing the top 10 best-selling products.
          top_selling_products

   # Result : For Top Selling Products
   
             

            	   
