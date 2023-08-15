// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/VotingOptions.sol";
import "contracts/Voting/Voters.sol";

contract Votes is VotingOptions, Voters {
    struct Vote {
        address voter;
        uint8 votingOption;
        uint192 weight;
    }
    Vote[] internal votes;

    constructor() {}
}
