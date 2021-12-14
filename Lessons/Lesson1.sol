pragma solidity ^0.6.7;

contract Lesson1 {

    // Opposite of Java - private String firstName;
    string private name;
    uint private age;


    function setName(string memory newName) public {
        
        name = newName;

    }
    
    // same

    function getName() public view returns (string memory) {
        return name;
        

    }

    constructor() public {
        name = "myName";
    }

}