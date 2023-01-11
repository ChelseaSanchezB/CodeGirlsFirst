USE parts;
SELECT * FROM part;

SELECT p.pname, p.weight 
FROM part p 
WHERE p.colour = 'RED';

SELECT DISTINCT s.sname
FROM supplier s
WHERE s.city = 'LONDON';

CREATE DATABASE shop;

USE shop;

CREATE TABLE SALEES1 (
		Store CHAR(10),
        Week INT,
        Day CHAR(10),
        SalesPerson CHAR(10),
        SalesAmount FLOAT,
        Month CHAR(3)
);

SHOW TABLES FROM PARTS;

INSERT INTO SALEES1 (Store, Week, Day, SalesPerson, SalesAmount, Month)
VALUES 
('London', 2, 'Monday', 'Frank', 56.25, 'May'),
('London', 5, 'Tuesday', 'Frank', 74.32, 'Sep'),
('London', 5, 'Monday', 'Bill', 98.42, 'Sep'),
('London', 5, 'Saturday', 'Bill', 73.90, 'Dec'),
('London', 1, 'Tuesday', 'Josie', 44.27, 'Sep'),
('Dusseldorf', 4, 'Monday', 'Manfred', 77.0, 'Jul'),
('Dusseldorf', 3, 'Tuesday', 'Inga', 9.99, 'Jun'),
('Dusseldorf', 4, 'Wednesday', 'Manfred', 86.81, 'Jul'),
('London', 6, 'Friday', 'Josie', 74.02, 'Oct'),
('Dusseldorf', 1, 'Saturday', 'Manfred', 43.11, 'Apr');

SELECT * FROM SALEES1