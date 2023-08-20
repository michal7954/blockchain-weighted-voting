// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/VotingProperties.sol";

contract VotingOptions is VotingProperties {
    string[] internal _votingOptions;

    modifier correctVotingOption(uint8 votingOption) {
        require(
            votingOption < _votingOptions.length,
            "Incorrect voting option - index out of range"
        );
        require(
            bytes(_votingOptions[votingOption]).length > 0,
            "Incorrect voting option - removed voting option"
        );
        _;
    }

    constructor() {
        _votingOptions = ["A", "B", "C"];
    }

    function addVotingOptions(string[] calldata votingOptionsToAdd)
        external
        onlyOwner
        votingIsUnready
    {
        for (uint8 i = 0; i < votingOptionsToAdd.length; i++) {
            _votingOptions.push(votingOptionsToAdd[i]);
        }
    }

    function removeVotingOptions(uint8[] calldata votingOptionsToRemove)
        external
        onlyOwner
        votingIsUnready
    {
        for (uint8 i = 0; i < votingOptionsToRemove.length; i++) {
            delete _votingOptions[votingOptionsToRemove[i]];
        }
    }

    function getVotingOptions() external view returns (string[] memory) {
        return _votingOptions;
    }
}
