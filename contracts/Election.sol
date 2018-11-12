pragma solidity ^0.4.24;

contract Election {

    constructor() public {
        addCandidate("Brian");
        addCandidate("Garfield");
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    uint public candidatesCount;

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    event votedEvent (
        uint indexed _candidateId
    );

    function vote(uint _candidateId) public {

        // require voter not to have voted before
        require(!voters[msg.sender]);

        // require a valid Canidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }

}
