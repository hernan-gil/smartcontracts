// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FavoriteRecords {
    // State variable to keep track of approved records
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) public userFavorites;

    // Custom error for not approved albums
    error NotApproved(string albumName);

    // List of approved records
    constructor() {
        loadApprovedRecords();
    }

    // Function to load approved albums into the mapping
    function loadApprovedRecords() internal {
        approvedRecords["Thriller"] = true;
        approvedRecords["Back in Black"] = true;
        approvedRecords["The Bodyguard"] = true;
        approvedRecords["The Dark Side of the Moon"] = true;
        approvedRecords["Their Greatest Hits (1971-1975)"] = true;
        approvedRecords["Hotel California"] = true;
        approvedRecords["Come On Over"] = true;
        approvedRecords["Rumours"] = true;
        approvedRecords["Saturday Night Fever"] = true;
    }

    // Function to get the list of approved records
    function getApprovedRecords() public pure returns (string[9] memory) {
        return [
            "Thriller",
            "Back in Black",
            "The Bodyguard",
            "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)",
            "Hotel California",
            "Come On Over",
            "Rumours",
            "Saturday Night Fever"
        ];
    }

    // Function to add a record to favorites
    function addRecord(string memory albumName) public {
        if (!approvedRecords[albumName]) {
            revert NotApproved(albumName); // Reject if the album is not approved
        }
        userFavorites[msg.sender][albumName] = true; // Mark the album as a favorite for the sender
    }

    // Function to retrieve the list of user's favorite records
    function getUserFavorites(address user) public view returns (string[] memory) {
        // Create an array to store favorites
        string[] memory favorites = new string[](9); // Known size of 9
        uint counter = 0;

        // Check each approved record to see if it's in the user's favorites
        for (uint i = 0; i < 9; i++) {
            string memory album = getApprovedRecords()[i];
            if (userFavorites[user][album]) {
                favorites[counter] = album;
                counter++;
            }
        }

        // Resize the array to fit the number of actual favorites
        string[] memory result = new string[](counter);
        for (uint j = 0; j < counter; j++) {
            result[j] = favorites[j];
        }

        return result;
    }

    // Function to reset user's favorites
    function resetUserFavorites() public {
        for (uint i = 0; i < 9; i++) {
            string memory album = getApprovedRecords()[i];
            userFavorites[msg.sender][album] = false; // Remove album from user's favorites
        }
    }
}
