// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract DefaultValues {
    bool public status; // default = false
    uint public u; // 0
    int public i; // 0
    address public addr; // 0x0000000000000000000000000000000000000000 40-zeros
    bytes32 public b32; // 0x0000000000000000000000000000000000000000000000000000000000000000 64-zeros
}