pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT


import "./erc20Interface.sol";
import "./Ownable.sol";

contract FAPToken is Ownable, IERC20 {

    uint256 public tSupply;
    string public tokenName;
    uint8 public decimals;
    string public symbol;


    uint256 constant private MAX_UINT256 = 2**256 -1;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    constructor(uint256 _initialAmount, string memory _tokenName, uint8 _decimalUnits, string memory _tokenSymbol){

        balances[msg.sender] = _initialAmount;
        tSupply = _initialAmount;
        tokenName = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;

    }

    
    function totalSupply() external view override returns (uint) {
        return tSupply;
    }

    function balanceOf(address _owner) external view override returns (uint){
            return balances[_owner];
    }

    function transfer(address _recipient, uint _val) external override returns(bool){

        require(balances[msg.sender] >= _val, "Insufficient funds for transfer.");
        balances[msg.sender] -= _val;
        balances[_recipient] += _val;
        emit Transfer(msg.sender, _recipient, _val); // emit triggers a Transfer event 
        return true;

    }

    function allowance(address _owner, address _spender) external view override returns (uint256) {

        return allowed[_owner][_spender];

    }

    function approve(address _spender, uint _val) external override returns (bool){
        allowed[msg.sender][_spender] = _val;
        emit Approval(msg.sender, _spender, _val); // emits triggers a Approval event
        return true;
    }

    function transferFrom(address _sender,address _recipient, uint _val) external override returns (bool){
        uint256 _allowance = allowed[_sender][msg.sender];
        require(balances[_sender] >= _val && _allowance >= _val, "Insufficient allowed funds for transfer.");
        balances[_recipient] += _val;
        balances[_sender] -= _val;
        if (_allowance < MAX_UINT256) {
            allowed[_sender][msg.sender] -= _val;
        }
        emit Transfer(_sender, _recipient, _val);
        return true;
    }



    
    
}



