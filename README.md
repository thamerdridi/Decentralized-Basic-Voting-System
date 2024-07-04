# Decentralized Voting Contract

## Overview
This repository hosts a Solidity smart contract for a decentralized voting system designed for deployment on the Ethereum blockchain. The contract ensures a secure and transparent voting process, allowing only registered voters to participate, ensuring each voter can vote only once, and enabling results to be tallied only after the voting period ends.

## Features
- **Owner Management**: Only the contract owner can register voters and control the voting period.
- **Voter Registration**: Assigns a unique ID to each registered voter.
- **Voting Session Control**: Enables the voting session to be opened and closed, ensuring votes are cast only during designated periods.
- **Single Vote Per Voter**: Guarantees each registered voter can cast one vote per voting session.
- **Transparent Tallying**: After the voting session has ended, the votes can be tallied transparently.

## Contract Functions
### `registerVoter(address voter)`
Registers a new voter, providing them with a unique ID. This function is only callable by the contract owner.

### `startVoting()`
Initiates the voting period. This function is only callable by the contract owner.

### `castVote(bool _vote)`
Allows registered and authenticated voters to cast their vote once, choosing either `true` (yes) or `false` (no).

### `endVoting()`
Closes the voting period. This function is only callable by the contract owner.

### `tallyVotes()`
Outputs the result of the voting session as "Vote Accepted", "Vote Denied", or "Vote Tied", depending on the majority of votes cast.

### `getVoterDetails(address voter)`
Provides details on whether a specific voter has voted and the nature of their vote.

## Using Remix IDE
### Setup
- Navigate to [Remix Ethereum IDE](https://remix.ethereum.org).
- Create a new file and paste the contents of the contract.
- Compile the contract using the Solidity compiler available in Remix.

### Deployment
- Connect to your Ethereum wallet using the Remix IDE.
- Deploy the contract from the "Deploy & Run Transactions" panel.

### Testing
- Interact with the deployed contract using the Remix interface to simulate the registration of voters, starting the voting period, casting votes, ending the voting period, and tallying votes.

## Security
This contract has implemented fundamental security features but has not undergone a formal security audit. It is recommended to perform thorough testing and possibly a security audit before a real-world deployment.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

