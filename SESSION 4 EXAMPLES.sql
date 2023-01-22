CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

CREATE TABLE Employee (
	EmployeeID INT ,
    Name VARCHAR(55),
    ManagerID INT,
    PRIMARY KEY(EmployeeID)
);

INSERT INTO Employee 
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Harry', 2),
(5, 'Joseph', 2),
(7, 'Ben', 2);

SELECT *
FROM Employee;

-- INNER JOIN
SELECT
	e1.Name EmployeeName, e2.Name AS ManagerName
FROM
	Employee e1
		INNER JOIN 
	Employee e2
		ON
        e1.ManagerID = e2.EmployeeID;
        
-- OUTER JOIN
SELECT
	e1.Name EmployeeName,
    IFNULL(e2.Name, 'Top Manager') AS ManagerName
FROM 
	Employee e1
		LEFT JOIN
	Employee e2
		ON
        e1.ManagerID = e2.EmployeeID;
        
        
USE JOINS_PRACTICE;

CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));

INSERT INTO Table1_fruit_basket
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));

INSERT INTO Table2_fruit_basket
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

SELECT * 
FROM Table1_fruit_basket;

SELECT *
FROM Table2_fruit_basket;

-- INNER JOIN
SELECT 
	t1.*, t2.*
FROM 
	Table1_fruit_basket t1
		INNER JOIN
	Table2_fruit_basket t2
		ON
        t1.ID = t2.ID;
        
-- INNER JOIN 
SELECT
	t1.ID AS T1ID,
    t1.Fruit AS T1Fruit,
    t2.ID AS T2ID,
    t2.Fruit AS T2Fruit
FROM
	Table1_fruit_basket t1
		INNER JOIN 
	Table2_fruit_basket t2
		ON
        t1.ID = t2.ID;
        
-- LEFT JOIN
SELECT
	t1.*, t2.*
FROM
	Table1_fruit_basket t1
		LEFT JOIN
	Table2_fruit_basket t2
		ON
        t1.ID = t2.ID;
        
-- RIGHT JOIN
SELECT
	t1.*, t2.*
FROM
	Table1_fruit_basket t1
		RIGHT JOIN
	Table2_fruit_basket t2
		ON
        t1.ID = t2.ID;
        
-- OUTER JOIN/UNION
SELECT *
FROM Table1_fruit_basket t1
LEFT JOIN
	Table2_fruit_basket t2
		ON 
		t1.ID = t2.ID
UNION
SELECT *
FROM Table1_fruit_basket t1
RIGHT JOIN
	Table2_fruit_basket t2 
		ON
        t1.ID = t2.ID

-- LEFT JOIN WHERE NULL
SELECT
	t1.*, t2.*
FROM
	Table1_fruit_basket t1
		LEFT JOIN
	Table2_fruit_basket t2
		ON
        t1.ID = t2.ID
WHERE
	t2.ID IS NULL;
 
 -- CROSS JOIN
 SELECT
	t1.*, t2.*
FROM 
	Table1_fruit_basket t1
		CROSS JOIN
	Table2_fruit_basket t2;
    
-- SUB QUERY
SELECT 
	ID, Fruit
FROM
	Table1_fruit_basket t1
WHERE
	t1.ID IN (SELECT
    t2.ID
		FROM
			Table2_fruit_basket t2
		WHERE
			t2.Fruit = 'apple');





