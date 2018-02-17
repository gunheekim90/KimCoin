var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var KimCoin = artifacts.require("./KimCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.deploy(KimCoin, 10000000000000000000000).then(function(){
      console.log("\n\naddress : "+KimCoin.address);
     
  });
};