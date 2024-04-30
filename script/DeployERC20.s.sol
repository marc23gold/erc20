//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {OPToken} from "../src/OPToken.sol";
import {Script} from "forge-std/Script.sol";

contract DeployERC20 is Script{

    uint256 public constant _initalSupply = 100 ether;

    function run() public returns(OPToken) {
        OPToken op;
        vm.startBroadcast();
        op = new OPToken(_initalSupply);
        vm.stopBroadcast();
        return op;
    }

}