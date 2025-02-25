require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.9",
  networks: {
    mumbai: {
      url: "<https://rpc-mumbai.maticvigil.com>",
      accounts: process.env.private_key,
    },
  },
  paths: {
    artifacts: "./artifacts",
  },
};