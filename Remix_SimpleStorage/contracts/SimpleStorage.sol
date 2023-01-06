// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // current version: 0.8.17 (2022-12-22)

// EVM = Ethereum Virtual Machine

// contract : class
contract SimpleStorage {
    // boolean, uint, int, address, bytes
    //      uint: unassigned integer → postif
    //    
    // bool hasFavoriteNumber = false;
    // uint favoriteNumber = 5;
    // string favoriteNumberInText = "Five";

    // This gets intialized to zero!
    uint256 favoriteNumber;    

    mapping(string => uint256) public nameToFavoriteNumber;
    
    // Works like a POJO in Java
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // People public person = People({favoriteNumber: 2, name: "Ovan"});

    // uint256[] public favoriteNumberLists;
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure → no gas is needed because it only displays → means no modification
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // calldata, memory, storage
    // calldata & memory → temporary | calldata: can't be modifed | memory: can be modified
    // storage → permanent
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 → deployed contract's address