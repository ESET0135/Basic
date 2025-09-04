function Counter(){
  let count=0;
  const increment =()=>{
    count++;
    document.getelementbyID('c1').innertext=count;
  }

  return (
    <div>
        <h1 id='c1'>0</h1>
        <button onClick={increment}>INC</button> 
    </div>
    );
  
}
export default Counter;

  
