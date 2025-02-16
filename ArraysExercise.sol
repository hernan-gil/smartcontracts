// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysExercise {
    // Declare an array of numbers
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Additional arrays for storing addresses and timestamps
    address[] public senders;
    uint[] public timestamps;

    // Function to return the entire numbers array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Function to reset the numbers array to its initial value
    function resetNumbers() public {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    // Function to append to the existing numbers array
    function appendToNumbers(uint[] calldata _toAppend) public {
        // Efficiently add to the storage array
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]); // adds the number from the input array
        }
    }

    // Function to save a timestamp and the caller's address
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender); // Store the caller's address
        timestamps.push(_unixTimestamp); // Store the timestamp
    }

    // Function to return timestamps after Y2K and corresponding senders
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint y2kTimestamp = 946702800; // January 1, 2000, 12:00 am
        uint count = 0;

        // First pass: count the valid timestamps
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > y2kTimestamp) {
                count++;
            }
        }

        // Prepare the arrays for valid timestamps and senders
        uint[] memory validTimestamps = new uint[](count);
        address[] memory validSenders = new address[](count);

        // Second pass: fill the valid arrays
        uint index = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > y2kTimestamp) {
                validTimestamps[index] = timestamps[i];
                validSenders[index] = senders[i];
                index++;
            }
        }

        return (validTimestamps, validSenders);
    }

    // Function to reset the senders array
    function resetSenders() public {
        delete senders; // Reset the array
    }

    // Function to reset the timestamps array
    function resetTimestamps() public {
        delete timestamps; // Reset the array
    }
}
