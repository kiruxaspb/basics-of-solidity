// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Errors {

    function testRequire(uint _i) public pure returns (uint) {
        require(_i <= 10, "i > 10");
        // run code if require false
        return _i;
    }

    function testRevert(uint _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }

    uint public number = 111;
    // checking function
    function testAssert() public view {
        assert(number == 111);
    }

    // mistakenly changing a variable
    function destroy() public { 
        number += 1;
    }

    function test(uint _i) public {
        number += 1;
        require(_i < 10);
        // return err if u input _i > 10
        // the transaction will be refunded
    }

    // custom error
    error inputError(address caller, uint i);

    function testCustomError(uint _i) public view returns (uint) {
        // require(_i < 10, "ERROR you unput i < 10!!! ERROR"); LONGER ERR MESSAGE = MORE GAS
        // code
        
        if (_i < 10) {
            revert inputError(msg.sender, _i);
        }
        return _i;
        // code
    }
}