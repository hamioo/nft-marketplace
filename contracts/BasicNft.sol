// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;

    string public constant TOKEN_URI =
        "ipfs://QmShXPocYLtguByg4B2vh5mtUWFJ6HTNaZf5oFQwwXAdZt?filename=QmShXPocYLtguByg4B2vh5mtUWFJ6HTNaZf5oFQwwXAdZt";

    constructor() ERC721("SOFT COMPOUND TIRE", "SCT") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
