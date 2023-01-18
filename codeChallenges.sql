-- Code Challenge 4.2 "Best Before"
-- Create 'Products' list
CREATE TABLE Products (
    productname TEXT PRIMARY KEY,
    price DEC,
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

-- Code Challenge 5.2 "Customer Copies"
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

-- Code Challenge 6.2 "Leaderboarding"
-- Create 'Players' table
CREATE TABLE Players (
    firstname TEXT PRIMARY KEY,
    lastname TEXT,
    losses INTEGER
);

-- Insert records into Players
INSERT INTO Players
VALUES (
    'Hikaru', 'Nakamura', 0,
    'Magnus', 'Karlsen', 2,
    'Wesley', 'So', 3,
    'Levon', 'Aronian', 3,
    'Haik', 'Martirosian', 1,
    'Vladimir', 'Fedoseev', 1
);

-- Sort the players by losses to derive the leaderboard.
SELECT *
FROM Players
ORDER BY losses;

-- Code Challenge 8 "Cakes"
-- Create 'cakes' table
CREATE TABLE cakes (
    name TEXT PRIMARY KEY,
    calories INTEGER
);

-- Insert records into cakes
INSERT INTO cakes 
VALUES (
    'Apple Cake', 100,
    'Banana Cake', 200,
    'Pound Cake', 180,
    'Sponge Cake', 100,
    'Genoise Cake', 360,
    'Chiffon Cake', 250,
    'Opera Cake', 90,
    'Cheese Cake', 370
);

-- Write a query to sort the cakes by calorie count and select the first 3 cakes from the list to offer the customer.
SELECT *
FROM cakes
ORDER BY calories
LIMIT 3;

-- Code challenge 9.2 "Salary Range"
-- Create 'staff' table

CREATE TABLE staff (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT,
    lastname TEXT,
    salary INTEGER
);

-- Insert records into staff table.
INSERT INTO staff (firstname, lastname, salary)
VALUES (
    'John', 'Smith', 1500,
    'David', 'Gibson', 1750,
    'Lisa', 'Anderson', 1300,
    'Seth', 'Gray', 2000,
    'Nelson', 'Gross', 1900
);

-- Write a query to output the first names of employees whose salaries are between 1500 and 1900.
SELECT firstname
FROM staff
WHERE salary BETWEEN 1500 AND 1900;

-- Code Challenge 10.2 "Superheroes"
-- Create films table
CREATE TABLE films (
    name TEXT PRIMARY KEY,
    genre TEXT,
    year INTEGER,
    production TEXT
);

-- Insert records into films table
INSERT INTO films 
VALUES (
    'Iron Man', 'Superheroes', 2008, 'Marvel Studios',
    'Venom', 'Superheroes', 2018, 'Columbia Pictures',
    'The Dark Knight', 'Superheroes', 'Warner Brothers',
    'The Avengers', 'Superheroes', 'Marvel Studios',
    'Avengers: Endgame', 'Superheroes', 'Marvel Studios'
);