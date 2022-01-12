// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    address owner = 0xEB8Ee7d5723F76e5c1Fd486F47133eaA9d1c5312;

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
        people[peopleCount] = (Person(_firstname, _lastname));
        incrementCount();
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}