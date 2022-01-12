// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    address owner;

    modifier onlyOwner() { // 
        require(msg.sender == owner); // return TRUE or FALSE
        _;
    }

    struct Person{
        string _firstname;
        string _lastname;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addPerson(string memory _firstname, string memory _lastname) public onlyOwner {
        incrementCount();
        people[peopleCount] = (Person(_firstname, _lastname));
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}