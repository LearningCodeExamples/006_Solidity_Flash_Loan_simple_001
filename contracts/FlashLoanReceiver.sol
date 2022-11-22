// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./Token.sol";
import "./FlashLoan.sol";

contract FlashLoanReceiver {

    FlashLoan private pool;
    address private owner;

    event LoanReceived(address token, uint256 amount);

    constructor(address poolAddress) {
        pool = FlashLoan(poolAddress);
        owner = msg.sender;
    }

    function receiveTokens(address tokenAddress, uint256 amount) external {
        require(msg.sender == address(pool), "Sender must be pool");
        //console.log address and amount received
        console.log("Received %s tokens", amount);
        console.log("token address: %s", tokenAddress);
        console.log("token name: %s", Token(tokenAddress).name());
        console.log("token symbol: %s", Token(tokenAddress).symbol());
        console.log("Sender: %s", msg.sender);
        console.log("Owner: %s", owner);
        console.log("Pool: %s", address(pool));
        console.log("Pool balance: %s tokens", pool.poolBalance());
        console.log("Pool token balance: %s tokens", Token(tokenAddress).balanceOf(address(pool)));
        console.log("Pool token allowance: %s tokens", Token(tokenAddress).allowance(address(pool), address(this)));
        console.log("Token(tokenAddress).balanceOf(address(this))", Token(tokenAddress).balanceOf(address(this)));

        // Emit event to prove tokens receive in test // comment out to fail test
        emit LoanReceived(tokenAddress, amount);

        // Use your funds here!
        require(Token(tokenAddress).balanceOf(address(this)) == amount, "Failed to get loan, Not enough tokens received");
        

        // Return all tokens to the pool
        require(Token(tokenAddress).transfer(msg.sender, amount), "Transfer of tokens failed");
    }

    function executeFlashLoan(uint256 amount) external {
        require(msg.sender == owner, "Only owner can execute flash loan");
        pool.flashLoan(amount);
    }
}
