TABLE-1

create table branch(
branch_id int primary key,
branch_name varchar(30),
branch_city varchar(20)            
);
 
TABLE-2

create table customer(
customer_id int auto_increment primary key,
customer_name varchar(20),
customer_mobile_num varchar(20) unique,       
purchase_date date,
branch_id int,
foreign key (branch_id) references branch (branch_id)
);



TABLE-3

create table staff(
staff_id int primary key,
staff_first_name varchar(10),
staff_last_name varchar(10),
staff_mobile_num varchar(10) unique,
staff_salary int check (staff_salary>=8000),
branch_id int,
foreign key (branch_id) references branch(branch_id),
customer_id int
);

TABLE-4

create table book(
book_id int primary key,
book_titte varchar(30),
book_price int check(book_price>=1000),     
author_name varchar(30),
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

TABLE-5

create table return_detail(
return_book_date date primary key,
book_id int,
foreign key (book_id) references book(book_id),  
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

TABLE-6

create table fees(
fees_status bool,
book_id int,
customer_id int, 
fees_amount int,
CONSTRAINT fees_amt CHECK (fees_amount<=5000)
);

========================================

INSERT --branch

INSERT INTO branch (branch_id, branch_name, branch_city) VALUES (101,'Main Library','Chennai');
INSERT INTO branch (branch_id, branch_name, branch_city) VALUES (102,'Branch A','Coimbatore');
INSERT INTO branch (branch_id, branch_name, branch_city) VALUES (103,'Branch B','Madurai');
INSERT INTO branch (branch_id, branch_name, branch_city) VALUES (104,'Branch C','Trichy');
INSERT INTO branch (branch_id, branch_name, branch_city) VALUES (105,'Branch D','Salem');

INSERT --staff

INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) VALUES (301,'layatharani','tharani','6369066135',15000,101,201);
INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) values (302,'sankari','sankari','9876543211',8500,102,202);
INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) VALUES (303,'kalaivani','kalai','8876543212',9000,103,203);
INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) VALUES (304,'rahul','rahul','8124127131',10000,104,204);
INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) VALUES (305,'sathish','sathish','9976543214', 20000,105,205);
INSERT INTO staff (staff_id,staff_first_name,staff_last_name,staff_mobile_num,staff_salary,branch_id,customer_id) VALUES (306,'Ravi','raj','9976534514', 16000,105,208);


INSERT --customer

INSERT INTO customer (customer_id, customer_name,customer_mobile_num,age,purchase_date,branch_id) VALUES (201,'Rajesh Kumar','6369066124',20,'2024-7-21',101);
INSERT INTO customer (customer_id, customer_name,customer_mobile_num,age,purchase_date,branch_id) VALUES (202,'Sangeetha','7745067890',26,'2024-6-23',102);
INSERT INTO customer (customer_id, customer_name,customer_mobile_num,age,purchase_date,branch_id) VALUES (203,'Karthik Raja','7845098765',21,'2024-05-01',103);
INSERT INTO customer (customer_id, customer_name,customer_mobile_num,age,purchase_date,branch_id) values (204,'Priya Mohan','8040918952',23,'2024-04-06',104);
INSERT INTO customer (customer_id, customer_name,customer_mobile_num,age,purchase_date,branch_id) values (205,'Ganesh','9845076543',24,'2024-09-21',105);

ALTER TABLE customer add column age int;
ALTER TABLE customer ADD CONSTRAINT CHK_Age CHECK (age<=28)

INSERT NEW RECORD AFTER ALTER COLUMN:
INSERT INTO customer (customer_id, customer_name,customer_mobile_num,purchase_date,branch_id,age) values (206,'gowtham','9876543132','2024-05-21',105,26);

update age details:

update customer set age=19 where customer_id='201'
update customer set age=18 where customer_id='202';
update customer set age=20 where customer_id='203';
update customer set age=28 where customer_id='204';
update customer set age=27 where customer_id='205';


