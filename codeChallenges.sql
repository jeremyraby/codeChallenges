-- Code Challenge 4.2
-- Create 'Products' list
CREATE TABLE Products (
    productname TEXT PRIMARY KEY,
    price INTEGER,
    productiondate DATE,
    expirationdate DATE
);

-- Insert records into Products
INSERT INTO Products 
VALUES (
    'Yogurt', 200, 2020-11-19, 2021-01-19,
    'Juice', 380.00, 2020-10-10, 2022-10-10,
    'Milk', 520.00, 2020-08-19, 2020-08-23 
);

-- Write a query to select the ProductName, ProductionDate and ExpirationDate.
SELECT 
    productname, 
    productiondate, 
    expirationdate 
FROM Products;

-- Code Challenge 5.2
-- Create 'Operation' table
CREATE TABLE Operation (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    checks TEXT
);

-- Insert records into Operation
INSERT INTO Operation (checks)
VALUES (
    'Check 1', 'Check 2', 'Check3',
    'Check 1', 'Check 2', 'Check3'
);

-- Write a query to show only the unique checks that are given to the customer.
SELECT DISTINCT checks FROM Operation;

