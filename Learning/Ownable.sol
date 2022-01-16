// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// state variables 
// global variables
// function modifier 
// function 
// error handling

contract Ownable{

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    // Only owner can set the new owner - modifier 

    function setOwner(address _newOwner) external onlyOwner {

        // If new owner address is not 0, continue
        require(_newOwner != address(0), "invalid address");
        // Continue 
        owner = _newOwner;

    }

    function onlyOwnerCanCallThisFunc() external onlyOwner{
        // code
    }

    function anyoneCanCallThisFunc() external pure returns (string memory){
        return "this function is for anyone";
    }

}