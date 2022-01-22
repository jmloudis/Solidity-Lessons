// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


// Allows for effiecient lookup
// Set, get, delete

contract Mapping{

    // ["Alice", "Bob, "Charlie"] - Array Lookup
    // {"alice": true, "Bob": true, "Charlie": true} - mapping 
    
    // mapping (key => value)

    // This mapping represents a balance of each address
    mapping(address => uint) public balances;

    //Nested Mapping

    // This mapping represent if the addresses are friends with each other. 
    mapping(address => mapping(address => bool)) public isFriend;


    function example() external {
        balances[msg.sender] == 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // 0

        balances[msg.sender] += 456; // 123 + 456 = 579

        delete balances[msg.sender]; // 0


        isFriend[msg.sender][address(this)] = true;

    }



}