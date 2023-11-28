// Open/Close Minting

import NftContract from "../contracts/NftContract.cdc"

transaction(isOpen: Bool) {
    execute {
        NftContract.setIsOpen(isOpen: isOpen)
    }
}