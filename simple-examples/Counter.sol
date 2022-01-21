// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Counter {
    uint public count;

    function increment() external {
        count +=1;
    }

    function decrement() external {
        count -=1;
    }
}