// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

contract EthereumWeightedVoting is Voting {
    constructor() {}

    function _getWeight() internal view override returns (uint192) {
        return _cast(msg.sender.balance);
    }
}
