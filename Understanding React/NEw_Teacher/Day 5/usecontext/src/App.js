import React, { useState, createContext } from 'react';
import Usecontext from './Component/Usecontext';
import GopalComponent from './Component/GopalComponent.js';
import Usereducer from './Component/Usereducer';
import Callanapi from './Component/Callanapi';

const Context = React.createContext(null);
export { Context };

function App() {
  const [theme, setTheme] = useState("light");
  const [count, setcount] = useState(0);

  return (
    <div className="App">
      <Context.Provider value={{ theme, setTheme, count, setcount }}>
        <div>Welcome to react app</div>
        {/* <Usecontext />
        <GopalComponent />
        <Usereducer /> */}
        
      </Context.Provider>
      <Callanapi />
    </div>
  );
}

export default App;