// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

// TODO Oracle required
contract NFTExplicitValueWeightedVoting is Voting {
    constructor(address valueSourceAddress_) {}

    function getWeight() internal pure override returns (uint192) {
        return 1;
    }
}
