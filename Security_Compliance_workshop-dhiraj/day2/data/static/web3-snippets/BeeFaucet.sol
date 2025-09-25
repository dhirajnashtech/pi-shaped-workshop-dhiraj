// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface Token {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract BeeFaucet {
    Token public token = Token(REMOVED);
    uint8 public balance = 200;

    function withdraw(uint8 amount) public {
        balance -= amount;
        require(balance >= 0, "Withdrew more than the account balance!");
        token.transfer(msg.sender, uint256(amount) * 1000000000000000000);
    }

    function getBalance() public view returns (uint8) {
        return balance;
    }
}
