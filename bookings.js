document.addEventListener("DOMContentLoaded", function() {
    let tickets = document.querySelectorAll(".ticket");

    tickets.forEach(ticket => {
        let cancelBtn = document.createElement("button");
        cancelBtn.innerText = "Cancel Booking";
        cancelBtn.classList.add("cancel-btn");

        cancelBtn.addEventListener("click", function() {
            ticket.innerHTML = "<p style='color: red;'>Booking Canceled ❌</p>";
        });

        ticket.appendChild(cancelBtn);
    });
});
