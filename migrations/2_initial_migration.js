var Gpssensor = artifacts.require("./Gpssensor.sol");

module.exports = function(deployer) {
  deployer.deploy(Gpssensor);
};
