require("@nomiclabs/hardhat-waffle");

const fs = require("fs");
const privateKey = fs.readFileSync(".secret").toString();
const projectId = ""; //TODO: get it from infura

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    //  unused configuration commented out for local dev now
    // mumbai: {
    //   url: "https://polygon-mumbai.infura.v3/${projectId}",
    //   accounts: [],
    // },
    // mainnet: {
    //   url: "https://rpc-mumbai.maticvigil.com",
    //   accounts: [],
    // },
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
