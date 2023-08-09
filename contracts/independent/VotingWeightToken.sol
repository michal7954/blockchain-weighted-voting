// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VotingWeightToken is ERC20 {
    constructor() ERC20("VotingWeightToken", "VWT") {
        _mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 3 * 10 ** decimals());
        _mint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 2 * 10 ** decimals());
        _mint(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 1 * 10 ** decimals());
    }
}