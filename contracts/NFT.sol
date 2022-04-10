//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 

//inherit contract from ERC721URIStorage - instead of writing all by self
contract NFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;    //address of marketplace which has access to modify a NFT

    constructor(address marketplaceAddress) ERC721("Metaverse Toekns", "METT"){
        contractAddress = marketplaceAddress;
    }

    //fn for minting tokens
    function createToken(string memory tokenURI) public returns (uint){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);   //-> gives marketplace the approval to transact this token
        return newItemId;
    }
}
