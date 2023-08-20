// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Maths {
    constructor() {}

    function _cast(uint256 number) internal pure returns (uint192) {
        if (number <= type(uint192).max) {
            return uint192(number);
        } else {
            return type(uint192).max;
        }
    }
}
