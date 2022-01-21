// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// arrays - dynamic or fixed size
// initial
// insert (push), get, update, delete, pop, length

contract arrays {
    uint[] public dynamicArray = [1, 2, 3, 4, 5]; // dymanic, can initial here
    uint[3] public fixedArray = [4, 5, 6]; // fixed
    
    function example() external {
        dynamicArray.push(5); // [1, 2, 3, 4, 5]
        uint x = dynamicArray[1]; // read element of array
        dynamicArray[2] = 555; // [1, 2, 555, 4, 5] change value element(index)
        delete dynamicArray[1]; // [1, 0, 555, 4, 5] change element(index) to default => 0
        dynamicArray.pop(); // [1, 0, 555, 4] delete last element
        uint len = dynamicArray.length; // get array length

        // create array in memory
        uint[] memory arr = new uint[](5); // size of arr
        // dont can use .push & .pop
        arr[1] = 111; // can change
        uint y = arr[2]; // can read
    }

    function returnArray() external view returns (uint[] memory) { // not recommended return array !GAS!
        return dynamicArray;
    }
}