// SPDX-License-Identifier: MIT

// Event Logging and Transaction Information

pragma solidity ^0.8.7;

contract NewApp {

    address public owner;
    address public sent;
    address public from;
    string private message;

    mapping(address => mapping(address => bool)) public isFriend;

    constructor () {
        owner = msg.sender;
    }

    function sendMessage(address _to, string calldata _message) external {
        emit Message(msg.sender, _to, _message);
        message = _message;
        from = msg.sender;
        sent = _to;
        isFriend[msg.sender][_to] = true;
    }

    function ViewLastMessage() public payable returns (string memory) {
        require(isFriend[from][sent] == true, "Error");

        return message;

    }
    

    event Message(address indexed _from, address indexed _to, string _message);

}