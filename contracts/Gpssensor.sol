pragma solidity ^0.4.25 
contract GPSTracker {
    string[2] coordinates = ["0.00", "0.00"];
  function sendCoordinates(string memory _latitude, string memory _longitude) public{
    coordinates[0] = _latitude;
     coordinates[1] = _longitude; 
     }
     function readCoordinates() view public returns(string memory, string memory)
      { 
        return (coordinates[0], coordinates[1]); 
        }
}