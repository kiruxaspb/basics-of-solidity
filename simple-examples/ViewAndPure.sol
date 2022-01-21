// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract ViewAndPureFunctions {
    uint public number;

    function viewFunction() external view returns (uint) { // view - use only read state, not modify
        return number;
    }

    function pureFunction() external pure returns (uint) { // pure - not read or modify state
        return 222;
    }

    function addToNumber(uint x) external view returns (uint) {
        return number + x;
    }

    function addition(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}