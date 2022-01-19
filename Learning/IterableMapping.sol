// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//be able to get the size of the mapping and all the elements with a for loop
contract IterableMapping {

    mapping(address => uint) public balances;
    // keeps track whether a key is inserted or not
    mapping(address => bool) public inserted;
    //
    address[] public keys;

    // get size of mapping and all of the keys / values
    function set(address _key, uint _val) external {
        balances[_key] = _val;

        // if _key is not yet inserted
        if (!inserted[_key]){
            inserted[_key] = true;
            keys.push(_key);
        }
    } 

    // get size of balances mapping
    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {

        return balances[keys[0]];

    }

    function get(uint _i) external view returns (uint){
        return balances[keys[_i]];
    }


}