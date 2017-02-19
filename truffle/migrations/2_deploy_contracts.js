var EmpAgreements = artifacts.require("./EmpAgreements.sol");
var AgencyWallet = artifacts.require("./AgencyWallet.sol");
var EmployeeWallet = artifacts.require("./EmployeeWallet.sol");
var ManufactorWallet = artifacts.require("./ManufactorWallet.sol");
var PLAgreements = artifacts.require("./PLAgreements.sol");

module.exports = function(deployer) {
  deployer.deploy(AgencyWallet);
  deployer.deploy(EmpAgreements);
  deployer.deploy(EmployeeWallet);
  deployer.deploy(ManufactorWallet);
  deployer.deploy(PLAgreements);
  // deployer.autolink();
};
