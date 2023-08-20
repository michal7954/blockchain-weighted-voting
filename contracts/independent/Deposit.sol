// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract Deposit {
    constructor() {}

    function deposit() external payable {}

    function transfer(uint256 amount) external {
        require(amount <= address(this).balance, "Not enough eth on balance");
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
