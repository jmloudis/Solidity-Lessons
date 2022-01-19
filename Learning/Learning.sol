// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Learning {




    // State Varaibles - store data on the blockchain, must be outside function (i)
    // Local Varables - A varaible inside a function, only exist if the function is executed (_i)

    uint public newUnit = 123;
    address public owner;
    uint public number;
    string public newString = "String";

    // Constant - Saves gas when function calls state variable. 
    uint public constant NEW_NUM = 123;

    // Default Variables
    bool public b; // false
    uint public u; // 0
    int  public i; // 0
    address public a; // 0x0000000000000000000000000000000000000000

    // Public - Most expensive, equivalent to = external + internal 
    // External - You should try to use external if the function will be called externally and not internally, Costs less than Public 
    // Internal = Opposite of External should be called if the function is called internally. Cheapest unless a public function is called.

    function getString() external view returns (string memory){

        return (newString);

    }

    function setString(string memory newValue) external view returns (string memory) {
        return newValue = newString;
    }


    function getTime() public returns (address, uint, uint){

        // Global varibles
        owner = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;

        return (owner, timestamp, blockNum);
    }

   

    
    
}