// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BridgeCore {

  address private   oppositeBridge;
  uint256 private   requestCount = 1;
  mapping(address => bool)    private whiteList;
  


  function prepareRqId(bytes memory  _selector, address receiveSide) internal returns (bytes32, address){
	bytes32 requestId = keccak256(abi.encodePacked(this, requestCount, _selector, receiveSide, oppositeBridge));
    requestCount += 1;
	return (requestId, oppositeBridge);
  }

  function setControl(address a) public /*onlyOwner*/ {
    whiteList[a] = true;
  }
  //TODO: set lock
  function set(address a) public /*onlyOwner*/ {
  	oppositeBridge = a;
  }

  event OracleRequest(
  	string  requestType,
    address bridge,
    bytes32 requestId,
    bytes   selector,
    address receiveSide,
    address oppositeBridge
  );


}