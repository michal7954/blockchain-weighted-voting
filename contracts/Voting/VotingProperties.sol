// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "contracts/Voting/Maths.sol";

contract VotingProperties is Ownable, Maths {
    enum VotingState {
        Unready,
        Active,
        Ended
    }

    VotingState internal _votingState;

    constructor() {
        _votingState = VotingState.Unready;
    }

    modifier votingIsUnready() {
        require(_votingState == VotingState.Unready, "Voting has been started");
        _;
    }

    modifier votingIsActive() {
        require(_votingState == VotingState.Active, "Voting is not active");
        _;
    }

    modifier votingIsEnded() {
        require(_votingState == VotingState.Ended, "Voting is not ended");
        _;
    }

    function startVoting() external onlyOwner votingIsUnready {
        _votingState = VotingState.Active;
    }

    function endVoting() external onlyOwner votingIsActive {
        _votingState = VotingState.Ended;
    }
}
