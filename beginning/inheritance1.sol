// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract first {
    function getFirstContract() public pure returns(string memory) {
        return "data from first contract";
    }
}

contract second is first {
}
