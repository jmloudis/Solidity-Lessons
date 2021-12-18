// SPDX-License-Identifier: MIT

// Extending String functionality and Bytes

pragma solidity ^0.8.7;

import "Lessons/Lesson7-extending/strings.sol";

contract testStrings {

    using Strings for string;

    function testContract(string memory _base) pure public returns (string memory) {

        return _base.concat("_suffix");

    }

    function needleInHaystack(string memory _base) pure public returns (int) {

        return _base.strops("t");

    }
}