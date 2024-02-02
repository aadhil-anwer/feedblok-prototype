// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FeedbackStorage {
    // Structure to hold each feedback
    struct Feedback {
        address sender;
        string message;
        uint256 timestamp;
    }

    // Array to store feedbacks
    Feedback[] public feedbacks;

    // Event to emit when a new feedback is added
    event FeedbackAdded(address indexed sender, string message, uint256 timestamp);

    // Function to add feedback
    function addFeedback(string memory _message) public {
        feedbacks.push(Feedback(msg.sender, _message, block.timestamp));
        emit FeedbackAdded(msg.sender, _message, block.timestamp);
    }

    // Function to get a specific feedback
    function getFeedback(uint _index) public view returns (address, string memory, uint256) {
        require(_index < feedbacks.length, "Feedback index out of bounds");
        Feedback storage feedback = feedbacks[_index];
        return (feedback.sender, feedback.message, feedback.timestamp);
    }

    // Function to get the total number of feedbacks
    function getTotalFeedbacks() public view returns (uint256) {
        return feedbacks.length;
    }
}
