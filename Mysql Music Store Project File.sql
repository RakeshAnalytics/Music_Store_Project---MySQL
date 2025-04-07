CREATE DATABASE Music_Store_Data_Project;

USE Music_Store_Data_Project;

SELECT * FROM album;
SELECT * FROM album2;
SELECT * FROM artist;
SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM genre;
SELECT * FROM invoice;
SELECT * FROM invoice_line;
SELECT * FROM media_type;
SELECT * FROM playlist;
SELECT * FROM playlist_track;
SELECT * FROM track

1. -- Who is the senior most employee based on job title?  -- 

SELECT first_name, last_name,title
FROM employee
ORDER BY levels DESC
LIMIT 1;
------------------------------------------------------------------------------------------------------------------

-- 2.-Which countries have the most Invoices? --

SELECT billing_country, COUNT(invoice_id) AS Invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY Invoice_count DESC
LIMIT 1;
--------------------------------------------------------------------------------------------------------------------------

--3-- What are top 3 values of total invoice?  ----

SELECT invoice_id, ROUND(SUM(total),0) AS Total_Invoice
FROM invoice
GROUP BY invoice_id
ORDER BY Total_Invoice DESC
LIMIT 3;

----------------------------------------------------------------------------------------------------------------------------------------------------
--4.-- Which city has the best customers? 

-- We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals  
SELECT billing_city, ROUND(SUM(total),0) AS Total_revenue
FROM invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;
-----------------------------------------------------------------------------------------------------
-- --5-- Who is the best customer? 
-- The customer who has spent the most money will be declared the best customer.
--  Write a query that returns the person who has spent the most money.

SELECT C.first_name, C.last_name,  ROUND(SUM(I.total),0) AS Most_Spent_Money
FROM customer C
JOIN 
invoice I
ON C.customer_id = I.customer_id
GROUP BY C.first_name, C.last_name
ORDER BY Most_Spent_Money DESC 
LIMIT 1;
----------------------------------------------------------------------------------------------------------------


