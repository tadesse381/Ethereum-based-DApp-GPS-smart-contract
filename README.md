<h1 align="center">Ethereum-based-DApp-GPS-smart-contract</h1>
</br>

## Introduction
The refund by location smart contract is aimed to be used when one party, for example an employer, agrees to pay another party, for example an employee, for being present in a certain geographic area for a certain duration. The employee’s phone sends its GPS location to a smart contract at a certain interval. Based on the pre-agreed contract codified in an Ethereum smart contract, a cryptocurrency payment is executed when all the agreed conditions are met.  If, at any point, the GPS sensor indicates that an employee is outside the range of the agreed GPS area, the contract state will be updated to indicate that it is out of compliance.  
In this project, an Ethereum based dApp is developed  that has both the smart contract tested and deployed in a testnet and a front end that will allow monitoring of the status.

## Architecture
The below figure shows the basic architecture of the Refund by Location Smart Contract.
![Speech-to-text data collection](contracts/Architecture.jpg)

## Dependencies
Install these prerequisites:
- NPM: https://nodejs.org
- Truffle: https://github.com/trufflesuite/truffle
- Ganache: http://truffleframework.com/ganache/
- Metamask: https://metamask.io/

# Installation Steps
## Step 1. Clone the project
`git clone https://github.com/tadesse381/Ethereum-based-DApp-GPS-smart-contract`

## Step 2. Install dependencies
```
$ npm install
```
## Step 3. Start Ganache
Open the Ganache GUI client that you downloaded and installed. This will start your local blockchain instance. 

## Step 4. Compile & Deploy Gpssensor Smart Contract
`$ truffle migrate --reset`
You must migrate the Gpssensor smart contract each time your restart ganache.

## Step 5. Configure Metamask
- Unlock Metamask
- Connect metamask to your local Etherum blockchain provided by Ganache.
- Import an account provided by ganache.

## Step 6. Run the Front End Application
`$ flutter run --no-sound-null-safety`
Visit this URL in your browser: http://localhost:3000
## Contributors
* [Tadesse Kebede](https://github.com/tadesse381)
