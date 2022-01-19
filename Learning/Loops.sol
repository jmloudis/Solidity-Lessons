// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract loops {


     // For loops and while loops
    // number of loops > gas cost 


    function loop() external pure {
        for (uint i =0; i < 10; i++){

            if (i == 3){
                // continue - skips the loop 
                continue;
            }
            if (i == 5) {
                break;
            }
           

            
        }

        uint j = 0;

        while (j < 10) {
            j++;
        }
    }

    function sum(uint _n) external pure returns(uint) {
        uint s;
        for (uint j; j < _n; j++){
            s += 1;
        }

        return s;
    }

}