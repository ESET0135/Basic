import React from "react";
import LoginFormDefault from "./components/LoginFormDefault";
import LoginFormEvents from "./components/LoginFormEvents";
import LoginFormWithEffect from "./components/LoginFormWithEffects.js";

function App() {
  return (
    <div>
      <h1 style={{ textAlign: "center" }}>React Login Forms with useState & useEffect</h1>

      {/* Default behaviour */}
      <LoginFormDefault />

      <hr style={{ margin: "40px 0" }} />

      {/* Event behaviour */}
      <LoginFormEvents />

      <hr style={{ margin: "40px 0" }} />

      {/* useEffect demo */}
      <LoginFormWithEffect />
    </div>
  );
}

export default App;
