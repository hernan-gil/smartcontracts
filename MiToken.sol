// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MiToken is ERC20 {
    constructor(string memory nombre, uint256 cantidadInicial) ERC20(nombre, nombre) {
        _mint(msg.sender, cantidadInicial);
    }
}
