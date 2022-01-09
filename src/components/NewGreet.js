import '../App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import Greeter from '../artifacts/contracts/Greeter.sol/Greeter.json'

//const greeterAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

// Greeter Address
const greeterAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

function NewGreet() {

    const [greeting, setGreetingValue] = useState('')
    // async - await a return value
  
    async function requestAccount() {
      await window.ethereum.request({
        method: 'eth_requestAccounts'
      });
    }
  
    async function fetchGreeting() {
      if (typeof window.ethereum !== 'undefined') {  
        const provider = new ethers.providers.Web3Provider(window.ethereum)
        const contract = new ethers.Contract(greeterAddress, Greeter.abi, provider)
        try{
          const data = await contract.greet()
          console.log('data: ', data)
        } catch (error) {
          console.log('error: ', error)
        }
      }
    }
  
    async function setGreeting() {
  
      if (!greeting) return
      if (typeof window.ethereum != 'undefined') {
        await requestAccount()
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract(greeterAddress, Greeter.abi, signer)
        const transaction = await contract.setGreeting(greeting)
        setGreetingValue('')
        await transaction.wait()
        fetchGreeting()
      }
  
    }
  
    return (
      <div className="greeting-header">
          <input 
            onChange={i => setGreetingValue(i.target.value)}
            placeholder='Set Greeting'
            value={greeting}
          />
          
          <button onClick={fetchGreeting}>Fetch Greeting </button>
          <button onClick={setGreeting}>Set Greeting </button>

      </div>
    );
}

export default NewGreet;