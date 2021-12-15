// SPDX-License-Identifier: MIT

// Imports and Libraries

pragma solidity ^0.8.7;

import "Lessons/Lesson4/library.sol";

contract testLibraries{

    using IntExtended for uint;

    function testIncrement(uint _base) public pure returns (uint) {
        return _base.increment();
    }

    function testDecrement(uint _base) public pure returns (uint) {
        return _base.decrement();
    }


    function testIncrementByValue(uint _base, uint _value) public pure returns (uint) {
        return _base.incrementByValue(_value);
    }

    function testDecrementByValue(uint _base, uint _value) public pure returns (uint) {
        return _base.decrementByValue(_value);
    }




}
