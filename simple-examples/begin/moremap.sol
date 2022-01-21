// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract mapp {
    uint256 public age;

    struct Human {
        uint256 age;
        string name;
    }

    Human[] public people;
    
    mapping(string => uint256) public nametoAge;

    function store(uint256 _age) public {
        age = _age;
    }

    function addHuman(string memory _name, uint256 _age) public {
        people.push(Human(_age, _name));
        nametoAge[_name] = _age;
    }
}