// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract GlobalVars {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blocknumber = block.number;
        return (sender, timestamp, blocknumber);
    }
}
