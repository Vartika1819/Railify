function login() {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let msg = document.getElementById("login-msg");

    if (username === "Vartika" && password === "123456") {
        msg.innerHTML = "<span style='color: green;'>Login Successful! Redirecting...</span>";
        setTimeout(() => {
            window.location.href = "dashboard.html"; // Redirect after login
        }, 1500);
    } else {
        msg.innerHTML = "<span style='color: red;'>Invalid Credentials</span>";
    }
}
