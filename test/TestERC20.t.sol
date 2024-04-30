//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OPToken} from "../src/OPToken.sol";
import {DeployERC20} from "../script/DeployERC20.s.sol";

contract TokenTest is Test {


    OPToken public ot;
    DeployERC20 public deployer;
    function setUp() public {
        deployer = new DeployERC20();
        ot = deployer.run();
    }
}