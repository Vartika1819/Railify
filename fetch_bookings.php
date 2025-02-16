<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    die("Unauthorized Access");
}

$username = $_SESSION['username'];

$userQuery = "SELECT id FROM users WHERE username='$username'";
$userResult = $conn->query($userQuery);
$user = $userResult->fetch_assoc();
$user_id = $user['id'];

$sql = "SELECT bookings.booking_id, trains.train_name, trains.source, trains.destination, bookings.status 
        FROM bookings 
        JOIN trains ON bookings.train_id = trains.train_id 
        WHERE bookings.user_id = '$user_id'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='ticket'>";
        echo "<h3>" . $row['train_name'] . "</h3>";
        echo "<p>From: " . $row['source'] . " → " . $row['destination'] . "</p>";
        echo "<p>Status: " . $row['status'] . "</p>";
        echo "<button onclick='cancelBooking(" . $row['booking_id'] . ")'>Cancel</button>";
        echo "</div>";
    }
} else {
    echo "<p>No bookings found.</p>";
}
?>