INSERT --book

INSERT INTO book (book_id,book_titte, book_price, author_name,customer_id) VALUES (401,'The Catcher in the Rye', 1200, 'J.D. Salinger',201);
INSERT INTO book (book_id,book_titte, book_price, author_name,customer_id) VALUES (402,'To Kill a Mockingbird', 1500, 'Harper Lee',202);
INSERT INTO book (book_id,book_titte, book_price, author_name,customer_id) VALUES (403,'pride and prejudice', 1100, 'George Orwell',203);
INSERT INTO book (book_id,book_titte, book_price, author_name,customer_id) VALUES (404,'jane eyre',1300,'Jane Austen',204);
INSERT INTO book (book_id,book_titte, book_price, author_name,customer_id) VALUES(405,'The Great Gatsby',1400,'F. Scott Fitzgerald',205);

INSERT --return_detail

INSERT INTO return_detail(return_book_date, book_id, customer_id) VALUES ('2024-08-22',401,201);
INSERT INTO return_detail(return_book_date, book_id, customer_id) VALUES ('2024-07-21',402,202);
INSERT INTO return_detail(return_book_date, book_id, customer_id) VALUES ('2024-06-22',403,203);  
INSERT INTO return_detail(return_book_date, book_id, customer_id) VALUES ('2024-05-27',404,204);
INSERT INTO return_detail(return_book_date, book_id, customer_id) VALUES ('2024-11-09',405,205);

  INSERT --fees

INSERT INTO fees (fees_status, book_id, customer_id,fees_amount) VALUES(True,401,201,1200);
INSERT INTO fees (fees_status, book_id, customer_id,fees_amount) VALUES(false,402,202,1500);
INSERT INTO fees (fees_status, book_id, customer_id,fees_amount) VALUES(true,403,203,1100);
INSERT INTO fees (fees_status, book_id, customer_id,fees_amount) VALUES(true,404,204,1300);
INSERT INTO fees (fees_status, book_id, customer_id,fees_amount) VALUES(false,405,205,1400);

=====================
table select query:

select * from branch;
select * from customer;
select * from staff;
select * from book;
select * from return_detail;
select * from fees;

================
inner join with all table

METHOD-1
select t_1.branch_id,t_1.branch_name,t_1.branch_city,t_2.customer_id,t_2.customer_name,t_2.customer_mobile_num,
t_2.purchase_date,t_2.age,t_3.staff_id,CONCAT(t_3.staff_first_name,' ',staff_last_name) staff_name,
t_3.staff_mobile_num,t_3.staff_salary,t_4.book_id,t_4.book_titte,t_4.book_price,t_4.author_name,
t_6.fees_status,t_6.fees_amount
from branch t_1,customer t_2,staff t_3,book t_4,return_detail t_5,fees t_6
where t_1.branch_id=t_2.branch_id
and t_3.customer_id=t_2.customer_id
and t_4.customer_id=t_2.customer_id
and t_5.book_id=t_4.book_id
and t_6.customer_id=t_2.customer_id


METHOD-2

select 
t_1.branch_id,t_3.staff_id,t_4.book_id,t_2.customer_id,t_2.customer_name,CONCAT(t_3.staff_first_name,' ',staff_last_name) staff_name,
t_1.branch_name,t_1.branch_city,t_2.customer_mobile_num,t_3.staff_mobile_num,t_2.purchase_date,
t_2.age customer_age,t_3.staff_salary,t_4.book_titte,t_4.book_price,t_4.author_name,t_6.fees_status,t_6.fees_amount
FROM branch t_1 INNER JOIN customer t_2 ON t_1.branch_id=t_2.branch_id
INNER JOIN staff t_3  ON t_3.customer_id=t_2.customer_id
INNER JOIN book t_4  ON t_4.customer_id=t_2.customer_id
INNER JOIN return_detail t_5 ON t_5.book_id=t_4.book_id
INNER JOIN fees t_6  ON t_6.customer_id=t_2.customer_id

