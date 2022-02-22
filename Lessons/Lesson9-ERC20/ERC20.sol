// SPDX-License-Identifier: MIT

// Debugging

pragma solidity ^0.8.7;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    
    string internal symbol;
    string internal name;
    uint8 internal decimals;
    uint internal tSupply;

    mapping (address => uint) private balances;
    mapping (address => mapping (address => uint)) private isFriend; 

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint _tSupply) {
        
        balances[msg.sender] = tSupply;
        _tSupply = tSupply;
        _name = name;
        _symbol = symbol;
        _decimals = decimals;

    }
    
    
    function totalSupply() public override view returns (uint _totalSupply) {

        _totalSupply = tSupply;

    }

    function balanceOf(address _addr) public  override view returns (uint balance){

        return balances[_addr];

    }

    function transfer(address _to, uint _value) public override returns (bool success){

        if(_value > 0  && _value <= balanceOf(msg.sender)){

            balances[msg.sender] -= _value;
            balances[_to] += _value;

            emit Transfer(msg.sender, _to, _value);
            return true;
        }

        else {
            return false;
        }

    }

    function transferFrom(address _from, address _to, uint _value) public override returns (bool success){
        
        if (isFriend[_from][msg.sender] > 0 && _value > 0 && isFriend[_from][msg.sender] >= _value) {

                balances[_from] >= _value;
                balances[_from] -= _value;
                balances[_to] += _value;
                isFriend[_from][msg.sender] -= _value;

                emit Transfer(_from, _to, _value);
                return true;

            }

        else {
            return false;
        }

    }

    function approve(address _spender, uint _value) public override returns (bool success) {

        isFriend[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;

    }

    function allowance(address _owner, address _spender) public override view returns (uint remaining){

            return isFriend[_owner][_spender];

    }




}