// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Storage {
    uint Data;

    function set(uint x) public {
        Data = x;
    }

    function get() public view returns (uint) {
        return Data;
    }
}