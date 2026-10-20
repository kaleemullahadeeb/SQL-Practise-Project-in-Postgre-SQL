--create table 
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
Book_Id SERIAL Primary key,
Title varchar(50),
Author varchar (50),
Genre varchar(50),
Published_Year int,
Price numeric (10,2),
Stock int
);
ALTER TABLE books ALTER COLUMN title TYPE varchar(255);


DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
Customer_ID SERIAL PRIMARY KEY,
Name varchar(50),
Email varchar(50),
Phone varchar(50),
City varchar(50),
Country varchar(50)
)

ALTER TABLE Customers ALTER COLUMN Country TYPE varchar(255);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
Order_Id SERIAL PRIMARY KEY,
Customer_ID int REFERENCES Customers(Customer_ID),
Book_ID int REFERENCES Books(Book_id),
Order_date date,
Quantity int,
Total_amount NUMERIC(10,2)
)

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--import data into books table
copy Books(Book_Id,Title,Author,Genre,Published_Year,Price,Stock)
FROM 'F:\SQL Practise Files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Books.csv'
CSV HEADER;

COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM 'F:\SQL Practise Files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Customers.csv'
CSV HEADER

COPY Orders(Order_Id,Customer_ID,Book_ID,Order_date,Quantity,Total_amount)
FROM 'F:\SQL Practise Files\ST - SQL ALL PRACTICE FILES-2\All Excel Practice Files\Orders.csv'
CSV HEADER

-- using Where clause 
SELECT * FROM Books 
WHERE genre='Fiction';
--find the books published after year 2000
SELECT * FROM Books 
where published_year>2000;
--LIST CUSTOMERS FROM CANADA

SELECT * FROM CUSTOMERS
WHERE country='Canada';

SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

SELECT SUM(stock) as total_stock
from books;

SELECT * FROM Books ORDER BY price desc limit 3;

select * from orders
where quantity>7;

select * from orders
where total_amount>400;

select distinct title from books;

select * from books
order by stock asc limit 40; 

select sum (total_amount) as grand_total 
from orders;

select * from books;
select * from orders;

SELECT b.Genre, SUM(o.Quantity) AS total_books_sold  
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.Genre;

select avg(price) as average_price 
from books
where genre = 'Fantasy'; 

--LIST CUSTOMERS WHO HAVE PLACES AT LEAST 2 ORDERS;
select o.customer_id, c.name, count(o.order_id) as order_count
from orders o 
join customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(order_id) >=2;

--FIND THE MOST FREQUENTLY ORDERED BOOK







