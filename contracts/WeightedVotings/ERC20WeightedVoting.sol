// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20WeightedVoting is Voting {
    IERC20 internal tokenInterface;

    constructor(address ERC20Address_) {
        tokenInterface = IERC20(ERC20Address_);
    }

    function getWeight() internal view override returns (uint192) {
        return _cast(tokenInterface.balanceOf(msg.sender));
    }
}
