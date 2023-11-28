// Mint an NFT Transaction

import NftContract from "../contracts/NftContract.cdc"

transaction(
    minterAddress: Address,
    ){
    let minter: &NftContract.Minter
    let collectionRef: &NftContract.Collection{NftContract.Receiver}

    prepare(acct: AuthAccount) {
        // Create public path
        let publicPath: PublicPath = /public/Minter
        
        // Set public minter
        // If it fails here, it's likely that the minterAddress path in the tx is wrong
        self.minter = getAccount(minterAddress)
            .getCapability(publicPath).borrow<&NftContract.Minter>() 
            ?? panic("Couldn't get Minter ref")
        
        // If account doesn't have a collection, create one
        if acct.borrow<&NftContract.Collection>(from: /storage/NFTCollection) == nil {
            acct.save(<-NftContract.createEmptyCollection(), to: /storage/NFTCollection)
            // link collection public
            acct.link<&NftContract.Collection{NftContract.CollectionPublic}>(/public/NFTCollection, target: /storage/NFTCollection)
        }


        self.collectionRef = acct.borrow<&NftContract.Collection{NftContract.Receiver}>(from: /storage/NFTCollection)
            ?? panic("Couldn't borrow collection")
    }
 
    execute {
        self.minter.mintNFT(receiver: self.collectionRef)
    }
}
 