// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Deposit {
    event Deposited(address indexed sender, uint256 value);
    event Transfer(address indexed receiver, uint256 value);

    constructor() {}

    function deposit() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    function transfer(uint256 amount) external {
        require(amount <= address(this).balance, "Not enough eth on balance");
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
        emit Transfer(msg.sender, amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
