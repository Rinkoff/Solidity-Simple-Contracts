// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract HotelRoom {

    address payable public owner;

    enum roomStatus {Vacant, Occupied}

    roomStatus public currentStatus;

    event Occupy(address _occupier, uint _value);

    constructor(){
        owner = payable(msg.sender);
        currentStatus = roomStatus.Vacant;
    }

    modifier onlyWhileVacant{
        require(currentStatus == roomStatus.Vacant,"Currently occupied.");
        _;
    }

    modifier costs (uint _amount) {
        require(msg.value >= _amount,"Not enough Ether provided.");
        _;
    }

    function bookRoom () public payable onlyWhileVacant costs(2 ether) {
        (bool sent,) = owner.call{value: msg.value}("");
        require(sent,"Transfer failed!");

        currentStatus = roomStatus.Occupied;
        emit Occupy(msg.sender,msg.value);



    }




}
