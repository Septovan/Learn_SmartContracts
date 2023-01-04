// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 50;

    function fund() public payable {
        // msg.value = ETH
        //
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETh to this contract?
        require (msg.value >= minimumUSD, "Didn't send enough!");
    }

    function getPrice() public view returns (uint256) {
        // ABI of the contract: use import from @chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol
        // Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        // (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();
        (,int256 answer,,,) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

    //function Withdraw(){}
    
}