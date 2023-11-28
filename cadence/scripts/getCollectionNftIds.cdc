import NftContract from "../contracts/NftContract.cdc"

pub fun main(address: Address): [UInt64] {
    let account = getAccount(address)

    let collectionRef = account.getCapability(/public/NFTCollection)
        .borrow<&{NftContract.CollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    return collectionRef.getIDs()
}