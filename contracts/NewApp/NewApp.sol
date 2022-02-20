// SPDX-License-Identifier: MIT

// Event Logging and Transaction Information

pragma solidity ^0.8.7;

contract NewApp {

    // 2nd address 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

    address public owner;
    address public sent;
    address public from;
    string private message;
    string[] private messages;

    mapping(address => mapping(address => bool)) public isFriend;

    constructor () {
        owner = msg.sender;
    }

    function sendMessage(address _to, string calldata _message) external {
        emit Message(msg.sender, _to, _message);
        message = _message;
        sent = _to;
        isFriend[msg.sender][_to] = true;
    }

    function ViewLastMessage() public view returns (string memory) {
        require(sent == msg.sender);
        return message;

    }
    

    event Message(address indexed _from, address indexed _to, string _message);

}