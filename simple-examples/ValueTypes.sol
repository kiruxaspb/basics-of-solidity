// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Values {
    bool public boolean = true; // can be TRUE or FALSE
    uint public u = 123; // uint = uint256: 0 <-> 2**256-1
                         // uint8: 0 <-> 2**8-1
                         // uint16: 0 <-> 2**16-1
    int public i = -123; // int = int256: -2**255 <-> 2**255-1
                         //       int128: -2**127 <-> 2**127-1

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x0000000000000000000000000000000000000000; //  40-zeros
    bytes32 public b32 = 0x0000000000000000000000000000000000000000000000000000000000000000; // 64-zeros
}