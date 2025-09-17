const dummyjson={"firstname":"SHubham","lastname":"Joshi"};

function EventComponent(){
    const onChangeHandler = (user) => { console.log(user.firstname) };

    const[username,setUsername]=React.useState("shubham");
    return(
       <div>
       <p>Welcome </p>

       <button onClick={()=>{console.log("button click")}}>click me</button>

       <div style={{background: 'red', padding: '50px'}}
       onMouseEnter={()=>{console.log("Mouse is entered")}}
       >
       <input type="text" onChange={(e) => { onChangeHandler(dummyjson) }}></input>
       </div>
       <input
         type="text"
         onChange={(e) => {
           onChangeHandler({ firstname: e.target.value, lastname: dummyjson.lastname });
         }}
       ></input>
       </div>   

    ); 
}  

export default EventComponent;