// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract IfElseStatement {

     // If Else & Ternary 

    function ifElse(uint _x) external pure returns (uint){
        if (_x < 10){
            return 1;
        } else if ( _x < 20) {
            return 2;
        } 

        // can omit else statement 
        // return 3;
        
        else {
            return 3;
        }
    }

    function ternary(uint _x) external pure returns (uint) {
        // if (_x < 10){
        //     return 1;
        // } 
        // return 2;

        return _x < 10 ? 1 : 2;


    }

}