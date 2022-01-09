import '../App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import Token from '../artifacts/contracts/Token.sol/Token.json'


// Token Address
const tokenAddress = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"

function NewToken() {

    const [userAccount, setUserAccount] = useState('')
    const [amount, setAmount] = useState(0)

    async function requestAccount() {
      await window.ethereum.request({
        method: 'eth_requestAccounts'
      });
    }

    async function getBalance(){
        if (typeof window.ethereum !== 'undefined') {
          const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' })
          const provider = new ethers.providers.Web3Provider(window.ethereum);
          const contract = new ethers.Contract(tokenAddress, Token.abi, provider)
          const balance = await contract.balanceOf(account);
          console.log("Balance: ", balance.toString());
        }
    }

    async function sendToken() {
        if (typeof window.ethereum !== 'undefined') {
          await requestAccount()
          const provider = new ethers.providers.Web3Provider(window.ethereum);
          const signer = provider.getSigner();
          const contract = new ethers.Contract(tokenAddress, Token.abi, signer);
          const transation = await contract.transfer(userAccount, amount);
          await transation.wait();
          console.log(`${amount} Coins successfully sent to ${userAccount}`);
        }
    }

    return (
        <div className="greeting-header">
            
              <input onChange={i => {setUserAccount(i.target.value)}} placeholder="Account ID"/>
              <input onChange={i => {setAmount(i.target.value)}} placeholder="Amount"/>
  
      
              <button onClick={getBalance}>Get Balance</button>
              <button onClick={sendToken}>Send Token</button>
  
  

            
        </div>
      );

}

export default NewToken;