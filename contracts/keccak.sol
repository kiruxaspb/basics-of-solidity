pragma solidity ^0.8.13;

contract Keccak {

   function keccak256test() public pure returns(bytes32 result) {
      return keccak256("data");
   }

   function keccak256Call(string memory _string) public pure returns(bytes32) {
      return keccak256(abi.encodePacked(_string));
   }

   function callKeccak256(string memory _string1, string memory _string2) public pure returns (bytes32) {
      return keccak256(abi.encodePacked(_string1, _string2));
   }
}
