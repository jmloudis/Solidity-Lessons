// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ArrayShift {
    uint[] public arr;

    function example() public {
        arr = [1, 2, 3];
        delete arr[1]; // [1, 0, 3]
    }

    // [1, 2, 3] --> remove (1)  --> [1, 3, 3] --> [1, 3]

    function remove(uint _x) public {
        
        require(_x < arr.length, "index out of bound");

        for (uint i = _x; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();

    }

    // 
    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        // [1, 2, 3, 4]
    }
}