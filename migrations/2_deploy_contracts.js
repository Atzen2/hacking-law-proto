var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var EmpAgreements = artifacts.require("./EmpAgreements.sol");

module.exports = function(deployer) {
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.autolink();
  deployer.deploy(EmpAgreements);
};
