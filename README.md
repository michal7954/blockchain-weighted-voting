# Weighted voting system on Blockchain

This repository contains a Solidity-based implementation of a weighted voting system as part of an engineering diploma project on "Application of blockchain technology in the implementation of a weighted voting system".

The secondary repository including front end for this decentralized application is located in [blockchain-weighted-voting-frontend](https://github.com/michal7954/blockchain-weighted-voting-frontend).

## Project Overview
This project demonstrates a decentralized voting system where vote weight dynamically depends on properties of the voting subject, such as token ownership duration or token balances. The system leverages smart contracts to maintain transparency, security, and immutability in a voting process.

### Example Use Case
This system could potentially be applied in a decentralized organization where members' voting power increases with their level of engagement or investment, measured through NFT ownership duration.

## Features
Decentralized app based on these smart contracts enables various features for administrator of the voting, for participants and for any external observer. It uses ERC20, ERC721 and Ownable contract.

### Administrator
- Configure source of vote weight.
- Set voting properties (e.g., duration, allowed participants).
- Transfer administrator privileges.
- Define voting options and manage eligible accounts.
- Control the voting phases while adhering to predefined contract rules.

### Voter
- Cast a weighted vote, with the weight determined by the configured source criteria (e.g., ERC20 token balance).

### Observer
- View all active and past voting properties, options, and results.
- Retrieve historical voting data for transparency.

## Code Highlights
- **Vote Casting Method**: Contains safety-check modifiers, emits events upon successful votes, and enables customizable weight determination (`_getWeight` method). [Link to Voting.sol](https://github.com/michal7954/blockchain-weighted-voting/blob/main/contracts/Voting/Voting.sol)
- **Weighted Voting**: One weighting method based on NFT ownership duration. [Link to NFTOwnershipPeriodWeightedVoting.sol](https://github.com/michal7954/blockchain-weighted-voting/blob/main/contracts/WeightedVotings/NFTOwnershipPeriodWeightedVoting.sol)
- **Vote Counting**: Processes votes and ensures accurate result calculation. [Link to Counting.sol](https://github.com/michal7954/blockchain-weighted-voting/blob/main/contracts/Voting/Counting.sol)

## Contracts and Inheritance Structure
Below are diagrams representing the inheritance structure for the smart contracts used in this project.

### Standard Voting Foundation
![obraz](https://github.com/user-attachments/assets/91b08abb-ffb6-4a3a-8a82-e455b87ecd1f)
### Weighted Voting Extension
![obraz](https://github.com/user-attachments/assets/ec66d2b2-3cdf-458e-a861-880e57086bbb)
