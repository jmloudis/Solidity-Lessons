// SPDX-License-Identifier: MIT

// Imports and Libraries

pragma solidity ^0.8.7;

library IntExtended{

    // "_" is a special character that is used in functional modifiers.
    //  It returns the flow of execution to the original function that is annotated.

    // Pure functions ensure that they do not read or modify the state.

    function increment(uint _self) public pure returns (uint){

        return _self+1; 

    }

    function decrement(uint _self) public pure returns (uint) {
        return _self-1;
    }

    function incrementByValue(uint _self, uint _value) public pure returns (uint) {
        return _self + _value;

    }

    function decrementByValue(uint _self, uint _value) public pure returns (uint) {
        return _self - _value;

    }

}