// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Counting.sol";

contract Voting is Counting {
    constructor() {}

    function vote(uint8 votingOption)
        external
        virtual
        votingIsActive
        senderCanVote
        correctVotingOption(votingOption)
    {
        _voters[msg.sender].voted = true;
        _votes.push(Vote(msg.sender, votingOption, _getWeight()));
    }

    function _getWeight() internal virtual returns (uint192) {
        return 1;
    }
}
