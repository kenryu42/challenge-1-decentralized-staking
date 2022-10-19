// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract ExampleExternalContract {
    address public owner;
    bool public completed;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function complete() public payable {
        completed = true;
    }

    function withdrawToStake(address payable stakingContract) public onlyOwner {
        completed = false;
        stakingContract.transfer(address(this).balance);
    }
}
