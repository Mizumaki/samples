pragma solidity ^0.4.17;

contract Adoption {
  address[16] public adopters;
  // ペットを受け取る
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15, "Pet's ID is not correct");
  
    adopters[petId] = msg.sender;
  
    return petId;
  }
  // 飼い主を検索する
  function getAdopters() public view returns (address[16]) {
    return adopters;
  }
}