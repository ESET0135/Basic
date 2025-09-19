import React, { useState } from "react";

function LoginFormEvents() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  // onChange with alerts
  const handleEmailChange = (e) => {
    setEmail(e.target.value);  // update state
    alert(`📧 Email changed: ${e.target.value}`);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value); // update state
    alert(`🔑 Password changed: ${e.target.value}`);
  };

  // onSubmit with alert
  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`📋 Submitted!\nEmail: ${email}\nPassword: ${password}`);

    if (email === "test@example.com" && password === "12345") {
      alert("✅ Login Successful!");
    } else {
      alert("❌ Invalid credentials!");
    }
  };

  return (
    <div style={{ maxWidth: "300px", margin: "auto", marginTop: "50px" }}>
      <h2>Login (Events & Alerts with useState)</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Email:</label><br />
          <input
            type="email"
            value={email}
            onChange={handleEmailChange}
            required
          />
        </div>

        <div style={{ marginTop: "10px" }}>
          <label>Password:</label><br />
          <input
            type="password"
            value={password}
            onChange={handlePasswordChange}
            required
          />
        </div>

        <button type="submit" style={{ marginTop: "15px" }}>
          Login
        </button>
      </form>
    </div>
  );
}

export default LoginFormEvents;
