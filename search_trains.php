<?php
include 'db.php';

$source = $_POST['source'];
$destination = $_POST['destination'];

$sql = "SELECT * FROM trains WHERE source='$source' AND destination='$destination'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='train'>";
        echo "<h3>" . $row['train_name'] . "</h3>";
        echo "<p>Departure: " . $row['departure_time'] . " | Arrival: " . $row['arrival_time'] . "</p>";
        echo "<p>Seats Available: " . $row['seats_available'] . " | Price: ₹" . $row['price'] . "</p>";
        echo "<button onclick='bookTrain(" . $row['train_id'] . ")'>Book Now</button>";
        echo "</div>";
    }
} else {
    echo "<p>No trains available for the selected route.</p>";
}
?>
