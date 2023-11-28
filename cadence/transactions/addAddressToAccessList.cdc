// Add address to accessList

import NftContract from "../contracts/NftContract.cdc"

transaction(address: Address) {
    execute {
        NftContract.addAddressToAccessList(address: address)
    }
}


