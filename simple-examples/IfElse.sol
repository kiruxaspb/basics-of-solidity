// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract IfElse {
    function example(uint _x) external pure returns (uint) {
        if (_x < 10) {
            return 1;
        } else if (_x < 20) {
            return 2;
        } else {
            return 3;
        }
    }
        /*
        if (_x < 10) {
            return 1;
        } else if (_x < 20) {
            return 2;
        }
        return 3;

        example style code:
        if (x < 3)
            x += 1;
        else
            x -= 1;
        */

    function ternary(uint _x) external pure returns (uint) {
        /*
        if (_x < 10) {
            return 1
        }
        return 2;
        */
        return _x < 10 ? 1 : 2; // equivalent to the code top
    }
}