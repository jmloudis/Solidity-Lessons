// SPDX-License-Identifier: MIT

// Custom Modifiers and Error handling

pragma solidity ^0.8.7;

interface Regulator {
    function checkValue(uint amount) external returns (bool);
    function loan() external returns (bool);
}

contract Bank is Regulator{

    // The internal modifer means that the function 
    // can only be called within the contract itself and any derived contracts.
    // ex. uint internal myInternalValue

    // The address modifer means 

    uint private bankValue;
    address private owner;

    modifier ownerFunc {
        require(owner == msg.sender);
        _;

    }

    constructor(uint amount) {

        bankValue = amount;
        owner = msg.sender;
    }

    function deposit(uint amount) public ownerFunc {
        bankValue += amount;
    }

    function withdrawel(uint amount) public ownerFunc {

        if (checkValue(amount)){
             bankValue -= amount;

        }
    }

    function balance() public view returns (uint) {

        return bankValue;
    }

    // Override

    function checkValue(uint amount) public override view returns (bool) {

        return bankValue > amount;

    }

    function loan() public override view returns (bool) {

        return bankValue > 0;

    }

}

contract Lesson2 is Bank(10) {

    // Opposite of Java - private String firstName;
    string private name;
    uint private age;


    function setName(string memory newName) public {
        
        name = newName;

    }

    function getName() public view returns (string memory) {
        return name;

    }

    function setAge(uint newAge) public {
        age = newAge;
    }

    function getAge() public view returns (uint) {
        return age;

    }  

}

// contract testThrows {

//     function testAssert() {

//     }

//     function testRequire() {

//     }

//     function Revert() {

//     }

// }