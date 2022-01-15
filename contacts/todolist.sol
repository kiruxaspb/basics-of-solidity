// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

//insert, update, read from array of structs
contract TodoList {
    
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;


    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }


    function updateText(uint _index, string calldata _text) external {
            todos[_index].text = _text;
            // todo.text = _text;
            // Todo storage todo = todos[_index]; >> cheaper by gas <<
    }


    function get(uint _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index]; // can use storage -> a little cheaper of gas
        return (todo.text, todo.completed);
    }


    function toggleCompleted(uint _index) external { // changing the status of the task by index
        todos[_index].completed = !todos[_index].completed;
    }
}