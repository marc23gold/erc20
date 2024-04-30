//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OPToken is ERC20 {


    constructor(uint256 _initalSupply) ERC20("OPToken","OP"){
        _mint(msg.sender, _initalSupply);
    }
}
