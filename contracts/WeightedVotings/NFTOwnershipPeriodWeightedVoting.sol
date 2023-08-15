// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/Voting/Voting.sol";

interface VotingNFTInterface {
    function getLastTransferTimestamp(uint256 tokenId)
        external
        view
        returns (uint256);

    function ownerOf(uint256 tokenId) external view returns (address owner);
}

contract NFTOwnershipPeriodWeightedVoting is Voting {
    VotingNFTInterface internal votingNFTInterface;

    constructor(address valueSourceAddress_) {
        votingNFTInterface = VotingNFTInterface(valueSourceAddress_);
    }

    function vote(uint256) external view override votingIsActive senderCanVote {
        revert(
            "No tokenId has been passed which is required for NFT weighted voting"
        );
    }

    function vote(uint256 votingOption, uint256 tokenId)
        external
        votingIsActive
        senderCanVote
        correctVotingOption(votingOption)
    {
        voters[msg.sender].voted = true;
        votes.push(Vote(msg.sender, votingOption, getWeight(tokenId)));
    }

    function getWeight(uint256 tokenId) internal view returns (uint256) {
        require(
            votingNFTInterface.ownerOf(tokenId) == msg.sender,
            "Sender is not the owner of given token"
        );
        return
            block.timestamp -
            votingNFTInterface.getLastTransferTimestamp(tokenId);
    }
}
