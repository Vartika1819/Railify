function searchTrains() {
    let source = document.getElementById("source").value;
    let destination = document.getElementById("destination").value;
    let resultsDiv = document.getElementById("results");

    let dummyTrains = [
        { name: "Rajdhani Express", time: "10:00 AM", duration: "6h 30m", fare: "₹1200" },
        { name: "Shatabdi Express", time: "11:45 AM", duration: "5h 50m", fare: "₹1000" },
        { name: "Duronto Express", time: "2:00 PM", duration: "7h 15m", fare: "₹1100" },
        { name: "Superfast Express", time: "4:30 PM", duration: "8h 00m", fare: "₹950" },
    ];

    if (source === "" || destination === "") {
        resultsDiv.innerHTML = "<p style='color: red;'>Please select both source and destination.</p>";
        return;
    }

    resultsDiv.innerHTML = `<h3>Available Trains from ${source} to ${destination}:</h3>`;
    dummyTrains.forEach(train => {
        resultsDiv.innerHTML += `
            <div class="train">
                <h4>${train.name}</h4>
                <p>Departure: ${train.time} | Duration: ${train.duration} | Fare: ${train.fare}</p>
                <button>Book Now</button>
            </div>
        `;
    });
}
