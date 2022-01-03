// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract Testing {

    uint public count = 10;
    
    string public newString = "Hello";

    address private owner;


    function getTime() public returns (address, uint, uint){
        owner = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;

        return (owner, timestamp, blockNum);
    }

    function increment() public {
        count = count + 1;
    }

    function decrement() public {
        count = count - 1;
    }

    function getString() public view returns (string memory){

        return (newString);

    }

    function setString(string memory newValue) public returns (string memory) {

        return newString = newValue;
    }
    
}
