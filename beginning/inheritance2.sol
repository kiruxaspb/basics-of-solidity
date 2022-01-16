// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;
// compile second.sol :)
contract first {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract second is first {
    constructor(string memory _name) first(_name) {}
}