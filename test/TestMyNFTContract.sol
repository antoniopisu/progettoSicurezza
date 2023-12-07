// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle-assertions/Assert.sol";
import "truffle-assertions/DeployedAddresses.sol";

import "../contracts/MyNFTContract.sol";

contract MyNFTContractTest {
    MyNFTContract myNFT = MyNFTContract(DeployedAddresses.MyNFTContract());

    // Test per la funzione createNFT
    function testCreateNFT() public {
        myNFT.createNFT();
        uint256 ownerBalance = myNFT.balanceOf(address(this));

        // Verifica che il bilancio del proprietario sia aumentato a 1
        Assert.equal(ownerBalance, 1, "Il bilancio del proprietario dovrebbe essere 1 dopo la creazione di un NFT.");
    }

    // Test per la funzione transferNFT
    function testTransferNFT() public {
        myNFT.createNFT();
        uint256 tokenId = 1;

        // Verifica che l'NFT sia di proprietà dell'indirizzo corrente
        Assert.equal(myNFT.getNFTOwner(tokenId), address(this), "L'NFT dovrebbe appartenere all'indirizzo corrente.");

        address newOwner = address(0x123); // Indirizzo fittizio
        myNFT.transferNFT(newOwner, tokenId);

        // Verifica che l'NFT sia stato trasferito correttamente
        Assert.equal(myNFT.getNFTOwner(tokenId), newOwner, "L'NFT dovrebbe essere stato trasferito con successo.");
    }

    // Test per la funzione getOwnerNFTs
    function testGetOwnerNFTs() public {
        myNFT.createNFT();
        uint256[] memory ownerNFTs = myNFT.getOwnerNFTs(address(this));

        // Verifica che l'array contenga almeno un elemento
        Assert.isAbove(ownerNFTs.length, 0, "L'array degli NFT del proprietario dovrebbe contenere almeno un elemento.");
    }
}
