# Arc Dev Passport

A minimalist smart contract for **Arc Testnet** that serves as an onchain record of a developer’s identity and contributions.

It does **not** issue tokens and does **not** promise any airdrop rewards.  
Its purpose is simple: help you create a clean, verifiable, and publicly showcaseable developer footprint on Arc.

With Arc Dev Passport, you can:

- Deploy your own Solidity contract
- Register your developer handle and project address
- Record links to your GitHub, tutorials, demos, and community contributions
- Leave real onchain activity visible on the Arc Testnet Explorer

---

## 0. Prerequisites

Install Foundry:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup


Verify the installation:
forge --version
cast --version

1.Configure Your Wallet and Arc Testnet
Arc Testnet Parameters
RPC: https://rpc.testnet.arc.network
Chain ID: 5042002
Gas Token: USDC
Explorer: https://testnet.arcscan.app
Create a new wallet dedicated to testnet usage:cast wallet new

Copy the generated Private key into your   .env   file.
Do not use your main wallet private key.

Copy the environment template: cp .env.example .env

Edit .env:
ARC_TESTNET_RPC_URL="https://rpc.testnet.arc.network"
PRIVATE_KEY="0xyour_test_wallet_private_key"
CONTRACT_ADDRESS=""
Then claim Arc Testnet USDC from the Circle Faucet:
https://faucet.circle.com
Select Arc Testnet and enter the address of your newly created wallet.

2. Run Local Tests
forge test

3.Deploy the Contract
./scripts/deploy.sh
After a successful deployment, the terminal will display something like:
Deployed to: 0x...
Transaction hash: 0x...
Copy the deployed contract address back into your .env file:CONTRACT_ADDRESS="0xyour_contract_address"
You can then verify the deployment on the Explorer:https://testnet.arcscan.app

4. Register Your Developer Profile
Edit scripts/register-example.sh and replace @your-handle and the GitHub link with your own information.
Then run:./scripts/register-example.sh

5. Log a Contribution
Edit scripts/log-contribution-example.sh and replace the sample contribution link with your own, such as:
a project README
a tutorial
a demo video
a community post
Then run:./scripts/log-contribution-example.sh

6. Read Onchain Data
Use the following command to read contribution data from the contract:
cast call "$CONTRACT_ADDRESS" \
  "getContributionCount(address)(uint256)" \
  "your_wallet_address" \
  --rpc-url "$ARC_TESTNET_RPC_URL"


Recommended Materials to Showcase Publicly
Consider including the following in your GitHub README:
Project Name: Arc Dev Passport
Project Description: Arc Testnet developer identity and contribution log
Contract Address
Deployment Transaction Hash
Interaction Transaction Hash
Screenshot of the Explorer transaction page
A short tutorial in Chinese or English:
How I deployed my first contract on Arc Testnet

Security Notes
Do not commit your .env file
Do not share your private key with anyone
Use a fresh test wallet, never your main wallet
Testnet USDC has no real monetary value
This project is intended only for legitimate testing and developer showcases
Do not use it for fake activity, fabricated contributions, or multi-account abuse

Builder
GitHub: Jerrypan-hub
Wallet Address: 0x85c8E2c53F666aBA511F66cfb8CDd86FEC28Ff7f
Contract Address: 0x41FA3c2171135462E5D65CB6C547385cD617CDEf
Profile Update Transaction: 0xdc11ffdcf040ab5ce51681cb99d95ba588d21ad3812ebbe6f70c1e10a98a4a73
GitHub Contribution Transaction: 0x2ad79f2d2e73b013b44a16e55c5683269c570340ed54290ce2a9eb7083a49282


