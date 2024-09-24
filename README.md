# **CryptoConverterLibrary**
**Leave Me A Star ⭐**



#**Overview**
The CryptoConverterLibrary is a Solidity library that provides a simple and secure way to convert the value of one cryptocurrency to another using Chainlink's decentralized price feeds. This library allows developers to integrate crypto-to-crypto conversion functionality directly into their smart contracts, making it easy for users to determine the equivalent value of their assets in a different cryptocurrency

#**How it works**

-> Fetch Price Data: The library uses Chainlink's AggregatorV3Interface to get the latest price data for the source and target cryptocurrencies.

-> Calculate Conversion: It converts the source amount to USD (or any stable value) and then from USD to the target cryptocurrency, taking into account the decimals of both cryptocurrencies.

-> Return Target Amount: The converted amount in the target cryptocurrency is returned.

#**installation and setup**

-> Solidity Compiler: Ensure your project uses Solidity version ^0.8.0.

-> Chainlink Price Feeds: Know the Chainlink price feed addresses for the cryptocurrencies you want to convert between. These addresses vary by network (e.g., 
   Sepolia testnet, Ethereum mainnet).

   
  1.Import the Library: Save the library code as CryptoConverterLibrary.sol in your project directory. Then, import the library into your contract:
    import "./CryptoConverterLibrary.sol";
    
  2.Deploy the Library:
    For testing on a testnet, you can deploy the library separately if needed. For convenience, you can also include it directly in your contract.
    
  3.Use the Library in Your Contract: Use the library's functions in your contract as follows:
  
  4.Deploying the Example Contract
  
     -> Open Remix IDE and create two files: CryptoConverterLibrary.sol and ExampleCryptoConversion.sol.
     
     -> Paste the library code into CryptoConverterLibrary.sol and the example contract code into ExampleCryptoConversion.sol.
  
  5.Compile the Contracts:
  
     -> Compile both contracts using the Solidity compiler version ^0.8.0.
     
     -> Deploy the Contract:
        Select ExampleCryptoConversion from the deployment panel.
        
     -> Choose the Sepolia testnet or any preferred testnet.
        Deploy the contract.

#**input params**

    -> amount: The amount of the source cryptocurrency in its smallest unit (e.g., for 1 ETH, it would be 1e18).
    
    -> fromPriceFeed: The Chainlink price feed address for the source cryptocurrency (e.g., ETH/USD feed).
    
    -> toPriceFeed: The Chainlink price feed address for the target cryptocurrency (e.g., BTC/USD feed).
