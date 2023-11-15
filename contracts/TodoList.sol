// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct TodoItem {
        string task;
        bool isCompleted;
    }

    // EVENTS
    event TaskCompleted(uint256 indexed id);

    // VARIABLES
    mapping(uint256 => TodoItem) public list;
    uint256 public count = 0;
    address public owner;

    // MODIFIER
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // FUNCTIONS
    function addTask(string calldata task) public onlyOwner {
        TodoItem memory item = TodoItem({task: task, isCompleted: false});
        list[count] = item;
        count++;
    }

    function completeTask(uint256 id) public onlyOwner {
        if (!list[id].isCompleted) {
            list[id].isCompleted = true;
            emit TaskCompleted(id);
        }
    }
}
