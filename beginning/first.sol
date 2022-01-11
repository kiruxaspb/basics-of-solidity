// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Storage {
    string strData;

    function set_str(string memory _strData) public {
        strData = _strData;
    }

    function get_str() public view returns(string memory) {
        return strData;
    }
}