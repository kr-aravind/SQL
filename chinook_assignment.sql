select * from album;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoiceline;
select * from mediatype;
select * from playlist;
select * from playlisttrack;
select * from track;

#1. Calculate Monthly-Wise invoice Sales and sort them in descending order
select month(InvoiceDate),sum(Total) from invoice group by month(InvoiceDate) order by sum(Total) desc;

#2. Write an SQL query to fetch the names of all employees and their managers.
select f.FirstName as Employee_name, e.FirstName as Manager_name from employee as e inner join employee as f on e.EmployeeId=f.ReportsTo;

#3. Find the names of customers who have made a purchase in the USA?
select concat(FirstName,' ', LastName) as Customer, country from customer where country = 'USA';

#4. Show the name of each genre and the total number of tracks in that genre
select genre.Name, count(genre.Name) from genre inner join track on genre.GenreId = track.GenreId group by genre.Name;

#5. Show the name of each customer and the total amount they have spent on purchases
select concat(c.FirstName,' ',c.LastName), sum(i.Total) from customer as c inner join invoice as i on c.CustomerId = i.CustomerId group by concat(c.FirstName,' ',c.LastName);

#6. Find the name of the album with the highest unit price
select a.Title, sum(t.UnitPrice) as Total_unit_price from album as a inner join track as t on a.AlbumId = t.AlbumId group by a.Title order by sum(t.UnitPrice) desc limit 1;

#7. Display the percentage of missing values for “billingstate” and “billingpostalcode” columnsrespectively for the invoice table.
select (sum(case when BillingState is null then 1 else 0 end)/count(CustomerId))*100 as BillingState_perc,(sum(case when BillingPostalCode is null then 1 else 0 end)/count(CustomerId))*100 as BillingPostalCode_perc from invoice;

#8. Show the name of each track and the total number of times it has been purchased.
select t.Name, count(i.InvoiceLineId) as Number_of_times from track as t LEFT join invoiceline as i on t.TrackId = i.TrackId group by t.TrackId;

#9. Find the name of the customer who has made the largest purchase in terms of total cost.
select concat(c.FirstName,' ',c.LastName) as Customer_name, i.CustomerId as CustmerId, sum(i.Total) as Total_amount from customer as c left join invoice as i on c.CustomerId = i.CustomerId group by c.CustomerId order by sum(i.total) desc limit 1;

#10. Display the total amount spent by each customer and the number of invoices they have.
select concat(c.FirstName,' ',c.LastName) as Customer_name, sum(i.Total) as Total, count(i.InvoiceId) as count_order from customer as c
inner join invoice as i on c.CustomerId = i.CustomerId group by c.CustomerId;

#11. Find the name of the artist who has the most tracks in the chinook database.
select a.name, count(a.name) as count from artist as a inner join 
(select album.artistId from track inner join album on track.AlbumID = album.AlbumId) as b on
 a.artistId = b.artistId group by a.name order by count desc limit 1;
 
 #12. Find the names and email addresses of customers who have spent more than the average amounton invoices
 select concat(c.FirstName,' ',c.LastName) as Cust_name, c.Email as Email from customer as c inner join
 (select * from (select CustomerId,sum(Total) as amount from invoice group by CustomerId having sum(Total)>avg(Total))as a) as b on c.CustomerId = b.CustomerId;
 
 #13. List the names of all the artists that have tracks in the 'Rock' genre.
 select Name from artist where ArtistId in (select artistId from album where AlbumId in 
 (select AlbumId from track where GenreId in (select GenreID from genre where Name='rock')));
 