=============================

left join with 2 table

select * from customer t_1 left join 
book t_2 on t_1.customer_id=t_2.customer_id
 
========================
right join with 2 table

select * from customer t_1 right join 
staff t_2 on t_1.customer_id=t_2.customer_id
 
=======================
left join with multiple table

select * from customer t_1 left join 
staff t_2 on t_1.customer_id=t_2.customer_id
left join book t_3
on t_2.customer_id=t_3.customer_id

========================
right join with multiple table

select * from customer t_1 right join 
staff t_2 on t_1.customer_id=t_2.customer_id
right join book t_3
on t_2.customer_id=t_3.customer_id

========================

AGGREGATE FUNCTONS


/*AVG (Average):
Calculate the average book price */
SELECT round(AVG(book_price),2) AS average_price
FROM book;

SELECT AVG(book_price)  AS average_price
FROM book;


/*COUNT:
Count the number of customers */
SELECT COUNT(*) AS total_customers
FROM customer;

SELECT COUNT(1) AS total_customers
FROM customer;

/*SUM:
Calculate the total fees amount paid */
SELECT SUM(fees_amount) AS total_paid_fees
FROM fees
WHERE fees_status = True;

SELECT SUM(fees_amount) AS total_paid_fees
FROM fees
WHERE fees_status = false;

/*MIN:
Find the minimum age among customers */
SELECT MIN(age) AS min_age
FROM customer;

/*MAX:
Find the maximum book price */
SELECT MAX(book_price) AS max_price
FROM book;

===============

USING OPERATORS

/*Operator: = (Equal to)
Retrieve all books with a price of 1500.*/
SELECT *
FROM book
WHERE book_price = 1500;customer_id != 201;age < 30;

/*Operator: != (Not equal to)
Fetch all customers except those with customer_id 201.*/
SELECT *
FROM customer
WHERE customer_id != 201;age < 30;

/*Operator: > (Greater than)
 Find all books priced higher than 1200.*/
SELECT *
FROM book
WHERE book_price > 1200;

/*Operator: < (Less than)
 Retrieve customers younger than 30 years old.*/
SELECT *
FROM customer
WHERE age < 30;

/*Operator: >= (Greater than or equal to)
List all books priced at least 1200. */
SELECT *
FROM book
WHERE book_price >= 1200;

/*Operator: <= (Less than or equal to)
 Fetch all customers who are 24 years old or younger */
SELECT *
FROM customer
WHERE age <= 24;

/*Operator: AND
Retrieve books with a price between 1200 and 1500 */
SELECT *
FROM book
WHERE book_price >= 1200 AND book_price <= 1500;

/*Operator: OR 
Fetch books either authored by 'J.D. Salinger' or priced above 1800 */
SELECT *
FROM book
WHERE author_name = 'J.D. Salinger' OR book_price > 1800;

/*Operator: NOT
Find all customers who are not from branch_id 101 */
SELECT *
FROM customer
WHERE NOT branch_id = 101;

/*Operator: IN
Retrieve books where the book_id is either 401, 404, or 405 */
SELECT *
FROM book
WHERE book_id IN (401, 404, 405);

/* Operator: BETWEEN
 List books with a price between 1400 and 1800 */
SELECT *
FROM book
WHERE book_price BETWEEN 1400 AND 1800;

/* Operator: LIKE */

SELECT *
FROM customer
WHERE customer_name LIKE 'Raj%';

SELECT *
FROM customer
WHERE customer_name LIKE 's%';

SELECT *
FROM customer
WHERE customer_name LIKE '%a';

========================
using operater-- inner join with all table

