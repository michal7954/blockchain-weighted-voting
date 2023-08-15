// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

interface WeightSourceInterface {
    function getValue(address address_) external view returns (uint256);
}

contract ExplicitValueWeightedVoting is Voting {
    WeightSourceInterface internal weightSourceInterface;

    constructor(address valueSourceAddress_) {
        weightSourceInterface = WeightSourceInterface(valueSourceAddress_);
    }

    function getWeight() internal view override returns (uint256) {
        return weightSourceInterface.getValue(msg.sender);
    }
}
