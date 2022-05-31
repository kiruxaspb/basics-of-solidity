pragma solidity ^0.8.14;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract FastFundingFlatform is ReentrancyGuard, AccessControl {
    bytes32 public constant PARTICIPANT = keccak256("PARTICIPANT");
    bytes32 public constant HOLDER = keccak256("HOLDER");
    uint32 constant votingTime = 3 days;

    uint256 public counterProposals = 0;

    event NewMember(address indexed fromAddress, uint256 amount);
    event NewProposal(address indexed proposer, uint256 amount);
    event Payment(
        address indexed holder,
        address indexed projectAddress,
        uint256 amount
    );

    struct Proposal {
        uint256 id;
        uint256 amount;
        uint256 livePeriod;
        uint256 voteInFavor;
        uint256 voteAgainst;
        string title;
        string description;
        bool isCompleted;
        bool paid;
        bool isPaid;
        address payable receiverAddress;
        address proposer;
        uint256 totalFundRaised;
        Funding[] funders;
        string imageId;
    }

    struct Funding {
        address payer;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => uint256) private holders;
    mapping(uint256 => Proposal) private proposals;
    mapping(address => uint256) private members;
    mapping(address => uint256[]) private votes;

    modifier onlyMember(string memory message) {
        require(hasRole(PARTICIPANT, msg.sender), message);
        _;
    }

    modifier onlyHolder(string memory message) {
        require(hasRole(HOLDER, msg.sender), message);
        _;
    }

    function createProposal(
        string calldata title,
        string calldata _description,
        address receiverAddress,
        uint256 amount,
        string calldata imageId
    ) public payable onlyMember("Only members can create new proposal.") {
        require(
            msg.value == 5 * 10**18,
            "You need to add 5 BNB to create a proposal"
        );
        uint256 proposalId = counterProposals;
        Proposal storage proposal = proposals[proposalId];
        proposal.id = proposalId;
        proposal.description = _description;
        proposal.title = title;
        proposal.receiverAddress = payable(receiverAddress);
        proposal.proposer = payable(msg.sender);
        proposal.amount = amount;
        proposal.livePeriod = block.timestamp + votingTime;
        proposal.isPaid = false;
        proposal.isCompleted = false;
        proposal.imageId = imageId;
        counterProposals++;
        emit NewProposal(msg.sender, amount);
    }

    function getAllProposals() public view returns (Proposal[] memory) {
        Proposal[] memory tempProposals = new Proposal[](counterProposals);
        for (uint256 index = 0; index < counterProposals; index++) {
            tempProposals[index] = proposals[index];
        }
        return tempProposals;
    }

    function getProposal(uint256 proposalId)
        public
        view
        returns (Proposal memory)
    {
        return proposals[proposalId];
    }

    function getVotes()
        public
        view
        onlyHolder("Only Holder can call this function.")
        returns (uint256[] memory)
    {
        return votes[msg.sender];
    }

    function getHolderBal()
        public
        view
        onlyHolder("Only Holder can call this function.")
        returns (uint256)
    {
        return holders[msg.sender];
    }

    function getMemberBal()
        public
        view
        onlyMember("Only Members can call this function.")
        returns (uint256)
    {
        return members[msg.sender];
    }

    function isHolder() public view returns (bool) {
        return holders[msg.sender] > 0;
    }

    function isMember() public view returns (bool) {
        return members[msg.sender] > 0;
    }

    function vote(uint256 proposalId, bool inFavour)
        public
        onlyHolder("Only Holders can vote on a proposal.")
    {
        Proposal storage proposal = proposals[proposalId];

        if (proposal.isCompleted || proposal.livePeriod <= block.timestamp) {
            proposal.isCompleted = true;
            revert("Time period of this proposal is ended.");
        }
        for (uint256 i = 0; i < votes[msg.sender].length; i++) {
            if (proposal.id == votes[msg.sender][i])
                revert("You can only vote once.");
        }

        if (inFavour) proposal.voteInFavor++;
        else proposal.voteAgainst++;

        votes[msg.sender].push(proposalId);
    }

    function provideFunds(uint256 proposalId, uint256 fundAmount)
        public
        payable
        onlyHolder("Only Holders can make payments")
    {
        Proposal storage proposal = proposals[proposalId];

        if (proposal.isPaid) revert("Required funds are provided.");
        if (proposal.voteInFavor <= proposal.voteAgainst)
            revert("This proposal is not selected for funding.");
        if (proposal.totalFundRaised >= proposal.amount)
            revert("Required funds are provided.");
        proposal.totalFundRaised += fundAmount;
        proposal.funders.push(Funding(msg.sender, fundAmount, block.timestamp));
        if (proposal.totalFundRaised >= proposal.amount) {
            proposal.isCompleted = true;
        }
    }

    function releaseFunding(uint256 proposalId)
        public
        payable
        onlyHolder("Only Holders are allowed to release funds")
    {
        Proposal storage proposal = proposals[proposalId];

        if (proposal.totalFundRaised <= proposal.amount) {
            revert("Required funds are not met. Please provider funds.");
        }
        proposal.receiverAddress.transfer(proposal.totalFundRaised);
        proposal.isPaid = true;
        proposal.isCompleted = true;
    }

    function createHolder() public payable {
        uint256 amount = msg.value;
        if (!hasRole(HOLDER, msg.sender)) {
            uint256 total = members[msg.sender] + amount;
            if (total >= 2 ether) {
                _setupRole(HOLDER, msg.sender);
                _setupRole(PARTICIPANT, msg.sender);
                holders[msg.sender] = total;
                members[msg.sender] += amount;
            } else {
                _setupRole(PARTICIPANT, msg.sender);
                members[msg.sender] += amount;
            }
        } else {
            members[msg.sender] += amount;
            holders[msg.sender] += amount;
        }
    }
}
