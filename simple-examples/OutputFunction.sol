// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// multi output
// named output
// destructuring assigment

contract funcout {
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    function named() public pure returns (uint x, bool bln) {
        return (1, true);
    }

    function assigned() public pure returns (uint x, bool bln) {
        // return (1, true);
        x = 1;
        bln = true;
    }

   function destructingAssignments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Can use array for output
    uint[] private arr;

    // Can use array for input
    function arrayInput(uint[] memory _arr) public {
        arr = _arr;
    }

    // func output array
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}   