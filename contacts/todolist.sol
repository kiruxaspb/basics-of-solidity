// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

//insert, update, read from array of structs
contract TodoList {
    uint256 public indexTodo = 0;
    address owner;
    mapping(uint256 => Todo) internal Tasks;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() { // 
        require(msg.sender == owner); // return TRUE or FALSE
        _;
    }

    struct Todo {
        string text;
        bool completed;
    }

    function addTask(string memory _text) internal onlyOwner {
        Tasks[indexTodo] = (Todo(_text, false));
        countTodo();
    }

    function countTodo() internal {
        indexTodo += 1;
    }

    function deleteTask(uint256 _index) internal onlyOwner {
        delete Tasks[_index];
        Tasks[_index].text = "cleaned";
        Tasks[_index].completed = false;
        // make a deletion with a shift
    }

    function updateText(uint256 _index, string memory _text) internal onlyOwner {
            Tasks[_index].text = _text;
            // todo.text = _text;
            // Todo storage todo = todos[_index]; >> cheaper by gas <<
    }

    function getTodo(uint256 _index) internal view onlyOwner returns (string memory, bool) {
        Todo memory todo = Tasks[_index]; // can use storage -> a little cheaper of gas
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint256 _index) internal onlyOwner { // changing the status of the task by index
        Tasks[_index].completed = !Tasks[_index].completed;
    }
}