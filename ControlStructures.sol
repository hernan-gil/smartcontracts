// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ControlStructures {
    // Custom error for after-hours scenario
    error AfterHours(uint time);

    // Function to implement FizzBuzz logic
    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    // Function to implement Do Not Disturb logic
    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Check if time is greater than or equal to 2400
        if (_time >= 2400) {
            // Trigger a panic (assuming you want to revert with an assert)
            assert(false);
        }
        // Check for after-hours time
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }
        // Check for lunch time
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        // Determine appropriate greeting based on time
        if (_time >= 800 && _time < 1200) {
            return "Morning!";
        } else if (_time >= 1300 && _time < 1800) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time < 2200) {
            return "Evening!";
        }
        // This line should not be reached. Keeping a return statement to satisfy the logic flow.
        revert("Invalid time");
    }
}
