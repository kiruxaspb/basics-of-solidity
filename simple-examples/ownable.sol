// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Own {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner { // func for set new contract owner
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    function ForOwner() external view onlyOwner returns(uint) {
        return 111;
    }

    function ForAnyOne() external pure returns(uint) {
        return 222;
    }
}