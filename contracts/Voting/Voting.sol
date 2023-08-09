// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Counting.sol";

contract Voting is Counting {
    constructor() {}

    function vote(uint256 votingOption)
        external
        votingIsActive
        senderCanVote
        correctVotingOption(votingOption)
    {
        voters[msg.sender].voted = true;
        votes.push(Vote(msg.sender, votingOption, getWeight()));
    }

    function getWeight() internal virtual returns (uint256) {
        return 1;
    }
}