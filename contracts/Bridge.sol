// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./core/BridgeCore.sol";

contract Bridge is BridgeCore {

  





  function transmitRequestV2(bytes memory  _selector, address receiveSide)
    public
    /*onlyOwner*/
    returns (bytes32)
  {
	require(address(0) != receiveSide, 'BAD RECEIVE SIDE');
    //require(msg.sender == myContract, "ONLY PERMISSIONED ADDRESS");

	(bytes32 requestId, address oppositeBridge) = prepareRqId(_selector, receiveSide);
  	emit OracleRequest("setRequest", address(this), requestId, _selector, receiveSide, oppositeBridge);

  	return requestId;
  }


  //==============================================================================================================


  function receiveRequestV2(string memory reqId,
                          bytes memory signature,
                          bytes memory b,
                          bytes32 tx,
                          address receiveSide) external {

  	//check out nonce, sign
  }
}