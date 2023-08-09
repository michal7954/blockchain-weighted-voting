// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20WeightedVoting is Voting {
    address internal ERC20Address;

    constructor(address ERC20Address_) {
        ERC20Address = ERC20Address_;
    }

    function getWeight() internal view override returns (uint256) {
        return IERC20(ERC20Address).balanceOf(msg.sender);
    }
}
