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
VALUES 
    ('Yogurt', 200, 2020-11-19, 2021-01-19),
    ('Juice', 380.00, 2020-10-10, 2022-10-10),
    ('Milk', 520.00, 2020-08-19, 2020-08-23);

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
VALUES 
    ('Check 1', 'Check 2', 'Check3'),
    ('Check 1', 'Check 2', 'Check3');

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
VALUES 
    ('Hikaru', 'Nakamura', 0),
    ('Magnus', 'Karlsen', 2),
    ('Wesley', 'So', 3),
    ('Levon', 'Aronian', 3),
    ('Haik', 'Martirosian', 1),
    ('Vladimir', 'Fedoseev', 1);

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
VALUES 
    ('Apple Cake', 100),
    ('Banana Cake', 200),
    ('Pound Cake', 180),
    ('Sponge Cake', 100),
    ('Genoise Cake', 360),
    ('Chiffon Cake', 250),
    ('Opera Cake', 90),
    ('Cheese Cake', 370);

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
VALUES 
    ('John', 'Smith', 1500),
    ('David', 'Gibson', 1750),
    ('Lisa', 'Anderson', 1300),
    ('Seth', 'Gray', 2000),
    ('Nelson', 'Gross', 1900);

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
VALUES 
    ('Iron Man', 'Superheroes', 2008, 'Marvel Studios'),
    ('Venom', 'Superheroes', 2018, 'Columbia Pictures'),
    ('The Dark Knight', 'Superheroes', 'Warner Brothers'),
    ('The Avengers', 'Superheroes', 'Marvel Studios'),
    ('Avengers: Endgame', 'Superheroes', 'Marvel Studios');

-- Write a query to output the names of all of the films which were produced by Marvel Studios in 2010 or later, sorted by the 'name' column.
SELECT name
FROM films
WHERE year >= 2010 AND production = 'Marvel Studios'
ORDER BY name;

-- Code Challenge 11.2 "Get the Ball Rolling!"
-- Create teams table
CREATE TABLE teams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teamname TEXT,
    country TEXT
);

-- Insert records into teams table
INSERT INTO teams (teamname, country)
VALUES 
    ('FC Barcelona', 'Spain'),
    ('FC Bayern Munich', 'Germany'),
    ('FC Chelsea', 'England'),
    ('FC Roma', 'Italy'),
    ('FC Leon', 'France'),
    ('FC Ajax', 'Nederland');

-- Write a query to output the team names and the countries of all teams that have played in La Liga (Spain), Premier League (England) and Bundesliga (Germany)․
SELECT teamname, country
FROM teams
WHERE country
IN ('Spain', 'England', 'Germany');

-- Code Challenge 12.2 "Annual Bonuses"
-- Add fields "department" and "experience" to staff table
ALTER TABLE staff
ADD department TEXT,
ADD experience INTEGER;

-- Update staff table with data for "department" and "experience" fields.
UPDATE TABLE staff
SET department = 'Marketing',
SET experience = 2
WHERE id = 1;

UPDATE TABLE staff
SET department = 'IT',
SET experience = 3
WHERE id = 2;

UPDATE TABLE staff
SET department = 'Marketing',
SET experience = 3
WHERE id = 3;

UPDATE TABLE staff
SET department = 'Finance',
SET experience = 6
WHERE id = 4;

UPDATE TABLE staff
SET department = 'Security',
SET experience = 1
WHERE id = 5;

/*
The salary shown in the table is monthly.
Each employee receives a bonus once a year. The bonus for each employee is equal to their years of experience multiplied by 500.

Write a query to output the firstname and lastname columns into one column named fullname separated by space, and the total annual 
salary for each employee keeping in mind bonuses named 'total'. Sort by the 'total' column.
*/
SELECT 
    CONCAT(firstname, ' ', lastname) AS fullname, 
    (experience * 500) + (salary * 12) AS total
FROM staff
ORDER BY total;

-- Code Challenge 13.2 "Average Grades"
-- Create sam_grades table
CREATE TABLE sam_grades (
    subject TEXT PRIMARY KEY,
    teacher TEXT,
    score INTEGER,
    semester INTEGER
);

-- Insert records into sam_grades table
INSERT INTO sam_grades 
VALUES 
    ('Math', 'Mr Smith', 100, 1),
    ('Chemistry', 'Mr Gibson', 95, 2),
    ('Physics', 'Ms Anderson', 97, 1),
    ('Geography', 'Mrs Gray', 88, 1),
    ('English', 'Mr Gross', 90, 2);

-- Write a query to output the average of Sam's exam scores for the first semester.
SELECT AVG(score)
FROM sam_grades
WHERE semester = 1;

-- Code Challenge 14.2 "Let's Get Fit!"
-- Create Foods table
CREATE TABLE Foods (
    name TEXT PRIMARY KEY,
    category TEXT,
    price INTEGER,
    fatpercentage INTEGER
);

-- Insert records into Foods table
INSERT INTO Foods 
VALUES 
    ('Cheesecake', 'Dessert', 600, 35),
    ('Canned Salmon', 'Seafood', 1650, 8),
    ('Avocado', 'Fruit', 810, 22),
    ('Fried Chicken', 'Meat Product', 1290, 11),
    ('Ice Cream', 'Milk Product', 300, 7),
    ('Brazil Nut', 'Nuts', 980, 62);

/*
Help Monica lose weight by writing a query to choose the foods, whose fat percentages are lower 
than the average from the "Foods" table.
*/
SELECT *
FROM Foods
WHERE 
    fatpercentage  < (SELECT AVG(fatpercentage) FROM Foods);

