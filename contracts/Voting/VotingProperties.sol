// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "contracts/Voting/Maths.sol";
import "contracts/Voting/Configuration.sol";

contract VotingProperties is Ownable, Maths, Configuration {
    uint256 internal _votingStartTime;
    uint256 internal _votingEndTime;
    bool internal _votingConfigurationLocked;

    modifier votingConfigurable() {
        if (!_devMode) {
            require(_votingConfigurationLocked == false, "Voting is locked");
        }
        _;
    }

    modifier votingOpened() {
        if (!_devMode) {
            require(
                _votingConfigurationLocked == true &&
                    block.timestamp >= _votingStartTime &&
                    block.timestamp < _votingEndTime,
                "Voting is not started"
            );
        }
        _;
    }

    modifier votingEnded() {
        if (!_devMode) {
            require(
                _votingConfigurationLocked == true &&
                    block.timestamp >= _votingEndTime,
                "Voting is not ended"
            );
        }
        _;
    }

    modifier unlockVoting() {
        if (!_devMode) {
            require(
                block.timestamp >= _votingEndTime + _minPhaseTime,
                "Not ready to unlock voting yet"
            );
        }
        _votingConfigurationLocked = false;
        _;
    }

    constructor() {
        _votingStartTime = block.timestamp + 2 * _minPhaseTime;
        _votingEndTime = block.timestamp + 3 * _minPhaseTime;
        _votingConfigurationLocked = false;
    }

    function setVotingTimes(uint256 startTime, uint256 endTime)
        external
        onlyOwner
    {
        if (!_devMode) {
            require(
                block.timestamp + _minPhaseTime <= startTime,
                "Lock period before voting start is not long enough"
            );
            require(
                startTime + _minPhaseTime <= endTime,
                "Voting period is not long enough"
            );
        }

        _votingStartTime = startTime;
        _votingEndTime = endTime;
    }

    function lockVoting() external onlyOwner {
        if (!_devMode) {
            require(
                block.timestamp + _minPhaseTime <= _votingStartTime,
                "Lock period before voting start is not long enough, you need to change voting times"
            );
        }
        _votingConfigurationLocked = true;
    }

    function getVotingTimes() external view returns (uint256, uint256) {
        return (_votingStartTime, _votingEndTime);
    }
}
