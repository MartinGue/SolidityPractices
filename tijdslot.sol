pragma solidity ^0.5.7;
//TODO:
// Wie kan opnemen?
// hoe veel?
// wanneer?
contract Tijdslot{
    address payable begunstigde;
    uint256 vrijgaveTijd;
    
    constructor(address payable _begunstigde,
    uint256 _vrijgaveTijd
    ) 
        public
        payable
    {
        require(_vrijgaveTijd > block.timestamp);
        begunstigde = _begunstigde;// bijv adres twee in remix
        vrijgaveTijd = _vrijgaveTijd;
    }
    
    function release() public {
        require(block.timestamp >= vrijgaveTijd);
        //weergeven in unixtimestamp.com dus je tijdsslot erbij optellen
        address(begunstigde).transfer(address(this).balance);
        //we nemen de hele balans die in dit contract zit opgesloten en schrijven het over naar de begunstige 
    } 
    
    
}
