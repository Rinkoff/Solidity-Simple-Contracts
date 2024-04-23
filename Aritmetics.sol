// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Aritmetics {
    function sum (uint a ,uint b) public pure returns(uint){
        return a+b;
    }

    function substract (uint a, uint b) public pure returns(uint) {
        require(a >= b,"Cannot subtract a smaller number from a larger number");
        return a-b;
    }

    function multiply (uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function divide (uint a, uint b) public pure returns(uint) {
        require(b != 0,"Cannot divide by zero");
        return a/b;
    }
}