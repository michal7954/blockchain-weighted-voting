// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/VotingProperties.sol";

contract Voters is VotingProperties {
    struct Voter {
        bool canVote;
        bool voted;
    }
    mapping(address => Voter) voters;

    constructor() {
        address[3] memory addresses = [
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
            0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
        ];

        for (uint8 i = 0; i < addresses.length; i++) {
            voters[addresses[i]] = Voter(true, false);
        }
    }

    modifier senderCanVote() {
        require(voters[msg.sender].canVote, "Account not entitled to vote");
        require(!voters[msg.sender].voted, "Account already voted");
        _;
    }

    function addVoters(address[] calldata votersToAdd)
        external
        onlyOwner
        votingIsUnready
    {
        for (uint8 i = 0; i < votersToAdd.length; i++) {
            voters[votersToAdd[i]] = Voter(true, false);
        }
    }

    function removeVoters(address[] calldata votersToRemove)
        external
        onlyOwner
        votingIsUnready
    {
        for (uint8 i = 0; i < votersToRemove.length; i++) {
            delete voters[votersToRemove[i]];
        }
    }
}
