// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicMath {
    
    // Function to add two unsigned integers
    function adder(uint256 _a, uint256 _b) public pure returns (uint256 sum, bool error) {
        // Perform the addition within a try-catch block to prevent overflow
        unchecked {
            sum = _a + _b;
            // Check if overflow occurred
            if (sum < _a) {
                return (0, true); // Overflow error
            }
            return (sum, false); // No error
        }
    }

    // Function to subtract two unsigned integers
    function subtractor(uint256 _a, uint256 _b) public pure returns (uint256 difference, bool error) {
        // Perform the subtraction within a try-catch block to prevent underflow
        unchecked {
            if (_b > _a) {
                return (0, true); // Underflow error
            }
            difference = _a - _b;
            return (difference, false); // No error
        }
    }
}
