import { useState } from "react";

function App() {
  const [count, setCount] = useState(0);

  // Move these functions inside App to access count and setCount
  function incrementCount() {
    setCount(count + 1);
  }

  function decrementCount() {
    setCount(count - 1);
  }

  return (
    <div>
      <div>{count}</div>
      <button onClick={incrementCount}>increase</button>
      <button onClick={decrementCount}>decrease</button>
    </div>
  );
}

export default App;