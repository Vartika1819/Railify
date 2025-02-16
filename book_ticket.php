<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    die("Unauthorized Access");
}

$username = $_SESSION['username'];
$train_id = $_POST['train_id'];

$userQuery = "SELECT id FROM users WHERE username='$username'";
$userResult = $conn->query($userQuery);
$user = $userResult->fetch_assoc();
$user_id = $user['id'];

$sql = "INSERT INTO bookings (user_id, train_id, seat_number, status) VALUES ('$user_id', '$train_id', FLOOR(RAND() * 100), 'Confirmed')";

if ($conn->query($sql) === TRUE) {
    echo "<script>alert('Booking Successful!'); window.location.href='bookings.html';</script>";
} else {
    echo "<script>alert('Error booking ticket.'); window.location.href='index.html';</script>";
}
?>
