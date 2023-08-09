// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract Ownable {
    address internal owner;

    event OwnerChange(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner");
        _;
    }

    constructor() {
        console.log("Owner contract deployed by: ", msg.sender);
        owner = msg.sender;
        emit OwnerChange(address(0), owner);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        emit OwnerChange(owner, newOwner);
        owner = newOwner;
    }
}
