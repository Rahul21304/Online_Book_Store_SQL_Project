select * from books;
select * from customers;
select * from orders;

#Basic Query 

 #1) Retrieve all books in the "Fiction" genre
select * from books
where Genre = 'Fiction' and Genre is not null;


 #2) Find books published after the year 1950
select * from books 
where Published_Year > 1950;


 #3) List all customers from the Canada
select * from customers 
where Country = 'Canada';
 
 
 #4) Show orders placed in November 2023
select * from orders 
where Order_Date between '2023-11-01' and '2023-11-31';


 #5) Retrieve the total stock of books available
select Sum(Stock)
from books;


 #6) Find the details of the most expensive book
select *
from books 
order by Price DESC
limit 1;


 #7) Show all customers who ordered more than 1 quantity of a book
select *
from orders as O
left join customers as C
on O.Customer_ID = C.Customer_ID
where Quantity >1;


 #8) Retrieve all orders where the total amount exceeds $20
select *
from Orders 
where Total_Amount>20;


 #9) List all genres available in the Books table
select Genre, Count(Book_ID)
from books
group by Genre;


 #10) Find the book with the lowest stock
select Title , Stock
from books
order by Stock
limit 1;


 #11) Calculate the total revenue generated from all orders
select Round(Sum(Total_Amount),2) as total_revenue
from orders;

#Advance Query 

 #1) Retrieve the total number of books sold for each genre
select Genre, Sum(o.Quantity) as Total_Unit_Sold
from orders as o
left join books as b
on o.Book_ID = b.Book_ID
group by b.Genre;


 #2) Find the average price of books in the "Fantasy" genre
select Genre, Round(Avg(Price),2) as Average_Price
from books
Group by Genre
having Genre = 'Fantasy';
 
 
 #3) List customers with names who have placed at least 2 orders
select c.Customer_ID , Count(Order_ID), c.Name
from orders as o
join customers as c
on o.Customer_ID = c.Customer_ID
group by Customer_ID
having Count(Order_ID)>=2;


 #4) Find the most frequently ordered book
select b.Book_ID, Title, Count(Order_ID)
from orders as o
left join books as b
on o.Book_ID = b.Book_ID
group by b.Book_ID
order by Count(Order_ID) DESC
limit 1 ;


 #5) Show the top 3 most expensive books of 'Fantasy' Genre
select Book_ID, Title,Genre, Price
from books
where Genre = 'Fantasy'
order by Price DESC 
limit 3;


 #6) Retrieve the total quantity of books sold by each author
select b.Author, Sum(o.Quantity)
from orders as o
left join books as b
on o.Book_ID=b.Book_ID
Group by b.Author;


 #7) List the cities where customers who spent over $30 are located
Select City, Total_Amount
from orders as o
left join customers as c
on o.Customer_ID = c.Customer_ID
having Total_Amount > 30;


 #8) Find the customer who spent the most on orders
Select Name, o.Customer_ID, sum(o.Total_Amount), Count(Order_ID)
from orders as o
left join customers as c
on o.Customer_ID = c.Customer_ID
Group by o.Customer_ID
Order by sum(Total_Amount) Desc 
limit 1 ;


 #9) Calculate the stock remaining after fulfilling all order
Select  b.Book_ID, Title, b.Stock, sum(o.Quantity) as Orders_Quantity , b.Stock-sum(o.Quantity) as remaining_Stock
from orders as o
join books as b
on o.Book_ID=b.Book_ID
group by b.Book_ID
order by b.Book_ID;
