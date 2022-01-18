// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract construct {
    address public owner;
    uint public x;

    constructor(uint _x) { // special func which call when call contract
        owner = msg.sender;
        x = _x;
    }
}