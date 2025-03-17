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
   # Question 2 : 
   - Which products are the top-selling and least-selling across all stores based on quantity sold?
      
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
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/367cff8057cbcfedf2ea2e86dfbb7de212e6dd2a/Top%2010%20Best%20Seling%20Products%20Based%20On%20Quantity%20Sold.png)

   # For Least Selling Products
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/367cff8057cbcfedf2ea2e86dfbb7de212e6dd2a/Bottom%2010%20Least%20Selling%20Products%20Based%20on%20Quantity%20Sold.png)

   # Question 3 :
   - How do sales vary by month, quarter, and year?

            # Calculating  First 2022 Monthly Sales Revneue Trends
            # Merge the 'product_sales' DataFrame with the 'date_table' DataFrame on the 'Date' column using an inner join.
            # This combines sales data with date information (e.g., month, year) for each sale.
            month_wise_sales = product_sales.merge(date_table, how='inner', on='Date')
            
            # Calculate the sales revenue for each sale by multiplying the product price by the number of units sold.
            # This creates a new column called 'Sales_Revenue' in the DataFrame.
            month_wise_sales['Sales_Revenue'] = (month_wise_sales['Product_Price'] * month_wise_sales['Units'])
            
            # Filter the data to include only sales from the year 2022, then group by 'Month_Number' and 'Month_Name'.
            # Calculate the total sales revenue for each month in 2022.
            month_wise_sales_revenue_2022 = month_wise_sales[month_wise_sales['Year'] == 2022].groupby(['Month_Number', 'Month_Name'])['Sales_Revenue'].sum().reset_index()
     
            # Rename the columns in the resulting DataFrame for clarity.
            # The columns are renamed to 'Month_Number', 'Month_Name', and 'Total_Sales_Revenue'.
            month_wise_sales_revenue_2022.columns = ['Month_Number', 'Month_Name', 'Total_Sales_Revenue']
            
            # Sort the DataFrame by 'Month_Number' to ensure the months are in chronological order.
            month_wise_sales_revenue_2022.sort_values(by='Month_Number')
  # --------------------------------------------------------------------------------------------------------------------------------------------------------

            # Calculating 2023 Monthly Sales Revenue Trends

            # Filter the 'month_wise_sales' DataFrame to include only sales from the year 2023.
            # Then, group the filtered data by 'Month_Number' and 'Month_Name'.
            # Calculate the total sales revenue for each month in 2023.
            month_wise_sales_revenue_2023 = month_wise_sales[month_wise_sales['Year'] == 2023].groupby(['Month_Number', 'Month_Name'])['Sales_Revenue'].sum().reset_index()
            
            # Rename the columns in the resulting DataFrame for clarity.
            # The columns are renamed to 'Month_Number', 'Month_Name', and 'Total_Sales_Revenue'.
            month_wise_sales_revenue_2023.columns = ['Month_Number', 'Month_Name', 'Total_Sales_Revenue']
            
            # Sort the DataFrame by 'Month_Number' to ensure the months are in chronological order.
            month_wise_sales_revenue_2023.sort_values(by='Month_Number')
  # --------------------------------------------------------------------------------------------------------------------------------------------------------

            # Year basis Quarterly Sales Revenue
            # First Calculating 2022 Quarterly Sales Revenue Trend
            quarter_wise_sales_revenue_2022 = month_wise_sales[month_wise_sales['Year'] == 2022].groupby("Quarter")['Sales_Revenue'].sum().reset_index()

            quarter_wise_sales_revenue_2022.columns = ['Quarter' , 'Total_Sales_Revenue']  

            quarter_wise_sales_revenue_2022
  # -------------------------------------------------------------------------------------------------------------------------------------------------------- 
            #  Similarly Calculate 2023 Quarterly Sales Revenue Trend
            quarter_wise_sales_revenue_2023 = month_wise_sales[month_wise_sales['Year'] == 2023].groupby("Quarter")['Sales_Revenue'].sum().reset_index 
            quarter_wise_sales_revenue_2023.columns = ['Quarter' , 'Total_Sales_Revenue']  
            quarter_wise_sales_revenue_2023

  # -------------------------------------------------------------------------------------------------------------------------------------------------------- 
           # Findout Yearly Sales Revenue and Profit trend
           sales_revenue_2022 = sum(product_sales[product_sales['Date'] <= '2022-12-31']['Sales_Revenue'])  
           profit_2022 = sum(product_sales[product_sales['Date'] <= '2022-12-31']['Profit'])
           sales_revenue_2023 = sum(product_sales[product_sales['Date'] >= '2023-01-01']['Sales_Revenue'])
           profit_2023 = sum(product_sales[product_sales['Date'] >= '2023-01-01']['Profit'])


   # Result : For Monthly Sales Trend (2022 vs 2023)
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/41b0de787047b7dbba75518825fc677b4dc6f2b0/Monthly%20Sales%20Trends%20(2022%20vs%202023).png)
   # For Quarterly Sales Trend (2022 vs 2023)
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/1f93fb8e23ab04bee503c028366ae68ea7a754b4/Quarterly%20Sales%20Trends%20%20(2022%20%26%202023).png)

   # Question 4 :  Identify Popular Products Category based on quantity Sold
            
            category_wise_quantity_sold = product_sales.groupby('Product_Category')['Units'].sum().reset_index()
            category_wise_quantity_sold.columns = ['Product_Category','Total_unit_sold']
            category_wise_quantity_sold.sort_values(by = 'Total_unit_sold' , ascending = False)
   # Result :
   ![Alt text](https://github.com/Coderbiswajit24/MavenToysAnalytics/blob/36d10f6ef037ba5fba3404de8df3eb2bc494fa3c/Quantity%20Sold%20Distribution%20Of%20Products%20Category.png)
  
     
     
                           
             

            	   
