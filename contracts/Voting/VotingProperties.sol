// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
// import "contracts/Voting/Ownable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VotingProperties is Ownable {
    enum VotingState {
        Unready,
        Active,
        Ended
    }

    VotingState internal votingState;

    constructor() {
        votingState = VotingState.Unready;
    }

    modifier votingIsUnready() {
        require(votingState == VotingState.Unready, "Voting has been started");
        _;
    }

    modifier votingIsActive() {
        require(votingState == VotingState.Active, "Voting is not active");
        _;
    }

    modifier votingIsEnded() {
        require(votingState == VotingState.Ended, "Voting is not ended");
        _;
    }

    function startVoting() external onlyOwner votingIsUnready {
        votingState = VotingState.Active;
    }

    function endVoting() external onlyOwner votingIsActive {
        votingState = VotingState.Ended;
    }
}
