// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BuyNFT is ERC721, Ownable {
    using SafeMath for uint256;

    uint256 public nextTokenId;
    uint256 public price = 1 ether;

    constructor() ERC721("BuyNFT", "BNFT") {}

    function mint() external payable {
        require(msg.value >= price, "Insufficient funds");

        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }

    function setPrice(uint256 _price) external onlyOwner {
        price = _price;
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
