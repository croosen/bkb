pragma solidity ^0.4.24;

contract Election {
    
    // constructor
    constructor() public {
        addCandidate("Brian");
        addCandidate("Garfield");
    }

    // the Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // read/write Candidates
    // this is assigned to a state variable, thus we will write data to the blockchain
    // every time we add a new key/value pair to it
    // set to public to get a getter function
    mapping(uint => Candidate) public candidates;

    // keep track of count Candidates
    // we can not query for a mappings length
    // cache state variable to keep track of length
    uint public candidatesCount;

    // add Candidate
    // private because we want to use it within the contract
    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

}
