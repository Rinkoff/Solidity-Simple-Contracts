// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Balance {
    mapping(address => uint) public balances;

    constructor() {
        balances[msg.sender] = 0;
    }

    event Deposit (address indexed _from , uint _value);
    event Withdraw (address indexed _to, uint _value);
    
    modifier depositEnough(uint _amount) {
        require(_amount >= 5,"Minimum amount is 5");
        _;
    }

    modifier validSender{
        require(msg.sender != address(0),"Invalid address");
        _;
    }

    modifier succesfullDeposit(uint _amount) {
        require(
            address(this).balance + _amount >= address(this).balance,
            "Deposit failed!"
        );
        _;
    }

    modifier sufficientBalance(uint _amount){
        require(balances[msg.sender] >= _amount,"Insufficient balance");
        _;
    }

    function deposit () public payable depositEnough(msg.value) validSender succesfullDeposit(msg.value) {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw (uint _amount) public sufficientBalance(_amount) {
        balances[msg.sender] -= _amount;
        payable (msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }
}