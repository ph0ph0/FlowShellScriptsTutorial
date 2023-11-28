# Shell script that automates deploying the flow project, creating a new emulator account, adding the emulator account to the access list, opening minting, minting an NFT into the emulator account, and getting the NFT IDs owned by the emulator account.

# Uncomment the `>> output.log` to log the output of each command to a output.log file.

# Deploy project
flow project deploy # >> output.log

# Create emulator-account-1 (see flow.json)
flow accounts create --key 5af4720a97c1fa50aa80b72d68c7bbc0779d198e9fe5e2b84d49ba852f20601fa23aa547635ec5e5d7d59a4da2cde5813577e2087a081303d85d27d59c401c5e # >> output.log

# Add address to accesslist
flow transactions send ./cadence/transactions/addAddressToAccessList.cdc 01cf0e2f2f715450 --signer emulator-account-1 # >> output.log

# Open minting
flow transactions send ./cadence/transactions/setIsOpen.cdc true # >> output.log

# Mint NFT into emulator-account-1
flow transactions send ./cadence/transactions/mint.cdc 0xf8d6e0586b0a20c7 --signer emulator-account-1 # >> output.log

# Get NFT IDs in emulator-account-1
flow scripts execute ./cadence/scripts/getCollectionNftIds.cdc 01cf0e2f2f715450 # >> output.log

flow transactions send ./cadence/transactions/setIsOpen.cdc false # >> output.log

