// SPDX-License-Identifier: MIT

// Data Types

pragma solidity ^0.8.7;


contract DataTypes {

    bool myBool = true;
    
    // Signed integer - can be both negative and positive
    // defined in bytes 8 - 256 (divisble by 9)

    // int8 max values from -128 to 128
    int8 myInt = -128;

    // Unsigned integer - can only be positive

    // uint8 max value from 0 to 255
    uint8 myUint = 255; 

    string myString;
    uint8[] myStringArr;

    bytes myValue;
    bytes1 myBytes1;
    bytes32 myBytes32;

    // fixed point number

    // fixed 8x1 myFixed = 128; // 128

    // ufixed 256x1 myFixed;

    enum Action {ADD, REMOVE, UPDATE}

    address myAddress;

    function assignAddress() public {
        myAddress = msg.sender;
        myAddress.balance;
    }

    uint[] myIntArr = [1,2,3];

    function arrFunc() public {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];

    }

    uint[10] myFixedArr;

    struct Account {

        uint balance;
        uint dailyLimit;

    }

    Account myAccount;

    function structFunc() public {
        myAccount.balance = 100;
    }

    mapping (address => Account) _accounts;
    
    // pass any value into balance. 

    function mappingFunc() public payable{
        _accounts[msg.sender].balance += msg.value;
    }

    function getBalance() public view returns (uint) {
        return _accounts[msg.sender].balance;
    }
    

}