-- Code Challenge 15.2 "Chocolate!"
-- Create desserts table
CREATE TABLE desserts (
    name TEXT PRIMARY KEY,
    price INTEGER
);

-- Insert records into desserts table.
INSERT INTO desserts 
VALUES 
    ('Chocolate Pudding', 15),
    ('Easy Chocolate Covered Oreos', 30),
    ('Flourless Chocolate Cake', 50),
    ('Vanilla Pudding', 20),
    ('Chess Pie', 35),
    ('Cookiedilla', 10);

-- Write a query to output only chocolate desserts.
SELECT *
FROM desserts
WHERE name LIKE '%Chocolate%';

-- Code Challenge 17 "Apartments"
-- Create Apartments table
CREATE TABLE Apartments (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   city TEXT,
   address TEXT,
   price INTEGER,
   status TEXT 
);

-- Insert records into Apartments table.
INSERT INTO Apartments (city, address, price, status)
VALUES
    ('Las Vegas', '732 Hall Street', 1000, 'Not rented'),
    ('Marlboro', '985 Huntx Lane', 800, 'Not rented'),
    ('Moretown', '3757 Wines Lane', 700, 'Not rented'),
    ('Owatonna', '314 Pritchard Court', 500, 'Rented'),
    ('Grayslake', '3234 Cunningham Court', 600, 'Rented'),
    ('Great Neck', '1927 Romines Mill Road', 900, 'Not rented');

/*
Write a query to output the apartments whose prices are greater than the average and are also not 
rented, sorted by the 'Price' column.
*/
SELECT *
FROM Apartments
WHERE 
    price > (SELECT AVG(price) FROM Apartments)
    AND status = 'Not rented'
ORDER BY price;

-- Code Challenge 18.2 "Mentor and Apprentice"
-- Create students table
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT,
    lastname TEXT,
    teacherid INTEGER
);

-- Create teachers table
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT,
    lastname TEXT
);

-- Insert records into students table
INSERT INTO students (firstname, lastname, teacherid)
VALUES
    ('Melanie', 'Cavazos', 1),
    ('Ted', 'Gray', 2),
    ('Sandra', 'Dennis', 1),
    ('John', 'Lockhart', 3),
    ('Michael', 'Cartwright', 2),
    ('Henry', 'Suh', 1);

-- Insert records into teachers table.
INSERT INTO teachers (firstname, lastname)
VALUES
    ('Kenneth', 'Rogers'),
    ('Julia', 'Marrero'),
    ('Mary', 'Foulds');

-- Write a query to output all of the students with their teachers' last names in one table, sorted by students ID.
SELECT 
    students.id,
    students.firstname,
    students.lastname,
    teachers.lastname AS "teacher"
FROM students, teachers
WHERE 
    students.teacherid =
    teachers.id
ORDER BY students.id;

-- Code Challenge 19.2 "Sorting the Inventory"
-- Create products table
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    productname TEXT,
    price INTEGER,
    categoryid INTEGER
);

-- Create categories table
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoryname TEXT
);

-- Insert records into products table
INSERT INTO products (productname, price, categoryid)
VALUES
    ('Apple', 800, 1),
    ('Potato', 400, 2),
    ('Orange', 900, 1),
    ('Tomato', 450, 2),
    ('OrangeJuice', 250, 3),
    ('TomatoJuice', 350, 3);

-- Insert records into categories table
INSERT INTO categories (categoryname)
VALUES 
    ('Fruit'),
    ('Vegetable'),
    ('Juice'),
    ('Chocolate');
/*
Each product has a category.
Write a query to output all products with their categories (productname-price-categoryname) in one table.
*/
SELECT
    products.productname,
    products.price,
    categories.categoryname
FROM products
INNER JOIN categories
ON 
    products.categoryid =
    categories.id;

-- Code Challenge 20.2 "Chess Tournament"
-- Create Norway Chess table
CREATE TABLE NorwayChess (
    player TEXT PRIMARY KEY,
    country TEXT,
    birthyear INTEGER,
    rating INTEGER
);

CREATE TABLE TataSteel (
    player TEXT PRIMARY KEY,
    country TEXT,
    birthyear INTEGER,
    rating INTEGER
);

-- Insert records into NorwayChess table
INSERT INTO NorwayChess
VALUES
    ('Magnus Carlsen', 'Norway', 1990, 2863),
    ('Alireza Firouzja', 'Iran', 2003, 2728),
    ('Levon Aronian', 'Armenia', 1982, 2767),
    ('Fabiano Caurana', 'USA', 1992, 2828),
    ('Jan-Krzysztof Duda', 'Poland', 1998, 2757),
    ('Aryan Tari', 'Norway', 1999, 2633);

-- Insert records into TataSteel table
INSERT INTO TataSteel
VALUES
    ('Magnus Carlsen', 'Norway', 1990, 2863),
    ('Wesley So', 'USA', '1993', 2770),
    ('Van Foreest Jorden', 'Netherlands', 1999, 2671),
    ('Fabiano Caurana', 'USA', 1992, 2828),
    ('Yu Yangyi', 'China', 1994, 2709);

/*
Write a query to merge 'NorwayChess' and 'TataSteel' tables. Then order the merged table by 'Rating' in descending order and 
show the final table of participants. No duplicates.
*/
SELECT 
    player, 
    country, 
    birthyear, 
    rating
FROM NorwayChess
UNION
SELECT 
    player,
    country,
    birthyear,
    rating
FROM TataSteel
ORDER BY rating DESC;

-- Code Challenge "Views"
-- Create users table
CREATE TABLE users (
    name TEXT,
    lastname TEXT,
    acc_id INTEGER PRIMARY KEY,
    status TEXT
);
