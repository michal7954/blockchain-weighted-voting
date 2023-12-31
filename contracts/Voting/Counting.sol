// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/Votes.sol";

contract Counting is Votes {
    struct Result {
        string name;
        uint256 votesCount;
    }

    event VotingResults(Result[] results);

    constructor() {}

    function getResults() external votingEnded returns (Result[] memory) {
        Result[] memory results = new Result[](_votingOptions.length);

        for (uint8 i = 0; i < _votingOptions.length; i++) {
            results[i] = Result(_votingOptions[i], 0);
        }

        for (uint64 i = 0; i < _votes.length; i++) {
            results[_votes[i].votingOption].votesCount += _votes[i].weight;
        }

        emit VotingResults(results);
        return results;
    }
}
