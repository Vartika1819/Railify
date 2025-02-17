-- 🚀 Create Database
DROP DATABASE IF EXISTS railway_management;
CREATE DATABASE railway_management;
USE railway_management;

-- 🚉 Create Stations Table
CREATE TABLE stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

-- Insert Dummy Data for Stations
INSERT INTO stations (station_name, location) VALUES
('Mumbai Central', 'Mumbai'),
('New Delhi', 'Delhi'),
('Kolkata Terminal', 'Kolkata'),
('Chennai Central', 'Chennai'),
('Bangalore City', 'Bangalore');

-- 🚆 Create Trains Table
CREATE TABLE trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL UNIQUE,
    source_station INT,
    destination_station INT,
    departure_time TIME,
    arrival_time TIME,
    total_seats INT CHECK (total_seats > 0),
    available_seats INT CHECK (available_seats >= 0),
    FOREIGN KEY (source_station) REFERENCES stations(station_id) ON DELETE CASCADE,
    FOREIGN KEY (destination_station) REFERENCES stations(station_id) ON DELETE CASCADE
);

-- Insert Dummy Data for Trains
INSERT INTO trains (train_name, source_station, destination_station, departure_time, arrival_time, total_seats, available_seats) VALUES
('Hanush Express', 1, 2, '10:00:00', '18:00:00', 200, 150),
('Rajdhani Express', 2, 3, '12:00:00', '20:00:00', 250, 200),
('Duronto Express', 3, 4, '06:30:00', '14:30:00', 180, 100),
('Shatabdi Express', 4, 5, '08:00:00', '16:00:00', 220, 180);

-- 👥 Create Passengers Table
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 5),
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(15) UNIQUE
);

-- Insert Dummy Data for Passengers
INSERT INTO passengers (full_name, age, gender, contact_number) VALUES
('Amit Sharma', 28, 'Male', '9876543210'),
('Priya Mehta', 24, 'Female', '9876543221'),
('Ravi Kumar', 35, 'Male', '9876543232'),
('Sneha Roy', 29, 'Female', '9876543243');

-- 🎫 Create Ticket Bookings Table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    seat_number VARCHAR(10) NOT NULL UNIQUE,
    booking_date DATE DEFAULT (CURDATE()),
    status ENUM('Confirmed', 'Cancelled', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE,
    FOREIGN KEY (train_id) REFERENCES trains(train_id) ON DELETE CASCADE
);

-- Insert Dummy Data for Bookings
INSERT INTO bookings (passenger_id, train_id, seat_number, booking_date, status) VALUES
(1, 1, 'A1-12', '2025-02-15', 'Confirmed'),
(2, 2, 'B2-15', '2025-02-16', 'Confirmed'),
(3, 3, 'C3-8', '2025-02-17', 'Pending'),
(4, 4, 'D4-20', '2025-02-18', 'Cancelled');

-- 👨‍💼 Create Employees Table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0),
    station_id INT,
    FOREIGN KEY (station_id) REFERENCES stations(station_id) ON DELETE SET NULL
);

-- Insert Dummy Data for Employees
INSERT INTO employees (full_name, position, salary, station_id) VALUES
('Ramesh Gupta', 'Station Manager', 75000.00, 1),
('Anita Verma', 'Ticket Collector', 45000.00, 2),
('Kunal Patel', 'Train Conductor', 55000.00, 3),
('Pooja Singh', 'Booking Clerk', 40000.00, 4);

-- 💰 Create Subscriptions Table
CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    subscription_type ENUM('Monthly', 'Quarterly', 'Yearly'),
    start_date DATE DEFAULT (CURDATE()),
    expiry_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id) ON DELETE CASCADE
);

-- Insert Dummy Data for Subscriptions
INSERT INTO subscriptions (passenger_id, subscription_type, start_date, expiry_date) VALUES
(1, 'Monthly', '2025-02-01', '2025-02-28'),
(2, 'Quarterly', '2025-02-01', '2025-04-30'),
(3, 'Yearly', '2025-02-01', '2026-01-31');

-- ✅ Show All Tables
SHOW TABLES;

-- ✅ View Data in Each Table
SELECT * FROM stations;
SELECT * FROM trains;
SELECT * FROM passengers;
SELECT * FROM bookings;
SELECT * FROM employees;
SELECT * FROM subscriptions;

-- 🔍 Advanced Queries for Analysis

-- 🚆 Find all trains departing from 'Mumbai Central'
SELECT t.train_name, s.station_name AS source, d.station_name AS destination, t.departure_time
FROM trains t
JOIN stations s ON t.source_station = s.station_id
JOIN stations d ON t.destination_station = d.station_id
WHERE s.station_name = 'Mumbai Central';

-- 🎫 Show confirmed bookings with passenger details
SELECT b.booking_id, p.full_name, t.train_name, b.seat_number, b.booking_date, b.status
FROM bookings b
JOIN passengers p ON b.passenger_id = p.passenger_id
JOIN trains t ON b.train_id = t.train_id
WHERE b.status = 'Confirmed';

-- 👨‍💼 Show employees working at each station
SELECT e.full_name AS employee, e.position, s.station_name
FROM employees e
JOIN stations s ON e.station_id = s.station_id
ORDER BY s.station_name;

-- 🚀 Check which trains have more than 50 available seats
SELECT train_name, available_seats FROM trains WHERE available_seats > 50;

-- 📅 Find passengers with active yearly subscriptions
SELECT p.full_name, s.subscription_type, s.expiry_date
FROM subscriptions s
JOIN passengers p ON s.passenger_id = p.passenger_id
WHERE s.subscription_type = 'Yearly' AND s.expiry_date > CURDATE();
