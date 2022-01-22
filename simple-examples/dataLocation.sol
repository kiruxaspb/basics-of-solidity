// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;
// storage, memory, calldata
// storage - variables (store on blockchain)
// memory - load to memory
// calldata - special data location that contains function arguments, only available for external functions


contract DataLoc {
    struct User {
        uint id;
        string nickname;
    }

    mapping(address => User) public users;

    function example() external {
        users[msg.sender] = User({id: 0, nickname: "admin"});
        // use 'storage' for update data
        User storage user = users[msg.sender];
        user.nickname = "superadmin";
        // use 'memory' for reading data
        User memory readOnly = users[msg.sender]; // can save function caller
        readOnly.id = 13; // after end func data dont will save
    }
}

contract DataLoc1 {
    struct User {
        uint id;
        string nickname;
    }

    mapping(address => User) public users;

    function example(uint[] memory x, string memory y) external returns (User memory){
        users[msg.sender] = User({id: 0, nickname: "admin"});
        User storage user = users[msg.sender];
        user.nickname = "superadmin";
        User memory readOnly = users[msg.sender];
        readOnly.id = 13;

        return readOnly;
    }
}

contract DataLoc2 {
    struct User {
        uint id;
        string nickname;
    }

    mapping(address => User) public users;

    function example(uint[] memory x, string memory y) external returns (uint[] memory) {
        users[msg.sender] = User({id: 0, nickname: "admin"});
        User storage user = users[msg.sender];
        user.nickname = "superadmin";
        User memory readOnly = users[msg.sender];
        readOnly.id = 13;

        uint[] memory memoryArray = new uint[](3);
        memoryArray[0] = 31;
        return memoryArray;
    }
}

contract DataLoc3 {
    struct User {
        uint id;
        string nickname;
    }

    mapping(address => User) public users;

    function example(uint[] calldata y, string memory s) external returns (uint[] memory) {
        users[msg.sender] = User({id: 0, nickname: "admin"});
        User storage user = users[msg.sender];
        user.nickname = "superadmin";
        User memory readOnly = users[msg.sender];
        readOnly.id = 13;

        _anyinternalfunction(y);

        uint[] memory memoryArray = new uint[](3);
        memoryArray[0] = 31;
        return memoryArray;
    }

    function _anyinternalfunction(uint[] calldata y) private {
        uint x = y[0];
    }
}