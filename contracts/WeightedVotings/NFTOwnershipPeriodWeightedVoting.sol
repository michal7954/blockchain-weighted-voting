// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "contracts/Voting/Voting.sol";

interface VotingNFTInterface {
    function ownerOf(uint256 tokenId) external view returns (address owner);

    function getLastTransferTimestamp(uint256 tokenId)
        external
        view
        returns (uint256);
}

contract NFTOwnershipPeriodWeightedVoting is Voting {
    VotingNFTInterface internal _votingNFTInterface;

    event InitVoting(address indexed contractAddress);
    event VoteCasted(
        address indexed voter,
        uint8 indexed votingOption,
        uint256 indexed tokenId,
        uint192 weight
    );

    error ProhibitedVoteFunction(string message);

    constructor(address contractAddress) {
        _votingNFTInterface = VotingNFTInterface(contractAddress);
        emit InitVoting(contractAddress);
    }

    function vote(uint8 votingOption, uint256 tokenId)
        external
        votingOpened
        senderCanVote
        correctVotingOption(votingOption)
    {
        _voters[msg.sender].voted = true;
        uint192 weight = _getWeight();
        _votes.push(Vote(msg.sender, votingOption, weight));
        emit VoteCasted(msg.sender, votingOption, tokenId, weight);
    }

    function vote(uint8) external view override votingOpened senderCanVote {
        revert ProhibitedVoteFunction(
            "No tokenId has been passed which is required for NFT weighted voting"
        );
    }

    function _getWeight(uint256 tokenId) internal view returns (uint192) {
        require(
            _votingNFTInterface.ownerOf(tokenId) == msg.sender,
            "Sender is not the owner of given token"
        );
        return
            _cast(
                block.timestamp -
                    _votingNFTInterface.getLastTransferTimestamp(tokenId)
            );
    }
}
