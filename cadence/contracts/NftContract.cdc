
pub contract NftContract {

    init() {
        self.totalSupply = 0
        self.accessList = []
        self.isOpen = false

        // Create a minter resource
        let minter <- create Minter(minterAddress: self.account.address)
        // Store the minter resource in the account's storage
        self.account.save(<-minter, to: /storage/Minter)
        // Create public capability to the minter resource
        self.account.link<&Minter>(/public/Minter, target: /storage/Minter)
    }

    /// The total number of tokens of this type in existence
    pub var totalSupply: UInt64

    pub var accessList: [Address]

    pub var isOpen: Bool

    pub resource Minter {
            
            pub let minterAddress: Address
    
            init(minterAddress: Address) {
                self.minterAddress = minterAddress
            }
    
            pub fun mintNFT(receiver: &AnyResource{NftContract.Receiver}) {
                pre {
                    NftContract.accessList.contains(receiver.owner!.address): "You are not allowed to mint NFTs"
                }
                receiver.deposit(token: <-create NFT())
            }
    }

    
    pub resource NFT {
        pub let id: UInt64

        init() {
            NftContract.totalSupply = NftContract.totalSupply + 1
            self.id = NftContract.totalSupply 
        }
    }

    pub resource interface CollectionPublic {
        pub fun getIDs(): [UInt64]
    }

    pub resource interface Receiver {
        pub fun deposit(token: @NFT)
    }

    
    pub resource Collection: CollectionPublic, Receiver {

        init() {
            self.ownedNFTs <- {}
            self.ownedIDs = []
        }

        /// Dictionary to hold the NFTs in the Collection
        pub var ownedNFTs: @{UInt64: NFT}
        pub var ownedIDs: [UInt64]

        pub fun getIDs(): [UInt64] {
            return self.ownedIDs
        }

        pub fun deposit(token: @NFT) {
           
            // Get the token's ID
            let id = token.id

            // Add the new token to the dictionary
            let oldToken <- self.ownedNFTs[id] <- token
            self.ownedIDs.append(id)

            // Destroy the empty old token that was "removed"
            destroy oldToken
        }

        destroy() {
            destroy self.ownedNFTs
        }
    }

    pub fun createEmptyCollection(): @Collection {
        return <-create Collection()
    }

    pub fun addAddressToAccessList(address: Address) {
        self.accessList.append(address)
    }

    pub fun setIsOpen(isOpen: Bool) {
        self.isOpen = isOpen
    }
}
 