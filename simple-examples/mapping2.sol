// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract IteribleMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _balance) external {
        balances[_key] = _balance;
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function setSize() external view returns (uint) {
        return keys.length;
    }

    function getFirst() external view returns (uint) {
        return balances[keys[0]];
    }

    function getLast() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }
}