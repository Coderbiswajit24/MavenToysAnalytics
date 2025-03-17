CREATE TABLE stores (
    Store_ID SERIAL PRIMARY KEY,
    Store_Name VARCHAR(255),
    Store_City VARCHAR(255),
    Store_Location VARCHAR(255),
    Store_Open_Date DATE
);

select * from stores;

CREATE TABLE products (
    Product_ID SERIAL PRIMARY KEY,
    Product_Name VARCHAR(255),
    Product_Category VARCHAR(255),
    Product_Cost DECIMAL(10, 2),
    Product_Price DECIMAL(10, 2)
);


select * from products;

CREATE TABLE inventory (
    Store_ID INTEGER,
    Product_ID INTEGER,
    Stock_On_Hand INTEGER,
    PRIMARY KEY (Store_ID, Product_ID),
	foreign key(product_id) references products(product_id),
	foreign key (store_id) references stores(store_id)
);


select * from inventory;

CREATE TABLE sales (
    Sale_ID SERIAL PRIMARY KEY,
    sale_Date DATE,
    Store_ID INTEGER,
    Product_ID INTEGER,
    Unit_sold INTEGER,
	foreign key(product_id) references products(product_id),
	foreign key (store_id) references stores(store_id)
);

select * from sales;

CREATE TABLE calendar (
    Date_Column DATE PRIMARY KEY,
    Month_column VARCHAR(20),
    Quarter VARCHAR(10),
    Week_day VARCHAR(10),
    Year INTEGER,
    Week_number VARCHAR(10)
);


select * from calendar;