// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/Counting.sol";

contract Voting is Counting {
    event VoteCasted(address indexed voter, uint8 indexed votingOption, uint192 weight);

    constructor() {}

    function vote(uint8 votingOption)
        external
        virtual
        votingOpened
        senderCanVote
        correctVotingOption(votingOption)
    {
        _voters[msg.sender].voted = true;
        uint192 weight = _getWeight();
        _votes.push(Vote(msg.sender, votingOption, weight));
        emit VoteCasted(msg.sender, votingOption, weight);
    }

    function _getWeight() internal virtual returns (uint192) {
        return 1;
    }
}
