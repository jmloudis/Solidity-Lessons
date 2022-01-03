contract Learning {

    // State Varaibles - store data on the blockchain, must be outside function 

    uint public newUnit = 123;
    address public owner;

    // Local Varables - A varaible inside a function, only exist if the function is executed 

    function example() external {

        uint localVaraible = 456;

        localVaraible += 789;

        owner = address(1);

    }


    function getTime() public returns (address, uint, uint){

        // Global varibles
        owner = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;

        return (owner, timestamp, blockNum);
    }

    // View - the body of the function will only reference local variables, not touching the blockchain.
    //      - Saves gas, 


    // require() - before i try this, before error handling.
    // revert() - error handling function, sends remaing gas back to caller
    // assert() - never expected to happen, worst thing to happen
    

    
    
}