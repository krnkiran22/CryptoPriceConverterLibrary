// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library CryptoConverterLibrary {
    // Function to convert any crypto amount to another using Chainlink price feeds
    function convertCrypto(
        uint256 amount, // Amount in the source crypto's smallest unit
        address fromPriceFeed, // Chainlink price feed address for source crypto
        address toPriceFeed // Chainlink price feed address for target crypto
    ) external view returns (uint256) {
        require(fromPriceFeed != address(0), "Invalid source price feed");
        require(toPriceFeed != address(0), "Invalid target price feed");

        // Get source price feed data
        (, int256 fromPrice,,,) = AggregatorV3Interface(fromPriceFeed).latestRoundData();
        uint8 fromDecimals = AggregatorV3Interface(fromPriceFeed).decimals();

        // Get target price feed data
        (, int256 toPrice,,,) = AggregatorV3Interface(toPriceFeed).latestRoundData();
        uint8 toDecimals = AggregatorV3Interface(toPriceFeed).decimals();

        // Validate price data
        require(fromPrice > 0, "Invalid source price");
        require(toPrice > 0, "Invalid target price");

        // Adjust the amount for the source crypto's decimals
        uint256 adjustedAmount = amount * (10 ** fromDecimals);

        // Calculate amount in USD (scaled to 18 decimals)
        uint256 amountInUSD = (adjustedAmount * uint256(fromPrice)) / (10 ** fromDecimals);

        // Calculate target amount by scaling down to the target's decimals
        uint256 targetAmount = (amountInUSD * (10 ** toDecimals)) / uint256(toPrice);

        return targetAmount;
    }
}
