# Blockchain Voting dApp on Ethereum

Study project following this tutorial: http://www.dappuniversity.com/articles/the-ultimate-ethereum-dapp-tutorial.

### Requirements
- truffle
- ganache
- lite-server
- MetaMask browser plugin

### Run
- `truffle migrate` will build your contract to the build folder
- change your settings to use the correct testing network in app.js and truffle.js (127.0.0.1:8545 for ganache-cli users)
- `npm run dev` will start your development server

### Changes I made following this tutorial

**After refresh, HTML gets rendered n times**

This happens because on initial render, the script listens to all events from block 0 to latest. Changed that to only listen on changes on the latest block. There is no need to recall all events on all blocks, as we only want to know of any new votes.

```javascript
fromBlock: 0,
toBlock: 'latest'
```

```javascript
fromBlock: 'latest'
```

### When things do not work

#### No ETH in your MetaMask accounts
- remove MetaMask
- add MetaMask again
- do not setup an account, use import existing account instead
- use mnemonic from your ganache(-cli)
- MetaMask is now inline with your test network
- make sure you have selected the correct test network in MetaMask
- sometimes you need to switch networks back and forward to enable MetaMask to load the test network settings again

#### Changes in my dApp are not visible
- after changes, run `truffle migrate --reset` to re-migrate the contracts
- otherwise; remove the contents of your build folder and run `truffle migrate` again
