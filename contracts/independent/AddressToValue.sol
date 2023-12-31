// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressToValue is Ownable {
    mapping(address => uint192) _values;

    event ValueSet(address account, uint192 value);

    constructor() {
        _values[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = 3;
        emit ValueSet(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 3);

        _values[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = 2;
        emit ValueSet(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 2);

        _values[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = 1;
        emit ValueSet(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 1);
    }

    function setValue(address account, uint192 value) external onlyOwner {
        _values[account] = value;
        emit ValueSet(account, value);
    }

    function getValue(address account) external view returns (uint192) {
        return _values[account];
    }
}
