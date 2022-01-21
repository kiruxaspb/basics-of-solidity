// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract locAndstate {
    uint public myvar; // state variable
    bool public bl; // state variable
    address public myAddr;

    function test() external {
        
        // local variables use only in function where they declared
        uint x = 123; // local variable
        bool lb = false; // local variable

        x += 456;
        lb = true;

        myvar = 321;
        bl = true;
        myAddr = address(1);
    }
}