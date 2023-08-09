// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Votes.sol";

contract Counting is Votes {
    struct Result {
        string name;
        uint256 votesCount;
    }

    constructor() {}

    function getResults() public view votingIsEnded returns (Result[] memory) {
        Result[] memory results = new Result[](votingOptions.length);

        for (uint8 i = 0; i < votingOptions.length; i++) {
            results[i] = Result(votingOptions[i], 0);
        }

        for (uint256 i = 0; i < votes.length; i++) {
            results[votes[i].votingOption].votesCount += votes[i].weight;
        }

        return results;
    }
}
