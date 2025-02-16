# 🚆 Railify - Railway Management System

**Railify** is a web-based **Railway Management System** that allows users to search for trains, view schedules, and book tickets efficiently. This project is built using **HTML, CSS, JavaScript (Frontend)** and **PHP & MySQL (Backend).**

## 📌 Features
✅ **User Authentication** (Login & Logout)  
✅ **Search for Trains** based on source & destination  
✅ **View Available Trains** with schedules  
✅ **Book Tickets** for selected trains  
✅ **View & Cancel Bookings**  

## 📂 Project Structure
```
Railify/
│── db.php                   # Database Connection
│── login.php                # User Authentication
│── search_trains.php        # Train Search Logic
│── book_ticket.php          # Booking Functionality
│── fetch_bookings.php       # Fetch Bookings
│── index.html               # Homepage (Train Search)
│── login.html               # Login Page
│── dashboard.html           # User Dashboard
│── bookings.html            # View Bookings Page
│── styles.css               # Styling for UI
│── script.js                # JavaScript for UI Interactions
│── railify.sql              # Database Schema & Dummy Data
│── README.md                # Project Documentation
```

## 🔧 Installation Guide
### Step 1: Clone Repository
```bash
git clone https://github.com/hanushrajputh/Railify.git
cd Railify
```

### Step 2: Setup Database
1. Open **MySQL Workbench**.
2. Create a new database:  
   ```sql
   CREATE DATABASE railify;
   ```
3. Import `railify.sql` to set up tables and data.

### Step 3: Configure Database Connection
- Open `db.php` and update your MySQL credentials if needed:
  ```php
  $host = "localhost";
  $user = "root";  // Change if different
  $pass = "";      // Add password if set
  $dbname = "railify";
  ```

### Step 4: Start Local Server
If using **XAMPP**, move the project folder inside `htdocs`, then start **Apache & MySQL**.

Access the project at:  
`http://localhost/Railify/`

## 🔑 Default Login Credentials
**Username:** `Vartika`  
**Password:** `123456`  

## 📊 Database Schema
The project contains three tables:

### 1️⃣ Users Table
| Column  | Type         | Description          |
|---------|-------------|----------------------|
| id      | INT (PK)    | User ID              |
| username | VARCHAR(50) | Unique username     |
| password | VARCHAR(255) | User password      |

### 2️⃣ Trains Table
| Column         | Type         | Description             |
|---------------|-------------|-------------------------|
| train_id      | INT (PK)    | Unique Train ID        |
| train_name    | VARCHAR(100) | Name of the train      |
| source        | VARCHAR(50)  | Source station        |
| destination   | VARCHAR(50)  | Destination station   |
| departure_time| TIME         | Departure Time        |
| arrival_time  | TIME         | Arrival Time          |
| seats_available | INT       | Available Seats       |
| price        | DECIMAL(10,2) | Ticket Price         |

### 3️⃣ Bookings Table
| Column      | Type         | Description             |
|------------|-------------|-------------------------|
| booking_id | INT (PK)    | Booking ID             |
| user_id    | INT (FK)    | User who booked        |
| train_id   | INT (FK)    | Train booked           |
| seat_number | INT        | Assigned Seat Number   |
| status      | ENUM       | Booking Status         |

## 📌 Dummy Data
The database includes **6 train routes** for demonstration:

| Train Name        | Source       | Destination      | Departure  | Arrival  | Seats | Price |
|------------------|-------------|-----------------|------------|---------|------|------|
| Rajdhani Express | New Delhi   | Mumbai         | 10:00 AM   | 10:30 PM | 120 | ₹1500 |
| Shatabdi Express | Chennai     | Kolkata        | 06:30 AM   | 06:15 PM | 100 | ₹1200 |
| Duronto Express  | Bangalore   | Delhi          | 09:00 AM   | 11:45 PM | 80  | ₹1800 |
| Garib Rath      | Pune        | Lucknow        | 12:00 PM   | 06:00 AM | 150 | ₹900  |
| Tejas Express   | Mumbai      | Ahmedabad      | 03:30 PM   | 08:45 PM | 60  | ₹2000 |
| Vande Bharat    | Hyderabad   | Visakhapatnam  | 07:15 AM   | 12:00 PM | 90  | ₹1300 |

## 🎯 To-Do (Future Enhancements)
✔ Integrate **payment gateway** for real bookings  
✔ Implement **seat selection feature**  
✔ Add **real-time train tracking**  

## 📜 License
This project is for educational purposes. Feel free to use and modify! 🚀

🚆 **Developed by Hanush Singh Rajputh** | 🔥 **Best UI & DBMS Project Submission!**
