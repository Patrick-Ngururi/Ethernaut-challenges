// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "lib/forge-std/src/Script.sol";
import "lib/forge-std/src/console.sol";

contract Level0Solution is Script {

    Level0 public level0 = Level0(0x757d776b500d4524DA673b57Bef7B7E7aC54c67F);

    function run() external {
        string memory password = level0.password();
        console.log("Password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}