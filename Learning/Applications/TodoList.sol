// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TodoList {

    struct Todo{
        string text;
        bool completed;
    }
    
    Todo[] public todos;

    constructor() {
        
    }

    function setText(string memory _text) external {

        todos.push(Todo({

            text: _text,
            completed: false

        }));
    }

    function updateText(uint _index, string calldata _text) external {

        Todo storage todo = todos[_index];
        todo.text = _text;

    }

    function get(uint _index) external view returns(string memory, bool){

        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);

    }

    function toggle(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }


}