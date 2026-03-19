-- STEP 1: Create the "Point" tables (Dimensions)

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

-- STEP 2: Create the "Middle" table (Fact Table)
-- This holds the numbers and points to the dimensions.

CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_id INT REFERENCES dim_date(date_id),
    store_id INT REFERENCES dim_store(store_id),
    product_id INT REFERENCES dim_product(product_id),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2) -- units * price
);

-- STEP 3: Load the Cleaned Data
-- I have standardized the dates and capitalized categories properly!

-- Loading Stores
INSERT INTO dim_store (store_name, city) VALUES 
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'),
('Mumbai Central', 'Mumbai');

-- Loading Products (Cleaning: 'electronics' -> 'Electronics')
INSERT INTO dim_product (product_name, category) VALUES 
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Grocery'),
('Jeans', 'Clothing'),
('Biscuits', 'Grocery');

-- Loading Dates (Standardizing format to YYYYMMDD)
INSERT INTO dim_date VALUES 
(20230829, '2023-08-29', 2023, 8, 29),
(20231212, '2023-12-12', 2023, 12, 12),
(20230205, '2023-02-05', 2023, 2, 5),
(20230115, '2023-01-15', 2023, 1, 15),
(20230809, '2023-08-09', 2023, 8, 9);

-- Loading the Fact Table (10 rows of cleaned data)
-- Note: Total Sales is calculated as (Units * Price)
INSERT INTO fact_sales (transaction_id, date_id, store_id, product_id, units_sold, unit_price, total_sales) VALUES
('TXN5000', 20230829, 1, 1, 3, 49262.78, 147788.34),
('TXN5001', 20231212, 1, 2, 11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
('TXN5003', 20230220, 2, 2, 14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
('TXN5005', 20230809, 3, 5, 12, 524.00, 6288.00),
('TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
('TXN5007', 20231026, 4, 6, 16, 2317.47, 37079.52),
('TXN5008', 20231208, 3, 7, 9, 469.99, 4229.91),
('TXN5009', 20230815, 3, 4, 3, 58851.01, 176553.03);