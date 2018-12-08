var LoyaltyPointSystem = artifacts.require("./LoyaltyPointSystem.sol");

module.exports = function(deployer) {
  deployer.deploy(LoyaltyPointSystem);
};
