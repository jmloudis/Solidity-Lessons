// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Errors{


    // Errors

    // require() - before i try this, before error handling. ( Use this first ) 

    // revert() - error handling function, sends remaing gas back to caller 
    //            Revert is better is coindition is nested in IF statements

    // assert() - never expected to happen, worst thing to happen 
    //            used to check for a condition that should always be true

    // Custom Errors - save gas

    // - gas refund when error is found, state updates are reverted 

    function testRequire(uint _i) public pure {

        require(_i <= 10, "i > 10");
        // passes - more code

    }

    function testRevert(uint _i) public pure {
        if (_i > 1){
            // code
            if (_i > 2){
                // more code
                if (_i > 10){
                    revert("i > 10");
                }
            }
        }
    }

    // Assert

    uint public num =123;

    function testAssert() public view {

        assert(num ==123);
    }

    function foo(uint _i) public {
        // accidently update num 
        // num += 1;

        num += 1;
        require(_i < 10);
    }



    error MyError(address caller, uint i);

    function testCustomError(uint _i) public view {
        require( _i < 10, "Very long error message takes up gas");
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }

}