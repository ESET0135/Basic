function Countes()
{
    console.log(x);
    var x=5;
    let count=0;
    const add=(a,b)=>a+b;
    console.log(add(3,2));

    const increment=()=>{
        count++;
        document.getElementById("c1").innerText=count;
    }

    const user={name :"SJ",info:"sdfsd"}

    const{name,info}=user
    console.log(name)

    let a=4,b=7;
    [a,b]=[b,a]
    console.log(a,b)


    const prev = {name:'S',age:20};
    const next ={...prev,age:30};
    console.log(prev.age,next.age,next.name)











    return (
        <>
        
            <h1 id="c1">0</h1>
            <button onClick={increment}>INC</button>
        </>

        

        
    )
}
export default Countes;