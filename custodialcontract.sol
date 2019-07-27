pragma solidity 0.5.10 ;

contract CustodialContract {
    //initieer de variabelen
    address payable client; //maak variabele client
    bool _switch = false;// _switch omdat switch een keyword is
    address public owner;
    
    event UpdateStatus(string _msg, uint256 _amount);//hier word een event UpdateStatus gemaakt met 2 variablen
    event UserStatus(string _msg, address user, uint256 amount);//alleen bij een setter gebruikt duh44
    
    
    constructor() public payable {
      client = msg.sender; // nu wordt client variabele het adress vastgekoppeld van de maker van het contract
                            
    }
    
    modifier alleenEigenaar(){
        require(msg.sender == owner);
        _;
    }
    
    function depositFunds()public payable{// payable heeft geen parameters nodig het contract houdt het bedrag vast 
    emit UserStatus("De gebruiker heeft wat geld gestort", msg.sender, address(this).balance);
    //UpdateStatus wordt gebruikt om de staat vast
    // te leggen in het event dat werkt dan als log op de blockchain.
    
    }
    
    function withdawFunds(uint amount)public payable alleenEigenaar{
       if(client.send(amount)){//we sturen een bedrag naar de client als het bedrag faalt en er wordt geen geld g
         emit UserStatus ("Gebruiker heeft geld opgenomen ", msg.sender, address(this).balance);
                   _switch = true;// if the send amount succeeeded boolean is true
       }
        else{
            _switch = false; //hier is het niet gelukt om aount te sturen
        }
        
    }
    
    function getFunds()public view returns(uint){
        return address(this).balance; // hier is de getter die het bedrag weergeeft met de functie alsClient als check
        
        }
    
}
