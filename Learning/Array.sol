// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract Array {

    // Dynamic Array - size can change
    uint[] public nums = [1,2,3];

    // Fixed Array - size does not change
    uint[3] public numsFixed = [4,5,6];


    function examples() external{

        nums.push(4); // [1, 2, 3, 4]

        uint x = nums[1]; // [2]

        nums[2] = 777; // [1, 2, 777, 4]

        delete nums[1]; // [1, 0, 777, 4]


        // How to change length of array
        // pop removes last element of array
        nums.pop(); // [1, 0, 777]
        uint len = nums.length;


        //create array in memory - cannot call push or pop - FIXED
        uint[] memory a = new uint[](5);
        a[1] = 123;

    }

    // Will use a lot of gas
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }


}