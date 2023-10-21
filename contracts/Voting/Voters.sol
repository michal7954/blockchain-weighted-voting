// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/VotingProperties.sol";

contract Voters is VotingProperties {
    struct Voter {
        bool canVote;
        bool voted;
    }

    mapping(address => Voter) internal _voters;

    event VoterAdded(address indexed voterAddress);
    event VoterRemoved(address indexed voterAddress);

    modifier senderCanVote() {
        require(_voters[msg.sender].canVote, "Account not entitled to vote");
        require(!_voters[msg.sender].voted, "Account already voted");
        _;
    }

    constructor() {
        if (_remixTestEnv) {
            address[3] memory addresses = [
                0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
                0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
                0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
            ];

            for (uint64 i = 0; i < addresses.length; i++) {
                _voters[addresses[i]] = Voter(true, false);
                emit VoterAdded(addresses[i]);
            }
        }

        if (_publicTestEnv) {
            address[3] memory addresses = [
                0x8b156952fE7684eE6fC4Ab91cb86Ec4FdD18140F,
                0xf8b0450A22C20920D4Ece9ccF85160DDBE036b67,
                0x507fbF58C43740eF4333d127789ab02466FC1dE2
            ];

            for (uint64 i = 0; i < addresses.length; i++) {
                _voters[addresses[i]] = Voter(true, false);
                emit VoterAdded(addresses[i]);
            }
        }
    }

    function addVoters(address[] calldata votersToAdd)
        external
        onlyOwner
        votingConfigurable
    {
        for (uint64 i = 0; i < votersToAdd.length; i++) {
            _voters[votersToAdd[i]] = Voter(true, false);
            emit VoterAdded(votersToAdd[i]);
        }
    }

    function removeVoters(address[] calldata votersToRemove)
        external
        onlyOwner
        votingConfigurable
    {
        for (uint64 i = 0; i < votersToRemove.length; i++) {
            _voters[votersToRemove[i]].canVote = false;
            emit VoterRemoved(votersToRemove[i]);
        }
    }
}
