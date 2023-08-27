// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/Voting.sol";

interface WeightSourceInterface {
    function getValue(address account) external view returns (uint192);
}

contract ExplicitValueWeightedVoting is Voting {
    WeightSourceInterface internal _weightSourceInterface;

    event InitVoting(address indexed valueSourceAddress);

    constructor(address valueSourceAddress) {
        _weightSourceInterface = WeightSourceInterface(valueSourceAddress);
        emit InitVoting(valueSourceAddress);
    }

    function _getWeight() internal view override returns (uint192) {
        return _weightSourceInterface.getValue(msg.sender);
    }
}
