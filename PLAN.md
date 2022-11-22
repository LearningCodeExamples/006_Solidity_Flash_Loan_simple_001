# 006_Solidity_Flash_Loan_simple_001
Solidity Flash Loan - simple

STEPS

1. mkdir 006_Solidity_Flash_Loan_simple_001
2. yarn init
3. ( rename README.md to PLAN.md, if you have one before you install hardhat,
   for instance if you cloned an empty repo to start the project )
4. yarn add --dev hardhat
5. Install openzeppelin contracts
6. yarn add @openzeppelin/contracts
7. yarn add --dev @openzeppelin/hardhat-upgrades
8. yarn add --dev @nomicfoundation/hardhat-toolbox @nomicfoundation/hardhat-network-helpers @nomicfoundation/hardhat-chai-matchers @nomiclabs/hardhat-ethers @nomiclabs/hardhat-etherscan chai ethers hardhat-gas-reporter solidity-coverage @typechain/hardhat typechain @typechain/ethers-v5 @ethersproject/abi @ethersproject/providers
9. start a new hardhat project
10. yarn add --dev dotenv
11. yarn hardhat
12. yarn hardhat test test/FlashLoan.js
    
```s

yarn hardhat test test/FlashLoan.js
yarn run v1.22.19
$ /Documents/CODE/LearningCodeExamples/006_Solidity_Flash_Loan_simple_001/node_modules/.bin/hardhat test test/FlashLoan.js
Compiled 1 Solidity file successfully


  Flashloan
    Deployment
      ✔ sends tokens to the Crowdsale contract
    Borrowing funds
Borrowing 100000000000000000000 tokens
Received 100000000000000000000 tokens
token address: 0x5fc8d32690cc91d4c39d9d3abcbd16989f875707
token name: Flash Token
token symbol: FLS
Sender: 0x0165878a594ca255338adfa4d48449f69242eb8f
Owner: 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
Pool: 0x0165878a594ca255338adfa4d48449f69242eb8f
Pool balance: 1000000000000000000000000 tokens
Pool token balance: 999900000000000000000000 tokens
Pool token allowance: 0 tokens
Token(tokenAddress).balanceOf(address(this)) 100000000000000000000
      ✔ borrows funds from the pool (102ms)


  2 passing (2s)
```

