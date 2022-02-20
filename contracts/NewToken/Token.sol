// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./IERC20.sol";

contract Token is IERC20 {

    uint public override totalSupply;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public override allowance;
    string public name = "The Ponzi Scheme";
    string public symbol = "TPS";
    uint8 public decimals = 9;
    
    address public owner;

    constructor() {

        owner = msg.sender;
        mint(100 * 10**uint(decimals));

    }

    function balanceOf(address _owner) external view override returns (uint){
            return balances[_owner];
    }

    function transfer(address _recipient, uint _amount) external override returns (bool) {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(msg.sender, _recipient, _amount);
        return true;
    }

    function approve(address _spender, uint _amount) external override returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function transferFrom(address _sender, address _recipient, uint _amount) external override returns (bool) {
        allowance[_sender][msg.sender] -= _amount;
        balances[_sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_sender, _recipient, _amount);
        return true;
    }

    function mint(uint _amount) internal {
        balances[msg.sender] += _amount;
        totalSupply += _amount;
        emit Transfer(address(0), msg.sender, _amount);
    }

    function burn(uint _amount) external {
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }
}