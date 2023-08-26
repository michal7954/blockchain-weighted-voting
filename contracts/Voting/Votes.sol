// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/VotingOptions.sol";
import "contracts/Voting/Voters.sol";

contract Votes is VotingOptions, Voters {
    struct Vote {
        address voter;
        uint8 votingOption;
        uint192 weight;
    }

    Vote[] internal _votes;

    event VotingReset();

    constructor() {}

    function resetVoting() external onlyOwner unlockVoting {
        for (uint64 i = 0; i < _votes.length; i++) {
            _voters[_votes[i].voter].voted = false;
        }

        delete _votes;

        emit VotingReset();
    }
}
