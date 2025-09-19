import React, { useState, useEffect } from "react";

function LoginFormWithEffect() {
  // track input and state
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [loggedIn, setLoggedIn] = useState(false);
  const [suggestions, setSuggestions] = useState([]);

  // some usernames already stored
  const users = ["alice", "alex", "albert", "bob", "bobby", "carol", "charlie"];

  // run every time username changes
  useEffect(() => {
    if (username === "") {
      setSuggestions([]);
    } else {
      const filtered = users.filter((u) =>
        u.toLowerCase().startsWith(username.toLowerCase())
      );
      setSuggestions(filtered);
    }
  }, [username]);

  // when form is submitted
  const handleSubmit = (e) => {
    e.preventDefault();
    if (username === "alice" && password === "12345") {
      setLoggedIn(true);
    } else {
      alert("Invalid login");
    }
  };

  // show alert only when loggedIn changes
  useEffect(() => {
    if (loggedIn) {
      alert("Welcome " + username);
    }
  }, [loggedIn]);

  return (
    <div>
      <h3>Login</h3>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Username:</label><br />
          <input
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>

        {/* simple suggestions list */}
        {suggestions.length > 0 && (
          <ul>
            {suggestions.map((s, i) => (
              <li key={i} onClick={() => setUsername(s)}>
                {s}
              </li>
            ))}
          </ul>
        )}

        <div>
          <label>Password:</label><br />
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>

        <button type="submit">Login</button>
      </form>
    </div>
  );
}

export default LoginFormWithEffect;