select 
t_1.branch_id,t_3.staff_id,t_4.book_id,t_2.customer_id,t_2.customer_name,CONCAT(t_3.staff_first_name,' ',staff_last_name) staff_name,
t_1.branch_name,t_1.branch_city,t_2.customer_mobile_num,t_3.staff_mobile_num,t_2.purchase_date,
t_2.age customer_age,t_3.staff_salary,t_4.book_titte,t_4.book_price,t_4.author_name,t_6.fees_status,t_6.fees_amount
from branch t_1,customer t_2,staff t_3,book t_4,return_detail t_5,fees t_6
where t_1.branch_id=t_2.branch_id
and t_3.customer_id=t_2.customer_id
and t_4.customer_id=t_2.customer_id
and t_5.book_id=t_4.book_id
and t_6.customer_id=t_2.customer_id
and t_6.fees_amount>=1200 and t_6.fees_amount<=1500
--and t_2.customer_name LIKE '%a';
--and t_4.book_price BETWEEN 1400 AND 1800;
--and t_4.book_id IN (401, 404, 405);
--and t_4.book_price = 1500
--and t_2.customer_id != 201
--and t_2.age < 30;
=========================

ORDER BY

-- retrieve staff details from the staff table and order them by staff_salary in descending order.
SELECT staff_id, staff_first_name, staff_salary
FROM staff
ORDER BY staff_salary DESC;

-- Sorting by Multiple Columns
SELECT staff_id, staff_first_name, staff_salary
FROM staff
ORDER BY staff_salary DESC, staff_first_name ASC; -- orders by staff_salary in descending order first, and for rows with the same salary, it orders by staff_first_name in ascending order.

-- retrieve customer details from the customer table and order them by purchase_date in ascending order.
SELECT customer_id, customer_name, purchase_date
FROM customer
ORDER BY purchase_date ASC;

-- retrive the customer name in ascending order
SELECT  customer_name
FROM customer
ORDER BY customer_name ;


-- GROUP BY
-- Write a SQL query to find the average age of customers for each branch. Display the branch name and the average age
SELECT b.branch_name,AVG(c.age) AS average_age
FROM customer c,branch b
WHERE c.branch_id = b.branch_id
GROUP BY b.branch_name;

-- Write a SQL query to find the number of books sold per author. Display the author name and the count of books sold
SELECT author_name,COUNT(book_id) AS books_sold
FROM book
GROUP BY author_name;

-- Write a SQL query to find the number of customers in each city. Display the city name and the count of customers
SELECT branch.branch_city,
    COUNT(customer.customer_id) AS customer_count
FROM branch,customer
WHERE branch.branch_id=customer.branch_id
GROUP BY branch_city;

-- HAVING 
-- retrive the count of customers in each branch
SELECT b.branch_city,
    COUNT(c.customer_id) AS customer_count
FROM branch as b,customer as c
WHERE b.branch_id=c.branch_id
GROUP BY b.branch_city
HAVING COUNT(customer_id) > 0;

-- retrive the total no.of.books purchased in each branch

SELECT b.branch_city,
    COUNT(bo.book_id) AS total_books_purchased
FROM branch b, customer c, book bo
WHERE b.branch_id = c.branch_id
    AND c.customer_id = bo.customer_id
GROUP BY b.branch_city;

-- find the average salary of staff members in branches where the average salary is greater than 9000, ordered by branch_city
SELECT b.branch_city,
      avg(s.staff_salary) as avg_salary
FROM branch as b,staff as s
WHERE b.branch_id=s.branch_id
GROUP BY b.branch_city
HAVING avg(s.staff_salary)>9000
ORDER BY b.branch_city;
 
 ======================
SINGLE ROW FUNCTIONS

-- 1. CONCAT 
-- Combine staff_first_name and staff_last_name into a single column full_name.
SELECT CONCAT(staff_first_name, ' ', staff_last_name) AS full_name
FROM staff;

-- 2.LENGTH 
-- Find the length of customer_name for all customers.
SELECT customer_name, LENGTH(customer_name) AS name_length
FROM customer;

