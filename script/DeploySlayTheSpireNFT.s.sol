//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script} from "../lib/forge-std/src/Script.sol";
import {SlayTheSpireNFT} from "../src/SlayTheSpireNFT.sol";

contract DeploySlayTheSpireNFT is Script {
    SlayTheSpireNFT public slayTheSpireNFT;

    function run() external returns (SlayTheSpireNFT) {
        vm.startBroadcast();
        slayTheSpireNFT = new SlayTheSpireNFT();
        vm.stopBroadcast();
        return slayTheSpireNFT;
    }
}
