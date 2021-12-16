// SPDX-License-Identifier: MIT

// Event Logging and Transaction Information

pragma solidity ^0.8.7;

contract Transaction {

    event SenderLogger(address);
    event ValueLogger(uint);

    address private owner;

    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }


    constructor()  {

        // Should only be called once by yourself
        owner = msg.sender;
        
    }

    // Fallback function
    // Can send eth to contract

    fallback() external payable isOwner validValue {

        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);

    }



}