-- 3. UPPER
-- Convert branch_name to uppercase
SELECT branch_name, UPPER(branch_name) AS branch_name_upper
FROM branch;

-- 4. LOWER
-- Convert author_name to lowercase
SELECT author_name, LOWER(author_name) AS author_name_lower
FROM book;

-- 5. DATE FORMAT
-- Format purchase_date in 'DD-MM-YYYYY' format
SELECT purchase_date, DATE_FORMAT(purchase_date, '%d-%m-%Y') AS formatted_date
FROM customer;

-- 6. NOW
-- return current date and time
select now() as current_timedate;

-- 7. REPLACE
-- replace the staff name from layatharani to laya
update staff
set staff_first_name=REPLACE(staff_first_name,'layatharani','laya')
where staff_first_name='layatharani';

-- 8. SUBSTRING
-- Extract the first 3 characters from customer_mobile_num
SELECT customer_mobile_num, SUBSTRING(customer_mobile_num, 1, 3) AS mobile_prefix
FROM customer;


-- 9. Calculate the total salary for each staff member, assuming a 10% bonus.
SELECT staff_id, staff_first_name, staff_salary,
       staff_salary * 1.1 AS total_salary_with_bonus
FROM staff;

-- 10 FORMAT
-- format the total_salary_with_bonus with 2 decimal places
SELECT staff_id, staff_first_name, staff_salary,
       FORMAT(staff_salary * 1.1,2) AS total_salary_with_bonus
FROM staff;

===================
SET OPERATION


-- UNION (remove duplicates)
SELECT customer_id FROM staff
UNION 
SELECT customer_id FROM customer;

-- UNION ALL
SELECT customer_id FROM staff
UNION ALL
SELECT customer_id FROM customer;

-- INTERSECT
SELECT customer_id FROM staff
INTERSECT
SELECT customer_id FROM customer;

-- EXCEPT (returns the rows that appear in the first result set but not in the second result set)
SELECT customer_id FROM staff
EXCEPT
SELECT customer_id FROM customer;


=======================
Create view:

create view Library_master
as
select t_1.branch_id,t_1.branch_name,t_1.branch_city,t_2.customer_id,t_2.customer_name,t_2.customer_mobile_num,
t_2.purchase_date,t_2.age,t_3.staff_id,CONCAT(t_3.staff_first_name,' ',staff_last_name) staff_name,
t_3.staff_mobile_num,t_3.staff_salary,t_4.book_id,t_4.book_titte,t_4.book_price,t_4.author_name,
t_6.fees_status,t_6.fees_amount
from branch t_1,customer t_2,staff t_3,book t_4,return_detail t_5,fees t_6
where t_1.branch_id=t_2.branch_id
and t_3.customer_id=t_2.customer_id
and t_4.customer_id=t_2.customer_id
and t_5.book_id=t_4.book_id
and t_6.customer_id=t_2.customer_id

select * from Library_master
select * from Library_master where branch_id='101'
select * from Library_master where customer_id='201'

=======================

-- sub query:

select * from customer where customer_id in (select customer_id from staff where customer_id in ('201','202'))

find max salary:

select max(fees_amount) from fees

Second max salary:

select max(fees_amount) from fees where fees_amount < (select max(fees_amount) from fees)

third max salary:

select MAX(fees_amount) from fees where fees_amount <
(select max(fees_amount) from fees where fees_amount < (select max(fees_amount) from fees))

-- find age of customer--inline query

SELECT  
(select AGE from customer A WHERE a.customer_id=b.customer_id) age_of_customer
FROM 
book b

find age of customer using operater--inline query

SELECT *,  
(select AGE from customer A WHERE a.customer_id=b.customer_id) age_of_customer
FROM 
book b
where b.customer_id='201'

inner joined 2 table and taking record based on customer table customer_id:

select t_1.* from book t_1,return_detail t_2
where t_1.book_id=t_2.book_id and t_1.customer_id in
(select customer_id from customer where customer_id in ('201','203'))



