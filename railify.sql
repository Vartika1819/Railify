CREATE DATABASE railify;
USE railify;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Trains Table
CREATE TABLE trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    seats_available INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Bookings Table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    train_id INT,
    seat_number INT NOT NULL,
    status ENUM('Confirmed', 'Waiting') DEFAULT 'Confirmed',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

-- Dummy Data for Trains
INSERT INTO trains (train_name, source, destination, departure_time, arrival_time, seats_available, price) 
VALUES 
('Rajdhani Express', 'New Delhi', 'Mumbai', '10:00:00', '22:30:00', 120, 1500),
('Shatabdi Express', 'Chennai', 'Kolkata', '06:30:00', '18:15:00', 100, 1200),
('Duronto Express', 'Bangalore', 'Delhi', '09:00:00', '23:45:00', 80, 1800),
('Garib Rath', 'Pune', 'Lucknow', '12:00:00', '06:00:00', 150, 900),
('Tejas Express', 'Mumbai', 'Ahmedabad', '15:30:00', '20:45:00', 60, 2000),
('Vande Bharat', 'Hyderabad', 'Visakhapatnam', '07:15:00', '12:00:00', 90, 1300);

-- Dummy User for Login
INSERT INTO users (username, password) VALUES ('Vartika', '123456');
