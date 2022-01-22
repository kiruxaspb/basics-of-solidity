// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car; // set struct as variable
    Car[] public cars; // array of cars
    mapping(address => Car[]) public carsByOwner; // many cars on 1 owner

    function example() external {
        // initial struct:
        Car memory mercedes = Car("e200", 2021, msg.sender);
        // the order of input is not important:
        Car memory lambo = Car({model: "huracan", year: 2020, owner: msg.sender});

        // more example
        Car memory renault;
        renault.model = "logan";
        renault.year = 2016;
        renault.owner = msg.sender;

        // write in array 'cars'
        cars.push(mercedes);
        cars.push(lambo);
        cars.push(renault);

        // write in array 'cars'
        cars.push(Car("ferrari", 2020, msg.sender));

        // get 
        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;

        // change
        Car storage _carr = cars[1];
        _carr.year = 2022;

        // delete
        delete _car.owner; // reset to default value
        
        delete cars[1]; // reset all variables to default
    }
}