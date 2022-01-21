// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;
// simple events
contract EVNT {
    event Log(string message);

    function test() public {
        emit Log("Function test() was called"); // check full transact message
    }
}