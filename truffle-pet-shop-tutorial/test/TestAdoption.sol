pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  
  // adopt()関数をテスト
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);
  
    uint expected = 8;
  
    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // ペットの飼い主が単一の場合をテスト
  function testGetAdopterAddressByPetId() public {
    // テストの返り値として正しいのは、このコントラクトのアドレス
    address expected = this;
  
    address adopter = adoption.adopters(8);
  
    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

  // 飼い主を配列から取得できるかテスト
  function testGetAdopterAddressByPetIdInArray() public {
    // テストの返り値として正しいのは、このコントラクトのアドレス
    address expected = this;
  
    // address[16]の配列内に、adoptionのadoptersを格納
    address[16] memory adopters = adoption.getAdopters();
  
    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }
}