  // SPDX-License-Identifier: MIT

// Debugging

pragma solidity ^0.8.7;

import "./ERC20.sol";

abstract contract MyFirstToken is ERC20 {
    
    string public constant symbol = "MFT";
    string public constant name = "My First Token";
    uint8 public constant decimals = 18;

    uint private constant __totalSupply = 10000;

    mapping (address => uint) private __balanceOf;
    mapping (address => mapping (address => uint)) private __allowances; 

    constructor() {

        __balanceOf[msg.sender] = __totalSupply;

    }

    
    function totalSupply() public override pure returns (uint _totalSupply) {

        _totalSupply = __totalSupply;

    }

    function balanceOf(address _addr) public  override view returns (uint balance){

        return __balanceOf[_addr];

    }

    function transfer(address _to, uint _value) public override returns (bool success){

        if(_value > 0  && _value <= balanceOf(msg.sender)){
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }

        else {
            return false;
        }

    }

    function transferFrom(address _from, address _to, uint _value) public override returns (bool success){
        
        if (__allowances[_from][msg.sender] > 0 &&
            _value > 0 &&
            __allowances[_from][msg.sender] >= _value) {

                __balanceOf[_from] -= _value;
                __balanceOf[_to] += _value;
                return true;

            }


    }

    function approve(address _spender, uint _value) public override returns (bool success) {

        __allowances[msg.sender][_spender] = _value;
        return true;

    }

    function allowance(address _owner, address _spender) public  override view returns (uint remaining){

            return __allowances[_owner][_spender];

    }




}