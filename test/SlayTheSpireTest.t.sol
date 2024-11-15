//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test} from "../lib/forge-std/src/Test.sol";
import {SlayTheSpireNFT} from "../src/SlayTheSpireNFT.sol";
import {DeploySlayTheSpireNFT} from "../script/DeploySlayTheSpireNFT.s.sol";

contract SlayTheSpireTest is Test {
    SlayTheSpireNFT public slayTheSpire;
    DeploySlayTheSpireNFT public deploySlayTheSpireNFT;

    address public bob = makeAddr("Bob");

    function setUp() external {
        deploySlayTheSpireNFT = new DeploySlayTheSpireNFT();
        slayTheSpire = deploySlayTheSpireNFT.run();
    }

    function testNFTCollectionName() public view {
        string memory name = slayTheSpire.name();
        bytes memory encodedName = abi.encodePacked(name);
        bytes32 hashedName = keccak256(encodedName);
        bytes32 hashedExpectedName = keccak256(
            abi.encodePacked(("SlayTheSpire"))
        );
        assert(hashedName == hashedExpectedName);
    }

    function testBobBalance() public {
        vm.prank(bob);
        slayTheSpire.mintNFT("ipfshashfroggy");

        assertEq(slayTheSpire.balanceOf(bob), 1);
        assertEq(slayTheSpire.tokenURI(0), "ipfshashfroggy");
    }
}
