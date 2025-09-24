import {useContext} from 'react'
import { Context } from '../App'

export default function GopalComponent() {
  const { theme, setTheme, count, setcount } = useContext(Context)
  return (
    <div>
      {theme}
      <button onClick={()=>setTheme("dark")}>Change theme</button>
    </div>
  )
}