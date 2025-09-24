import { use, useState } from "react"

const useFetch = (url) => {
    const [loading,setLoading] = useState(false)
    const [data,setData] = useState(null)
    const [error,setError] = useState(null)
    const useEffect(null)

    const getData=async ()=>{
        try {
            setLoading(true)
            // fetch(url,{
            //     headers:{
            //         'authorization':`Bearer ${localStorage.getItem('token')}`
            const response = await axios.get(url)
            setData(response.data)
        } catch (error) {
            setError(error)
        } finally {
            setLoading(false)
        }
    }
    useEffect(()=>{ getData() },[url])  
    

    return {loading,data,error}
}