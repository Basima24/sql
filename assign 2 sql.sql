-- create database
create database Sales;
Use Sales;
-- create Orders table
create table Orders( 
Order_id int  primary key unique ,
Customer_name varchar(50) not null,
Product_Category varchar(50) not null,
Ordered_item varchar(50) not null,
Contact_No varchar(50) not null
);
desc Orders;

-- 1. add new column named Order Quantity to Orders
alter table Orders add column Order_Qnty int not null;
desc Orders;

-- 2. rename table orders to Sales_Orders
rename table Orders to Sales_Orders;
desc Sales_orders;


desc Sales_Orders;
Select * from Sales_Orders;

alter table Sales_Orders modify column Contact_No bigint not null;
desc Sales_Orders;

truncate table Sales_Orders;
select * from sales_orders;

-- 3.  Insert 10 rows of Sample data
insert into Sales_Orders(Order_id,Customer_name,Product_Category,Ordered_item,Contact_No,Order_Qnty) 
values
(101,'Smith','Electronics','Laptop',1234566677,1),
(102,'Arun','Clothing','Shirt',7773219001,2),
(103,'Leo','Sports','Basketball',1818230719,3),
(104,'Rose','Clothing','Jacket',7919832551,2),
(105,'Emily','Electronics','Monitor',1112223333,4),
(106,'Gijo','Clothing','Jeans',9196745656,2),
(107,'Rumu','Sports','Racket',9947483443,2),
(108,'Fayzan','Home','Mop',702503226,1),
(109,'benny','Home','Detergent',7678001212,1),
(110,'Rinchu','Elecronics','Head phones',9193450909,2)
; 
select * from sales_orders;

-- 4. retrieve Customer name and ordered_item from table
Select Customer_name,Ordered_item from sales_orders;

-- 5. use update command to change name of the product for any row
update Sales_orders set Ordered_item = 'football' where order_id= 103;



select *from Sales_Orders;

-- 6. Delete the table from Database
drop table Sales_Orders;





















