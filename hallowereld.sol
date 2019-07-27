pragma solidity 0.5.10;
contract MijnContract{
    string value;
    
    constructor()public {
        value = "Hallo wereld !";
    }
    
    function get()public view returns(string memory) {
        return value;
    }
    function set(string memory _value) public {
        value = _value;
    }
}
