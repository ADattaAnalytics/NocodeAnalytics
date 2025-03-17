CREATE DATABASE ola;
Use ola;
#Retrieve all Successful Bookings;
Create View Successful_Bookings As
SELECT*FROM bookings
WHERE Booking_Status = 'Success';
Select *From Successful_Bookings;
#Find the Average ride distance for Each Vehicle Type;
Create View ride_distance_for_Each_Vehicle_type As
Select Vehicle_Type, Avg(Ride_Distance)
As avg_distance From bookings
Group By Vehicle_Type;
Select * From ride_distance_for_Each_Vehicle_type;
#Get the total Number of Cancelled Rides by Customers:
Select Count(*) From bookings
Where Booking_Status = 'Canceled by Customer';
#top 5 customers who booked the highest number of rides
Create View Top_5_Customer As
Select Customer_ID, Count(Booking_ID)
as total_rides
From bookings
Group by Customer_ID
Order by total_rides DESC LIMIT 5;
select * from Top_5_Customer;
##5. Get the number of rides canceled by drivers due to personal and car-related issues:
Create View Canceled_by_drivers As
SELECT Count(*) From bookings
Where Canceled_Rides_by_driver = 'Personal & Car related issue';
Select * From Canceled_by_drivers;
#6 Find the Maximum & Minimum driver ratings for Prime Sedan bookings:
Create View Driver_rating_PS as
Select Max(Driver_Ratings) as Max_ratings,
Min(Driver_Ratings) as Min_ratings
From bookings Where Vehicle_Type = "Prime Sedan";
Select * From Driver_rating_PS;
#6 Retrieve all rides Where Payement was made Using UPI:
SELECT * From bookings
Where Payment_Method='UPI';
#8 Find the average customer rating per vehicle type:
Create View Vehicle_ratings_customer As
SELECT Vehicle_Type, AVG (Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type
Order BY avg_customer_rating ASC;
Select *from Vehicle_ratings_customer;
#9 Calculate the total booking value of rides completed successfully
Create View Successful_rides As
Select SUM(Booking_Value) as total_successful_value
From bookings
Where Booking_Status = 'Success';
Select*From Successful_rides;
#10 List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_list As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
Where Incomplete_Rides = 'Yes';
SELECT*FROM incomplete_rides_list;