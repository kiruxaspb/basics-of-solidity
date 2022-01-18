// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract shifting {
uint[] public array;

    function test() public {
        array = [1, 2, 3];
        delete array[1]; // [1, 0, 3]
    }

    // algorithm: [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 3, 4, 6, 6] --> [1, 2, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []
    function remove(uint _index) public {
        require(_index < array.length, "index out of length array");

        for (uint i = _index; i < array.length - 1; i++) {
            array[i] = array[i + 1];
        }

        array.pop();
    }

    function test_algorithm() external {
        array = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(array[0] == 1);
        assert(array[0] == 2);
        assert(array[0] == 4);
        assert(array[0] == 5);
        assert(array.length == 4);

        array = [1];
        remove(0);
        // []
        assert(array.length == 0);
    }
}