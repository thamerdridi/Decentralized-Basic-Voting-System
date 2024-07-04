// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VotingContract {
    address public owner;
    uint256 public voterId;
    bool public votingActive;
    uint256 public yesVoters;
    uint256 public noVoters;

    mapping(address => uint256) public registeredVoters;
    mapping(uint256 => bool) public votersVoted;
    mapping(uint256 => bool) public voteOutcome;

    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
        _;
    }

    modifier onlyRegistered() {
        require(registeredVoters[msg.sender] != 0, "Not Registered");
        _;
    }

    modifier notYetVoted() {
        require(!votersVoted[registeredVoters[msg.sender]], "Already Voted");
        _;
    }

    modifier votingIsActive() {
        require(votingActive, "Voting not active");
        _;
    }

    modifier votingIsNotActive() {
        require(!votingActive, "Voting is active");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerVoter(address voter) public onlyOwner {
        require(registeredVoters[voter] == 0, "Already Registered");
        voterId++;
        registeredVoters[voter] = voterId;
    }

    function startVoting() public onlyOwner votingIsNotActive {
        votingActive = true;
        yesVoters = 0;
        noVoters = 0;
    }

    function castVote(bool _vote) public onlyRegistered notYetVoted votingIsActive {
        uint256 voterIndex = registeredVoters[msg.sender];
        votersVoted[voterIndex] = true;
        voteOutcome[voterIndex] = _vote;

        if (_vote) {
            yesVoters++;
        } else {
            noVoters++;
        }
    }

    function endVoting() public onlyOwner votingIsActive {
        votingActive = false;
    }

    function tallyVotes() public view votingIsNotActive returns (string memory) {
        if (yesVoters > noVoters) {
            return "Vote Accepted";
        } else if (yesVoters < noVoters) {
            return "Vote Denied";
        } else {
            return "Vote Tied";
        }
    }

    function getVoterDetails(address voter) external view returns (bool hasVoted, bool vote) {
        uint256 voterIndex = registeredVoters[voter];
        hasVoted = votersVoted[voterIndex];
        vote = voteOutcome[voterIndex];
        return (hasVoted, vote);
    }
}

