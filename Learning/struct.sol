// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// strcuts - allow you to group data together
contract Structs {

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;

    // owners can have more than 1 car - Car[] 
    mapping(address => Car[]) public carsByOwner;

    function examples() external {

        Car memory toyota = Car("Honda", 1998, msg.sender);
        Car memory lambo = Car({model: "Lambo", year: 2022, owner: msg.sender});

        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2019;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        // update car sotrage
        Car storage _car = cars[0];
        _car.year = 3029;

        delete _car.owner;

        delete cars[1];

        
        

    }

    

}