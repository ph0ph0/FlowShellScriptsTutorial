# Flow Shell Scripts Tutorial

### 👋 Welcome Flow Developer!

This repository contains a collection of shell scripts designed to demonstrate the automation of tasks associated with development workflows on the Flow blockchain. The repo includes a shell script (found in utils/shellScripts/setupAndMint.sh) which runs a number of Flow transactions to reproducibly modify the blockchain state. This would be useful, if for example a developer needed the Flow emulator to be in a defined state before they could run a specific transaction (eg a dev wants to test staking an NFT, but an account must own an NFT before staking).

The associated blog post can be found here:

https://fullstackpho.com/how-to-use-shell-scripts-to-speed-up-cadence-development-on-flow-blockchain

**Please Note**: This repo is not a demonstration of Cadence best practices. In order to simplify the codebase, the project does not implement the Flow NFT standard and removes complexity that is irrelevant to the demonstration of the shell scripts.

# Prerequisites
- [Flow CLI](https://developers.flow.com/tools/flow-cli/install): Instructions on how to install and configure the Flow CLI.
- Shell Environment: These scripts are written for a Unix-like shell environment.
- An understanding of [Flow development](https://developers.flow.com/build/getting-started/quickstarts/hello-world).


# Installation
To use these scripts, clone the repository to your local machine:

```
git clone https://github.com/ph0ph0/FlowShellScriptsTutorial
cd ShellScriptsTutorial
```

Please ensure that you have the Flow CLI installed (see [Prerequsites](#Prerequisites))


# Usage

Before running the scripts, ensure they have the appropriate permissions and are executable on your system. 

**NOTE**: Always check the contents of a shell script before changing its permissions or running it to ensure that it is not malicious!

## Setting Permissions on macOS
1. Open your terminal.
2. Navigate to the directory where the scripts are located.
3. Run the following command from the project root to change the script's permissions, allowing it to be executed.

```
chmod 755 ./utils/shellScripts/setupAndMint.sh
```

## Preparing Scripts on Windows

Windows uses a different file system and does not require setting executable permissions like Unix-based systems. However, ensure you have a suitable shell environment to execute shell scripts, like Git Bash or WSL (Windows Subsystem for Linux).

## Running the Script

Complete these steps after installing Flow CLI

1. Open a new terminal instance and run:

```
flow emulator
```
This will start a new emulator instance.

2. Open a new terminal instance, and run:

```
./utils/shellScripts/setupAndMint.sh
```
This will run the shell script. All of the commands in the script will be executed in order.

# Contributing
Contributions to this project are welcome!

# License
This project is licensed under the MIT License - see the [LICENSE file](https://opensource.org/license/mit/) for details.

# Acknowledgements
- Flow Community and Grant Scheme: For support and resources.
- Ali Serag, Jerome Pimmel and Luke McIntyre (Dapper Labs) for help and guidance with blog posts.