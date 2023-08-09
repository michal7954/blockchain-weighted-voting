// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

contract EthereumWeightedVoting is Voting {
    constructor() {}

    function getWeight() internal view override returns (uint256) {
        return msg.sender.balance;
    }
}
