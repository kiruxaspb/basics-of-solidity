// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Func {
    bool public paused;
    uint public count;

    function setPause() external {
        paused = !paused;
    }

    function inc() external {
        require(!paused, "paused");
        count += 1;
    }

    function dec() external {
        require(!paused, "paused");
        count -= 1;
    }
}

// basic modifier
contract FuncModifier {
    bool public paused;
    uint public count;

    function setPause() external {
        paused = !paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }
}

// input modifier
contract Checkinput {
    bool public pause;
    uint public count;
    
    function setPause() external {
        pause = !pause;
    }

    modifier whenNotPaused() {
        require(!pause, "paused");
        _;
    }

    modifier check(uint _x) { // check input value
        require(_x < 100, "x >= 100");
        _;
    }

    function incrementby(uint _x) external whenNotPaused check(_x) {
        // require(_x < 100, "x >= 100");
        count += _x;
    }
}

contract Sw {
    uint public count;

    modifier sandwich() {
        // code here
        count += 10; // call test -> count: 0 + 10 = 10
        _; // call test() -> count: 10 + 1 = 1
        // more code here
        count *= 2; // after call test() -> count: 11 * 2 = 22
    }

    function test() external sandwich { // after call test will be call "sandwich" and will be complete code in modifier
        count += 1;
    }
}