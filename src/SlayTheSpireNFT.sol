//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SlayTheSpireNFT is ERC721 {
    mapping(uint256 => string) private s_tokeIdToURI;

    uint256 private s_tokenNumber;

    constructor() ERC721("SlayTheSpire", "STS") {
        s_tokenNumber = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_tokeIdToURI[s_tokenNumber] = tokenUri;
        _safeMint(msg.sender, s_tokenNumber, "");
        s_tokenNumber += 1;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokeIdToURI[tokenId];
    }
}
