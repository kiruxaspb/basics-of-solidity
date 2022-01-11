// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract arrays {
    Person[] public people;
    uint256 public peopleCount;

    struct Person{
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        people.push(Person(_firstname, _lastname));
        peopleCount += 1;
    }
}