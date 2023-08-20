// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressToValue is Ownable {
    mapping(address => uint192) _values;

    constructor() {
        _values[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = 3;
        _values[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = 2;
        _values[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = 1;
    }

    function setValue(address address_, uint192 value) external onlyOwner {
        _values[address_] = value;
    }

    function getValue(address address_) external view returns (uint192) {
        return _values[address_];
    }
}
