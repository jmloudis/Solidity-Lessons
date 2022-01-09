import React, { useEffect, useState } from 'react';
import { ethers } from 'ethers';
// import TokenArtifact from '../artifacts/contracts/Vote.sol/Vote.json';
// import contractAddress from '../A';
import voting from '../artifacts/contracts/Vote.sol/Vote.json';
import { parseName, parseBytes } from '../utils/parse';
import { parseBytes32String } from 'ethers/lib/utils';
import token from '../artifacts/contracts/Vote.sol/Vote.json';

const votingAddress = "0x959922bE3CAee4b8Cd9a407cc3ac1C251C2007B1"

function Dapp() {

    
        const [contracts, setContract] = useState();
        const [proposals, setProposals] = useState([]);
        const [chairperson, setChairperson] = useState('');

        async function _initialize() {

          await _intializeEthers();

        }
        
        const _intializeEthers = async () => {
    
            // ethers connection for the smartcontract
            const provider = new ethers.providers.Web3Provider(window.ethereum);
        
            //const _token = new ethers.Contract(contractAddress.Token, TokenArtifact.abi,_provider.getSigner(0));
            const contract = new ethers.Contract(votingAddress, voting.abi, provider.getSigner(0));
        
            // get the chairman address
            const newChairperson = await contract.chairperson();

            const newProposal = await contract.getAllProposals();
        
            // save the token data into a hook to reuse it along the app
            setContract(contract);
            setProposals(newProposal);
            setChairperson(newChairperson);

        };

        const voteProposal = async (proposal) => {
            await contracts.vote(proposal)
        };
        
        // Connects to the smart contract token id (check /contracts/contract-address.json)
        
        async function init() {

            const [selectedAddress] = await window.ethereum.enable();
            _initialize(selectedAddress);

        }
        
        useEffect(() => {
          // When the page loads it will initialize the init function
          // that we need to connect the frontend with the smartcontract
          init();
         }, []);
        
        return (
            <div className="greeting-header">
           <h1>Voting System</h1>
           <div>
            <h4>chairperson: {chairperson}</h4>
            <h4>proposal:</h4>
            {proposals.map((proposal, index) => {
                const name = parseName(parseBytes(proposal.name));
                const voteCount = proposal.voteCount._hex;
                return (
                <div key={index} style={{ padding: '1rem 0' }}>
                    🗳 {name} - {Number(voteCount)}
                    <button
                    style={{ marginLeft: '2em' }}
                    onClick={() => voteProposal(index)}>
                    Vote
                    </button>
                </div>
                );
            })}
           </div>
          </div>
         );
}



export default Dapp;

