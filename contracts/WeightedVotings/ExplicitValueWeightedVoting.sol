// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ValueSourceInterface {
    function getValue(address address_) external view returns (uint256);
}

contract ExplicitValueWeightedVoting is Voting {
    address internal valueSourceAddress;

    constructor(address valueSourceAddress_) {
        valueSourceAddress = valueSourceAddress_;
    }

    function getWeight() internal view override returns (uint256) {
        return ValueSourceInterface(valueSourceAddress).getValue(msg.sender);
    }
}
