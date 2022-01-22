// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract ViewPure{

    uint public number;

    // View - the body of the function will only reference local variables, not touching the blockchain. can READ from the blockchain
    //      - Saves gas, 

    function viewFunc() public view returns(uint) {
        return number;
    }

    function addToNum(uint x) external view returns (uint) {
        return number + x;
    }

    // Pure - does not modify or read anything from the blockchain. 

    function pureFunc() public  pure returns (uint) {
        return 1;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

}