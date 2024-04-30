//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OPToken} from "../src/OPToken.sol";
import {DeployERC20} from "../script/DeployERC20.s.sol";

contract TokenTest is Test {


    OPToken public ot;
    DeployERC20 public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTBALANCE = 10 ether;

    function setUp() public {
        deployer = new DeployERC20();
        ot = deployer.run();

        vm.prank(msg.sender);
        ot.transfer(bob, STARTBALANCE);
    }

    function testBobBalance() public {
        assertEq(ot.balanceOf(bob), STARTBALANCE);
    }

    function testAllowancesWork() public {
        uint256 initalAllowance = 5; 
        //bob approves alice to spend tokens on his behalf 
        vm.prank(bob);
        ot.approve(alice, initalAllowance);

        uint256 transferAmount = 3;

        vm.prank(alice);
        ot.transferFrom(bob,alice, transferAmount);

        assertEq(ot.balanceOf(alice), transferAmount);
        assertEq(ot.balanceOf(bob), STARTBALANCE - transferAmount);

    }  
}