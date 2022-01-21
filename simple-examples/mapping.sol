// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// declare a mapping (simple & nested)
// set, get, delete

// ["kirill", "petya", "vanya"]
// { "kirill": true, "petya": true, "vanya": true }

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function example() external {
        balances[msg.sender] = 100;

        uint balance = balances[msg.sender]; // get sender balance
        uint balance2 = balances[address(1)]; // 0

        balances[msg.sender] += 200; // 100 + 200 = 300
        // balances[msg.sender] = 200 - its a change balance: before: 100, after: 200

        delete balances[msg.sender]; // set 0

        // neste example
        isFriend[msg.sender][address(this)] = true;
    }
}

contract Nested {
    mapping(address => mapping(uint => bool)) public friend;

    function get(address _address, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return friend[_address][_i];
    }

    function set(address _address, uint _i, bool _friend) public {
        friend[_address][_i] = _friend;
    }

    function remove(address _address, uint _i) public {
        delete friend[_address][_i];
    }
}