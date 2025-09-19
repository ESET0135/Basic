import React, { useState } from "react";

function LoginFormDefault() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (email === "test@example.com" && password === "12345") {
      alert("✅ Login Successful!");
    } else {
      alert("❌ Invalid credentials!");
    }
  };

  return (
    <div style={{ maxWidth: "300px", margin: "auto", marginTop: "50px" }}>
      <h2>Login (Default Behaviour)</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Email:</label><br />
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)} // just updates state
            required
          />
        </div>

        <div style={{ marginTop: "10px" }}>
          <label>Password:</label><br />
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)} // just updates state
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

export default LoginFormDefault;
