// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FunctionOutputs{

    // basic example of returning many outputs

    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }


    // Named output

    function named() public pure returns (uint x, bool b) {

        return (1, true);

    }

    // Saves more gas

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;

    }


    // Destructing assignment

    function desctructingAssignments() public pure {
        (uint x, bool b) = assigned();
        (, bool b2) = returnMany();

    }
}