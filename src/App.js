import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import Greet from './components/NewGreet.js';
import Tokens from './components/NewToken.js';
import Votes from './components/Dapp.js'

function App() {
  return (
    <div className="app">
      <header className="app-header">
      <h3>dApp React</h3>
        <div className="app_wrapper">
            <Greet />
            <Tokens />
            <Votes />
        </div>
      </header>
    </div>
  );
}


export default App;
