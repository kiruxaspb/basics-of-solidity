// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public orderStatus;

    struct Order {
        address buyer;
        Status orderStatus;
    }

    Order[] public orders;

    function get() public view returns (Status) {
        return orderStatus;
    }

    function set(Status _status) external {
        orderStatus = _status;
    }

    function ship() external {
        orderStatus = Status.Shipped;
    }

    function reset() external {
        delete orderStatus;
    }
}