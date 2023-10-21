// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Configuration {
    bool internal constant _devMode = true;
    bool internal _remixTestEnv = true;
    bool internal _publicTestEnv = false;
    uint256 internal constant _minPhaseTime = 24 hours;

    constructor() {}
}
