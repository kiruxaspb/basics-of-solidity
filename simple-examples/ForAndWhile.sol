// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract ForAndWhile {
    function Loops() external pure {
        for (uint i = 0; i < 10; i++) {
            // code 1
            if (i == 3) { // skip iteration
                continue; // code 2 will be skipped when i == 3 & can use w/o condition
            }
            // code 2
            
            if (i == 5){
                break; // exit from loop & can use w/o condition
            }
        }

        /*
        while (true) { // infinite
            // code 3
        }
        */

        uint j = 0;
        while (j < 10){
            //code 4
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint){
        uint s;
        for (uint i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}