// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/VotingProperties.sol";

contract VotingOptions is VotingProperties {
    string[] internal _votingOptions;

    event VotingOptionAdded(uint8 indexed index, string indexed votingOption);
    event VotingOptionRemoved(uint8 indexed index, string indexed votingOption);

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
        if (_devMode) {
            _votingOptions = ["A", "B", "C"];
            emit VotingOptionAdded(0, _votingOptions[0]);
            emit VotingOptionAdded(1, _votingOptions[1]);
            emit VotingOptionAdded(2, _votingOptions[2]);
        }
    }

    function addVotingOptions(string[] calldata votingOptionsToAdd)
        external
        onlyOwner
        votingConfigurable
    {
        for (uint8 i = 0; i < votingOptionsToAdd.length; i++) {
            _votingOptions.push(votingOptionsToAdd[i]);
            emit VotingOptionAdded(
                uint8(_votingOptions.length) - 1,
                votingOptionsToAdd[i]
            );
        }
    }

    function removeVotingOptions(uint8[] calldata votingOptionsToRemove)
        external
        onlyOwner
        votingConfigurable
    {
        for (uint8 i = 0; i < votingOptionsToRemove.length; i++) {
            string memory votingOption = _votingOptions[votingOptionsToRemove[i]];
            delete _votingOptions[votingOptionsToRemove[i]];
            emit VotingOptionRemoved(votingOptionsToRemove[i], votingOption);
        }
    }

    function getVotingOptions() external view returns (string[] memory) {
        return _votingOptions;
    }
}
