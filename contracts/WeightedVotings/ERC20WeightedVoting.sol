// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/Voting.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20WeightedVoting is Voting {
    IERC20 internal _tokenInterface;

    constructor(address ERC20Address) {
        _tokenInterface = IERC20(ERC20Address);
    }

    function _getWeight() internal view override returns (uint192) {
        return _cast(_tokenInterface.balanceOf(msg.sender));
    }
}
