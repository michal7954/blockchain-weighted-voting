// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

interface WeightSourceInterface {
    function getValue(address address_) external view returns (uint192);
}

contract ExplicitValueWeightedVoting is Voting {
    WeightSourceInterface internal _weightSourceInterface;

    constructor(address valueSourceAddress) {
        _weightSourceInterface = WeightSourceInterface(valueSourceAddress);
    }

    function _getWeight() internal view override returns (uint192) {
        return _weightSourceInterface.getValue(msg.sender);
    }
}
