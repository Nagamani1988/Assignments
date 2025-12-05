select * from customers
select * from orders

UPDATE customers SET custname='Abhi' where custid='1006';

---1. Write a query to display the custid ,name, age, orderid,orderdate for 
--product books or cd, sort data by name in descending order

select 
customers.custid, customers.custname,customers.age,
orders.orderid,orders.orderdate
from customers 
inner join orders 
on customers.custid = orders.custid
where orders.products in ('laptop','tv')
order by customers.custname desc




---2. Write a SQL statement to find the list of customers who live in the 
--same city as ajay, and display custid , custname , price (price > 500)



SELECT
    c.custid,c.custname,o.price FROM customers AS c
INNER JOIN orders AS o   
ON c.custid = o.custid
WHERE c.caddress in (    SELECT caddress     FROM customers     WHERE custname = 'sai')
AND o.price > 500;





---3. Write a query to find the name of customers along with order details 
--who purchased   more than two products

select cust.custname,o.orderid,o.orderdate,o.quantity from customers as cust inner join orders o on o.custid = cust.custid
where o.quantity>2

----4. A discount of 20% has been announced to all customers who resides 
--in Bangalore . display custid , custname , orderid  and discount price
select cust.custid,cust.custname,o.orderid, o.price,(o.price * 20/100) as 'Discount Price' from customers as cust inner join orders o on cust.custid = o.custid
where cust.caddress=' Bangalore'

-- 5. write a query to join three tables (create products table for the same)
CREATE TABLE [Product](
	[ProductID] [Int] NULL,
	[ProductName] [varchar](20) NULL,
	[ProductCost] [Int] NULL
)

Insert into Product (ProductID,ProductName,ProductCost

select cust.custid,cust.custname,combinedTable.orderid,combinedTable.orderdate,combinedTable.productname from customers cust inner join 
(select o.custid,o.orderid,o.orderdate,p.productname from orders o inner join Products P on o.ProductId = p.ProductID) combinedTable 
on cust.custid = combinedTable.custid

---6. update price by 5% from orders table for customers who resides in 
--pune and chennai
select price from orders
WHERE custid IN (
    SELECT custid 
    FROM customers 
    WHERE caddress IN ('Pune', 'Chennai'))

  ---7.7. create a report in following format
  select 
  CONCAT('cid:',cust.custid,'-ordid:',o.orderid) 'Custidord',
  UPPER( cust.custname) 'Custname',
  SUBSTRING(o.products,1,3) 'Product',
  o.orderdate
  from customers cust inner join orders o on cust.custid = o.custid
  where o.orderdate>= '01-12-2000'

  ----Validations------------
   

    create table student1
  (
    studentname varchar(20),
    studentRollnumber int identity(100,100),
    studentDOB varchar(20),
    studentclass int
  )

  select * from student1

  insert into student1 (studentname,studentDOB,studentclass) values
  ('Roopa','02-04-2001',5),
  ('Deepa','09-10-1997',8),
  ('Saadhya','08-08-2005',3),
  ('Roopa','02-04-2001',5);

--. DOB cannot be greater then current date ---

 ALTER TABLE Student1
ADD CONSTRAINT studentDOB CHECK (studentDOB <= GETDATE());

---b. Class should be between 1 - 10 
ALTER TABLE Student1
ADD CONSTRAINT studentclass CHECK (studentclass <=10);

-----stocks-----
create table Stock(

StockId varchar(50),
    MinStockLvl INT NOT NULL,
    MaxStockLvl INT NOT NULL
);



select * from Stock

ALTER TABLE Stock
ADD CONSTRAINT chk_stock_levels CHECK (MaxStockLvl > MinStockLvl);


ALTER TABLE Stock
ADD CONSTRAINT chk_stockid_format CHECK (
    StockId LIKE '[A-Za-z][A-Za-z][A-Za-z]-[0-9][0-9]-[A-Za-z][A-Za-z][A-Za-z]'
);


INSERT INTO Stock (StockId, MinStockLvl, MaxStockLvl)
VALUES ('stc-11-abc', 20, 30);

INSERT INTO Stock (StockId, MinStockLvl, MaxStockLvl)
VALUES ('stc-11-efg', 20, 34);

INSERT INTO Stock (StockId, MinStockLvl, MaxStockLvl)
VALUES ('stc-11-hig',30 ,60);

------create table purchase---
create table Product1(
Productid int,
PurchaseDate date default GETDATE(),
SerialNo int UNIQUE,
price int,
qty int,
Total as (price*qty) PERSISTED
);



select * from Product1;

Insert into Product1(Productid,SerialNo,price,qty)
values (1,100,2000,3),
(2,200,1000,5),
(3,300,4000,2);

Insert into Product1(Productid,SerialNo,price,qty)
values (4,500,2000,2);

----• Create a rule  qty should be greater than 1----

ALTER TABLE Product1
ADD CONSTRAINT chk_qty CHECK (qty > 1);

---- Create a rule where price should be between 1000 and  7000 

ALTER TABLE Product1
ADD CONSTRAINT chk_price_range
CHECK (price BETWEEN 1000 AND 7000);























9
          