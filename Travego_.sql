create database Travego;
use Travego;
create table Passenger (
passenger_id int,
passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int,
Bus_type varchar(20));

create table Price (
id int,
Bus_type varchar(20),
Distance int,
Price int);

insert into Passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemanth','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into Price values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

select * from passenger;
select * from price;

# a.How many female passengers travelled a minimum distance of 600 KMs?
select * from passenger where (gender = 'F' and distance>=600);
select count(*) as count_of_passengers from passenger where (gender = 'F' and distance>=600);

# b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeperbus
select * from passenger where (distance>500 and bus_type = 'Sleeper');

# c.Select passenger names whose names start with the character 'S'
select passenger_name from passenger where passenger_name like 'S%';

# d.Calculate the price charged for each passenger,displaying the Passenger name, Boarding City, Destination City, Bustype, and Price in the output.
select passenger.passenger_name, passenger.boarding_city, passenger.destination_city, passenger.Bus_type, Price.price from passenger inner join price on passenger.bus_type = price.bus_type where (price.distance = passenger.distance);
#or can be written this way
# select passenger.passenger_name, passenger.boarding_city, passenger.destination_city, passenger.Bus_type, Price.price from passenger inner join price on passenger.distance = price.distance where (price.bus_type = passenger.bus_type);

# e. What are the passenger name(s) and the ticket price for those who traveled 1000KMs Sitting in a bus?
select passenger.passenger_name, passenger.boarding_city, passenger.destination_city, passenger.Bus_type, passenger.distance, Price.price from passenger inner join price on passenger.bus_type = price.bus_type where (price.distance = passenger.distance and passenger.distance = 1000 and passenger.bus_type = 'sitting');

# f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select bus_type,price from price where (distance in (select distance from passenger where boarding_city in ('Panaji','Bengaluru') and Destination_city in ('Bengaluru','Panaji'))) group by bus_type;

# g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.
update passenger set category = 'Non-AC' where bus_type = 'Sleeper';
select * from passenger;

# h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
delete from passenger where passenger_name = 'Piyush';
commit;
select * from passenger;
# i.Truncate the table passenger and comment on the number of rows in the table (explain if required).
truncate table passenger;
#describe table passenger;
select * from passenger;
 
 # j.Delete the table passenger from the database.
 drop table passenger;











 
 
 
 


 
 

