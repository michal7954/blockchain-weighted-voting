// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.0/access/Ownable.sol";

contract VotingNFTCollection is ERC721, Ownable {
    mapping(uint256 => uint256) internal _lastTransferTimestamps;

    constructor() ERC721("VotingNFTCollection", "VTN") {
        _safeMint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0);
        _safeMint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 1);
        _safeMint(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 2);
    }

    function safeMint(address to, uint256 tokenId) external onlyOwner {
        _safeMint(to, tokenId);
    }

    function getLastTransferTimestamp(uint256 tokenId)
        external
        view
        returns (uint256)
    {
        return _lastTransferTimestamps[tokenId];
    }

    function _beforeTokenTransfer(
        address,
        address,
        uint256 tokenId
    ) internal override {
        _lastTransferTimestamps[tokenId] = block.timestamp;
    }

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://ipfs.io/ipfs/QmXN7J5w8tmjfU3H8Gb9ku9Ug7Lvwp68VzJ6JSYTkU4KcF/";
    }

    
}
