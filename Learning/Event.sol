// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Event {

    // events allow the developer to write data on the blockchain
    event Log(string message, uint val);

    // up to 3 indexed parameters
    event IndexedLog(address indexed sender, uint val);

    function example() external {

        emit Log("food", 123);
        emit IndexedLog(msg.sender, 456);

    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }

    
}