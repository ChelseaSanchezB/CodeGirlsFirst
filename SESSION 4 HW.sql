USE parts;

SELECT * FROM supplier;
-- (s_id, sname, status, city)
-- S1	SMITH	20	LONDON
-- S2	JONES	10	PARIS
-- S3	BLAKE	30	PARIS
-- S4	CLARK	20	LONDON
-- S5	ADAMS	30	ATHENS

SELECT * FROM supply;
-- (s_id, p_id, j_id, quantity)
-- S1	P1	J1	200
-- S1	P1	J1	700
-- S2	P3	J1	400
-- S2	P3	J2	200
-- S2	P3	J3	200
-- S2	P3	J4	500
-- S2	P3	J5	600
-- S2	P3	J6	400
-- S2	P3	J7	800
-- S2	P5	J2	100
-- S3	P3	J1	200
-- S3	P4	J2	500
-- S4	P6	J3	300
-- S4	P6	J7	300
-- S5	P2	J2	200
-- S5	P2	J4	100
-- S5	P5	J5	500
-- S5	P5	J7	100
-- S5	P6	J2	200
-- S5	P1	J4	100
-- S5	P3	J4	200
-- S5	P4	J4	800
-- S5	P5	J4	400
-- S5	P6	J4	500

-- Find the name and status of each supplier who supplies project J2
SELECT DISTINCT s.sname, s.status
FROM supply sp
INNER JOIN supplier s
ON
sp.S_ID = s.S_ID
WHERE
sp.J_ID = 'J2';

SELECT * FROM project;
-- (j_id, jname, city)
-- J1	SORTER	PARIS
-- J2	DISPLAY	ROME
-- J3	OCR	ATHENS
-- J4	CONSOLE	ATHENS
-- J5	RAID	LONDON
-- J6	EDS	OSLO
-- J7	TAPPE	LONDON


-- Find the name and city of each project supplied by a London-based supplier
SELECT DISTINCT p.jname, p.city
FROM supplier s
INNER JOIN project p
	ON 
    p.city = s.city
WHERE 
s.city = 'London';


-- Find the name and city of each project not supplied by a London-based supplier
SELECT DISTINCT p.jname, p.city
FROM supplier s
INNER JOIN project p
	ON 
    p.city = s.city
WHERE 
s.city <> 'London';

SELECT * FROM part;
-- (p_id, pname, colour, weight, city)
-- P1	NUT	RED	12	LONDON
-- P2	BOLT	GREEN	17	PARIS
-- P3	SCREW	BLUE	17	ROME
-- P4	SCREW	RED	14	LONDON
-- P5	CAM	BLUE	12	PARIS
-- P6	COG	RED	19	LONDON

-- Find the supplier name, part name and project name for each case where a
-- supplier supplies a project with a part, but also the supplier city, project city
-- and part city are the same.
SELECT DISTINCT s.sname, pt.pname, p.jname
FROM
	supplier s
INNER JOIN part pt ON pt.p_id = sp.p_id
INNER JOIN supply sp ON s.s_id = sp.s_id
INNER JOIN project p ON p.j_id = sp.j_id
WHERE 
s.city = pt.city
AND 
sp.city = p.city;

