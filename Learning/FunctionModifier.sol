// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FunctionModifier{

    // Function Modifier - reuse code before and / or after function
    // Basic, Inputs, and sandwich

    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused{
        // require(!paused, "paused");
        count += 1;
    }

    function dec() external whenNotPaused{
        // require(!paused, "paused");
        count -= 1;
    }



    modifier cap(uint _x) {
        require( _x < 100, "x >= 100");

        // execute to the rest of contract
        _;
    }

    function IncBy(uint _x) external whenNotPaused cap(_x) {
        // require( _x < 100, "x >= 100");
        count += _x;
    }


    // Sandwich

    modifier sandwich() {

        // code
        count += 10;
        _;

        // executes and runs more code
        count *= 2;

    }

    function foo() external sandwich {
        
        count += 1;

    }


}