// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract Election{
    // model candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    // store acc that have voted
    mapping(address=>bool) public voters;
    // store candidate
    // fetch candidate
    mapping(uint=>Candidate) public candidates;
    
    // store candidate count
    uint public candidateCount;

    // voted event
    event votedEvent(
        uint indexed_candidateId
    );

    // constructor
    constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidateCount ++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint _candidateId) public{
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidateCount);

        // record that voter has voted
        voters[msg.sender] = true;
        // update votes
        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }

}

// pragma solidity >=0.4.16 <0.9.0;

// contract SimpleStorage {
//     uint storedData;
//     string public candidate;
//     constructor(){

//     }


//     function set(uint x) public {
//         storedData = x;
//     }

//     function get() public view returns (uint) {
//         return storedData;
//     }
// }