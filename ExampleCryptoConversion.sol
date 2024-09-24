// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CryptoPriceConverterLibrary.sol"; // Import the library

contract ExampleCryptoConversion {
    using CryptoPriceConverterLibrary for uint256; // Attach the library to the uint256 type

    // Function to convert crypto using the library
    function convertMyCrypto(
        uint256 amount,        // Amount in the source crypto's smallest unit
        address fromPriceFeed, // Chainlink price feed address for source crypto (e.g., ETH/USD)
        address toPriceFeed    // Chainlink price feed address for target crypto (e.g., BTC/USD)
    ) public view returns (uint256) {
        // Use the library's convertCrypto function
        return amount.convertCrypto(fromPriceFeed, toPriceFeed);
    }
}
